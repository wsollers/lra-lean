import LRA.Function.Definition

namespace LRA.Function

universe u v w

/--
Backends satisfy the generic function interface by presenting a graph relation
that is total and single-valued on the exported domain and codomain types.
-/
class GenericSemantics
    (FunctionObject : Type w)
    (Domain : outParam (Type u))
    (Codomain : outParam (Type v)) where
  toFunctionRelation : FunctionObject → FunctionRelation Domain Codomain

def interpret
    {FunctionObject : Type w}
    {Domain : Type u} {Codomain : Type v}
    [GenericSemantics FunctionObject Domain Codomain]
    (function : FunctionObject) : FunctionRelation Domain Codomain :=
  GenericSemantics.toFunctionRelation function

def genericTheory
    {FunctionObject : Type w}
    {Domain : Type u} {Codomain : Type v}
    [GenericSemantics FunctionObject Domain Codomain]
    (function : FunctionObject) : Prop :=
  IsFunctionRelation (interpret function)

noncomputable def toFunction
    {FunctionObject : Type w}
    {Domain : Type u} {Codomain : Type v}
    [GenericSemantics FunctionObject Domain Codomain]
    (function : FunctionObject)
    (satisfiesGeneric : genericTheory function) :
    LRA.Function Domain Codomain :=
  fun input => Classical.choose (satisfiesGeneric.1 input)

theorem toFunction_graph
    {FunctionObject : Type w}
    {Domain : Type u} {Codomain : Type v}
    [GenericSemantics FunctionObject Domain Codomain]
    (function : FunctionObject)
    (satisfiesGeneric : genericTheory function)
    (input : Domain) :
    interpret function input (toFunction function satisfiesGeneric input) := by
  sorry
end LRA.Function
