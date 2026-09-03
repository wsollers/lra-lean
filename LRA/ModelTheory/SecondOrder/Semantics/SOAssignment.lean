import LRA.ModelTheory.SecondOrder.HenkinModel
import LRA.Logic.Semantics.Assignment
import LRA.Logic.Syntax.SecondOrder.Term

open LRA.Logic

namespace LRA.ModelTheory.SecondOrder

structure SOAssignment
    {S : Signature} (M : HenkinModel S)
    (Variable : Type) (RelationVariable FunctionVariable : Nat → Type) where
  elementAssignment : Variable → M.Domain
  relationAssignment : {arity : Nat} → RelationVariable arity → (Fin arity → M.Domain) → Prop
  relationAssignment_admissible :
    ∀ {arity : Nat} (X : RelationVariable arity),
      relationAssignment X ∈ M.RelationDomain arity
  functionAssignment : {arity : Nat} → FunctionVariable arity → (Fin arity → M.Domain) → M.Domain
  functionAssignment_admissible :
    ∀ {arity : Nat} (F : FunctionVariable arity),
      functionAssignment F ∈ M.FunctionDomain arity

def SOAssignment.evaluateTerm
    {S : Signature} {Variable : Type} {FunctionVariable : Nat → Type}
    {M : HenkinModel S}
    (assignment : SOAssignment M Variable (fun _ => Empty) FunctionVariable) :
    LRA.Logic.SecondOrder.Term S Variable FunctionVariable → M.Domain
  | .var v => assignment.elementAssignment v
  | .const c => M.interpretConstant c
  | .apply f args =>
      M.interpretFunction f (fun i => SOAssignment.evaluateTerm assignment (args i))
  | .applyVar F args =>
      assignment.functionAssignment F (fun i => SOAssignment.evaluateTerm assignment (args i))

def SOAssignment.forgetRelations
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    {M : HenkinModel S}
    (assignment : SOAssignment M Variable RelationVariable FunctionVariable) :
    SOAssignment M Variable (fun _ => Empty) FunctionVariable where
  elementAssignment := assignment.elementAssignment
  relationAssignment := fun {_} e => Empty.elim e
  relationAssignment_admissible := by
    intro arity e
    exact Empty.elim e
  functionAssignment := assignment.functionAssignment
  functionAssignment_admissible := assignment.functionAssignment_admissible

def SOAssignment.updateRelationAssignment
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    [∀ arity, DecidableEq (RelationVariable arity)]
    {arity : Nat} {M : HenkinModel S}
    (assignment : SOAssignment M Variable RelationVariable FunctionVariable)
    (targetVariable : RelationVariable arity)
    (relation_ : (Fin arity → M.Domain) → Prop)
    (relation_admissible : relation_ ∈ M.RelationDomain arity) :
    SOAssignment M Variable RelationVariable FunctionVariable where
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
  relationAssignment_admissible := by
    intro otherArity other
    dsimp
    by_cases h : otherArity = arity
    · subst otherArity
      by_cases h' : other = targetVariable
      · subst h'
        simpa using relation_admissible
      · simpa [h'] using assignment.relationAssignment_admissible other
    · simpa [h] using assignment.relationAssignment_admissible other
  functionAssignment := assignment.functionAssignment
  functionAssignment_admissible := assignment.functionAssignment_admissible

def SOAssignment.updateFunctionAssignment
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    [∀ arity, DecidableEq (FunctionVariable arity)]
    {arity : Nat} {M : HenkinModel S}
    (assignment : SOAssignment M Variable RelationVariable FunctionVariable)
    (targetVariable : FunctionVariable arity)
    (function_ : (Fin arity → M.Domain) → M.Domain)
    (function_admissible : function_ ∈ M.FunctionDomain arity) :
    SOAssignment M Variable RelationVariable FunctionVariable where
  elementAssignment := assignment.elementAssignment
  relationAssignment := assignment.relationAssignment
  relationAssignment_admissible := assignment.relationAssignment_admissible
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
  functionAssignment_admissible := by
    intro otherArity other
    dsimp
    by_cases h : otherArity = arity
    · subst otherArity
      by_cases h' : other = targetVariable
      · subst h'
        simpa using function_admissible
      · simpa [h'] using assignment.functionAssignment_admissible other
    · simpa [h] using assignment.functionAssignment_admissible other

end LRA.ModelTheory.SecondOrder
