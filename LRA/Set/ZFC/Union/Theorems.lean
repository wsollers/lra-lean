import LRA.Set.ZFC.Axioms.Union
import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Extensionality.Theorems
import LRA.Set.ZFC.Pairing.Theorems

/-!
Existence, uniqueness, and the chosen union over a set of sets (`⋃ A`), plus
binary union derived from it and from Pairing.
-/

namespace LRA.Set.ZFC

/-- There exists a union over `A`. -/
theorem UnionOverExists (A : Set) :
    ∃ U : Set, IsUnionOf A U := by
  sorry

/-- Any union over `A` is equal to any other union over `A`. -/
theorem UnionOverIsUnique
    {A U V : Set}
    (UIsUnionOf : IsUnionOf A U)
    (VIsUnionOf : IsUnionOf A V) :
    V = U := by
  sorry

/-- TeX label: `thm:union-output-exists-unique`.
For any set of sets, there exists exactly one union over it. -/
theorem UnionOverExistsAndIsUnique (A : Set) :
    ExistsAndUnique (fun U : Set => IsUnionOf A U) := by
  sorry

/-- The chosen union over `A`. -/
noncomputable def TheUnionOver (A : Set) : Set :=
  Classical.choose (UnionOverExists A)

/-- The chosen union over `A` has the expected members. -/
theorem TheUnionOverIsUnionOf (A : Set) :
    IsUnionOf A (TheUnionOver A) := by
  sorry

/-- Every union over `A` equals the chosen union over `A`. -/
theorem EveryUnionOverEqualsTheUnionOver
    {A U : Set}
    (UIsUnionOf : IsUnionOf A U) :
    U = TheUnionOver A := by
  sorry

/-- Binary union of `A` and `B`, derived as the union over their pair set. -/
noncomputable def TheUnion (A B : Set) : Set :=
  TheUnionOver (PairSet A B)

/-- Membership in the chosen binary union. -/
theorem TheUnionMembership (A B x : Set) :
    x ∈ TheUnion A B ↔ x ∈ A ∨ x ∈ B := by
  sorry

end LRA.Set.ZFC
