// 用法：node build.js
// 读取 map-source.js 和 ../flashcards/cards-*.js，生成：
//   map-data.js  —— 交互式思维导图页面（index.html）使用，叶子节点附带速记卡的中英解释
//   mindmap.md   —— GitHub 上直接可看的 Mermaid 总览 + 完整中英大纲
const fs = require("fs"), path = require("path");
const SRC = require("./map-source.js");
const FC = path.join(__dirname, "..", "flashcards");
global.window = {};
for (const f of fs.readdirSync(FC).filter(f => /^cards-.*\.js$/.test(f)).sort())
  new Function("window", fs.readFileSync(path.join(FC, f), "utf8").replace(/^AIIO_DECKS\./gm, "window.AIIO_DECKS."))(window);
const byFront = new Map();
for (const dk of window.AIIO_DECKS) for (const c of dk.cards) {
  const prev = byFront.get(c[0]);
  if (!prev || prev.dk.key === "acronyms") byFront.set(c[0], { dk, c });
}

const missing = []; let leaves = 0, branches = 0;
function conv(n, d) {
  if (Array.isArray(n)) {
    leaves++;
    const [en, zh, ref] = n, hit = byFront.get(ref || en);
    if (!hit) missing.push(ref || en);
    const o = { en, zh };
    if (hit) Object.assign(o, { k: hit.dk.key, ce: hit.c[0], cz: hit.c[1] || "", eb: hit.c[2], zb: hit.c[3] });
    return o;
  }
  branches++;
  const dd = n.d || d;
  const o = { en: n.en, zh: n.zh, c: n.c.map(x => conv(x, dd)) };
  if (n.d) { o.d = n.d; o.w = n.w; }
  if (n.sub) o.sub = n.sub;
  return o;
}
const tree = conv(SRC, 0);
const decks = {}; for (const dk of window.AIIO_DECKS) decks[dk.key] = [dk.en, dk.name];
fs.writeFileSync(path.join(__dirname, "map-data.js"),
  "// 由 build.js 生成，请勿手改。修改结构请编辑 map-source.js。\nwindow.AIIO_MAP = " + JSON.stringify(tree) + ";\nwindow.AIIO_MAP_DECKS = " + JSON.stringify(decks) + ";\n");

// ---- Markdown ----
const q = s => s.replace(/"/g, "'");
let md = `# NCA-AIIO 知识思维导图 · Knowledge Mind Map\n\n> 由 \`build.js\` 从 \`map-source.js\` 生成，请勿手改。交互版（可折叠、搜索、双语/中文/EN 切换、点开看速记卡解释）见同目录 [index.html](index.html)。\n\n`;
md += "## 总览 Overview\n\n```mermaid\nmindmap\n  root((\"NCA-AIIO\"))\n";
for (const dm of tree.c) {
  md += `    d${dm.d}["${q(dm.en)} · ${q(dm.zh)} · ${dm.w}"]\n`;
  dm.c.forEach((t, i) => { md += `      d${dm.d}t${i}["${q(t.en)}<br/>${q(t.zh)}"]\n`; });
}
md += "```\n\n## 完整大纲 Full outline\n";
function outline(n, depth) {
  if (!n.c) {
    md += `${"  ".repeat(depth)}- ${n.en} · ${n.zh}\n`;
    return;
  }
  if (depth === 0) { md += `\n### ${n.en} · ${n.zh}（${n.w}）\n\n`; n.c.forEach(x => outline(x, 1)); return; }
  md += `${"  ".repeat(depth - 1)}- **${n.en} · ${n.zh}**\n`;
  n.c.forEach(x => outline(x, depth + 1));
}
tree.c.forEach(dm => outline(dm, 0));
fs.writeFileSync(path.join(__dirname, "mindmap.md"), md);

console.log(`branches ${branches}, leaves ${leaves}, linked to cards ${leaves - missing.length}`);
if (missing.length) { console.log("UNRESOLVED:\n  " + missing.join("\n  ")); process.exitCode = 1; }
