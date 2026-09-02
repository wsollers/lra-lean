import LRA.Order.OrderedSets.Preorder.Definition

namespace LRA.Order.OrderedSets.Preorder

/--
`PreorderRelationIsReflexive` TODO

Predicate logic:

  LRA.Relation.Reflexive preorder.relation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (preorder : LRA.Order.OrderedSets.Preorder.PreorderRelation Carrier) (x : Carrier), preorder.1 x x

Logical form (Lean):

```lean
theorem PreorderRelationIsReflexive
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Relation.Reflexive preorder.relation
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
theorem PreorderRelationIsReflexive
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Relation.Reflexive preorder.relation := by
  sorry
/--
`PreorderRelationIsTransitive` TODO

Predicate logic:

  LRA.Relation.Transitive preorder.relation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (preorder : LRA.Order.OrderedSets.Preorder.PreorderRelation Carrier) (x y z : Carrier), (preorder.1 x y ∧ preorder.1 y z) → preorder.1 x z

Logical form (Lean):

```lean
theorem PreorderRelationIsTransitive
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Relation.Transitive preorder.relation
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
theorem PreorderRelationIsTransitive
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Relation.Transitive preorder.relation := by
  sorry
end LRA.Order.OrderedSets.Preorder
