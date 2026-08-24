namespace LRA.UniversalAlgebra.UniversalProperties.Basic

universe u v w

/--
`FreeObject` TODO

Predicate logic:

  structure FreeObject
    (Generator Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (Carrier : Object -> Type w)
    (freeObject : Object)
    (includeGenerator : Generator -> Carrier freeObject) : Prop where
  ExistsExtension :
    forall targetObject (_generatorMap : Generator -> Carrier targetObject),
      Nonempty (Arrow freeObject targetObject)
  UniqueExtension :
    forall targetObject
      (_generatorMap : Generator -> Carrier targetObject)
      (firstArrow secondArrow : Arrow freeObject targetObject),
        firstArrow = secondArrow

Predicate logic (unfolded):

  structure FreeObject
    (Generator Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (Carrier : Object -> Type w)
    (freeObject : Object)
    (includeGenerator : Generator -> Carrier freeObject) : Prop where
  ExistsExtension :
    forall targetObject (_generatorMap : Generator -> Carrier targetObject),
      Nonempty (Arrow freeObject targetObject)
  UniqueExtension :
    forall targetObject
      (_generatorMap : Generator -> Carrier targetObject)
      (firstArrow secondArrow : Arrow freeObject targetObject),
        firstArrow = secondArrow (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure FreeObject
    (Generator Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (Carrier : Object -> Type w)
    (freeObject : Object)
    (includeGenerator : Generator -> Carrier freeObject) : Prop where
  ExistsExtension :
    forall targetObject (_generatorMap : Generator -> Carrier targetObject),
      Nonempty (Arrow freeObject targetObject)
  UniqueExtension :
    forall targetObject
      (_generatorMap : Generator -> Carrier targetObject)
      (firstArrow secondArrow : Arrow freeObject targetObject),
        firstArrow = secondArrow
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
structure FreeObject
    (Generator Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (Carrier : Object -> Type w)
    (freeObject : Object)
    (includeGenerator : Generator -> Carrier freeObject) : Prop where
  ExistsExtension :
    forall targetObject (_generatorMap : Generator -> Carrier targetObject),
      Nonempty (Arrow freeObject targetObject)
  UniqueExtension :
    forall targetObject
      (_generatorMap : Generator -> Carrier targetObject)
      (firstArrow secondArrow : Arrow freeObject targetObject),
        firstArrow = secondArrow

end LRA.UniversalAlgebra.UniversalProperties.Basic
