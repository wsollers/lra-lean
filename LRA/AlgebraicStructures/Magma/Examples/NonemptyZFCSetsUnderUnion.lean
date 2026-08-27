import LRA.AlgebraicStructures.Magma.Constructions.Set.ClosedSubset
import LRA.Set.Constructions.ZFCSet.Instances

namespace LRA.AlgebraicStructures.Magma.Examples

/-! Nonempty ZFC sets under union — same builder, carrier set to `ZFCSet` instead of
a Mathlib type, showing `ClosedSubsetMul` doesn't care which set theory it's handed.
This is `LRA_Set ZFCSet`, an ordinary ambient-Lean predicate over `ZFCSet` — *not*
built via ZFCSet's own internal `HasSeparation`. Building the subset as a `ZFCSet`
object in its own right (staying inside ZFC's object language) is where
Grothendieck-universe care would start to matter; that's future work, not this. -/

open LRA.Set.Constructions (ZFCSet)

/-- Union as the magma operation — `ZFCSet` has no pre-existing `Mul`, and union is
the natural binary operation to demonstrate closure with here. -/
noncomputable instance : Mul ZFCSet := ⟨(· ∪ ·)⟩

def NonemptyZFCSets : LRA.Set.LRA_Set ZFCSet := {A | ∃ x, x ∈ A}

theorem nonemptyZFCSetsClosedUnderUnion :
    ∀ A B, A ∈ NonemptyZFCSets → B ∈ NonemptyZFCSets → A * B ∈ NonemptyZFCSets := by
  -- Needs the union axiom's membership characterization (`x ∈ A ∪ B ↔ x ∈ A ∨ x ∈ B`,
  -- i.e. `TheUnionOverIsUnionOf` unfolded to the pair case), which is still open
  -- elsewhere in the ZFCSet tree — not something to resolve from Magma's own audit.
  sorry

noncomputable instance : Mul {A // A ∈ NonemptyZFCSets} :=
  Magma.Constructions.ClosedSubsetMul nonemptyZFCSetsClosedUnderUnion

end LRA.AlgebraicStructures.Magma.Examples
