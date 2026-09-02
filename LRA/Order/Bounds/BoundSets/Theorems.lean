import LRA.Order.Bounds.BoundSets.Definition
import LRA.Set.Interface.Laws.Membership
import LRA.Set.Interface.Laws.Subset

namespace LRA.Order

open LRA.Set

universe u v

section GenericBoundSets

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSeparation Element SetObject]
variable [HasUniversal SetObject] [HasComplement SetObject]
variable [MembershipLaws Element SetObject]
variable [SeparationLaws Element SetObject]
variable [UniversalMembershipLaws Element SetObject]
variable [ExtensionalityLaw Element SetObject]
variable [SubsetLaws SetObject]

/--
`UpperBoundsMembership` TODO

Predicate logic:

  (∀ A ∈ U ∀ x ∈ Element), x ∈ UpperBounds relation A ↔ UpperBound relation A x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject] [inst_6 : LRA.Set.HasSeparation Element SetObject] [inst_7 : LRA.Set.HasUniversal SetObject] [inst_8 : LRA.Set.HasComplement SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ (LRA.Set.SeparationLaws Element SetObject ∧ (LRA.Set.UniversalMembershipLaws Element SetObject ∧ (LRA.Set.ExtensionalityLaw Element SetObject ∧ LRA.Set.SubsetLaws SetObject)))) → ∀ (relation : Element → Element → Prop) (subset : SetObject) (bound : Element), inst.1 (inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 subset element → relation element bound) bound ↔ ∀ (element : Element), inst.1 subset element → relation element bound

Logical form (Lean):

```lean
theorem UpperBoundsMembership
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (bound : Element) :
    bound ∈ UpperBounds relation subset ↔
      UpperBound relation subset bound
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem UpperBoundsMembership
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (bound : Element) :
    bound ∈ UpperBounds relation subset ↔
      UpperBound relation subset bound := by
  sorry
/--
`LowerBoundsMembership` TODO

Predicate logic:

  (∀ A ∈ U ∀ x ∈ Element), x ∈ LowerBounds relation A ↔ LowerBound relation A x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject] [inst_6 : LRA.Set.HasSeparation Element SetObject] [inst_7 : LRA.Set.HasUniversal SetObject] [inst_8 : LRA.Set.HasComplement SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ (LRA.Set.SeparationLaws Element SetObject ∧ (LRA.Set.UniversalMembershipLaws Element SetObject ∧ (LRA.Set.ExtensionalityLaw Element SetObject ∧ LRA.Set.SubsetLaws SetObject)))) → ∀ (relation : Element → Element → Prop) (subset : SetObject) (bound : Element), inst.1 (inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 subset element → relation bound element) bound ↔ ∀ (element : Element), inst.1 subset element → relation bound element

Logical form (Lean):

```lean
theorem LowerBoundsMembership
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (bound : Element) :
    bound ∈ LowerBounds relation subset ↔
      LowerBound relation subset bound
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem LowerBoundsMembership
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (bound : Element) :
    bound ∈ LowerBounds relation subset ↔
      LowerBound relation subset bound := by
  sorry
/--
`UpperBoundsAntitoneUnderInclusion` TODO

Predicate logic:

  (∀ A B ∈ U), UpperBounds relation B ⊆ UpperBounds relation A

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject] [inst_6 : LRA.Set.HasSeparation Element SetObject] [inst_7 : LRA.Set.HasUniversal SetObject] [inst_8 : LRA.Set.HasComplement SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ (LRA.Set.SeparationLaws Element SetObject ∧ (LRA.Set.UniversalMembershipLaws Element SetObject ∧ (LRA.Set.ExtensionalityLaw Element SetObject ∧ LRA.Set.SubsetLaws SetObject)))) → ∀ {relation : Element → Element → Prop} {smaller larger : SetObject}, inst_5.1 smaller larger → inst_5.1 (inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 larger element → relation element bound) (inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 smaller element → relation element bound)

Logical form (Lean):

```lean
theorem UpperBoundsAntitoneUnderInclusion
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : smaller ⊆ larger) :
    UpperBounds relation larger ⊆ UpperBounds relation smaller
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem UpperBoundsAntitoneUnderInclusion
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : smaller ⊆ larger) :
    UpperBounds relation larger ⊆ UpperBounds relation smaller := by
  sorry
/--
`LowerBoundsAntitoneUnderInclusion` TODO

Predicate logic:

  (∀ A B ∈ U), LowerBounds relation B ⊆ LowerBounds relation A

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject] [inst_6 : LRA.Set.HasSeparation Element SetObject] [inst_7 : LRA.Set.HasUniversal SetObject] [inst_8 : LRA.Set.HasComplement SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ (LRA.Set.SeparationLaws Element SetObject ∧ (LRA.Set.UniversalMembershipLaws Element SetObject ∧ (LRA.Set.ExtensionalityLaw Element SetObject ∧ LRA.Set.SubsetLaws SetObject)))) → ∀ {relation : Element → Element → Prop} {smaller larger : SetObject}, inst_5.1 smaller larger → inst_5.1 (inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 larger element → relation bound element) (inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 smaller element → relation bound element)

Logical form (Lean):

```lean
theorem LowerBoundsAntitoneUnderInclusion
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : smaller ⊆ larger) :
    LowerBounds relation larger ⊆ LowerBounds relation smaller
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem LowerBoundsAntitoneUnderInclusion
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : smaller ⊆ larger) :
    LowerBounds relation larger ⊆ LowerBounds relation smaller := by
  sorry
/--
`UpperBoundsOfEmpty` TODO

Predicate logic:

  UpperBounds relation ∅ ∈ SetObject = HasUniversal.universal ∈ SetObject

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject] [inst_6 : LRA.Set.HasSeparation Element SetObject] [inst_7 : LRA.Set.HasUniversal SetObject] [inst_8 : LRA.Set.HasComplement SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ (LRA.Set.SeparationLaws Element SetObject ∧ (LRA.Set.UniversalMembershipLaws Element SetObject ∧ (LRA.Set.ExtensionalityLaw Element SetObject ∧ LRA.Set.SubsetLaws SetObject)))) → ∀ (relation : Element → Element → Prop), inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 inst_4.1 element → relation element bound = inst_7.1

Logical form (Lean):

```lean
theorem UpperBoundsOfEmpty
    (relation : LRA.Relation.Endorelation Element) :
    UpperBounds relation (∅ : SetObject) =
      (HasUniversal.universal : SetObject)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem UpperBoundsOfEmpty
    (relation : LRA.Relation.Endorelation Element) :
    UpperBounds relation (∅ : SetObject) =
      (HasUniversal.universal : SetObject) := by
  sorry
/--
`LowerBoundsOfEmpty` TODO

Predicate logic:

  LowerBounds relation ∅ ∈ SetObject = HasUniversal.universal ∈ SetObject

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject] [inst_6 : LRA.Set.HasSeparation Element SetObject] [inst_7 : LRA.Set.HasUniversal SetObject] [inst_8 : LRA.Set.HasComplement SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ (LRA.Set.SeparationLaws Element SetObject ∧ (LRA.Set.UniversalMembershipLaws Element SetObject ∧ (LRA.Set.ExtensionalityLaw Element SetObject ∧ LRA.Set.SubsetLaws SetObject)))) → ∀ (relation : Element → Element → Prop), inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 inst_4.1 element → relation bound element = inst_7.1

Logical form (Lean):

```lean
theorem LowerBoundsOfEmpty
    (relation : LRA.Relation.Endorelation Element) :
    LowerBounds relation (∅ : SetObject) =
      (HasUniversal.universal : SetObject)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem LowerBoundsOfEmpty
    (relation : LRA.Relation.Endorelation Element) :
    LowerBounds relation (∅ : SetObject) =
      (HasUniversal.universal : SetObject) := by
  sorry
end GenericBoundSets

end LRA.Order
