import LRA.Logic.Language.SecondOrder.Language

namespace LRA.Logic.SecondOrder

/--
Second-order terms extend first-order terms by allowing application of
second-order function variables of arbitrary finite arity.
-/
inductive Term (S : Signature) (Variable : Type) (FunctionVariable : Nat → Type) where
  | var : Variable → Term S Variable FunctionVariable
  | const : S.Constants → Term S Variable FunctionVariable
  | apply :
      (f : S.FunctionSymbol) →
      (Fin (S.functionArity f) → Term S Variable FunctionVariable) →
      Term S Variable FunctionVariable
  | applyVar :
      {arity : Nat} →
      FunctionVariable arity →
      (Fin arity → Term S Variable FunctionVariable) →
      Term S Variable FunctionVariable

end LRA.Logic.SecondOrder
