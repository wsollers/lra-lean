# Bounding Chapter — Additions Tracking

Running list of definitions/theorems added during the correctness-and-completeness
audit of `volume-iii/book-analysis-i/bounding/` (things the notes were *missing*,
not things that were wrong — bad statements get their own findings report, not
this list). One row per item. Update the Status column as each moves through
`.tex` → Lean statement (`sorry`) → (optionally) Lean proof completed.

Audit order follows `bounding/notes/index.tex`: `bounds-extremals` →
`bounds-algebra` → `completeness`.

| # | Item | TeX status | TeX file / label | Lean status | Lean file / name | Notes |
|---|------|-----------|-------------------|-------------|-------------------|-------|
| 1 | Bounded ⟺ ∃M≥0, ∀a∈A, \|a\|≤M | ✅ Added | `notes/bounds-extremals/notes-upper-lower-bounds.tex` — `prop:bounded-iff-absolute-value-bound` | ✅ Statement added (`sorry`) | `LRA/VolumeIII/Analysis/Bounding/Scratch/UpperLowerBounds.lean` — `IsBounded_iff_abs_bound` | Asserted in `def:bounded`'s prose as "equivalently," never proven anywhere nearby. Proof idea: M = max(\|u\|,\|ℓ\|) one way, u=M/ℓ=−M the other. |
| 2 | Nonempty bounded set has both a supremum and an infimum | ✅ Added | `notes/bounds-extremals/notes-suprema-infima.tex` — `cor:bounded-set-has-supremum-and-infimum` | ✅ Statement added (`sorry`) | `LRA/VolumeIII/Analysis/Bounding/Scratch/SupremaInfima.lean` — `bounded_set_has_supremum_and_infimum` | `thm:lub-property-implies-existence-of-suprema` and `thm:glb-property-implies-existence-of-infima` existed separately but were never combined into a single citable "bounded ⟹ both exist" corollary. Trivial: `⟨lub_property... hne hbdd.1, glb_property... hne hbdd.2⟩`. Good one-line practice proof to complete by hand later. |
| 3 | A ⊆ ℝ has a maximum ⟺ sup A ∈ A (and then max A = sup A) | ✅ Added | `notes/bounds-extremals/notes-maxima-minima.tex` — `cor:maximum-iff-supremum-in-the-set` | ✅ Statement added (`sorry`) | `LRA/VolumeIII/Analysis/Bounding/Scratch/MaximaMinima.lean` — `maximum_iff_supremum_mem` | `prop:maximum-implies-supremum` and `prop:supremum-in-the-set-is-the-maximum` are the two directions of this iff but were never bundled. Forward direction needs uniqueness-of-the-supremum to pin the maximum down as equal to `s`; backward direction is exactly `supremum_in_the_set_is_the_maximum`. |

## Legend

- **TeX status**: `Not started` / `Drafted (not committed)` / `✅ Added` (live in the repo, will surface in the next knowledge-explorer rebuild)
- **Lean status**: `Not started` / `✅ Statement added (sorry)` / `✅ Proved` / `⚠️ Needs typeclass review`
- Items here are additions only. Bad/imprecise existing statements are reported inline in the audit conversation, not tracked in this file, unless you want a second table added for that too.
