import LRA.Function.Satisfy_Generic

namespace LRA.Function.Constructions.Mathlib.NativeFunction

universe u v

instance {Domain : Type u} {Codomain : Type v} :
    LRA.Function.GenericSemantics
      (LRA.Function Domain Codomain) Domain Codomain where
  toFunctionRelation := LRA.Function.Graph

theorem satisfiesGeneric
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    LRA.Function.genericTheory function := by
  sorry
end LRA.Function.Constructions.Mathlib.NativeFunction
