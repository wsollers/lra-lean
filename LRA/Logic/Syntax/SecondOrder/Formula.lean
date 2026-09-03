import LRA.Logic.Syntax.SecondOrder.Term

namespace LRA.Logic.SecondOrder

/--
General second-order formulas with first-order quantification and quantification
over relation and function variables of arbitrary finite arity.
-/
inductive Formula
    (S : Signature) (Variable : Type)
    (RelationVariable FunctionVariable : Nat → Type) where
  | relation :
      (r : S.RelationSymbol) →
      (Fin (S.relationArity r) → Term S Variable FunctionVariable) →
      Formula S Variable RelationVariable FunctionVariable
  | relationVar :
      {arity : Nat} →
      RelationVariable arity →
      (Fin arity → Term S Variable FunctionVariable) →
      Formula S Variable RelationVariable FunctionVariable
  | equal :
      Term S Variable FunctionVariable →
      Term S Variable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable
  | neg :
      Formula S Variable RelationVariable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable
  | impl :
      Formula S Variable RelationVariable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable
  | forallQ :
      Variable →
      Formula S Variable RelationVariable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable
  | forallRel :
      {arity : Nat} →
      RelationVariable arity →
      Formula S Variable RelationVariable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable
  | forallFun :
      {arity : Nat} →
      FunctionVariable arity →
      Formula S Variable RelationVariable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable

def Formula.and
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    (φ ψ : Formula S Variable RelationVariable FunctionVariable) :
    Formula S Variable RelationVariable FunctionVariable :=
  Formula.neg (Formula.impl φ (Formula.neg ψ))

def Formula.existsQ
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    (v : Variable) (φ : Formula S Variable RelationVariable FunctionVariable) :
    Formula S Variable RelationVariable FunctionVariable :=
  Formula.neg (Formula.forallQ v (Formula.neg φ))

def Formula.existsRel
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    {arity : Nat}
    (X : RelationVariable arity) (φ : Formula S Variable RelationVariable FunctionVariable) :
    Formula S Variable RelationVariable FunctionVariable :=
  Formula.neg (Formula.forallRel X (Formula.neg φ))

def Formula.existsFun
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    {arity : Nat}
    (F : FunctionVariable arity) (φ : Formula S Variable RelationVariable FunctionVariable) :
    Formula S Variable RelationVariable FunctionVariable :=
  Formula.neg (Formula.forallFun F (Formula.neg φ))

end LRA.Logic.SecondOrder
