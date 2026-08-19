import LRA.Function.Definition
import LRA.Relation.Operations.Composition.Definition

namespace LRA.Function

universe u v w

/-- Composition of functions: apply the right function, then the left. -/
def Compose
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (outer : LRA.Function Middle Codomain)
    (inner : LRA.Function Domain Middle) :
    LRA.Function Domain Codomain :=
  fun input => outer (inner input)

end LRA.Function
