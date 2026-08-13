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
/--
There exists a union over `A`.

Logical form:

```lean
theorem UnionOverExists (A : Set) :
    ∃ U : Set, IsUnionOf A U
```
-/
theorem UnionOverExists (A : Set) :
    ∃ U : Set, IsUnionOf A U := by
  have unionOver := Union A
  rcases unionOver with ⟨U, UIsUnionOver⟩
  exact ⟨U, UIsUnionOver⟩
/--
Any union over `A` is equal to any other union over `A`.

Logical form:

```lean
theorem UnionOverIsUnique
    {A U V : Set}
    (UIsUnionOf : IsUnionOf A U)
    (VIsUnionOf : IsUnionOf A V) :
    V = U
```
-/
theorem UnionOverIsUnique
    {A U V : Set}
    (UIsUnionOf : IsUnionOf A U)
    (VIsUnionOf : IsUnionOf A V) :
    V = U := by
  apply Extensionality
  intro x
  constructor
  · -- mp
    intro xInV
    have xInAOrV := VIsUnionOf x
    have xInAOrU := UIsUnionOf x
    have xInAOrUFromV := xInAOrV.mp xInV
    apply xInAOrU.mpr
    exact xInAOrUFromV
  . -- mpr
    intro xInU
    have xInAOrU := UIsUnionOf x
    have xInAOrV := VIsUnionOf x
    have xInAOrVFromU := xInAOrU.mp xInU
    apply xInAOrV.mpr
    exact xInAOrVFromU

/-- TeX label: `thm:union-output-exists-unique`.
For any set of sets, there exists exactly one union over it.

Logical form:

```lean
theorem UnionOverExistsAndIsUnique (A : Set) :
    ExistsAndUnique (fun U : Set => IsUnionOf A U)
```
-/
theorem UnionOverExistsAndIsUnique (A : Set) :
    ExistsAndUnique (fun U : Set => IsUnionOf A U) := by
  have unionOverExists := UnionOverExists A
  constructor
  · -- lhs exists
    exact unionOverExists
  . -- rhs unique
    intro U V UIsUnionOf VIsUnionOf
    exact (UnionOverIsUnique
      (A := A)
      (U := U)
      (V := V)
      UIsUnionOf
      VIsUnionOf).symm

/--
The union over `A`, chosen after its existence has been established.

Logical form:

```lean
noncomputable def TheUnionOver (A : Set) : Set :=
  Classical.choose (UnionOverExists A)
```
-/
noncomputable def TheUnionOver (A : Set) : Set :=
  Classical.choose (UnionOverExists A)
/--
The chosen union over `A` has the expected members.

Logical form:

```lean
theorem TheUnionOverIsUnionOf (A : Set) :
    IsUnionOf A (TheUnionOver A)
```
-/
theorem TheUnionOverIsUnionOf (A : Set) :
    IsUnionOf A (TheUnionOver A) := by
  have unionOverExists := UnionOverExists A
  exact Classical.choose_spec unionOverExists

/--
Every union over `A` is equal to the chosen union over `A`.

Logical form:

```lean
theorem EveryUnionOverEqualsTheUnionOver
    {A U : Set}
    (UIsUnionOf : IsUnionOf A U) :
    U = TheUnionOver A
```
-/
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

/-! ### Binary union, derived from `TheUnionOver` and `PairSet`

`A ∪ B` is not a new primitive: it is the union over the pair set `{A, B}`. -/

/--
Binary union of `A` and `B`, derived as the union over their pair set.

Logical form:

```lean
noncomputable def TheUnion (A B : Set) : Set :=
  TheUnionOver (PairSet A B)
```
-/
noncomputable def TheUnion (A B : Set) : Set :=
  TheUnionOver (PairSet A B)

/-- `x` belongs to `A ∪ B` iff `x` belongs to `A` or `x` belongs to `B`.

Derived from `TheUnionOverIsUnionOf` and `PairSetMembership`, not from a
separate axiom.

Logical form:

```lean
theorem TheUnionMembership (A B x : Set) :
    x ∈ TheUnion A B ↔ x ∈ A ∨ x ∈ B
```
-/
theorem TheUnionMembership (A B x : Set) :
    x ∈ TheUnion A B ↔ x ∈ A ∨ x ∈ B := by
  have unionOver := TheUnionOverIsUnionOf (PairSet A B)
  have pairSetMembership := PairSetMembership A B x
  constructor
  · -- mp
    intro xInUnion
    unfold IsUnionOf at unionOver
    have xInUnionIff := unionOver x
    have xInSomeMember := xInUnionIff.mp xInUnion
    rcases xInSomeMember with ⟨C, CInPairSet, xInC⟩
    have CEqualsAOrB := (PairSetMembership A B C).mp CInPairSet
    rcases CEqualsAOrB with CEqualsA | CEqualsB
    · -- C = A
      rw [CEqualsA] at xInC
      apply Or.inl
      exact xInC
    . -- C = B
      rw [CEqualsB] at xInC
      apply Or.inr
      exact xInC

  . -- mpr
    intro xInAOrB
    unfold IsUnionOf at unionOver
    rcases xInAOrB with xInA | xInB

    · -- x ∈ A
      apply (unionOver x).mpr
      refine ⟨A, ?_, xInA⟩
      apply (PairSetMembership A B A).mpr
      exact Or.inl rfl

    · -- x ∈ B
      apply (unionOver x).mpr
      refine ⟨B, ?_, xInB⟩
      apply (PairSetMembership A B B).mpr
      exact Or.inr rfl

end LRA.VolumeI.Set.Enderton
