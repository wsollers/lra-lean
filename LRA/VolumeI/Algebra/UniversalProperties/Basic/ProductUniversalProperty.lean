namespace LRA.Algebra.UniversalProperties.Basic

universe u v

/--
Product object with projections and the usual unique mediating arrow.

Logical form:

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

end LRA.Algebra.UniversalProperties.Basic
