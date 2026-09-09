import LRA.Relation.Interface.Laws
import LRA.Relation.Interface.ModelTheory.LStructure

namespace LRA.Relation.ModelTheory

universe u

/--
`RelationTheory` TODO

Predicate logic:

  structure RelationTheory {Carrier : Type u}
      (relationInterpretation : Carrier → Carrier → Prop) : Prop where
    reflexive : LRA.Relation.Reflexive relationInterpretation
    symmetric : LRA.Relation.Symmetric relationInterpretation
    transitive : LRA.Relation.Transitive relationInterpretation

Predicate logic (unfolded):

  structure RelationTheory {Carrier : Type u}
      (relationInterpretation : Carrier → Carrier → Prop) : Prop where
    reflexive : LRA.Relation.Reflexive relationInterpretation
    symmetric : LRA.Relation.Symmetric relationInterpretation
    transitive : LRA.Relation.Transitive relationInterpretation (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure RelationTheory {Carrier : Type u}
    (relationInterpretation : Carrier → Carrier → Prop) : Prop where
  reflexive : LRA.Relation.Reflexive relationInterpretation
  symmetric : LRA.Relation.Symmetric relationInterpretation
  transitive : LRA.Relation.Transitive relationInterpretation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure RelationTheory {Carrier : Type u}
    (relationInterpretation : Carrier → Carrier → Prop) : Prop where
  reflexive : LRA.Relation.Reflexive relationInterpretation
  symmetric : LRA.Relation.Symmetric relationInterpretation
  transitive : LRA.Relation.Transitive relationInterpretation

end LRA.Relation.ModelTheory
