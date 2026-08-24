namespace LRA.UniversalAlgebra.UniversalProperties.Basic

universe u v

/--
`ProductUniversalProperty` TODO

Predicate logic:

  structure ProductUniversalProperty
    (Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (leftObject rightObject productObject : Object) where
  LeftProjection : Arrow productObject leftObject
  RightProjection : Arrow productObject rightObject
  ExistsMediator :
    forall sourceObject,
      Arrow sourceObject leftObject ->
      Arrow sourceObject rightObject ->
        Nonempty (Arrow sourceObject productObject)
  UniqueMediator :
    forall sourceObject
      (_leftMap : Arrow sourceObject leftObject)
      (_rightMap : Arrow sourceObject rightObject)
      (firstMediator secondMediator : Arrow sourceObject productObject),
        firstMediator = secondMediator

Predicate logic (unfolded):

  structure ProductUniversalProperty
    (Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (leftObject rightObject productObject : Object) where
  LeftProjection : Arrow productObject leftObject
  RightProjection : Arrow productObject rightObject
  ExistsMediator :
    forall sourceObject,
      Arrow sourceObject leftObject ->
      Arrow sourceObject rightObject ->
        Nonempty (Arrow sourceObject productObject)
  UniqueMediator :
    forall sourceObject
      (_leftMap : Arrow sourceObject leftObject)
      (_rightMap : Arrow sourceObject rightObject)
      (firstMediator secondMediator : Arrow sourceObject productObject),
        firstMediator = secondMediator (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure ProductUniversalProperty
    (Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (leftObject rightObject productObject : Object) where
  LeftProjection : Arrow productObject leftObject
  RightProjection : Arrow productObject rightObject
  ExistsMediator :
    forall sourceObject,
      Arrow sourceObject leftObject ->
      Arrow sourceObject rightObject ->
        Nonempty (Arrow sourceObject productObject)
  UniqueMediator :
    forall sourceObject
      (_leftMap : Arrow sourceObject leftObject)
      (_rightMap : Arrow sourceObject rightObject)
      (firstMediator secondMediator : Arrow sourceObject productObject),
        firstMediator = secondMediator
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
structure ProductUniversalProperty
    (Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (leftObject rightObject productObject : Object) where
  LeftProjection : Arrow productObject leftObject
  RightProjection : Arrow productObject rightObject
  ExistsMediator :
    forall sourceObject,
      Arrow sourceObject leftObject ->
      Arrow sourceObject rightObject ->
        Nonempty (Arrow sourceObject productObject)
  UniqueMediator :
    forall sourceObject
      (_leftMap : Arrow sourceObject leftObject)
      (_rightMap : Arrow sourceObject rightObject)
      (firstMediator secondMediator : Arrow sourceObject productObject),
        firstMediator = secondMediator

end LRA.UniversalAlgebra.UniversalProperties.Basic
