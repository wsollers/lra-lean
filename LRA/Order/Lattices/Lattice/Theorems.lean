import LRA.Order.Lattices.Lattice.Definition

namespace LRA.Order

universe u

/--
`LatticeHasJoin` TODO

Predicate logic:

  (∀ left right ∈ Alpha), exists join, Join relation left right join

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, ((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (left right : Alpha), (Exists fun join => (relation left join ∧ (relation right join ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation join upper)) ∧ Exists fun meet => (relation meet left ∧ (relation meet right ∧ ∀ (lower : Alpha), relation lower left → relation lower right → relation lower meet)))) → ∀ (left right : Alpha), Exists fun join => (relation left join ∧ (relation right join ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation join upper))

Logical form (Lean):

```lean
theorem LatticeHasJoin
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLattice : Lattice relation)
    (left right : Alpha) :
    exists join, Join relation left right join
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem LatticeHasJoin
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLattice : Lattice relation)
    (left right : Alpha) :
    exists join, Join relation left right join := by
  sorry
/--
`LatticeHasMeet` TODO

Predicate logic:

  (∀ left right ∈ Alpha), exists meet, Meet relation left right meet

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, ((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (left right : Alpha), (Exists fun join => (relation left join ∧ (relation right join ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation join upper)) ∧ Exists fun meet => (relation meet left ∧ (relation meet right ∧ ∀ (lower : Alpha), relation lower left → relation lower right → relation lower meet)))) → ∀ (left right : Alpha), Exists fun meet => (relation meet left ∧ (relation meet right ∧ ∀ (lower : Alpha), relation lower left → relation lower right → relation lower meet))

Logical form (Lean):

```lean
theorem LatticeHasMeet
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLattice : Lattice relation)
    (left right : Alpha) :
    exists meet, Meet relation left right meet
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem LatticeHasMeet
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLattice : Lattice relation)
    (left right : Alpha) :
    exists meet, Meet relation left right meet := by
  sorry
/--
`JoinEqualsRightIffRelated` TODO

Predicate logic:

  (∀ left right ∈ Alpha), Join relation left right right ↔ relation left right

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) → ∀ (left right : Alpha), (relation left right ∧ (relation right right ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation right upper)) ↔ relation left right

Logical form (Lean):

```lean
theorem JoinEqualsRightIffRelated
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    (left right : Alpha) :
    Join relation left right right ↔ relation left right
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
theorem JoinEqualsRightIffRelated
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    (left right : Alpha) :
    Join relation left right right ↔ relation left right := by
  sorry
/--
`MeetEqualsLeftIffRelated` TODO

Predicate logic:

  (∀ left right ∈ Alpha), Meet relation left right left ↔ relation left right

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) → ∀ (left right : Alpha), (relation left left ∧ (relation left right ∧ ∀ (lower : Alpha), relation lower left → relation lower right → relation lower left)) ↔ relation left right

Logical form (Lean):

```lean
theorem MeetEqualsLeftIffRelated
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    (left right : Alpha) :
    Meet relation left right left ↔ relation left right
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
theorem MeetEqualsLeftIffRelated
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    (left right : Alpha) :
    Meet relation left right left ↔ relation left right := by
  sorry
/--
`MeetWithJoinAbsorbs` TODO

Predicate logic:

  meet = left

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) → ∀ {left right join meet : Alpha}, ((relation left join ∧ (relation right join ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation join upper)) ∧ (relation meet left ∧ (relation meet join ∧ ∀ (lower : Alpha), relation lower left → relation lower join → relation lower meet))) → meet = left

Logical form (Lean):

```lean
theorem MeetWithJoinAbsorbs
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {left right join meet : Alpha}
    (joinIsJoin : Join relation left right join)
    (meetIsMeet : Meet relation left join meet) :
    meet = left
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
theorem MeetWithJoinAbsorbs
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {left right join meet : Alpha}
    (joinIsJoin : Join relation left right join)
    (meetIsMeet : Meet relation left join meet) :
    meet = left := by
  sorry
/--
`JoinWithMeetAbsorbs` TODO

Predicate logic:

  join = left

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) → ∀ {left right meet join : Alpha}, ((relation meet left ∧ (relation meet right ∧ ∀ (lower : Alpha), relation lower left → relation lower right → relation lower meet)) ∧ (relation left join ∧ (relation meet join ∧ ∀ (upper : Alpha), relation left upper → relation meet upper → relation join upper))) → join = left

Logical form (Lean):

```lean
theorem JoinWithMeetAbsorbs
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {left right meet join : Alpha}
    (meetIsMeet : Meet relation left right meet)
    (joinIsJoin : Join relation left meet join) :
    join = left
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
theorem JoinWithMeetAbsorbs
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {left right meet join : Alpha}
    (meetIsMeet : Meet relation left right meet)
    (joinIsJoin : Join relation left meet join) :
    join = left := by
  sorry
/--
`JoinOfMeetsRelatedToMeetWithJoin` TODO

Predicate logic:

  relation joinOfMeets aMeetBJoinC

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) → ∀ {a b c bJoinC aMeetBJoinC aMeetB aMeetC joinOfMeets : Alpha}, ((relation b bJoinC ∧ (relation c bJoinC ∧ ∀ (upper : Alpha), relation b upper → relation c upper → relation bJoinC upper)) ∧ ((relation aMeetBJoinC a ∧ (relation aMeetBJoinC bJoinC ∧ ∀ (lower : Alpha), relation lower a → relation lower bJoinC → relation lower aMeetBJoinC)) ∧ ((relation aMeetB a ∧ (relation aMeetB b ∧ ∀ (lower : Alpha), relation lower a → relation lower b → relation lower aMeetB)) ∧ ((relation aMeetC a ∧ (relation aMeetC c ∧ ∀ (lower : Alpha), relation lower a → relation lower c → relation lower aMeetC)) ∧ (relation aMeetB joinOfMeets ∧ (relation aMeetC joinOfMeets ∧ ∀ (upper : Alpha), relation aMeetB upper → relation aMeetC upper → relation joinOfMeets upper)))))) → relation joinOfMeets aMeetBJoinC

Logical form (Lean):

```lean
theorem JoinOfMeetsRelatedToMeetWithJoin
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {a b c bJoinC aMeetBJoinC aMeetB aMeetC joinOfMeets : Alpha}
    (bJoinCIsJoin : Join relation b c bJoinC)
    (aMeetBJoinCIsMeet : Meet relation a bJoinC aMeetBJoinC)
    (aMeetBIsMeet : Meet relation a b aMeetB)
    (aMeetCIsMeet : Meet relation a c aMeetC)
    (joinOfMeetsIsJoin : Join relation aMeetB aMeetC joinOfMeets) :
    relation joinOfMeets aMeetBJoinC
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
theorem JoinOfMeetsRelatedToMeetWithJoin
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {a b c bJoinC aMeetBJoinC aMeetB aMeetC joinOfMeets : Alpha}
    (bJoinCIsJoin : Join relation b c bJoinC)
    (aMeetBJoinCIsMeet : Meet relation a bJoinC aMeetBJoinC)
    (aMeetBIsMeet : Meet relation a b aMeetB)
    (aMeetCIsMeet : Meet relation a c aMeetC)
    (joinOfMeetsIsJoin : Join relation aMeetB aMeetC joinOfMeets) :
    relation joinOfMeets aMeetBJoinC := by
  sorry
/--
`JoinWithMeetRelatedToMeetOfJoins` TODO

Predicate logic:

  relation aJoinBMeetC meetOfJoins

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) → ∀ {a b c bMeetC aJoinBMeetC aJoinB aJoinC meetOfJoins : Alpha}, ((relation bMeetC b ∧ (relation bMeetC c ∧ ∀ (lower : Alpha), relation lower b → relation lower c → relation lower bMeetC)) ∧ ((relation a aJoinBMeetC ∧ (relation bMeetC aJoinBMeetC ∧ ∀ (upper : Alpha), relation a upper → relation bMeetC upper → relation aJoinBMeetC upper)) ∧ ((relation a aJoinB ∧ (relation b aJoinB ∧ ∀ (upper : Alpha), relation a upper → relation b upper → relation aJoinB upper)) ∧ ((relation a aJoinC ∧ (relation c aJoinC ∧ ∀ (upper : Alpha), relation a upper → relation c upper → relation aJoinC upper)) ∧ (relation meetOfJoins aJoinB ∧ (relation meetOfJoins aJoinC ∧ ∀ (lower : Alpha), relation lower aJoinB → relation lower aJoinC → relation lower meetOfJoins)))))) → relation aJoinBMeetC meetOfJoins

Logical form (Lean):

```lean
theorem JoinWithMeetRelatedToMeetOfJoins
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {a b c bMeetC aJoinBMeetC aJoinB aJoinC meetOfJoins : Alpha}
    (bMeetCIsMeet : Meet relation b c bMeetC)
    (aJoinBMeetCIsJoin : Join relation a bMeetC aJoinBMeetC)
    (aJoinBIsJoin : Join relation a b aJoinB)
    (aJoinCIsJoin : Join relation a c aJoinC)
    (meetOfJoinsIsMeet : Meet relation aJoinB aJoinC meetOfJoins) :
    relation aJoinBMeetC meetOfJoins
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
theorem JoinWithMeetRelatedToMeetOfJoins
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {a b c bMeetC aJoinBMeetC aJoinB aJoinC meetOfJoins : Alpha}
    (bMeetCIsMeet : Meet relation b c bMeetC)
    (aJoinBMeetCIsJoin : Join relation a bMeetC aJoinBMeetC)
    (aJoinBIsJoin : Join relation a b aJoinB)
    (aJoinCIsJoin : Join relation a c aJoinC)
    (meetOfJoinsIsMeet : Meet relation aJoinB aJoinC meetOfJoins) :
    relation aJoinBMeetC meetOfJoins := by
  sorry
end LRA.Order
