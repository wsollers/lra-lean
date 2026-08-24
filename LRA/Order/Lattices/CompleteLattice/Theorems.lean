import LRA.Set.Interface.Membership
import LRA.Order.Lattices.CompleteLattice.Definition
import LRA.Order.Lattices.Lattice.Definition

namespace LRA.Order

open LRA.Set

universe u v

/--
`CompleteLatticeHasBottomAndTop` TODO

Predicate logic:

  (exists bottom, forall element, relation bottom element) ∧ (exists top, forall element, relation element top)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop}, ((∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x → x = y ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z)) ∧ ∀ (subset : SetObject), (Exists fun supremum => (∀ (element : Element), inst.1 subset element → relation element supremum ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation supremum bound) ∧ Exists fun infimum => (∀ (element : Element), inst.1 subset element → relation infimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound infimum))) → (Exists fun bottom => ∀ (element : Element), relation bottom element ∧ Exists fun top => ∀ (element : Element), relation element top)

Logical form (Lean):

```lean
theorem CompleteLatticeHasBottomAndTop
    {Element : Type u}
    {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsCompleteLattice : CompleteLattice SetObject relation) :
    (exists bottom, forall element, relation bottom element) /\
      (exists top, forall element, relation element top)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem CompleteLatticeHasBottomAndTop
    {Element : Type u}
    {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsCompleteLattice : CompleteLattice SetObject relation) :
    (exists bottom, forall element, relation bottom element) /\
      (exists top, forall element, relation element top) := by
  sorry

/--
`AllSupremaImplyCompleteLattice` TODO

Predicate logic:

  CompleteLattice SetObject relation

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject] [inst_2 : LRA.Set.HasUniversal SetObject] [inst_3 : LRA.Set.HasComplement SetObject], (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.UniversalMembershipLaws Element SetObject) → ∀ {relation : Element → Element → Prop}, ((∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x → x = y ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z)) ∧ ∀ (subset : SetObject), Exists fun supremum => (∀ (element : Element), inst.1 subset element → relation element supremum ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation supremum bound)) → ((∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x → x = y ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z)) ∧ ∀ (subset : SetObject), (Exists fun supremum => (∀ (element : Element), inst.1 subset element → relation element supremum ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation supremum bound) ∧ Exists fun infimum => (∀ (element : Element), inst.1 subset element → relation infimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound infimum)))

Logical form (Lean):

```lean
theorem AllSupremaImplyCompleteLattice
    {Element : Type u}
    {SetObject : Type v}
    [Membership Element SetObject]
    [HasSeparation Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject]
    [SeparationLaws Element SetObject]
    [UniversalMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (everySubsetHasSupremum :
      forall subset : SetObject,
        exists supremum, Supremum relation subset supremum) :
    CompleteLattice SetObject relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem AllSupremaImplyCompleteLattice
    {Element : Type u}
    {SetObject : Type v}
    [Membership Element SetObject]
    [HasSeparation Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject]
    [SeparationLaws Element SetObject]
    [UniversalMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (everySubsetHasSupremum :
      forall subset : SetObject,
        exists supremum, Supremum relation subset supremum) :
    CompleteLattice SetObject relation := by
  sorry

/--
`AllInfimaImplyCompleteLattice` TODO

Predicate logic:

  CompleteLattice SetObject relation

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject] [inst_2 : LRA.Set.HasUniversal SetObject] [inst_3 : LRA.Set.HasComplement SetObject], (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.UniversalMembershipLaws Element SetObject) → ∀ {relation : Element → Element → Prop}, ((∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x → x = y ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z)) ∧ ∀ (subset : SetObject), Exists fun infimum => (∀ (element : Element), inst.1 subset element → relation infimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound infimum)) → ((∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x → x = y ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z)) ∧ ∀ (subset : SetObject), (Exists fun supremum => (∀ (element : Element), inst.1 subset element → relation element supremum ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation supremum bound) ∧ Exists fun infimum => (∀ (element : Element), inst.1 subset element → relation infimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound infimum)))

Logical form (Lean):

```lean
theorem AllInfimaImplyCompleteLattice
    {Element : Type u}
    {SetObject : Type v}
    [Membership Element SetObject]
    [HasSeparation Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject]
    [SeparationLaws Element SetObject]
    [UniversalMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (everySubsetHasInfimum :
      forall subset : SetObject,
        exists infimum, Infimum relation subset infimum) :
    CompleteLattice SetObject relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem AllInfimaImplyCompleteLattice
    {Element : Type u}
    {SetObject : Type v}
    [Membership Element SetObject]
    [HasSeparation Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject]
    [SeparationLaws Element SetObject]
    [UniversalMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (everySubsetHasInfimum :
      forall subset : SetObject,
        exists infimum, Infimum relation subset infimum) :
    CompleteLattice SetObject relation := by
  sorry

/--
`CompleteLatticeIsLattice` TODO

Predicate logic:

  Lattice relation

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject] [inst_2 : LRA.Set.HasUniversal SetObject] [inst_3 : LRA.Set.HasComplement SetObject], (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.UniversalMembershipLaws Element SetObject) → ∀ {relation : Element → Element → Prop}, ((∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x → x = y ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z)) ∧ ∀ (subset : SetObject), (Exists fun supremum => (∀ (element : Element), inst.1 subset element → relation element supremum ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation supremum bound) ∧ Exists fun infimum => (∀ (element : Element), inst.1 subset element → relation infimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound infimum))) → ((∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x → x = y ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z)) ∧ ∀ (left right : Element), (Exists fun join => (relation left join ∧ (relation right join ∧ ∀ (upper : Element), relation left upper → relation right upper → relation join upper)) ∧ Exists fun meet => (relation meet left ∧ (relation meet right ∧ ∀ (lower : Element), relation lower left → relation lower right → relation lower meet))))

Logical form (Lean):

```lean
theorem CompleteLatticeIsLattice
    {Element : Type u}
    {SetObject : Type v}
    [Membership Element SetObject]
    [HasSeparation Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject]
    [SeparationLaws Element SetObject]
    [UniversalMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsCompleteLattice : CompleteLattice SetObject relation) :
    Lattice relation
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
theorem CompleteLatticeIsLattice
    {Element : Type u}
    {SetObject : Type v}
    [Membership Element SetObject]
    [HasSeparation Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject]
    [SeparationLaws Element SetObject]
    [UniversalMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsCompleteLattice : CompleteLattice SetObject relation) :
    Lattice relation := by
  sorry

end LRA.Order
