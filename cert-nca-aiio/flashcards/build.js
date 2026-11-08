// 用法：node build.js
// 从 cards-*.js 生成：flashcards.md（GitHub 上阅读/打印，中英双语）与 anki-import.txt（Anki 导入，Tab 分隔：正面、背面、标签）
// 卡片格式：[英文正面, 中文正面（"" 表示同英文）, 英文背面, 中文背面]
const fs = require("fs"), path = require("path");
global.window = {};
for (const f of fs.readdirSync(__dirname).filter(f => /^cards-.*\.js$/.test(f)).sort()) {
  new Function("window", fs.readFileSync(path.join(__dirname, f), "utf8").replace(/^AIIO_DECKS\./gm, "window.AIIO_DECKS."))(window);
}
const DECKS = window.AIIO_DECKS;
const DNAME = { 0: "缩写速查 · Acronyms", 1: "领域 1 · AI 基础知识 · Essential AI Knowledge", 2: "领域 2 · AI 基础设施 · AI Infrastructure", 3: "领域 3 · AI 运维 · AI Operations" };
const total = DECKS.reduce((n, d) => n + d.cards.length, 0);
const html = s => s.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
const cell = s => html(s).replace(/\|/g, "\\|");
const zhFront = c => (c[1] && c[1] !== c[0] ? c[1] : "");

let md = `# NCA-AIIO 速记卡 · Flashcards（${total} 张，中英双语）\n\n`;
md += `> 由 \`build.js\` 从 \`cards-*.js\` 生成，请勿手改。翻卡和记录熟练度请用同目录的 [index.html](index.html)（可切换 双语 / 中文 / EN）；`;
md += `Anki 用户导入 [anki-import.txt](anki-import.txt)。\n\n## 牌组 Decks\n\n| 领域 Domain | 牌组 Deck | 张数 |\n| --- | --- | --- |\n`;
for (const d of [1, 2, 3, 0]) for (const k of DECKS.filter(x => x.d === d)) md += `| ${DNAME[d]} | [${k.name} · ${k.en}](#${k.key}) | ${k.cards.length} |\n`;
for (const d of [1, 2, 3, 0]) {
  md += `\n## ${DNAME[d]}\n`;
  for (const k of DECKS.filter(x => x.d === d)) {
    md += `\n<a id="${k.key}"></a>\n### ${k.name} · ${k.en}（${k.cards.length}）\n\n| 正面 Front | 背面 Back |\n| --- | --- |\n`;
    for (const c of k.cards) {
      const z = zhFront(c);
      md += `| **${cell(c[0])}**${z ? "<br>" + cell(z) : ""} | ${cell(c[2])}<br>${cell(c[3])} |\n`;
    }
  }
}
fs.writeFileSync(path.join(__dirname, "flashcards.md"), md);

let tsv = "#separator:tab\n#html:true\n#tags column:3\n";
for (const k of DECKS) for (const c of k.cards) {
  const z = zhFront(c);
  tsv += `${html(c[0])}${z ? "<br>" + html(z) : ""}\t${html(c[2])}<br><br>${html(c[3])}\tAIIO::D${k.d} AIIO::${k.key}\n`;
}
fs.writeFileSync(path.join(__dirname, "anki-import.txt"), tsv);
console.log(`decks ${DECKS.length}, cards ${total} → flashcards.md, anki-import.txt`);
