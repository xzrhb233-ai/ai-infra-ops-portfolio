// 用法：node build.js
// 从 cards-*.js 生成：flashcards.md（GitHub 上阅读/打印）与 anki-import.txt（Anki 导入，Tab 分隔：正面、背面、标签）
const fs = require("fs"), path = require("path");
global.window = {};
for (const f of fs.readdirSync(__dirname).filter(f => /^cards-.*\.js$/.test(f)).sort()) {
  new Function("window", fs.readFileSync(path.join(__dirname, f), "utf8").replace(/^AIIO_DECKS\./gm, "window.AIIO_DECKS."))(window);
}
const DECKS = window.AIIO_DECKS;
const DNAME = { 0: "缩写速查", 1: "领域 1 · AI 基础知识", 2: "领域 2 · AI 基础设施", 3: "领域 3 · AI 运维" };
const total = DECKS.reduce((n, d) => n + d.cards.length, 0);
const cell = s => s.replace(/\|/g, "\\|");

let md = `# NCA-AIIO 速记卡（${total} 张）\n\n> 由 \`build.js\` 从 \`cards-*.js\` 生成，请勿手改。要翻卡和记录熟练度，请用同目录的 [index.html](index.html)；`;
md += `要用 Anki，导入 [anki-import.txt](anki-import.txt)。\n\n## 牌组\n\n| 领域 | 牌组 | 张数 |\n| --- | --- | --- |\n`;
for (const d of [1, 2, 3, 0]) for (const k of DECKS.filter(x => x.d === d)) md += `| ${DNAME[d]} | [${k.name}](#${k.key}) | ${k.cards.length} |\n`;
for (const d of [1, 2, 3, 0]) {
  md += `\n## ${DNAME[d]}\n`;
  for (const k of DECKS.filter(x => x.d === d)) {
    md += `\n<a id="${k.key}"></a>\n### ${k.name}（${k.cards.length}）\n\n| 正面 | 背面 |\n| --- | --- |\n`;
    for (const [f, b] of k.cards) md += `| ${cell(f)} | ${cell(b)} |\n`;
  }
}
fs.writeFileSync(path.join(__dirname, "flashcards.md"), md);

let tsv = "#separator:tab\n#html:false\n#tags column:3\n";
for (const k of DECKS) for (const [f, b] of k.cards) tsv += `${f}\t${b}\tAIIO::D${k.d} AIIO::${k.key}\n`;
fs.writeFileSync(path.join(__dirname, "anki-import.txt"), tsv);
console.log(`decks ${DECKS.length}, cards ${total} → flashcards.md, anki-import.txt`);
