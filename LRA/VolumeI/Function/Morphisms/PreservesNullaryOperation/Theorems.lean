import LRA.VolumeI.Function.Morphisms.PreservesNullaryOperation.Definition

namespace LRA.Function.Morphisms

universe u v

theorem PreservesNullaryOperation.apply {Source : Type u} {Target : Type v}
    {map : Source -> Target}
    {sourceElement : LRA.Operation.NullaryOperation Source}
    {targetElement : LRA.Operation.NullaryOperation Target}
    (law : PreservesNullaryOperation map sourceElement targetElement) :
    map sourceElement = targetElement :=
  law

end LRA.Function.Morphisms
