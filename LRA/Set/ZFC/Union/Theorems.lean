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
  have unionOver := Union A
  rcases unionOver with ⟨U, UIsUnionOver⟩
  exact ⟨U, UIsUnionOver⟩

/-- Any union over `A` is equal to any other union over `A`. -/
theorem UnionOverIsUnique
    {A U V : Set}
    (UIsUnionOf : IsUnionOf A U)
    (VIsUnionOf : IsUnionOf A V) :
    V = U := by
  apply Extensionality
  intro x
  constructor
  · intro xInV
    have xInAOrV := VIsUnionOf x
    have xInAOrU := UIsUnionOf x
    have xInAOrUFromV := xInAOrV.mp xInV
    apply xInAOrU.mpr
    exact xInAOrUFromV
  · intro xInU
    have xInAOrU := UIsUnionOf x
    have xInAOrV := VIsUnionOf x
    have xInAOrVFromU := xInAOrU.mp xInU
    apply xInAOrV.mpr
    exact xInAOrVFromU

/-- TeX label: `thm:union-output-exists-unique`.
For any set of sets, there exists exactly one union over it. -/
theorem UnionOverExistsAndIsUnique (A : Set) :
    ExistsAndUnique (fun U : Set => IsUnionOf A U) := by
  have unionOverExists := UnionOverExists A
  constructor
  · exact unionOverExists
  · intro U V UIsUnionOf VIsUnionOf
    exact (UnionOverIsUnique
      (A := A)
      (U := U)
      (V := V)
      UIsUnionOf
      VIsUnionOf).symm

/-- The chosen union over `A`. -/
noncomputable def TheUnionOver (A : Set) : Set :=
  Classical.choose (UnionOverExists A)

/-- The chosen union over `A` has the expected members. -/
theorem TheUnionOverIsUnionOf (A : Set) :
    IsUnionOf A (TheUnionOver A) := by
  have unionOverExists := UnionOverExists A
  exact Classical.choose_spec unionOverExists

/-- Every union over `A` equals the chosen union over `A`. -/
theorem EveryUnionOverEqualsTheUnionOver
    {A U : Set}
    (UIsUnionOf : IsUnionOf A U) :
    U = TheUnionOver A := by
  exact (UnionOverIsUnique
    (A := A)
    (U := U)
    (V := TheUnionOver A)
    UIsUnionOf
    (TheUnionOverIsUnionOf A)).symm

/-- Binary union of `A` and `B`, derived as the union over their pair set. -/
noncomputable def TheUnion (A B : Set) : Set :=
  TheUnionOver (PairSet A B)

/-- Membership in the chosen binary union. -/
theorem TheUnionMembership (A B x : Set) :
    x ∈ TheUnion A B ↔ x ∈ A ∨ x ∈ B := by
  have unionOver := TheUnionOverIsUnionOf (PairSet A B)
  have pairSetMembership := PairSetMembership A B x
  constructor
  · intro xInUnion
    unfold IsUnionOf at unionOver
    have xInUnionIff := unionOver x
    have xInSomeMember := xInUnionIff.mp xInUnion
    rcases xInSomeMember with ⟨C, CInPairSet, xInC⟩
    have CEqualsAOrB := (PairSetMembership A B C).mp CInPairSet
    rcases CEqualsAOrB with CEqualsA | CEqualsB
    · rw [CEqualsA] at xInC
      apply Or.inl
      exact xInC
    · rw [CEqualsB] at xInC
      apply Or.inr
      exact xInC
  · intro xInAOrB
    unfold IsUnionOf at unionOver
    rcases xInAOrB with xInA | xInB
    · apply (unionOver x).mpr
      refine ⟨A, ?_, xInA⟩
      apply (PairSetMembership A B A).mpr
      exact Or.inl rfl
    · apply (unionOver x).mpr
      refine ⟨B, ?_, xInB⟩
      apply (PairSetMembership A B B).mpr
      exact Or.inr rfl

end LRA.Set.ZFC

/-! Compatibility aliases for the historical Enderton union names. -/
namespace LRA.Set.Enderton

abbrev UnionOverExists (A : Set) := LRA.Set.ZFC.UnionOverExists A

abbrev UnionOverIsUnique
    {A U V : Set}
    (UIsUnionOf : IsUnionOf A U)
    (VIsUnionOf : IsUnionOf A V) : V = U :=
  LRA.Set.ZFC.UnionOverIsUnique UIsUnionOf VIsUnionOf

abbrev UnionOverExistsAndIsUnique (A : Set) :=
  LRA.Set.ZFC.UnionOverExistsAndIsUnique A

noncomputable abbrev TheUnionOver (A : Set) : Set := LRA.Set.ZFC.TheUnionOver A

abbrev TheUnionOverIsUnionOf (A : Set) :=
  LRA.Set.ZFC.TheUnionOverIsUnionOf A

abbrev EveryUnionOverEqualsTheUnionOver
    {A U : Set}
    (UIsUnionOf : IsUnionOf A U) : U = TheUnionOver A :=
  LRA.Set.ZFC.EveryUnionOverEqualsTheUnionOver UIsUnionOf

noncomputable abbrev TheUnion (A B : Set) : Set := LRA.Set.ZFC.TheUnion A B

abbrev TheUnionMembership (A B x : Set) :=
  LRA.Set.ZFC.TheUnionMembership A B x

end LRA.Set.Enderton
