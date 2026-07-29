namespace LRA.VolumeI.Algebra.UniversalProperties.Basic

universe u v w

/--
A free object over generators extends every generator map uniquely along the
chosen interpretation of arrows.
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

end LRA.VolumeI.Algebra.UniversalProperties.Basic
