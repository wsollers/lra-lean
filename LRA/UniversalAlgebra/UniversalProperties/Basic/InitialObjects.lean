namespace LRA.UniversalAlgebra.UniversalProperties.Basic

universe u v

/--
`InitialObject` TODO

Predicate logic:

  structure InitialObject
    (Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (initialObject : Object) : Prop where
  ExistsArrow : forall targetObject, Nonempty (Arrow initialObject targetObject)
  UniqueArrow :
    forall targetObject
      (firstArrow secondArrow : Arrow initialObject targetObject),
        firstArrow = secondArrow

Predicate logic (unfolded):

  structure InitialObject
    (Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (initialObject : Object) : Prop where
  ExistsArrow : forall targetObject, Nonempty (Arrow initialObject targetObject)
  UniqueArrow :
    forall targetObject
      (firstArrow secondArrow : Arrow initialObject targetObject),
        firstArrow = secondArrow (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure InitialObject
    (Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (initialObject : Object) : Prop where
  ExistsArrow : forall targetObject, Nonempty (Arrow initialObject targetObject)
  UniqueArrow :
    forall targetObject
      (firstArrow secondArrow : Arrow initialObject targetObject),
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
structure InitialObject
    (Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (initialObject : Object) : Prop where
  ExistsArrow : forall targetObject, Nonempty (Arrow initialObject targetObject)
  UniqueArrow :
    forall targetObject
      (firstArrow secondArrow : Arrow initialObject targetObject),
        firstArrow = secondArrow

end LRA.UniversalAlgebra.UniversalProperties.Basic
