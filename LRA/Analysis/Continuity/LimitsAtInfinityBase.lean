/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/continuity/notes/limits-at-infinity/notes-limits-at-infinity.tex.

Completes coverage of the `limits-at-infinity` section. `def:limit-at-infinity`
itself was already restated as `TendsToInfty` in `LimitsAtInfinityAdditions.lean`
(ADDITIONS.md items 30-32); this file adds the one remaining un-covered
label, `def:infinite-adherent-points`, and imports the additions file
rather than redefining `TendsToInfty`.
-/

import LRA.Analysis.Continuity.LimitsAtInfinityAdditions

namespace LRA.Analysis.Continuity

/-- `def:infinite-adherent-points`: `+∞` (resp. `−∞`) is an adherent
point of `A` if `A` is unbounded above (resp. below) — the domain
hypothesis under which `TendsToInfty`/`TendsToNegInfty` are meaningful.

Logical form:

```lean
def PlusInftyAdherent (A : Set ℝ) : Prop := ∀ M : ℝ, ∃ x ∈ A, x > M
```
-/
def PlusInftyAdherent (A : Set ℝ) : Prop := ∀ M : ℝ, ∃ x ∈ A, x > M

/--
`MinusInftyAdherent` defines the displayed object for minus infty adherent.

Logical form:

```lean
def MinusInftyAdherent (A : Set ℝ) : Prop := ∀ M : ℝ, ∃ x ∈ A, x < M
```
-/
def MinusInftyAdherent (A : Set ℝ) : Prop := ∀ M : ℝ, ∃ x ∈ A, x < M

end LRA.Analysis.Continuity
