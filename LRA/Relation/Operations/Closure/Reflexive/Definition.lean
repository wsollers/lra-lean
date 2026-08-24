import LRA.Relation.Operations.Boolean.Definition
import LRA.Relation.Canonical.IdentityRelation.Definition

namespace LRA.Relation

universe u

/--
`ReflexiveClosure` TODO

Predicate logic:

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha) (a a_1 : Alpha), Or (relation a a_1) (LRA.Relation.IdentityRelation Alpha a a_1)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop) (a a_1 : Alpha), Or (relation a a_1) (a = a_1)

Logical form (Lean):

```lean
def ReflexiveClosure {Alpha : Type u} (relation : Endorelation Alpha) :
    Endorelation Alpha :=
  RelationUnion relation (IdentityRelation Alpha)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def ReflexiveClosure {Alpha : Type u} (relation : Endorelation Alpha) :
    Endorelation Alpha :=
  RelationUnion relation (IdentityRelation Alpha)

end LRA.Relation
