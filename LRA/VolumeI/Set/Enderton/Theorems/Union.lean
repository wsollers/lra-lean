import LRA.VolumeI.Set.Enderton.Axioms.Axioms
import LRA.VolumeI.Set.Enderton.Definitions
import LRA.VolumeI.Set.Enderton.Theorems.Extensionality
import LRA.VolumeI.Set.Enderton.Theorems.Pairing

/-!
Existence, uniqueness, and the chosen union over a set of sets (`⋃ A`), plus
binary union derived from it and from Pairing.

Enderton's primitive Union axiom gives the union *over a set of sets*, not a
binary operation. Binary union `A ∪ B` is not axiomatized separately here; it
is derived as `⋃ {A, B}`, matching the textbook development.
-/

namespace LRA.VolumeI.Set.Enderton

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

/-- The union over `A`, chosen after its existence has been established. -/
noncomputable def TheUnionOver (A : Set) : Set :=
  Classical.choose (UnionOverExists A)

/-- The chosen union over `A` has the expected members. -/
theorem TheUnionOverIsUnionOf (A : Set) :
    IsUnionOf A (TheUnionOver A) := by
  sorry

/-- Every union over `A` is equal to the chosen union over `A`. -/
theorem EveryUnionOverEqualsTheUnionOver
    {A U : Set}
    (UIsUnionOf : IsUnionOf A U) :
    U = TheUnionOver A := by
  sorry

/-! ### Binary union, derived from `TheUnionOver` and `PairSet`

`A ∪ B` is not a new primitive: it is the union over the pair set `{A, B}`. -/

/-- Binary union of `A` and `B`, derived as the union over their pair set. -/
noncomputable def TheUnion (A B : Set) : Set :=
  TheUnionOver (PairSet A B)

/-- `x` belongs to `A ∪ B` iff `x` belongs to `A` or `x` belongs to `B`.

Derived from `TheUnionOverIsUnionOf` and `PairSetMembership`, not from a
separate axiom. -/
theorem TheUnionMembership (A B x : Set) :
    x ∈ TheUnion A B ↔ x ∈ A ∨ x ∈ B := by
  sorry

end LRA.VolumeI.Set.Enderton
