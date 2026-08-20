import LRA.Morphism.Properties.PreservesNullaryOperation.Definition

namespace LRA.Morphism

universe u v

/-- Apply nullary-operation preservation. -/
theorem PreservesNullaryOperation.apply {Source : Type u} {Target : Type v}
    {function : Source → Target}
    {sourceElement : LRA.Operation.NullaryOperation Source}
    {targetElement : LRA.Operation.NullaryOperation Target}
    (law : PreservesNullaryOperation function sourceElement targetElement) :
    function sourceElement = targetElement := by
  sorry

end LRA.Morphism
