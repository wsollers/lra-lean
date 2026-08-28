import LRA.Relation.Interface.Operations.Converse.Definition
import LRA.Order.Lattices.CompleteLattice.Definition

namespace LRA.Order

universe u v

/--
`ConverseIsCompleteLatticeIff` TODO

Predicate logic:

  CompleteLattice SetObject (LRA.Relation.Converse relation) ↔ CompleteLattice SetObject relation

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop), ((∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation y x → relation x y → x = y ∧ ∀ (x y z : Element), relation y x → relation z y → relation z x)) ∧ ∀ (subset : SetObject), (Exists fun supremum => (∀ (element : Element), inst.1 subset element → relation supremum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound supremum) ∧ Exists fun infimum => (∀ (element : Element), inst.1 subset element → relation element infimum ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation infimum bound))) ↔ ((∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x → x = y ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z)) ∧ ∀ (subset : SetObject), (Exists fun supremum => (∀ (element : Element), inst.1 subset element → relation element supremum ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation supremum bound) ∧ Exists fun infimum => (∀ (element : Element), inst.1 subset element → relation infimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound infimum)))

Logical form (Lean):

```lean
theorem ConverseIsCompleteLatticeIff
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) :
    CompleteLattice SetObject (LRA.Relation.Converse relation) ↔
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

Related proof moves: constructor, .mp, .mpr

-/
theorem ConverseIsCompleteLatticeIff
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) :
    CompleteLattice SetObject (LRA.Relation.Converse relation) ↔
      CompleteLattice SetObject relation := by
  sorry

end LRA.Order
