import LRA.Relation.Interface.Operations.Converse.Definition
import LRA.Order.Bounds.Infimum.Definition
import LRA.Order.Bounds.Supremum.Definition
import LRA.Order.Bounds.BoundSets.Definition
import LRA.Set.Interface.Laws.Membership

namespace LRA.Order

universe u v

/--
`InfimumOfConverseIffSupremum` TODO

Predicate logic:

  (∀ A ∈ U ∀ x ∈ Element), Infimum (LRA.Relation.Converse relation) A x ↔ Supremum relation A x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject) (candidate : Element), (∀ (element : Element), inst.1 subset element → relation element candidate ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation candidate bound) ↔ (∀ (element : Element), inst.1 subset element → relation element candidate ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation candidate bound)

Logical form (Lean):

```lean
theorem InfimumOfConverseIffSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Infimum (LRA.Relation.Converse relation) subset candidate ↔
      Supremum relation subset candidate
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
theorem InfimumOfConverseIffSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Infimum (LRA.Relation.Converse relation) subset candidate ↔
      Supremum relation subset candidate := by
  sorry
/--
`InfimumOfEmptyIffTop` TODO

Predicate logic:

  (∀ x ∈ Element), Infimum relation ∅ ∈ SetObject x ↔ forall element, relation element x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ (relation : Element → Element → Prop) (candidate : Element), (∀ (element : Element), inst.1 inst_4.1 element → relation candidate element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 inst_4.1 element → relation bound element) → relation bound candidate) ↔ ∀ (element : Element), relation element candidate

Logical form (Lean):

```lean
theorem InfimumOfEmptyIffTop
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (candidate : Element) :
    Infimum relation (∅ : SetObject) candidate ↔
      forall element, relation element candidate
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem InfimumOfEmptyIffTop
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (candidate : Element) :
    Infimum relation (∅ : SetObject) candidate ↔
      forall element, relation element candidate := by
  sorry
/--
`InfimumIffSupremumOfLowerBounds` TODO

Predicate logic:

  (∀ A ∈ U ∀ x ∈ Element), Infimum relation A x ↔ Supremum relation (LowerBounds relation A) x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject] [inst_2 : LRA.Set.HasUniversal SetObject] [inst_3 : LRA.Set.HasComplement SetObject], (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.UniversalMembershipLaws Element SetObject) → ∀ (relation : Element → Element → Prop) (subset : SetObject) (candidate : Element), (∀ (element : Element), inst.1 subset element → relation candidate element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound candidate) ↔ (∀ (element : Element), inst.1 (inst_1.1 inst_2.1 fun bound => ∀ (element : Element), element ∈ subset → relation bound element) element → relation element candidate ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 (inst_1.1 inst_2.1 fun bound => ∀ (element : Element), element ∈ subset → relation bound element) element → relation element bound) → relation candidate bound)

Logical form (Lean):

```lean
theorem InfimumIffSupremumOfLowerBounds
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSeparation Element SetObject]
    [LRA.Set.HasUniversal SetObject] [LRA.Set.HasComplement SetObject]
    [LRA.Set.SeparationLaws Element SetObject]
    [LRA.Set.UniversalMembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Infimum relation subset candidate ↔
      Supremum relation (LowerBounds relation subset) candidate
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
theorem InfimumIffSupremumOfLowerBounds
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSeparation Element SetObject]
    [LRA.Set.HasUniversal SetObject] [LRA.Set.HasComplement SetObject]
    [LRA.Set.SeparationLaws Element SetObject]
    [LRA.Set.UniversalMembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Infimum relation subset candidate ↔
      Supremum relation (LowerBounds relation subset) candidate := by
  sorry
end LRA.Order
