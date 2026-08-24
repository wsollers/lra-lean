import LRA.Order.Lattices.DistributiveLattice.Definition

namespace LRA.Order

universe u

/--
`DistributiveLatticeIsLattice` TODO

Predicate logic:

  Lattice relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (left right : Alpha), (Exists fun join => (relation left join ∧ (relation right join ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation join upper)) ∧ Exists fun meet => (relation meet left ∧ (relation meet right ∧ ∀ (lower : Alpha), relation lower left → relation lower right → relation lower meet)))) ∧ (∀ (a b c bMeetC leftSide aJoinB aJoinC rightSide : Alpha), (relation bMeetC b ∧ (relation bMeetC c ∧ ∀ (lower : Alpha), relation lower b → relation lower c → relation lower bMeetC)) → (relation a leftSide ∧ (relation bMeetC leftSide ∧ ∀ (upper : Alpha), relation a upper → relation bMeetC upper → relation leftSide upper)) → (relation a aJoinB ∧ (relation b aJoinB ∧ ∀ (upper : Alpha), relation a upper → relation b upper → relation aJoinB upper)) → (relation a aJoinC ∧ (relation c aJoinC ∧ ∀ (upper : Alpha), relation a upper → relation c upper → relation aJoinC upper)) → (relation rightSide aJoinB ∧ (relation rightSide aJoinC ∧ ∀ (lower : Alpha), relation lower aJoinB → relation lower aJoinC → relation lower rightSide)) → leftSide = rightSide ∧ ∀ (a b c bJoinC leftSide aMeetB aMeetC rightSide : Alpha), (relation b bJoinC ∧ (relation c bJoinC ∧ ∀ (upper : Alpha), relation b upper → relation c upper → relation bJoinC upper)) → (relation leftSide a ∧ (relation leftSide bJoinC ∧ ∀ (lower : Alpha), relation lower a → relation lower bJoinC → relation lower leftSide)) → (relation aMeetB a ∧ (relation aMeetB b ∧ ∀ (lower : Alpha), relation lower a → relation lower b → relation lower aMeetB)) → (relation aMeetC a ∧ (relation aMeetC c ∧ ∀ (lower : Alpha), relation lower a → relation lower c → relation lower aMeetC)) → (relation aMeetB rightSide ∧ (relation aMeetC rightSide ∧ ∀ (upper : Alpha), relation aMeetB upper → relation aMeetC upper → relation rightSide upper)) → leftSide = rightSide)) → ((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (left right : Alpha), (Exists fun join => (relation left join ∧ (relation right join ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation join upper)) ∧ Exists fun meet => (relation meet left ∧ (relation meet right ∧ ∀ (lower : Alpha), relation lower left → relation lower right → relation lower meet))))

Logical form (Lean):

```lean
theorem DistributiveLatticeIsLattice
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsDistributiveLattice : DistributiveLattice relation) :
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
theorem DistributiveLatticeIsLattice
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsDistributiveLattice : DistributiveLattice relation) :
    Lattice relation := by
  sorry

/--
`JoinDistributesOverMeet` TODO

Predicate logic:

  leftSide = rightSide

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (left right : Alpha), (Exists fun join => (relation left join ∧ (relation right join ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation join upper)) ∧ Exists fun meet => (relation meet left ∧ (relation meet right ∧ ∀ (lower : Alpha), relation lower left → relation lower right → relation lower meet)))) ∧ (∀ (a b c bMeetC leftSide aJoinB aJoinC rightSide : Alpha), (relation bMeetC b ∧ (relation bMeetC c ∧ ∀ (lower : Alpha), relation lower b → relation lower c → relation lower bMeetC)) → (relation a leftSide ∧ (relation bMeetC leftSide ∧ ∀ (upper : Alpha), relation a upper → relation bMeetC upper → relation leftSide upper)) → (relation a aJoinB ∧ (relation b aJoinB ∧ ∀ (upper : Alpha), relation a upper → relation b upper → relation aJoinB upper)) → (relation a aJoinC ∧ (relation c aJoinC ∧ ∀ (upper : Alpha), relation a upper → relation c upper → relation aJoinC upper)) → (relation rightSide aJoinB ∧ (relation rightSide aJoinC ∧ ∀ (lower : Alpha), relation lower aJoinB → relation lower aJoinC → relation lower rightSide)) → leftSide = rightSide ∧ ∀ (a b c bJoinC leftSide aMeetB aMeetC rightSide : Alpha), (relation b bJoinC ∧ (relation c bJoinC ∧ ∀ (upper : Alpha), relation b upper → relation c upper → relation bJoinC upper)) → (relation leftSide a ∧ (relation leftSide bJoinC ∧ ∀ (lower : Alpha), relation lower a → relation lower bJoinC → relation lower leftSide)) → (relation aMeetB a ∧ (relation aMeetB b ∧ ∀ (lower : Alpha), relation lower a → relation lower b → relation lower aMeetB)) → (relation aMeetC a ∧ (relation aMeetC c ∧ ∀ (lower : Alpha), relation lower a → relation lower c → relation lower aMeetC)) → (relation aMeetB rightSide ∧ (relation aMeetC rightSide ∧ ∀ (upper : Alpha), relation aMeetB upper → relation aMeetC upper → relation rightSide upper)) → leftSide = rightSide)) → ∀ {a b c bMeetC leftSide aJoinB aJoinC rightSide : Alpha}, ((relation bMeetC b ∧ (relation bMeetC c ∧ ∀ (lower : Alpha), relation lower b → relation lower c → relation lower bMeetC)) ∧ ((relation a leftSide ∧ (relation bMeetC leftSide ∧ ∀ (upper : Alpha), relation a upper → relation bMeetC upper → relation leftSide upper)) ∧ ((relation a aJoinB ∧ (relation b aJoinB ∧ ∀ (upper : Alpha), relation a upper → relation b upper → relation aJoinB upper)) ∧ ((relation a aJoinC ∧ (relation c aJoinC ∧ ∀ (upper : Alpha), relation a upper → relation c upper → relation aJoinC upper)) ∧ (relation rightSide aJoinB ∧ (relation rightSide aJoinC ∧ ∀ (lower : Alpha), relation lower aJoinB → relation lower aJoinC → relation lower rightSide)))))) → leftSide = rightSide

Logical form (Lean):

```lean
theorem JoinDistributesOverMeet
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsDistributiveLattice : DistributiveLattice relation)
    {a b c bMeetC leftSide aJoinB aJoinC rightSide : Alpha}
    (bMeetCIsMeet : Meet relation b c bMeetC)
    (leftSideIsJoin : Join relation a bMeetC leftSide)
    (aJoinBIsJoin : Join relation a b aJoinB)
    (aJoinCIsJoin : Join relation a c aJoinC)
    (rightSideIsMeet : Meet relation aJoinB aJoinC rightSide) :
    leftSide = rightSide
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
theorem JoinDistributesOverMeet
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsDistributiveLattice : DistributiveLattice relation)
    {a b c bMeetC leftSide aJoinB aJoinC rightSide : Alpha}
    (bMeetCIsMeet : Meet relation b c bMeetC)
    (leftSideIsJoin : Join relation a bMeetC leftSide)
    (aJoinBIsJoin : Join relation a b aJoinB)
    (aJoinCIsJoin : Join relation a c aJoinC)
    (rightSideIsMeet : Meet relation aJoinB aJoinC rightSide) :
    leftSide = rightSide := by
  sorry

/--
`MeetDistributesOverJoin` TODO

Predicate logic:

  leftSide = rightSide

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (left right : Alpha), (Exists fun join => (relation left join ∧ (relation right join ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation join upper)) ∧ Exists fun meet => (relation meet left ∧ (relation meet right ∧ ∀ (lower : Alpha), relation lower left → relation lower right → relation lower meet)))) ∧ (∀ (a b c bMeetC leftSide aJoinB aJoinC rightSide : Alpha), (relation bMeetC b ∧ (relation bMeetC c ∧ ∀ (lower : Alpha), relation lower b → relation lower c → relation lower bMeetC)) → (relation a leftSide ∧ (relation bMeetC leftSide ∧ ∀ (upper : Alpha), relation a upper → relation bMeetC upper → relation leftSide upper)) → (relation a aJoinB ∧ (relation b aJoinB ∧ ∀ (upper : Alpha), relation a upper → relation b upper → relation aJoinB upper)) → (relation a aJoinC ∧ (relation c aJoinC ∧ ∀ (upper : Alpha), relation a upper → relation c upper → relation aJoinC upper)) → (relation rightSide aJoinB ∧ (relation rightSide aJoinC ∧ ∀ (lower : Alpha), relation lower aJoinB → relation lower aJoinC → relation lower rightSide)) → leftSide = rightSide ∧ ∀ (a b c bJoinC leftSide aMeetB aMeetC rightSide : Alpha), (relation b bJoinC ∧ (relation c bJoinC ∧ ∀ (upper : Alpha), relation b upper → relation c upper → relation bJoinC upper)) → (relation leftSide a ∧ (relation leftSide bJoinC ∧ ∀ (lower : Alpha), relation lower a → relation lower bJoinC → relation lower leftSide)) → (relation aMeetB a ∧ (relation aMeetB b ∧ ∀ (lower : Alpha), relation lower a → relation lower b → relation lower aMeetB)) → (relation aMeetC a ∧ (relation aMeetC c ∧ ∀ (lower : Alpha), relation lower a → relation lower c → relation lower aMeetC)) → (relation aMeetB rightSide ∧ (relation aMeetC rightSide ∧ ∀ (upper : Alpha), relation aMeetB upper → relation aMeetC upper → relation rightSide upper)) → leftSide = rightSide)) → ∀ {a b c bJoinC leftSide aMeetB aMeetC rightSide : Alpha}, ((relation b bJoinC ∧ (relation c bJoinC ∧ ∀ (upper : Alpha), relation b upper → relation c upper → relation bJoinC upper)) ∧ ((relation leftSide a ∧ (relation leftSide bJoinC ∧ ∀ (lower : Alpha), relation lower a → relation lower bJoinC → relation lower leftSide)) ∧ ((relation aMeetB a ∧ (relation aMeetB b ∧ ∀ (lower : Alpha), relation lower a → relation lower b → relation lower aMeetB)) ∧ ((relation aMeetC a ∧ (relation aMeetC c ∧ ∀ (lower : Alpha), relation lower a → relation lower c → relation lower aMeetC)) ∧ (relation aMeetB rightSide ∧ (relation aMeetC rightSide ∧ ∀ (upper : Alpha), relation aMeetB upper → relation aMeetC upper → relation rightSide upper)))))) → leftSide = rightSide

Logical form (Lean):

```lean
theorem MeetDistributesOverJoin
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsDistributiveLattice : DistributiveLattice relation)
    {a b c bJoinC leftSide aMeetB aMeetC rightSide : Alpha}
    (bJoinCIsJoin : Join relation b c bJoinC)
    (leftSideIsMeet : Meet relation a bJoinC leftSide)
    (aMeetBIsMeet : Meet relation a b aMeetB)
    (aMeetCIsMeet : Meet relation a c aMeetC)
    (rightSideIsJoin : Join relation aMeetB aMeetC rightSide) :
    leftSide = rightSide
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
theorem MeetDistributesOverJoin
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsDistributiveLattice : DistributiveLattice relation)
    {a b c bJoinC leftSide aMeetB aMeetC rightSide : Alpha}
    (bJoinCIsJoin : Join relation b c bJoinC)
    (leftSideIsMeet : Meet relation a bJoinC leftSide)
    (aMeetBIsMeet : Meet relation a b aMeetB)
    (aMeetCIsMeet : Meet relation a c aMeetC)
    (rightSideIsJoin : Join relation aMeetB aMeetC rightSide) :
    leftSide = rightSide := by
  sorry

end LRA.Order
