import LRA.Relation.Operations.Boolean.Definition
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Relation

universe u

/--
`SymmetricClosure` TODO

Predicate logic:

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha) (a a_1 : Alpha), Or (relation a a_1) (LRA.Relation.Converse relation a a_1)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop) (a a_1 : Alpha), Or (relation a a_1) (relation a_1 a)

Logical form (Lean):

```lean
def SymmetricClosure {Alpha : Type u} (relation : Endorelation Alpha) :
    Endorelation Alpha :=
  RelationUnion relation (Converse relation)
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
def SymmetricClosure {Alpha : Type u} (relation : Endorelation Alpha) :
    Endorelation Alpha :=
  RelationUnion relation (Converse relation)

end LRA.Relation
