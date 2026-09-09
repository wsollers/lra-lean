import LRA.Relation.Constructions.Mathlib.PredicateSetRelation
import LRA.Relation.Interface.Satisfy_Generic

/-!
Mathlib's predicate-set relation backend satisfies the generic relation
interface by interpreting membership of `(left, right)` as the generic
predicate relation.
-/

namespace LRA.Relation.Constructions.Mathlib

universe u

instance : LRA.Relation.GenericSemantics (PredicateSetRelation (Carrier := Carrier)) Carrier where
  toEndorelation := PredicateSetRelation.toEndorelation

/--
`predicateSetRelation_interpret_eq_toEndorelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : LRA.Relation.Constructions.Mathlib.PredicateSetRelation Carrier), LRA.Relation.interpret relation = relation.toEndorelation

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    relation : PredicateSetRelation Carrier
  Prove
    LRA.Relation.Constructions.Mathlib.instGenericSemanticsPredicateSetRelation.1 relation = funleft right => { fst := left, snd := right } ∈ relation

Logical form (Lean):

```lean
theorem predicateSetRelation_interpret_eq_toEndorelation
    {Carrier : Type u}
    (relation : PredicateSetRelation Carrier) :
    LRA.Relation.interpret relation =
      PredicateSetRelation.toEndorelation relation
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
theorem predicateSetRelation_interpret_eq_toEndorelation
    {Carrier : Type u}
    (relation : PredicateSetRelation Carrier) :
    LRA.Relation.interpret relation =
      PredicateSetRelation.toEndorelation relation := by
  sorry
end LRA.Relation.Constructions.Mathlib
