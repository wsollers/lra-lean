# CLEANUP.md — Lean vs. LaTeX Audit (Volume I & Volume II)

**Generated:** 2026-07-28
**Scope:** `lra-lean` (`LRA/VolumeI`, `LRA/VolumeII`) vs. `lra-volume-i`, `lra-volume-ii` (LaTeX source of record)
**Purpose:** Estimate how much formalization work remains by comparing the count of theorem-like environments in the LaTeX source against the count of Lean declarations, folder by folder.

## Methodology & caveats

This audit is a **structural** count, not a semantic one. It was produced by:

1. Grepping every `*.tex` file under `volume-i/` and `volume-ii/` (excluding `build/`, `.git/`) for `\begin{theorem|definition|lemma|proposition|corollary|axiom}` and capturing the bracketed title and `\label{}` where present.
2. Grepping every `*.lean` file under `LRA/VolumeI` and `LRA/VolumeII` for top-level `theorem`, `lemma`, `def`, `structure`, `class`, `abbrev`, `inductive` declarations.
3. Grouping both sides by topic folder and comparing raw counts.

**What this does *not* tell you:**

- There is currently **no cross-reference system** between `.tex` `\label{}`s and Lean declaration names (checked — only 6 files in the Lean tree even contain a `thm:`/`def:`-style substring, and those are false positives from prose). So this is a coverage-density estimate, not a 1:1 checklist. A real per-theorem checklist would require adding `\label` ↔ Lean-name mapping (see Recommendations).
- One tex theorem can require several Lean lemmas (or zero, if it's a remark). Ratios below are a proxy for effort, not a literal deficit count.
- **`sorry` counts matter more than raw declaration counts.** A folder can have a Lean declaration for every tex theorem and still be "not done" if the proof is `sorry`.
- `LRA-NEW/` and `LRA-OLD/` in `lra-lean` are **not** counted — the active build (`lakefile.lean`) only wires up `LRA/`. They appear to be superseded drafts/archives.
- The repo already has partial audit artifacts (`OMNIBUS-GAP-LIST.md`, `OMNIBUS-PUNCHLIST.md`, `lean-decl-inventory.txt`) — those look focused on Volume III+ (the arithmetic/algebra omnibus) and are stale (last touched mid-June) relative to the current tree. This document is the first apples-to-apples Volume I/II sweep.

## Headline numbers

| | Volume I | Volume II |
|---|---|---|
| LaTeX theorem-like environments (tex) | **~615** | **~874** |
| Lean top-level declarations | **568** | **874** |
| Lean source files | 94 | 53 |
| `sorry` occurrences in Lean | **8** | **265** |

Volume I's Lean declaration count (568) is in the same ballpark as its tex count (615), and it's nearly `sorry`-free — 8 stubs total. **Volume II's Lean declaration count matches its tex count almost exactly (874 vs 874) but carries 265 `sorry`s**, meaning a large fraction of what looks "done" by declaration count is actually a stated-but-unproved stub. Treat Volume II's coverage number as optimistic until the `sorry` count comes down.

## Volume I — topic breakdown

LaTeX (`lra-volume-i/volume-i/book-{geometry,logic,sets}`):

| Topic | tex defs/thms | Lean folder | Lean decls | Notes |
|---|---|---|---|---|
| euclidean-geometry | 42 | — | 0 | **No Lean folder exists for geometry at all.** |
| analytical-geometry | 8 | — | 0 | Same — unformalized. |
| trigonometry | 87 | — | 0 | Same — unformalized. |
| **Geometry subtotal** | **137** | *(none)* | **0** | **Entire book-geometry corpus is unformalized in Lean.** |
| predicate-logic | 94 | `Logic/...` | 215 (shared w/ below) | |
| propositional-logic | 122 | `Logic/...` | ↑ | |
| axiom-systems | 23 | `Logic/...` | ↑ | |
| proof-techniques | 1 | `Logic/...` | ↑ | |
| **Logic subtotal** | **240** | `VolumeI/Logic` (56 files) | **215** | Reasonable density; Lean tree is deeply subdivided (FirstOrder, Propositional, SecondOrderMonadic, Takeuti proof system, etc.) beyond what the tex topic split shows. |
| set-theory | 52 | `Set/ZFC/...` | ↑ | |
| cardinality | 10 | `Set/...` | ↑ | |
| relations | 47 | `Relations/...` | 23 (separate top folder) | |
| functions | 43 | `Set/...` | ↑ | |
| functions-and-order | 25 | `Set/...` | ↑ | |
| orderings | 61 | `Set/...` | ↑ | |
| **Set/Relations subtotal** | **238** | `VolumeI/Set` (24 files) + `VolumeI/Relations` (3 files) | **174 + 23 = 197** | |
| *(no direct tex equivalent found)* | — | `VolumeI/Algebra` (8 files) | 127 | Bundles (`CommutativeMonoid/Group/Ring`), operation laws. Likely sourced from the Landau-style omnibus doc rather than `book-logic`/`book-sets`/`book-geometry` — **Lean is ahead of the Volume I tex tree here**, worth checking against `omnibus-arithmetic-algebra-landau-style.md` in the project. |
| *(same)* | — | `VolumeI/Operations` (2 files) | 22 | |
| *(same)* | — | `VolumeI/Structures` (1 file) | 7 | |

`sorry` count: 8, all in `VolumeI/Algebra/Models/*` (`CanonicalEmbeddings`, `CharacteristicCardinality` ×3, `ComparisonMatrix`, `Construction`, `Models` ×2). Everything outside `Algebra/Models` in Volume I appears fully proved.

**Bottom line for Volume I:** Logic and Set theory are well underway structurally and nearly sorry-free. **Geometry (137 tex statements: analytic geometry, Euclidean constructions, trigonometry) has zero Lean presence** — this is the single largest, cleanest chunk of remaining work in Volume I.

## Volume II — topic breakdown

LaTeX (`lra-volume-ii/volume-ii/book-{continuum,discrete-algebraic}`):

| Topic | tex defs/thms | Lean folder | Lean decls | `sorry` | Coverage read |
|---|---|---|---|---|---|
| integers (+ Mendelson/Pfefer/Polish/Tao constructions) | 165 | `VolumeII/Integers` (15 files) | 271 | 31 | Good structural coverage, moderate stub debt. |
| natural-numbers | 56 | `VolumeII/NaturalNumbers` (9 files) | 72 | 19 | Good coverage, some stubs. |
| peano-systems | 129 | `VolumeII/PeanoSystems` (4 files) | 30 | 2 | **Lean has ~23% of the tex statement count** — largest structural gap by ratio in Volume II. |
| whole-numbers | 43 | `VolumeII/WholeNumbers` (1 file) | 20 | 10 | ~47% by count, and half of what exists is stubbed. |
| rationals | 164 | `VolumeII/RationalNumbers` (4 files) | 90 | 37 | ~55% by count; largest raw `sorry` count after RealNumbers. |
| reals + extended-real-numbers | 84 + 25 = 109 | `VolumeII/RealNumbers` (12 files) | 288 | 120 | More Lean decls than tex statements (good structural depth), but **120 sorries — by far the largest stub concentration in the repo.** Treat "done" claims here with real skepticism. |
| complex-numbers | 44 | `VolumeII/ComplexNumbers` (2 files) | 38 | 19 | ~86% by count but half the declarations are stubbed. |
| arithmetic-operations-relations | 77 | `VolumeII/BasicArithmetic` (4 files) | 26 | 19 | ~34% by count, and most of what exists is stubbed. |
| identity-equality-equivalence + constructing-number-systems + embedding-number-systems + number-lines | 40+25+13+9 = 87 | `VolumeII/Foundations` (1 file) | 11 | 5 | Largest proportional gap: 87 tex statements vs. 11 Lean declarations. |
| *(no clear 1:1 tex topic)* | — | `VolumeII/Switches` (1 file, + `Switches/Sets`) | 28 | 3 | Likely a generic-construction/typeclass-switch scaffold; check against `constructing-number-systems`. |

**Bottom line for Volume II:** declaration counts look deceptively complete (874 vs. 874 tex statements) but 265 `sorry`s are hiding underneath. Ranked by real remaining work:

1. **RealNumbers** — 120 sorries, the single biggest block of unfinished proofs in the whole repo.
2. **RationalNumbers** — 37 sorries on top of an already-partial (55%) structural count.
3. **PeanoSystems** — structurally thin (23% of tex statement count) even before counting sorries.
4. **Foundations** (identity/equality/embedding/number-lines cluster) — structurally thin (11 vs. 87).
5. **BasicArithmetic** — thin (26 vs. 77) and mostly stubbed (19 sorries).

## Recommended next steps

1. **Geometry (Volume I) is a clean, self-contained gap** — no existing Lean scaffolding to conflict with. If you want a well-scoped next project, `book-geometry` (Euclidean constructions, analytic geometry, trigonometry — 137 tex statements) is it.
2. **Triage RealNumbers' 120 sorries first in Volume II** — it's the largest single liability and likely blocks downstream Complex/RationalNumbers work that depends on completed real-number lemmas.
3. **Add `\label{}` ↔ Lean-declaration-name annotations going forward** (e.g., a doc-comment `-- lra:def:point-slope-form` above each Lean `def`/`theorem`). Without this, any future audit is stuck at the same folder-level granularity this one used — a real per-theorem checklist isn't possible until labels are threaded through.
4. **Reconcile `VolumeI/Algebra`** (127 decls, 8 sorries) against `omnibus-arithmetic-algebra-landau-style.md` and `fine-number-system-formalized.md` in the Learning-Real-Analysis project — it doesn't map to any `book-geometry`/`book-logic`/`book-sets` tex topic, so its source of truth needs to be confirmed explicitly.
5. **Archive or delete `LRA-NEW/` and `LRA-OLD/`** if they're confirmed superseded — they add ~ another two full copies of Volume I/II worth of files to grep through on every future audit, with no build target referencing them.

## Raw counts (for reference)

```
Volume I tex by env:   definition=367 theorem=179 proposition=35 axiom=25 lemma=5 corollary=4  (total 615)
Volume II tex by env:  theorem=396 definition=246 lemma=80 corollary=78 proposition=48 axiom=26 (total 874)

Volume I Lean by kind: def=... theorem=... structure=... abbrev=... inductive=... (see per-folder table above; total 568)
Volume II Lean by kind: (see per-folder table above; total 874)
```

*Scratch grep output used to produce this audit was left on disk at `F:\repos\.claude-audit-tmp\` on the source machine — safe to delete once this report is reviewed.*
