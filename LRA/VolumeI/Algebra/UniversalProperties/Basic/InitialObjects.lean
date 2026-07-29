namespace LRA.VolumeI.Algebra.UniversalProperties.Basic

universe u v

/-- An object is initial when it has a unique arrow to every object. -/
structure InitialObject
    (Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (initialObject : Object) : Prop where
  existsArrow : forall targetObject, Nonempty (Arrow initialObject targetObject)
  uniqueArrow :
    forall targetObject
      (firstArrow secondArrow : Arrow initialObject targetObject),
        firstArrow = secondArrow

end LRA.VolumeI.Algebra.UniversalProperties.Basic
