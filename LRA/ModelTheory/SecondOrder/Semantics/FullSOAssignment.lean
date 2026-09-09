import LRA.ModelTheory.SecondOrder.FullModel
import LRA.Logic.Semantics.Assignment
import LRA.Logic.Syntax.SecondOrder.Term

open LRA.Logic

namespace LRA.ModelTheory.SecondOrder

/--
`FullSOAssignment` TODO

Predicate logic:

  structure FullSOAssignment
      {S : Signature} (M : FullModel S)
      (Variable : Type) (RelationVariable FunctionVariable : Nat → Type) where
    elementAssignment : Variable → M.Domain
    relationAssignment : {arity : Nat} → RelationVariable arity → (Fin arity → M.Domain) → Prop
    functionAssignment : {arity : Nat} → FunctionVariable arity → (Fin arity → M.Domain) → M.Domain

Predicate logic (unfolded):

  structure FullSOAssignment
      {S : Signature} (M : FullModel S)
      (Variable : Type) (RelationVariable FunctionVariable : Nat → Type) where
    elementAssignment : Variable → M.Domain
    relationAssignment : {arity : Nat} → RelationVariable arity → (Fin arity → M.Domain) → Prop
    functionAssignment : {arity : Nat} → FunctionVariable arity → (Fin arity → M.Domain) → M.Domain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure FullSOAssignment
    {S : Signature} (M : FullModel S)
    (Variable : Type) (RelationVariable FunctionVariable : Nat → Type) where
  elementAssignment : Variable → M.Domain
  relationAssignment : {arity : Nat} → RelationVariable arity → (Fin arity → M.Domain) → Prop
  functionAssignment : {arity : Nat} → FunctionVariable arity → (Fin arity → M.Domain) → M.Domain
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure FullSOAssignment
    {S : Signature} (M : FullModel S)
    (Variable : Type) (RelationVariable FunctionVariable : Nat → Type) where
  elementAssignment : Variable → M.Domain
  relationAssignment : {arity : Nat} → RelationVariable arity → (Fin arity → M.Domain) → Prop
  functionAssignment : {arity : Nat} → FunctionVariable arity → (Fin arity → M.Domain) → M.Domain

/--
`FullSOAssignment.evaluateTerm` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
        assignment.functionAssignment F (fun i => evaluateTerm assignment (args i)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
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
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
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

/--
`FullSOAssignment.forgetRelations` TODO

Predicate logic:

  def FullSOAssignment.forgetRelations
      {S : Signature} {Variable : Type}
      {RelationVariable FunctionVariable : Nat → Type}
      {M : FullModel S}
      (assignment : FullSOAssignment M Variable RelationVariable FunctionVariable) :
      FullSOAssignment M Variable (fun _ => Empty) FunctionVariable where
    elementAssignment := assignment.elementAssignment
    relationAssignment := fun {_} e => Empty.elim e
    functionAssignment := assignment.functionAssignment

Predicate logic (unfolded):

  def FullSOAssignment.forgetRelations
      {S : Signature} {Variable : Type}
      {RelationVariable FunctionVariable : Nat → Type}
      {M : FullModel S}
      (assignment : FullSOAssignment M Variable RelationVariable FunctionVariable) :
      FullSOAssignment M Variable (fun _ => Empty) FunctionVariable where
    elementAssignment := assignment.elementAssignment
    relationAssignment := fun {_} e => Empty.elim e
    functionAssignment := assignment.functionAssignment (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def FullSOAssignment.forgetRelations
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    {M : FullModel S}
    (assignment : FullSOAssignment M Variable RelationVariable FunctionVariable) :
    FullSOAssignment M Variable (fun _ => Empty) FunctionVariable where
  elementAssignment := assignment.elementAssignment
  relationAssignment := fun {_} e => Empty.elim e
  functionAssignment := assignment.functionAssignment
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def FullSOAssignment.forgetRelations
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    {M : FullModel S}
    (assignment : FullSOAssignment M Variable RelationVariable FunctionVariable) :
    FullSOAssignment M Variable (fun _ => Empty) FunctionVariable where
  elementAssignment := assignment.elementAssignment
  relationAssignment := fun {_} e => Empty.elim e
  functionAssignment := assignment.functionAssignment

/--
`FullSOAssignment.updateRelationAssignment` TODO

Predicate logic:

  def FullSOAssignment.updateRelationAssignment
      {S : Signature} {Variable : Type}
      {RelationVariable FunctionVariable : Nat → Type}
      [∀ arity, DecidableEq (RelationVariable arity)]
      {arity : Nat} {M : FullModel S}
      (assignment : FullSOAssignment M Variable RelationVariable FunctionVariable)
      (targetVariable : RelationVariable arity)
      (relation_ : (Fin arity → M.Domain) → Prop) :
      FullSOAssignment M Variable RelationVariable FunctionVariable where
    elementAssignment

Predicate logic (unfolded):

  def FullSOAssignment.updateRelationAssignment
      {S : Signature} {Variable : Type}
      {RelationVariable FunctionVariable : Nat → Type}
      [∀ arity, DecidableEq (RelationVariable arity)]
      {arity : Nat} {M : FullModel S}
      (assignment : FullSOAssignment M Variable RelationVariable FunctionVariable)
      (targetVariable : RelationVariable arity)
      (relation_ : (Fin arity → M.Domain) → Prop) :
      FullSOAssignment M Variable RelationVariable FunctionVariable where
    elementAssignment (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def FullSOAssignment.updateRelationAssignment
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    [∀ arity, DecidableEq (RelationVariable arity)]
    {arity : Nat} {M : FullModel S}
    (assignment : FullSOAssignment M Variable RelationVariable FunctionVariable)
    (targetVariable : RelationVariable arity)
    (relation_ : (Fin arity → M.Domain) → Prop) :
    FullSOAssignment M Variable RelationVariable FunctionVariable where
  elementAssignment
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
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

/--
`FullSOAssignment.updateFunctionAssignment` TODO

Predicate logic:

  def FullSOAssignment.updateFunctionAssignment
      {S : Signature} {Variable : Type}
      {RelationVariable FunctionVariable : Nat → Type}
      [∀ arity, DecidableEq (FunctionVariable arity)]
      {arity : Nat} {M : FullModel S}
      (assignment : FullSOAssignment M Variable RelationVariable FunctionVariable)
      (targetVariable : FunctionVariable arity)
      (function_ : (Fin arity → M.Domain) → M.Domain) :
      FullSOAssignment M Variable RelationVariable FunctionVariable where
    elementAssignment

Predicate logic (unfolded):

  def FullSOAssignment.updateFunctionAssignment
      {S : Signature} {Variable : Type}
      {RelationVariable FunctionVariable : Nat → Type}
      [∀ arity, DecidableEq (FunctionVariable arity)]
      {arity : Nat} {M : FullModel S}
      (assignment : FullSOAssignment M Variable RelationVariable FunctionVariable)
      (targetVariable : FunctionVariable arity)
      (function_ : (Fin arity → M.Domain) → M.Domain) :
      FullSOAssignment M Variable RelationVariable FunctionVariable where
    elementAssignment (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def FullSOAssignment.updateFunctionAssignment
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    [∀ arity, DecidableEq (FunctionVariable arity)]
    {arity : Nat} {M : FullModel S}
    (assignment : FullSOAssignment M Variable RelationVariable FunctionVariable)
    (targetVariable : FunctionVariable arity)
    (function_ : (Fin arity → M.Domain) → M.Domain) :
    FullSOAssignment M Variable RelationVariable FunctionVariable where
  elementAssignment
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
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
