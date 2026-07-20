#!/usr/bin/env python3
"""Build a static web view of the repository's real Markdown and Lean sources.

The generated navigation mirrors tracked paths instead of relying on a separate,
hand-maintained mathematical outline.
"""

from __future__ import annotations

import html
import pathlib
import re
import shutil
from dataclasses import dataclass

ROOT = pathlib.Path(__file__).resolve().parents[1]
SITE = ROOT / "site"
BLUEPRINT_WEB = ROOT / "blueprint" / "web" / "index.html"
BLUEPRINT_PDF = ROOT / "blueprint" / "print" / "print.pdf"
REPOSITORY_URL = "https://github.com/wsollers/lra-lean"

EXCLUDED_MARKDOWN = {
    pathlib.Path("AGENTS.md"),
    pathlib.Path("CLAUDE.md"),
    pathlib.Path("GEMINI.md"),
    pathlib.Path(".github/copilot-instructions.md"),
    pathlib.Path(".github/instructions/lra.instructions.md"),
}

DECLARATION_PATTERN = re.compile(
    r"^\s*(?:noncomputable\s+)?(def|theorem|axiom|structure|inductive|class|abbrev)\s+"
    r"([A-Za-z_][A-Za-z0-9_'.]*)",
    re.MULTILINE,
)


@dataclass(frozen=True)
class LeanDeclaration:
    kind: str
    name: str


def page(title: str, body: str, *, depth: int = 0) -> str:
    prefix = "../" * depth
    blueprint_link = (
        f'    <a href="{prefix}blueprint/index.html">Blueprint</a>\n'
        if BLUEPRINT_WEB.exists()
        else ""
    )
    mermaid_script = (
        """
  <script type="module">
    import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.esm.min.mjs';
    mermaid.initialize({ startOnLoad: true, securityLevel: 'strict' });
  </script>"""
        if 'class="mermaid"' in body
        else ""
    )
    return f"""<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{html.escape(title)}</title>
  <style>
    :root {{ color-scheme: light dark; font-family: system-ui, sans-serif; }}
    body {{ max-width: 1120px; margin: 0 auto; padding: 1.25rem; line-height: 1.55; }}
    header {{ display: flex; gap: 1rem; align-items: baseline; flex-wrap: wrap; border-bottom: 1px solid #8885; }}
    nav a {{ margin-right: .9rem; }}
    code, pre {{ font-family: ui-monospace, SFMono-Regular, Consolas, monospace; }}
    pre {{ overflow-x: auto; padding: 1rem; border: 1px solid #8885; border-radius: .4rem; }}
    table {{ border-collapse: collapse; width: 100%; }}
    th, td {{ text-align: left; padding: .45rem; border-bottom: 1px solid #8885; vertical-align: top; }}
    .path {{ color: #666; word-break: break-all; }}
    .status {{ font-weight: 650; }}
    .tree ul {{ margin-top: .2rem; }}
    .tree li {{ margin: .18rem 0; }}
    blockquote {{ border-left: .25rem solid #8888; padding-left: 1rem; margin-left: 0; }}
    .mermaid {{ overflow-x: auto; padding: 1rem; border: 1px solid #8885; border-radius: .4rem; }}
  </style>
{mermaid_script}
</head>
<body>
<header>
  <h1>{html.escape(title)}</h1>
  <nav>
    <a href="{prefix}index.html">Home</a>
    <a href="{prefix}markdown/index.html">Markdown</a>
    <a href="{prefix}lean/index.html">Lean modules</a>
{blueprint_link.rstrip()}
    <a href="{REPOSITORY_URL}">GitHub</a>
  </nav>
</header>
{body}
</body>
</html>
"""


def inline_markdown(text: str) -> str:
    escaped = html.escape(text)
    escaped = re.sub(r"`([^`]+)`", r"<code>\1</code>", escaped)
    escaped = re.sub(r"\*\*([^*]+)\*\*", r"<strong>\1</strong>", escaped)
    escaped = re.sub(r"\*([^*]+)\*", r"<em>\1</em>", escaped)
    escaped = re.sub(
        r"\[([^\]]+)\]\(([^)]+)\)",
        lambda match: f'<a href="{html.escape(match.group(2), quote=True)}">{match.group(1)}</a>',
        escaped,
    )
    return escaped


def render_markdown(source: str) -> str:
    lines = source.splitlines()
    output: list[str] = []
    paragraph: list[str] = []
    in_code = False
    code_info = ""
    code_lines: list[str] = []
    list_kind: str | None = None

    def flush_paragraph() -> None:
        if paragraph:
            output.append(f"<p>{inline_markdown(' '.join(paragraph))}</p>")
            paragraph.clear()

    def close_list() -> None:
        nonlocal list_kind
        if list_kind:
            output.append(f"</{list_kind}>")
            list_kind = None

    for line in lines:
        if line.startswith("```"):
            flush_paragraph()
            close_list()
            if in_code:
                code_text = "\n".join(code_lines)
                if code_info.strip().lower() == "mermaid":
                    output.append(f'<div class="mermaid">{html.escape(code_text)}</div>')
                else:
                    output.append("<pre><code>" + html.escape(code_text) + "</code></pre>")
                code_lines.clear()
                in_code = False
                code_info = ""
            else:
                in_code = True
                code_info = line[3:].strip()
            continue
        if in_code:
            code_lines.append(line)
            continue
        heading = re.match(r"^(#{1,6})\s+(.*)$", line)
        if heading:
            flush_paragraph()
            close_list()
            level = len(heading.group(1))
            output.append(f"<h{level}>{inline_markdown(heading.group(2))}</h{level}>")
            continue
        bullet = re.match(r"^\s*[-*+]\s+(.*)$", line)
        numbered = re.match(r"^\s*\d+[.)]\s+(.*)$", line)
        if bullet or numbered:
            flush_paragraph()
            kind = "ul" if bullet else "ol"
            if list_kind != kind:
                close_list()
                output.append(f"<{kind}>")
                list_kind = kind
            item = (bullet or numbered).group(1)
            output.append(f"<li>{inline_markdown(item)}</li>")
            continue
        if line.startswith(">"):
            flush_paragraph()
            close_list()
            output.append(f"<blockquote>{inline_markdown(line[1:].strip())}</blockquote>")
            continue
        if not line.strip():
            flush_paragraph()
            close_list()
            continue
        paragraph.append(line.strip())

    flush_paragraph()
    close_list()
    if in_code:
        output.append("<pre><code>" + html.escape("\n".join(code_lines)) + "</code></pre>")
    return "\n".join(output)


def output_path(section: str, source_path: pathlib.Path) -> pathlib.Path:
    return SITE / section / source_path.with_suffix(source_path.suffix + ".html")


def relative_depth(path: pathlib.Path) -> int:
    return len(path.relative_to(SITE).parents) - 1


def source_link(path: pathlib.Path) -> str:
    return f"{REPOSITORY_URL}/blob/main/{path.as_posix()}"


def markdown_files() -> list[pathlib.Path]:
    results = []
    for path in ROOT.rglob("*.md"):
        relative = path.relative_to(ROOT)
        if relative in EXCLUDED_MARKDOWN:
            continue
        if any(part in {".git", ".lake", "site", "blueprint"} for part in relative.parts):
            continue
        results.append(relative)
    return sorted(results)


def lean_files() -> list[pathlib.Path]:
    return sorted(path.relative_to(ROOT) for path in (ROOT / "LRA").rglob("*.lean"))


def declarations(text: str) -> list[LeanDeclaration]:
    return [LeanDeclaration(kind, name) for kind, name in DECLARATION_PATTERN.findall(text)]


def write_markdown_pages(paths: list[pathlib.Path]) -> None:
    for relative in paths:
        source = (ROOT / relative).read_text(encoding="utf-8")
        target = output_path("markdown", relative)
        target.parent.mkdir(parents=True, exist_ok=True)
        body = (
            f'<p class="path">{html.escape(relative.as_posix())}</p>'
            f'<p><a href="{source_link(relative)}">View source on GitHub</a></p>'
            + render_markdown(source)
        )
        target.write_text(page(relative.name, body, depth=relative_depth(target)), encoding="utf-8")


def write_lean_pages(paths: list[pathlib.Path]) -> None:
    for relative in paths:
        source = (ROOT / relative).read_text(encoding="utf-8")
        found = declarations(source)
        status = "contains proof placeholders" if re.search(r"\bsorry\b", source) else "no `sorry` found"
        rows = "".join(
            f"<tr><td><code>{html.escape(item.kind)}</code></td><td><code>{html.escape(item.name)}</code></td></tr>"
            for item in found
        ) or '<tr><td colspan="2">No top-level declarations detected.</td></tr>'
        target = output_path("lean", relative)
        target.parent.mkdir(parents=True, exist_ok=True)
        body = f"""
<p class="path">{html.escape(relative.as_posix())}</p>
<p><a href="{source_link(relative)}">View source on GitHub</a></p>
<p class="status">Status: {status}</p>
<h2>Declarations</h2>
<table><thead><tr><th>Kind</th><th>Name</th></tr></thead><tbody>{rows}</tbody></table>
<h2>Source</h2>
<pre><code>{html.escape(source)}</code></pre>
"""
        target.write_text(page(relative.name, body, depth=relative_depth(target)), encoding="utf-8")


def tree_listing(paths: list[pathlib.Path], section: str) -> str:
    items = []
    for relative in paths:
        target = output_path(section, relative)
        href = target.relative_to(SITE / section).as_posix()
        items.append(f'<li><a href="{html.escape(href, quote=True)}">{html.escape(relative.as_posix())}</a></li>')
    return "<ul>" + "".join(items) + "</ul>"


def write_indexes(markdown: list[pathlib.Path], lean: list[pathlib.Path]) -> None:
    markdown_index = SITE / "markdown" / "index.html"
    markdown_index.parent.mkdir(parents=True, exist_ok=True)
    markdown_index.write_text(
        page("Markdown documentation", '<div class="tree">' + tree_listing(markdown, "markdown") + "</div>", depth=1),
        encoding="utf-8",
    )
    lean_index = SITE / "lean" / "index.html"
    lean_index.parent.mkdir(parents=True, exist_ok=True)
    lean_index.write_text(
        page("Lean module tree", '<div class="tree">' + tree_listing(lean, "lean") + "</div>", depth=1),
        encoding="utf-8",
    )
    blueprint_items = ""
    if BLUEPRINT_WEB.exists():
        blueprint_items += '  <li><a href="blueprint/index.html">Number-system Blueprint</a></li>\n'
    if BLUEPRINT_PDF.exists():
        blueprint_items += '  <li><a href="number-systems-blueprint.pdf">Number-system Blueprint PDF</a></li>\n'
    home_body = f"""
<p>This site is generated directly from the tracked repository. It mirrors the actual Markdown files and the <code>LRA/</code> Lean module hierarchy; there is no separate invented mathematical outline.</p>
<section><h2>Repository views</h2>
<ul>
  <li><a href="markdown/index.html">Markdown documentation</a> — {len(markdown)} tracked pages</li>
  <li><a href="lean/index.html">Lean module tree</a> — {len(lean)} modules</li>
{blueprint_items.rstrip()}
  <li><a href="{REPOSITORY_URL}">Source repository</a></li>
</ul></section>
"""
    (SITE / "index.html").write_text(page("Learning Real Analysis — Lean", home_body), encoding="utf-8")


def main() -> None:
    if SITE.exists():
        shutil.rmtree(SITE)
    SITE.mkdir(parents=True)
    markdown = markdown_files()
    lean = lean_files()
    write_markdown_pages(markdown)
    write_lean_pages(lean)
    write_indexes(markdown, lean)
    print(f"Generated {len(markdown)} Markdown pages and {len(lean)} Lean module pages.")


if __name__ == "__main__":
    main()
