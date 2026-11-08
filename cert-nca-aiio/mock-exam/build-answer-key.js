// 用法：node build-answer-key.js   → 从 questions.js 生成 paper-A.md / paper-B.md（题目在前，答案解析在文末）
const fs = require("fs"), path = require("path");
global.window = {};
require(path.join(__dirname, "questions.js"));
const Q = window.AIIO_QUESTIONS, L = ["A", "B", "C", "D", "E"];
const DOM = { 1: "AI 基础知识", 2: "AI 基础设施", 3: "AI 运维" };
const NOTE = { 1: "01-essential-ai-knowledge.md", 2: "02-ai-infrastructure.md", 3: "03-ai-operations.md" };
for (const set of ["A", "B"]) {
  const qs = Q.filter(q => q.set === set);
  let md = `# 模拟考 ${set}（50 题 / 60 分钟）\n\n> 由 \`build-answer-key.js\` 从 \`questions.js\` 生成，请勿手改。自编练习题，非真题。\n`;
  md += `> 建议在 [交互式考场](index.html) 里计时作答；这份 Markdown 方便在 GitHub 上直接阅读或打印。\n\n`;
  md += `| 领域 | 题数 |\n| --- | --- |\n` + [1, 2, 3].map(d => `| ${d}. ${DOM[d]} | ${qs.filter(q => q.d === d).length} |`).join("\n") + "\n\n## 题目\n\n";
  qs.forEach((q, i) => {
    md += `**${i + 1}.** ${q.q}\n\n` + q.o.map((o, j) => `- ${L[j]}. ${o}`).join("\n") + "\n\n";
  });
  md += `## 答案与解析\n\n| 题 | 答案 | 领域 | 考点 | 复习 |\n| --- | --- | --- | --- | --- |\n`;
  qs.forEach((q, i) => { md += `| ${i + 1} | ${q.a.map(j => L[j]).join(", ")} | D${q.d} | ${q.t} | ${NOTE[q.d]} ${q.ref} |\n`; });
  md += "\n";
  qs.forEach((q, i) => { md += `**${i + 1}. ${q.a.map(j => L[j]).join(", ")}**　${q.e}\n\n`; });
  fs.writeFileSync(path.join(__dirname, `paper-${set}.md`), md);
  console.log(`paper-${set}.md`, qs.length, "questions");
}
