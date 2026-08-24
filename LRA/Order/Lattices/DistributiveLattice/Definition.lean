import LRA.Order.Lattices.Lattice.Definition

namespace LRA.Order

universe u

/--
`DistributiveLattice` TODO

Predicate logic:

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), (LRA.Order.Lattice relation ∧ (∀ (a b c bMeetC leftSide aJoinB aJoinC rightSide : Alpha), LRA.Order.Meet relation b c bMeetC → LRA.Order.Join relation a bMeetC leftSide → LRA.Order.Join relation a b aJoinB → LRA.Order.Join relation a c aJoinC → LRA.Order.Meet relation aJoinB aJoinC rightSide → leftSide = rightSide ∧ ∀ (a b c bJoinC leftSide aMeetB aMeetC rightSide : Alpha), LRA.Order.Join relation b c bJoinC → LRA.Order.Meet relation a bJoinC leftSide → LRA.Order.Meet relation a b aMeetB → LRA.Order.Meet relation a c aMeetC → LRA.Order.Join relation aMeetB aMeetC rightSide → leftSide = rightSide))

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop), (((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (left right : Alpha), (Exists fun join => (relation left join ∧ (relation right join ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation join upper)) ∧ Exists fun meet => (relation meet left ∧ (relation meet right ∧ ∀ (lower : Alpha), relation lower left → relation lower right → relation lower meet)))) ∧ (∀ (a b c bMeetC leftSide aJoinB aJoinC rightSide : Alpha), (relation bMeetC b ∧ (relation bMeetC c ∧ ∀ (lower : Alpha), relation lower b → relation lower c → relation lower bMeetC)) → (relation a leftSide ∧ (relation bMeetC leftSide ∧ ∀ (upper : Alpha), relation a upper → relation bMeetC upper → relation leftSide upper)) → (relation a aJoinB ∧ (relation b aJoinB ∧ ∀ (upper : Alpha), relation a upper → relation b upper → relation aJoinB upper)) → (relation a aJoinC ∧ (relation c aJoinC ∧ ∀ (upper : Alpha), relation a upper → relation c upper → relation aJoinC upper)) → (relation rightSide aJoinB ∧ (relation rightSide aJoinC ∧ ∀ (lower : Alpha), relation lower aJoinB → relation lower aJoinC → relation lower rightSide)) → leftSide = rightSide ∧ ∀ (a b c bJoinC leftSide aMeetB aMeetC rightSide : Alpha), (relation b bJoinC ∧ (relation c bJoinC ∧ ∀ (upper : Alpha), relation b upper → relation c upper → relation bJoinC upper)) → (relation leftSide a ∧ (relation leftSide bJoinC ∧ ∀ (lower : Alpha), relation lower a → relation lower bJoinC → relation lower leftSide)) → (relation aMeetB a ∧ (relation aMeetB b ∧ ∀ (lower : Alpha), relation lower a → relation lower b → relation lower aMeetB)) → (relation aMeetC a ∧ (relation aMeetC c ∧ ∀ (lower : Alpha), relation lower a → relation lower c → relation lower aMeetC)) → (relation aMeetB rightSide ∧ (relation aMeetC rightSide ∧ ∀ (upper : Alpha), relation aMeetB upper → relation aMeetC upper → relation rightSide upper)) → leftSide = rightSide))

Logical form (Lean):

```lean
def DistributiveLattice
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  Lattice relation /\
    (forall a b c bMeetC leftSide aJoinB aJoinC rightSide,
      Meet relation b c bMeetC ->
        Join relation a bMeetC leftSide ->
          Join relation a b aJoinB ->
            Join relation a c aJoinC ->
              Meet relation aJoinB aJoinC rightSide ->
                leftSide = rightSide) /\
      (forall a b c bJoinC leftSide aMeetB aMeetC rightSide,
        Join relation b c bJoinC ->
          Meet relation a bJoinC leftSide ->
            Meet relation a b aMeetB ->
              Meet relation a c aMeetC ->
                Join relation aMeetB aMeetC rightSide ->
                  leftSide = rightSide)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def DistributiveLattice
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  Lattice relation /\
    (forall a b c bMeetC leftSide aJoinB aJoinC rightSide,
      Meet relation b c bMeetC ->
        Join relation a bMeetC leftSide ->
          Join relation a b aJoinB ->
            Join relation a c aJoinC ->
              Meet relation aJoinB aJoinC rightSide ->
                leftSide = rightSide) /\
      (forall a b c bJoinC leftSide aMeetB aMeetC rightSide,
        Join relation b c bJoinC ->
          Meet relation a bJoinC leftSide ->
            Meet relation a b aMeetB ->
              Meet relation a c aMeetC ->
                Join relation aMeetB aMeetC rightSide ->
                  leftSide = rightSide)

end LRA.Order
