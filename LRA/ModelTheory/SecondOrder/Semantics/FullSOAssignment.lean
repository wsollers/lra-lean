import LRA.ModelTheory.SecondOrder.FullModel
import LRA.Logic.Semantics.Assignment
import LRA.Logic.Syntax.SecondOrder.Term

open LRA.Logic

namespace LRA.ModelTheory.SecondOrder

structure FullSOAssignment
    {S : Signature} (M : FullModel S)
    (Variable : Type) (RelationVariable FunctionVariable : Nat → Type) where
  elementAssignment : Variable → M.Domain
  relationAssignment : {arity : Nat} → RelationVariable arity → (Fin arity → M.Domain) → Prop
  functionAssignment : {arity : Nat} → FunctionVariable arity → (Fin arity → M.Domain) → M.Domain

def FullSOAssignment.evaluateTerm
    {S : Signature} {Variable : Type} {FunctionVariable : Nat → Type}
    {M : FullModel S}
    (assignment : FullSOAssignment M Variable (fun _ => Empty) FunctionVariable) :
    LRA.Logic.SecondOrder.Term S Variable FunctionVariable → M.Domain
  | .var v => assignment.elementAssignment v
  | .const c => M.interpretConstant c
  | .apply f args =>
      M.interpretFunction f (fun i => evaluateTerm assignment (args i))
  | .applyVar F args =>
      assignment.functionAssignment F (fun i => evaluateTerm assignment (args i))

def FullSOAssignment.forgetRelations
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    {M : FullModel S}
    (assignment : FullSOAssignment M Variable RelationVariable FunctionVariable) :
    FullSOAssignment M Variable (fun _ => Empty) FunctionVariable where
  elementAssignment := assignment.elementAssignment
  relationAssignment := fun {_} e => Empty.elim e
  functionAssignment := assignment.functionAssignment

def FullSOAssignment.updateRelationAssignment
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    [∀ arity, DecidableEq (RelationVariable arity)]
    {arity : Nat} {M : FullModel S}
    (assignment : FullSOAssignment M Variable RelationVariable FunctionVariable)
    (targetVariable : RelationVariable arity)
    (relation_ : (Fin arity → M.Domain) → Prop) :
    FullSOAssignment M Variable RelationVariable FunctionVariable where
  elementAssignment := assignment.elementAssignment
  relationAssignment := fun {otherArity} other =>
    if h : otherArity = arity then
      match h with
      | rfl =>
          if h' : other = targetVariable then
            by
              subst h'
              exact relation_
          else
            assignment.relationAssignment other
    else
      assignment.relationAssignment other
  functionAssignment := assignment.functionAssignment

def FullSOAssignment.updateFunctionAssignment
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    [∀ arity, DecidableEq (FunctionVariable arity)]
    {arity : Nat} {M : FullModel S}
    (assignment : FullSOAssignment M Variable RelationVariable FunctionVariable)
    (targetVariable : FunctionVariable arity)
    (function_ : (Fin arity → M.Domain) → M.Domain) :
    FullSOAssignment M Variable RelationVariable FunctionVariable where
  elementAssignment := assignment.elementAssignment
  relationAssignment := assignment.relationAssignment
  functionAssignment := fun {otherArity} other =>
    if h : otherArity = arity then
      match h with
      | rfl =>
          if h' : other = targetVariable then
            by
              subst h'
              exact function_
          else
            assignment.functionAssignment other
    else
      assignment.functionAssignment other

end LRA.ModelTheory.SecondOrder
