namespace LRA.VolumeI.Algebra.UniversalProperties.Basic

universe u v

/-- Product object with projections and the usual unique mediating arrow. -/
structure ProductUniversalProperty
    (Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (leftObject rightObject productObject : Object) where
  leftProjection : Arrow productObject leftObject
  rightProjection : Arrow productObject rightObject
  existsMediator :
    forall sourceObject,
      Arrow sourceObject leftObject ->
      Arrow sourceObject rightObject ->
        Nonempty (Arrow sourceObject productObject)
  uniqueMediator :
    forall sourceObject
      (_leftMap : Arrow sourceObject leftObject)
      (_rightMap : Arrow sourceObject rightObject)
      (firstMediator secondMediator : Arrow sourceObject productObject),
        firstMediator = secondMediator

end LRA.VolumeI.Algebra.UniversalProperties.Basic
