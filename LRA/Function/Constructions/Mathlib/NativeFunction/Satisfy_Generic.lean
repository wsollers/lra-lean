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
  constructor
  · intro input
    exact ⟨function input, rfl⟩
  · intro input firstOutput secondOutput firstEval secondEval
    exact firstEval.symm.trans secondEval

end LRA.Function.Constructions.Mathlib.NativeFunction
