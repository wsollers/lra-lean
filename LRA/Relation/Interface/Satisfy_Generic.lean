import LRA.Relation.Interface.Definitions

namespace LRA.Relation

universe u v

/--
`GenericSemantics` Backends satisfy the generic relation interface by providing an interpretation into the canonical predicate-valued endorelation semantics.

Predicate logic:

  class GenericSemantics (RelationObject : Type v) (Carrier : outParam (Type u)) where
    toEndorelation : RelationObject → Endorelation Carrier

Predicate logic (unfolded):

  class GenericSemantics (RelationObject : Type v) (Carrier : outParam (Type u)) where
    toEndorelation : RelationObject → Endorelation Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class GenericSemantics (RelationObject : Type v) (Carrier : outParam (Type u)) where
  toEndorelation : RelationObject → Endorelation Carrier
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
class GenericSemantics (RelationObject : Type v) (Carrier : outParam (Type u)) where
  toEndorelation : RelationObject → Endorelation Carrier

/--
`interpret` TODO

Predicate logic:

  ∀ {RelationObject : Type v} {Carrier : Type u} [inst : LRA.Relation.GenericSemantics RelationObject Carrier] (relation : RelationObject) (a a_1 : Carrier), inst.1 relation a a_1

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    inst.1 relation a a_1

Logical form (Lean):

```lean
def interpret
    {RelationObject : Type v} {Carrier : Type u}
    [GenericSemantics RelationObject Carrier]
    (relation : RelationObject) : Endorelation Carrier :=
  GenericSemantics.toEndorelation relation
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
def interpret
    {RelationObject : Type v} {Carrier : Type u}
    [GenericSemantics RelationObject Carrier]
    (relation : RelationObject) : Endorelation Carrier :=
  GenericSemantics.toEndorelation relation

end LRA.Relation
