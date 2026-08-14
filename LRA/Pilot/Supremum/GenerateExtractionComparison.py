"""Generate the Supremum Lean-versus-Volume-III landscape calibration PDF source.

Inputs remain read-only.  The generated report is deliberately a pilot build
artifact: it does not rewrite Volume III or claim that the experimental local
notation is governed production notation.
"""

from __future__ import annotations

import argparse
import json
import re
from collections import Counter
from pathlib import Path


PRIMARY = "LRA.Pilot.OrderBounds.LeastUpperBound"
GENERAL_NEGATION = "LRA.Pilot.OrderBounds.NotLeastUpperBoundIffFailure"
STRICT_NEGATION = "LRA.Pilot.OrderBounds.NotLeastUpperBoundIffStrictFailureOfTotal"
UNIQUENESS = "LRA.Pilot.OrderBounds.LeastUpperBoundUnique"


def extract_environment(source: str, environment: str, title: str | None = None) -> str:
    heading = rf"\\begin\{{{re.escape(environment)}\}}"
    if title is not None:
        heading += rf"\[{re.escape(title)}\]"
    match = re.search(heading, source)
    if not match:
        raise ValueError(f"missing {environment} environment {title or ''}".strip())
    start = match.start()
    cursor = match.end()
    depth = 1
    token = re.compile(rf"\\(begin|end)\{{{re.escape(environment)}\}}")
    while depth:
        next_token = token.search(source, cursor)
        if not next_token:
            raise ValueError(f"unterminated {environment} environment")
        depth += 1 if next_token.group(1) == "begin" else -1
        cursor = next_token.end()
    return source[start:cursor]


def extract_definition_box(source: str, title: str) -> str:
    start_token = rf"\begin{{definitionbox}}{{{title}}}"
    start = source.index(start_token)
    end_token = r"\end{definitionbox}"
    end = source.index(end_token, start) + len(end_token)
    return source[start:end]


def ascii_lean(value: str | None) -> str:
    if not value:
        return "[not applicable]"
    replacements = {
        "∀": "forall ",
        "∃": "exists ",
        "¬": "not ",
        "∧": " and ",
        "∨": " or ",
        "→": " -> ",
        "↔": " <-> ",
        "∈": " in ",
        "≤": " <= ",
        "<": " < ",
        "⟨": "<",
        "⟩": ">",
        "·": ".",
        "₁": "1",
        "₂": "2",
    }
    for old, new in replacements.items():
        value = value.replace(old, new)
    ascii_value = value.encode("ascii", "replace").decode("ascii")
    return "\n".join(line.rstrip() for line in ascii_value.splitlines())


def tex_escape(value: object) -> str:
    text = str(value)
    for old, new in [
        ("\\", r"\textbackslash{}"),
        ("&", r"\&"),
        ("%", r"\%"),
        ("$", r"\$"),
        ("#", r"\#"),
        ("_", r"\_"),
        ("{", r"\{"),
        ("}", r"\}"),
        ("~", r"\textasciitilde{}"),
        ("^", r"\textasciicircum{}"),
    ]:
        text = text.replace(old, new)
    return text


def fit_display_math(source: str) -> str:
    """Preserve display content while fitting it to one comparison column."""

    def replace(match: re.Match[str]) -> str:
        content = " ".join(match.group(1).split())
        if len(content) > 180:
            content = content.replace(r"\qquad", r"\\ &\qquad")
            content = content.replace(r"\Longleftrightarrow", r"\\ &\Longleftrightarrow")
            content = content.replace(r":=", r"\\ &:=")
            content = r"\begin{aligned}&" + content + r"\end{aligned}"
        return (
            r"\begin{center}\begin{adjustbox}{max width=.98\linewidth}$\displaystyle "
            + content
            + r"$\end{adjustbox}\end{center}"
        )

    return re.sub(r"\\\[(.*?)\\\]", replace, source, flags=re.S)


def write_text(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text.rstrip() + "\n", encoding="utf-8")


def node_index(graph: dict) -> dict[str, dict]:
    return {node["declaration"]: node for node in graph["nodes"]}


def proof_summary(node: dict) -> str:
    return "\n".join(
        [
            f"declaration: {node['declaration']}",
            f"proof term: {node['proofTermStatus']}",
            f"proof digest: {node.get('proofTermDigest')}",
            f"direct proof constants: {len(node['proofDependencies'])}",
            f"internal LRA: {len(node['proofDependencyPartition']['internalLra'])}",
            f"external library: {len(node['proofDependencyPartition']['externalLibrary'])}",
            f"kernel/platform: {len(node['proofDependencyPartition']['kernelPlatform'])}",
            f"kernel axiom closure: {', '.join(node['kernelAxioms']) or '[none]'}",
            f"uses sorryAx: {node['usesSorry']}",
        ]
    )


def logic_constants(value: object) -> list[str]:
    """Return the fully qualified constants retained in one raw logic node."""
    found: list[str] = []
    if isinstance(value, dict):
        if value.get("kind") == "constant" and isinstance(value.get("name"), str):
            found.append(value["name"])
        for child in value.values():
            found.extend(logic_constants(child))
    elif isinstance(value, list):
        for child in value:
            found.extend(logic_constants(child))
    return list(dict.fromkeys(found))


def logic_outline(value: object, depth: int = 0, limit: int = 9) -> list[str]:
    """Make the extractor's raw logic AST inspectable without hiding rough edges."""
    indent = "  " * depth
    if depth >= limit:
        return [indent + "..."]
    if not isinstance(value, dict):
        return [indent + repr(value)]
    kind = str(value.get("kind", "unknown"))
    if kind in {"and", "or", "implies", "iff"}:
        lines = [indent + kind.upper()]
        lines.extend(logic_outline(value.get("left"), depth + 1, limit))
        lines.extend(logic_outline(value.get("right"), depth + 1, limit))
        return lines
    if kind == "not":
        return [indent + "NOT", *logic_outline(value.get("body"), depth + 1, limit)]
    if kind in {"forall", "exists"}:
        name = str(value.get("name", "_"))
        lines = [indent + f"{kind.upper()} {name}"]
        domain_names = logic_constants(value.get("domain"))
        if domain_names:
            lines.append(indent + "  domain constants: " + ", ".join(domain_names))
        lines.extend(logic_outline(value.get("body"), depth + 1, limit))
        return lines
    constants = logic_constants(value)
    label = kind.upper()
    if constants:
        label += " constants: " + ", ".join(constants)
    return [indent + label]


def coverage_inventory(primary: dict, graph: dict) -> list[dict[str, str]]:
    """Slot-complete actuality audit for the definition-centered extraction unit."""
    has = lambda key: bool(primary.get(key))
    return [
        {"slot": "Artifact identity / label", "lean": "concept ID + declaration ID available; artifact label not joined", "volume": "def:supremum present", "owner": "Joined + authored"},
        {"slot": "Kind and title", "lean": "definition kind; Lean name is fallback only", "volume": "Definition / Supremum present", "owner": "Authored, Lean-validated"},
        {"slot": "Canonical prose definition", "lean": "docstring evidence, not canonical prose", "volume": "present", "owner": "Authored"},
        {"slot": "Ambient structure", "lean": "Poset binder extracted", "volume": "arbitrary poset in box; R in later readings", "owner": "Reviewed binder roles"},
        {"slot": "Parameters", "lean": "set object, subset, candidate extracted", "volume": "S, A, s present", "owner": "Reviewed rendering"},
        {"slot": "Mathematical assumptions", "lean": "no nonempty / total / complete hypothesis", "volume": "nonempty standing convention; R specialization", "owner": "Authored, Lean-checked"},
        {"slot": "Canonical mathematical display", "lean": "renderable candidate; no governed renderer", "volume": "present", "owner": "Approved join"},
        {"slot": "Raw Lean signature", "lean": "available", "volume": "not applicable", "owner": "Lean"},
        {"slot": "Folded predicate body", "lean": "available" if has("foldedPredicateLogic") else "missing", "volume": "Predicate reading present", "owner": "Lean + governed rendering"},
        {"slot": "Normalized proposition tree", "lean": "available; membership proof binders are implication guards", "volume": "not applicable", "owner": "Lean transform"},
        {"slot": "Fully unfolded predicate logic", "lean": "available; definitional equality verified", "volume": "definition equations present", "owner": "Lean transform + approved rendering"},
        {"slot": "Standard quantified statement", "lean": "candidate available; unapproved", "volume": "present, but adds nonempty and R", "owner": "Transform then semantic approval"},
        {"slot": "Predicate reading", "lean": "folded evidence available; T10 registry join pending", "volume": "present", "owner": "Governed join + approval"},
        {"slot": "Literal negation", "lean": "available", "volume": "not shown as literal structural negation", "owner": "Lean transform"},
        {"slot": "Pushed negation", "lean": "AST candidate available; classical principles recorded", "volume": "strict real form present, plus empty-domain clause", "owner": "Transform / checked witness / approval"},
        {"slot": "Negated quantified statement", "lean": "renderable candidate; no governed surface form", "volume": "present", "owner": "Transform then approval"},
        {"slot": "Negation predicate reading", "lean": "checked general and total-order theorems available", "volume": "present", "owner": "Checked witness + governed join"},
        {"slot": "Contrapositive", "lean": "not applicable to a definition", "volume": "missing / not applicable", "owner": "Theorem-only reviewed block"},
        {"slot": "Aliases / equivalent forms", "lean": "Supremum and LUB definitional aliases extracted", "volume": "least-upper-bound wording present", "owner": "Checked witness + authored selection"},
        {"slot": "Failure modes", "lean": "checked failure predicates and equivalences", "volume": "present with authored labels", "owner": "Lean clauses + authored taxonomy"},
        {"slot": "Examples", "lean": "9 checked manifest examples", "volume": "figures/exposition, no formal attachment", "owner": "Authored selection + checked witnesses"},
        {"slot": "Counterexamples", "lean": "5 checked records", "volume": "empty-set explanation present", "owner": "Authored selection + checked witnesses"},
        {"slot": "Formal dependencies", "lean": f"typed graphs available ({len(graph['edges'])} direct; {len(graph.get('transitiveEdges', []))} transitive)", "volume": "not shown", "owner": "Lean"},
        {"slot": "Learner prerequisites", "lean": "not inferable", "volume": "3 dependencies present", "owner": "Authored"},
        {"slot": "Proof term / trust", "lean": "N/A for definition; available on attached theorems", "volume": "not shown", "owner": "Lean"},
        {"slot": "Detailed professional proof", "lean": "not recoverable from compiled term", "volume": "uniqueness proof TODO", "owner": "Authored"},
        {"slot": "Detailed learner proof", "lean": "not recoverable from compiled term", "volume": "uniqueness proof TODO", "owner": "Authored"},
        {"slot": "Interpretation", "lean": "docstring may suggest; cannot approve", "volume": "present", "owner": "Authored"},
        {"slot": "Exposition / motivation", "lean": "not inferable", "volume": "present", "owner": "Authored"},
        {"slot": "Lean formalization marker", "lean": "declaration evidence available", "volume": "missing on def:supremum", "owner": "Reviewed correspondence join"},
    ]


def build_report(graph: dict, vol_source: str, proof_source: str, output_dir: Path) -> Path:
    nodes = node_index(graph)
    primary = nodes[PRIMARY]
    general_negation = nodes[GENERAL_NEGATION]
    strict_negation = nodes[STRICT_NEGATION]
    uniqueness = nodes[UNIQUENESS]

    snippets = output_dir / "snippets"
    volume_definition = extract_definition_box(vol_source, "Supremum")
    volume_definition = re.sub(r"\\label\{[^}]+\}", "", volume_definition)
    volume_definition = volume_definition.replace(r"\begin{definition}[Supremum]", r"\begin{definition*}[Supremum]")
    volume_definition = volume_definition.replace(r"\end{definition}", r"\end{definition*}")
    write_text(snippets / "vol3-definition.tex", fit_display_math(volume_definition))
    write_text(
        snippets / "vol3-standard-predicate.tex",
        fit_display_math(extract_environment(vol_source, "remark*", "Standard quantified statement"))
        + "\n\n"
        + fit_display_math(extract_environment(vol_source, "remark*", "Predicate reading")),
    )
    write_text(
        snippets / "vol3-negations.tex",
        fit_display_math(extract_environment(vol_source, "remark*", "Negated quantified statement"))
        + "\n\n"
        + fit_display_math(extract_environment(vol_source, "remark*", "Negation predicate reading")),
    )
    write_text(
        snippets / "vol3-failures.tex",
        fit_display_math(extract_environment(vol_source, "remark*", "Failure modes"))
        + "\n\n"
        + extract_environment(vol_source, "remark*", "Interpretation"),
    )
    write_text(
        snippets / "vol3-exposition-dependencies.tex",
        extract_environment(vol_source, "remark*", "Exposition")
        + "\n\n"
        + extract_environment(vol_source, "dependencies"),
    )
    proof_body = re.sub(r"^.*?\\begin\{proposition\*\}", r"\\begin{proposition*}", proof_source, flags=re.S)
    proof_body = proof_body[: proof_body.index(r"\clearpage")]
    write_text(snippets / "vol3-uniqueness-proof.tex", proof_body)

    write_text(snippets / "lean-primary-type.txt", ascii_lean(primary["statement"]))
    write_text(snippets / "lean-primary-body.txt", ascii_lean(primary["definitionBody"]))
    write_text(snippets / "lean-primary-unfolded.txt", ascii_lean(primary["controlledUnfolding"]))
    write_text(snippets / "lean-folded-predicate.txt", ascii_lean(primary["foldedPredicateLogic"]))
    write_text(snippets / "lean-unfolded-predicate.txt", ascii_lean(primary["unfoldedPredicateLogic"]))
    write_text(
        snippets / "lean-raw-logic-outline.txt",
        "\n".join(logic_outline(primary["controlledUnfoldingLogicExpression"])),
    )
    write_text(
        snippets / "lean-pushed-negation-outline.txt",
        "\n".join(logic_outline(primary["pushedNegationExpression"])),
    )
    write_text(snippets / "lean-primary-negation.txt", ascii_lean(primary["mechanicalDefinitionNegation"]))
    write_text(snippets / "lean-general-negation.txt", ascii_lean(general_negation["statement"]))
    write_text(snippets / "lean-strict-negation.txt", ascii_lean(strict_negation["statement"]))
    write_text(snippets / "lean-uniqueness-proof.txt", ascii_lean(proof_summary(uniqueness)))

    roles = Counter(entry["role"] for entry in graph["harvestManifest"])
    role_rows = "\n".join(
        rf"{tex_escape(role.replace('_', ' '))} & {count} \\" for role, count in sorted(roles.items())
    )
    examples = [node for node in graph["nodes"] if node.get("manifestRole") == "example"]
    counterexamples = [
        node
        for node in graph["nodes"]
        if node.get("manifestRole") in {"counterexample", "counterexample_structure"}
    ]
    example_items = "\n".join(
        rf"\item \texttt{{{tex_escape(node['title'])}}}: {tex_escape(node['relationshipToPrimary'].replace('_', ' '))}"
        for node in examples
    )
    counterexample_items = "\n".join(
        rf"\item \texttt{{{tex_escape(node['title'])}}}: {tex_escape(node['relationshipToPrimary'].replace('_', ' '))}"
        for node in counterexamples
    )

    theorem_nodes = [
        node
        for node in graph["nodes"]
        if node.get("manifestRole") in {"consequence_theorem", "relationship_theorem", "boundary_theorem"}
    ]
    theorem_items = "\n".join(
        rf"\item \texttt{{{tex_escape(node['title'])}}} -- {tex_escape(node['relationshipToPrimary'].replace('_', ' '))}"
        for node in theorem_nodes
    )

    coverage = coverage_inventory(primary, graph)
    write_text(
        output_dir / "supremum-coverage-audit.json",
        json.dumps(
            {
                "primaryDeclaration": PRIMARY,
                "purpose": "slot-complete Lean versus Volume III actuality audit",
                "slots": coverage,
            },
            indent=2,
            ensure_ascii=False,
        ),
    )

    def coverage_rows(rows: list[dict[str, str]]) -> str:
        return "\n".join(
            rf"\textbf{{{tex_escape(row['slot'])}}} & {tex_escape(row['lean'])} & {tex_escape(row['volume'])} & {tex_escape(row['owner'])} \\"
            for row in rows
        )

    coverage_rows_a = coverage_rows(coverage[:15])
    coverage_rows_b = coverage_rows(coverage[15:])

    tex_path = output_dir / "supremum-extraction-comparison.tex"
    tex = rf"""\documentclass[10pt]{{article}}
\usepackage[letterpaper,landscape,margin=0.34in,headheight=15pt,footskip=16pt]{{geometry}}
\usepackage[T1]{{fontenc}}
\usepackage{{lmodern,amsmath,amssymb,amsthm,adjustbox,array,booktabs,enumitem,fancyhdr,fvextra,hyperref,microtype,tabularx,tcolorbox,xcolor}}
\tcbuselibrary{{breakable,skins}}
\definecolor{{leanblue}}{{HTML}}{{173F5F}}
\definecolor{{volorange}}{{HTML}}{{9C4A1A}}
\definecolor{{softblue}}{{HTML}}{{EAF2F8}}
\definecolor{{softorange}}{{HTML}}{{FBF0E8}}
\definecolor{{ink}}{{HTML}}{{20262E}}
\hypersetup{{colorlinks=true,linkcolor=leanblue}}
\renewcommand{{\hyperref}}[2][]{{#2}}
\setlength{{\parindent}}{{0pt}}
\setlength{{\parskip}}{{3pt}}
\setlist{{nosep,leftmargin=1.2em}}
\pagestyle{{fancy}}
\fancyhf{{}}
\lhead{{\sffamily\bfseries Supremum extraction calibration}}
\rhead{{\sffamily Lean evidence $\leftrightarrow$ Volume III authoring}}
\cfoot{{\sffamily\thepage}}
\newtheorem{{definition}}{{Definition}}
\newtheorem*{{definition*}}{{Definition}}
\newtheorem*{{proposition*}}{{Proposition}}
\newtheorem*{{remark*}}{{}}
\newenvironment{{dependencies}}{{\par\medskip\textbf{{Dependencies}}\par}}{{}}
\newcommand{{\LRAProofFor}}[1]{{}}
\newcommand{{\LRAProofBodyStart}}{{}}
\newtcolorbox{{definitionbox}}[1]{{colback=softorange,colframe=volorange,title=\textbf{{#1}},boxrule=.6pt,arc=1mm,left=1.5mm,right=1.5mm,top=1mm,bottom=1mm}}
\newtcolorbox{{leanbox}}[1]{{colback=softblue,colframe=leanblue,title=\textbf{{#1}},boxrule=.6pt,arc=1mm,left=1.5mm,right=1.5mm,top=1mm,bottom=1mm}}
\newcommand{{\PageTitle}}[2]{{\begin{{center}}\sffamily\Large\bfseries #1\\[-1pt]\small\mdseries #2\end{{center}}\vspace{{-4pt}}}}
\newcommand{{\Columns}}[2]{{\begin{{minipage}}[t]{{.488\textwidth}}#1\end{{minipage}}\hfill\vrule\hfill\begin{{minipage}}[t]{{.488\textwidth}}#2\end{{minipage}}}}
\newcommand{{\LeanHead}}{{\color{{leanblue}}\sffamily\bfseries LEAN: HARVESTED OR MECHANICALLY TRANSFORMED\par\color{{ink}}}}
\newcommand{{\VolHead}}{{\color{{volorange}}\sffamily\bfseries VOLUME III: CURRENT AUTHORED LATEX\par\color{{ink}}}}
\newcommand{{\AuditHead}}{{\textbf{{Contract slot}} & \textbf{{Lean actuality}} & \textbf{{Volume III actuality}} & \textbf{{Authority / next join}}\\}}
\fvset{{fontsize=\scriptsize,breaklines=true,breakanywhere=true,frame=single,framesep=2mm}}
\begin{{document}}

\PageTitle{{One concept becomes an evidence family}}{{The extraction unit is not one printed definition}}
\Columns{{
\LeanHead
\begin{{leanbox}}{{Run envelope}}
Schema: \texttt{{{tex_escape(graph['schemaId'])}/v{graph['schemaVersion']}}}\\
Manifest: \texttt{{{tex_escape(graph['manifestVersion'])}}}\\
Primary: \texttt{{LeastUpperBound}}\\
Seeds: \textbf{{{len(graph['harvestManifest'])}}}; dependency-closed declarations: \textbf{{{len(graph['nodes'])}}}; direct typed edges: \textbf{{{len(graph['edges'])}}}; transitive reachability edges: \textbf{{{len(graph.get('transitiveEdges', []))}}}.
\end{{leanbox}}
\small
\begin{{tabular}}{{@{{}}p{{.79\linewidth}}r@{{}}}}
\toprule Manifest role & Count\\\midrule
{role_rows}
\bottomrule
\end{{tabular}}
\par\medskip
One definition requires aliases, unfolded predicates, checked logical forms,
consequences, witnesses, examples, counterexamples, proof evidence, and formal
dependency graphs. Eight additional declarations enter only through formal
dependency closure.
}}{{
\VolHead
\input{{snippets/vol3-definition.tex}}
\smallskip
\textit{{Visible authored unit:}} one definition box. Its surrounding logical,
failure, dependency, and pedagogical blocks are separate content even though
they describe the same concept.
}}
\newpage

\PageTitle{{Raw first-order predicate logic}}{{Exact extracted text and AST on the left; the current authored definition on the right}}
\Columns{{
\LeanHead
\begin{{leanbox}}{{Raw fully unfolded predicate (exact Lean pretty-print)}}
\VerbatimInput{{snippets/lean-unfolded-predicate.txt}}
\end{{leanbox}}
\begin{{leanbox}}{{Raw extraction-logic tree (no notation cleanup)}}
\VerbatimInput{{snippets/lean-raw-logic-outline.txt}}
\end{{leanbox}}
\begin{{leanbox}}{{Pilot-readable FOL projection of that extracted structure}}
\[
  (\forall a\in A)\,(a\leq_P s)
  \;\land\;
  (\forall u\in P)\Bigl[
    (\forall a\in A)\,(a\leq_P u)
    \Longrightarrow s\leq_P u
  \Bigr].
\]
\end{{leanbox}}
\scriptsize
The first box is harvested after policy-bounded unfolding; the second is the
normalized proposition tree backed by retained raw Lean expressions. The third is an \textbf{{experimental local renderer}},
not approved T10 governance output. Definitional equality to the compiled body:
\textbf{{{primary['unfoldingDefinitionalEqualityVerified']}}}. Metatype-checked
normalization classifies proposition proof binders as implication guards and
retains data binders as quantifiers.
}}{{
\VolHead
\input{{snippets/vol3-definition.tex}}
\begin{{tcolorbox}}[colback=softorange,colframe=volorange,title=\textbf{{Actual comparison}},boxrule=.6pt]
\small
The definition box and Lean agree on the two defining clauses in an arbitrary
poset. The later Volume ``standard quantified'' block is \emph{{not}} the same
formula: it adds $A\ne\varnothing$ and changes the competitor domain to
$\mathbb R$. Those are authored scope choices, not facts recovered from this
Lean definition.
\end{{tcolorbox}}
}}
\newpage

\PageTitle{{Folded predicate and predicate readings}}{{One extracted definition supports both the unfolded FOL and named-predicate views}}
\Columns{{
\LeanHead
\begin{{leanbox}}{{Folded predicate body (exact Lean pretty-print)}}
\VerbatimInput{{snippets/lean-folded-predicate.txt}}
\end{{leanbox}}
\begin{{leanbox}}{{Pilot-readable predicate reading}}
\[
 \operatorname{{UpperBound}}_P(A,x)
 :\Longleftrightarrow (\forall a\in A)(a\leq_P x),
\]
\begin{{center}}\begin{{adjustbox}}{{max width=.96\linewidth}}$\displaystyle
\begin{{aligned}}
 \operatorname{{LeastUpperBound}}_P(A,s)
 &:\Longleftrightarrow \operatorname{{UpperBound}}_P(A,s)\\
 &\qquad\land (\forall u\in P)
 \bigl(\operatorname{{UpperBound}}_P(A,u)\Rightarrow s\leq_P u\bigr).
\end{{aligned}}$
\end{{adjustbox}}\end{{center}}
\end{{leanbox}}
\begin{{leanbox}}{{Aliases available from checked definitions}}
\texttt{{Supremum}} and \texttt{{LUB}} are definitionally checked aliases of
\texttt{{LeastUpperBound}}. Their publication as preferred surface names is
still an authored/governed choice.
\end{{leanbox}}
\scriptsize
Lean supplies the folded predicate structure. Argument ordering, typography,
the symbol $P$, and the published name require the governed predicate and
notation join; this page intentionally labels the local rendering as provisional.
}}{{
\VolHead
\input{{snippets/vol3-standard-predicate.tex}}
\begin{{tcolorbox}}[colback=softorange,colframe=volorange,title=\textbf{{Actual comparison}},boxrule=.6pt]
\small
The Volume predicate reading is already authored, but it orders arguments as
$(s,A,P)$ and specializes $P$ to the real order. Lean's compiled declaration
orders them as $(P,A,s)$ and is generic over the carrier and set interface.
The mathematical core aligns; the rendering and scope do not yet share a
reviewed correspondence record.
\end{{tcolorbox}}
}}
\newpage

\PageTitle{{Negation layers, shown separately}}{{Literal, pushed, checked-general, and strict-total-order readings are not one field}}
\Columns{{
\LeanHead
\begin{{leanbox}}{{Literal negation of the unfolded body}}
\VerbatimInput{{snippets/lean-primary-negation.txt}}
\end{{leanbox}}
\begin{{leanbox}}{{Raw pushed-negation AST}}
\VerbatimInput{{snippets/lean-pushed-negation-outline.txt}}
\end{{leanbox}}
\begin{{leanbox}}{{Pilot-readable pushed FOL (general poset)}}
\[
 (\exists a\in A)\,\neg(a\leq_P s)
 \;\lor\;
 (\exists u\in P)\Bigl[
   (\forall a\in A)(a\leq_P u)\land\neg(s\leq_P u)
 \Bigr].
\]
\end{{leanbox}}
\scriptsize
Candidate status: \textbf{{mechanically derived; unapproved; classical
principles recorded}}. The transform records uses of
$\neg\forall\Rightarrow\exists\neg$ and
$\neg(A\Rightarrow B)\Rightarrow A\land\neg B$. Strict inequalities require
the separately checked total-order theorem; they are not generic FOL cleanup.
Membership guards are normalized structurally; publication still requires the
checked family witness and reviewed rendering correspondence.
}}{{
\VolHead
\input{{snippets/vol3-negations.tex}}
\begin{{tcolorbox}}[colback=softorange,colframe=volorange,title=\textbf{{Actual comparison}},boxrule=.6pt]
\small
The two witness clauses correspond after assuming total order and choosing the
strict rendering. The Volume also adds $A=\varnothing$ because its section has
made nonemptiness part of applicability. That clause is \textbf{{not}} the
negation of Lean's least-upper-bound predicate: in a poset with a least element,
the empty set can have a least upper bound.
\end{{tcolorbox}}
}}
\newpage

\PageTitle{{Definition surface and fully unfolded predicate logic}}{{Lean separates the declaration type, body, and policy-bounded expansion}}
\Columns{{
\LeanHead
\begin{{leanbox}}{{Declaration type}}
\VerbatimInput{{snippets/lean-primary-type.txt}}
\end{{leanbox}}
\begin{{leanbox}}{{Compiled definition body}}
\VerbatimInput{{snippets/lean-primary-body.txt}}
\end{{leanbox}}
\begin{{leanbox}}{{Controlled full logical unfolding}}
\VerbatimInput{{snippets/lean-primary-unfolded.txt}}
\end{{leanbox}}
\scriptsize
Policy: \texttt{{{tex_escape(graph['unfoldingPolicyVersion'])}}}. Unfolded:
\texttt{{UpperBound}}. Definitional equality check: \textbf{{{primary['unfoldingDefinitionalEqualityVerified']}}}.
The remaining structure and membership constants are explicit stop boundaries,
not silently unfolded residue.
}}{{
\VolHead
\input{{snippets/vol3-standard-predicate.tex}}
\scriptsize
The Volume block adds $A\ne\varnothing$ and specializes a quantified clause to
$\mathbb R$, while the definition box states an arbitrary poset. Neither
addition is present in the canonical Lean predicate. This is an authored
applicability/specialization decision requiring reconciliation.
}}
\newpage

\PageTitle{{Negation is multiple artifacts}}{{Literal negation, pushed logic, checked failure equivalence, and strict-order specialization have different provenance}}
\Columns{{
\LeanHead
\begin{{leanbox}}{{Mechanical negation of the unfolded definition}}
\VerbatimInput{{snippets/lean-primary-negation.txt}}
\end{{leanbox}}
\begin{{leanbox}}{{Checked general-poset failure equivalence}}
\VerbatimInput{{snippets/lean-general-negation.txt}}
\end{{leanbox}}
\begin{{leanbox}}{{Checked total-order strict specialization}}
\VerbatimInput{{snippets/lean-strict-negation.txt}}
\end{{leanbox}}
\scriptsize
The generic transform does not turn $\neg(x\le y)$ into $y<x$. The strict
reading comes from a named theorem carrying totality. All candidates retain
``unapproved'' status until joined to authored semantics.
}}{{
\VolHead
\input{{snippets/vol3-negations.tex}}
\scriptsize
The right side combines three choices: nonemptiness as a domain clause,
real-number totality for strict inequalities, and a named predicate reading.
Lean can validate the last two only through the checked declaration family;
it must not invent the first.
}}
\newpage

\PageTitle{{Failure modes need witnesses and editorial ownership}}{{Formal clauses are harvested; learner-facing classification remains authored}}
\Columns{{
\LeanHead
\begin{{leanbox}}{{Checked failure predicate family}}
\begin{{itemize}}
\item \texttt{{UpperBoundFailure}}: an in-set witness is not below the candidate.
\item \texttt{{SharpnessFailure}}: an upper-bound competitor is not above the candidate.
\item \texttt{{NotUpperBoundIffUpperBoundFailure}} validates the first clause.
\item \texttt{{NotLeastUpperBoundIffFailure}} validates their disjunction.
\item Total-order theorems validate the optional strict rewrites.
\end{{itemize}}
\end{{leanbox}}
\begin{{leanbox}}{{What Lean does not decide}}
``Domain failure'', ``bound failure'', and ``sharpness failure'' are authored
names. Selection, ordering, explanation, and whether empty-set nonexistence is
shown inside this definition entry remain volume/semantic-artifact decisions.
\end{{leanbox}}
}}{{
\VolHead
\input{{snippets/vol3-failures.tex}}
}}
\newpage

\PageTitle{{Consequences and proof evidence}}{{A definition pulls theorem records; compiled proof evidence does not become a detailed learning proof}}
\Columns{{
\LeanHead
\begin{{leanbox}}{{Named consequence family}}
\scriptsize\begin{{itemize}}
{theorem_items}
\end{{itemize}}
\end{{leanbox}}
\begin{{leanbox}}{{Compiled proof evidence: uniqueness}}
\VerbatimInput{{snippets/lean-uniqueness-proof.txt}}
\end{{leanbox}}
\scriptsize
The proof value is recovered with \texttt{{allowOpaque := true}}. Lean supplies
the checked term, digest, direct constants, partitions, kernel closure, and
\texttt{{sorryAx}} result. It does not recover tactic intent or pedagogical
steps from the compiled term.
}}{{
\VolHead
\input{{snippets/vol3-uniqueness-proof.tex}}
\scriptsize
This is precisely the independent authoring boundary: the current Volume III
professional and detailed proofs are explicit TODOs even though Lean already
has a checked uniqueness proof and formal dependency evidence.
}}
\newpage

\PageTitle{{Examples, counterexamples, and dependency ownership}}{{The formal family verifies claims; the volume chooses what teaches the concept}}
\Columns{{
\LeanHead
\begin{{leanbox}}{{Eight checked examples}}
\scriptsize\begin{{itemize}}
{example_items}
\end{{itemize}}
\end{{leanbox}}
\begin{{leanbox}}{{Five counterexample records}}
\scriptsize\begin{{itemize}}
{counterexample_items}
\end{{itemize}}
\end{{leanbox}}
\begin{{leanbox}}{{Dependency contract}}
Formal statement, definition, proof, transitive, and kernel-trust graphs are
generated separately. Learner prerequisites and prose-proof dependencies
remain authored and must not be inferred from proof-term reachability.
\end{{leanbox}}
}}{{
\VolHead
\input{{snippets/vol3-exposition-dependencies.tex}}
\begin{{tcolorbox}}[colback=softorange,colframe=volorange,title=\textbf{{Comparison verdict}},boxrule=.6pt]
\small
Volume III chooses nonemptiness, the real-number presentation, the featured
empty-set explanation, and three learner dependencies. Lean can check related
formal claims, but cannot generate those pedagogical choices. Conversely, the
Volume entry does not expose aliases, proof trust, formal dependency classes,
totality boundaries, or the full checked witness inventory without the Lean
attachment.
\end{{tcolorbox}}
}}
\newpage

\PageTitle{{Actuality audit: definition and logical slots}}{{Every contracted slot appears, including unavailable and not-applicable fields}}
\scriptsize
\renewcommand{{\arraystretch}}{{1.22}}
\begin{{tabularx}}{{\textwidth}}{{@{{}}p{{.19\textwidth}}X X p{{.18\textwidth}}@{{}}}}
\toprule
\AuditHead
\midrule
{coverage_rows_a}
\bottomrule
\end{{tabularx}}
\par\medskip
\footnotesize
``Available'' on the Lean side means evidence or an unapproved mechanical
candidate exists. It does not mean that candidate already owns the published
mathematics or typography.
\newpage

\PageTitle{{Actuality audit: attached boxes, proofs, and pedagogy}}{{What can be populated, what can only be validated, and what remains authored}}
\scriptsize
\renewcommand{{\arraystretch}}{{1.22}}
\begin{{tabularx}}{{\textwidth}}{{@{{}}p{{.19\textwidth}}X X p{{.18\textwidth}}@{{}}}}
\toprule
\AuditHead
\midrule
{coverage_rows_b}
\bottomrule
\end{{tabularx}}
\par\medskip
\begin{{tcolorbox}}[colback=black!3,colframe=black!55,title=\textbf{{Bottom line}},boxrule=.6pt]
\small
Lean now supplies most formal structure needed for the definition, raw FOL,
folded predicate, literal negation, pushed-negation candidate, checked failure
readings, aliases, examples, counterexamples, dependencies, and theorem trust.
The largest remaining engineering gap is the governed T10/T11 join and renderer.
The irreducible authoring layer is title/prose, applicability conventions,
pedagogical selection, learner dependencies, interpretation/exposition,
detailed proof narrative, and reviewed Lean-to-artifact correspondence.
\end{{tcolorbox}}

\end{{document}}
"""
    write_text(tex_path, tex)
    return tex_path


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--json", type=Path, required=True)
    parser.add_argument("--volume-tex", type=Path, required=True)
    parser.add_argument("--volume-proof", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    args = parser.parse_args()

    graph = json.loads(args.json.read_text(encoding="utf-8"))
    if graph.get("primaryDeclaration") != PRIMARY:
        raise ValueError("input is not the Supremum extraction contract package")
    args.output_dir.mkdir(parents=True, exist_ok=True)
    tex = build_report(
        graph,
        args.volume_tex.read_text(encoding="utf-8"),
        args.volume_proof.read_text(encoding="utf-8"),
        args.output_dir,
    )
    print(tex)


if __name__ == "__main__":
    main()
