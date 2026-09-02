import LRA.NumberSystems.PeanoSystem.Recursion.Iterator

namespace LRA.NumberSystems.PeanoSystem.Recursion

open LRA.NumberSystems.PeanoSystem

universe u v w

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`BinaryIteratorOperationClauses` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (parameterType target : Type w) (initialValueForParameter : parameterType → target) (stepRuleForParameter : parameterType → target → target) (operation : parameterType → Element → target) (parameterValue : parameterType), LRA.NumberSystems.PeanoSystem.Recursion.IteratorFunctionClauses ps target (initialValueForParameter parameterValue) (stepRuleForParameter parameterValue) (operation parameterValue)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (parameterType target : Type w) (initialValueForParameter : parameterType → target) (stepRuleForParameter : parameterType → target → target) (operation : parameterType → Element → target) (parameterValue : parameterType), (operation parameterValue ps.1 = initialValueForParameter parameterValue ∧ ∀ (element : Element), operation parameterValue (ps.2 element) = stepRuleForParameter parameterValue (operation parameterValue element))

Logical form (Lean):

```lean
def BinaryIteratorOperationClauses
    (ps : PeanoSystem Element SetObject)
    (parameterType target : Type w)
    (initialValueForParameter : parameterType -> target)
    (stepRuleForParameter : parameterType -> target -> target)
    (operation : parameterType -> Element -> target) : Prop :=
  forall parameterValue : parameterType,
    IteratorFunctionClauses
      ps
      target
      (initialValueForParameter parameterValue)
      (stepRuleForParameter parameterValue)
      (operation parameterValue)
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
def BinaryIteratorOperationClauses
    (ps : PeanoSystem Element SetObject)
    (parameterType target : Type w)
    (initialValueForParameter : parameterType -> target)
    (stepRuleForParameter : parameterType -> target -> target)
    (operation : parameterType -> Element -> target) : Prop :=
  forall parameterValue : parameterType,
    IteratorFunctionClauses
      ps
      target
      (initialValueForParameter parameterValue)
      (stepRuleForParameter parameterValue)
      (operation parameterValue)

/--
`ExistenceOfBinaryIteratorOperation` TODO

Predicate logic:

  exists operation : parameterType -> Element -> target, BinaryIteratorOperationClauses ps parameterType target initialValueForParameter stepRuleForParameter operation

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (parameterType target : Type w) (initialValueForParameter : parameterType → target) (stepRuleForParameter : parameterType → target → target), Exists fun operation => ∀ (parameterValue : parameterType), (operation parameterValue ps.1 = initialValueForParameter parameterValue ∧ ∀ (element : Element), operation parameterValue (ps.2 element) = stepRuleForParameter parameterValue (operation parameterValue element))

Logical form (Lean):

```lean
theorem ExistenceOfBinaryIteratorOperation
    (ps : PeanoSystem Element SetObject)
    (parameterType target : Type w)
    (initialValueForParameter : parameterType -> target)
    (stepRuleForParameter : parameterType -> target -> target) :
    exists operation : parameterType -> Element -> target,
      BinaryIteratorOperationClauses
        ps
        parameterType
        target
        initialValueForParameter
        stepRuleForParameter
        operation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem ExistenceOfBinaryIteratorOperation
    (ps : PeanoSystem Element SetObject)
    (parameterType target : Type w)
    (initialValueForParameter : parameterType -> target)
    (stepRuleForParameter : parameterType -> target -> target) :
    exists operation : parameterType -> Element -> target,
      BinaryIteratorOperationClauses
        ps
        parameterType
        target
        initialValueForParameter
        stepRuleForParameter
        operation := by
  sorry
/--
`UniquenessOfBinaryIteratorOperations` TODO

Predicate logic:

  BinaryIteratorOperationClauses ps parameterType target initialValueForParameter stepRuleForParameter firstOperation -> BinaryIteratorOperationClauses ps parameterType target initialValueForParameter stepRuleForParameter secondOperation -> firstOperation = secondOperation

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (parameterType target : Type w) (initialValueForParameter : parameterType → target) (stepRuleForParameter : parameterType → target → target) (firstOperation secondOperation : parameterType → Element → target), (∀ (parameterValue : parameterType), (firstOperation parameterValue ps.1 = initialValueForParameter parameterValue ∧ ∀ (element : Element), firstOperation parameterValue (ps.2 element) = stepRuleForParameter parameterValue (firstOperation parameterValue element)) ∧ ∀ (parameterValue : parameterType), (secondOperation parameterValue ps.1 = initialValueForParameter parameterValue ∧ ∀ (element : Element), secondOperation parameterValue (ps.2 element) = stepRuleForParameter parameterValue (secondOperation parameterValue element))) → firstOperation = secondOperation

Logical form (Lean):

```lean
theorem UniquenessOfBinaryIteratorOperations
    (ps : PeanoSystem Element SetObject)
    (parameterType target : Type w)
    (initialValueForParameter : parameterType -> target)
    (stepRuleForParameter : parameterType -> target -> target)
    (firstOperation secondOperation :
      parameterType -> Element -> target) :
    BinaryIteratorOperationClauses
      ps
      parameterType
      target
      initialValueForParameter
      stepRuleForParameter
      firstOperation ->
    BinaryIteratorOperationClauses
      ps
      parameterType
      target
      initialValueForParameter
      stepRuleForParameter
      secondOperation ->
    firstOperation = secondOperation
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
theorem UniquenessOfBinaryIteratorOperations
    (ps : PeanoSystem Element SetObject)
    (parameterType target : Type w)
    (initialValueForParameter : parameterType -> target)
    (stepRuleForParameter : parameterType -> target -> target)
    (firstOperation secondOperation :
      parameterType -> Element -> target) :
    BinaryIteratorOperationClauses
      ps
      parameterType
      target
      initialValueForParameter
      stepRuleForParameter
      firstOperation ->
    BinaryIteratorOperationClauses
      ps
      parameterType
      target
      initialValueForParameter
      stepRuleForParameter
      secondOperation ->
    firstOperation = secondOperation := by
  sorry
/--
`BinaryIteratorOperationWellDefined` TODO

Predicate logic:

  exists operation : parameterType -> Element -> target, BinaryIteratorOperationClauses ps parameterType target initialValueForParameter stepRuleForParameter operation ∧ forall otherOperation : parameterType -> Element -> target, BinaryIteratorOperationClauses ps parameterType target initialValueForParameter stepRuleForParameter otherOperation -> otherOperation = operation

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (parameterType target : Type w) (initialValueForParameter : parameterType → target) (stepRuleForParameter : parameterType → target → target), Exists fun operation => (∀ (parameterValue : parameterType), (operation parameterValue ps.1 = initialValueForParameter parameterValue ∧ ∀ (element : Element), operation parameterValue (ps.2 element) = stepRuleForParameter parameterValue (operation parameterValue element)) ∧ ∀ (otherOperation : parameterType → Element → target), (∀ (parameterValue : parameterType), (otherOperation parameterValue ps.1 = initialValueForParameter parameterValue ∧ ∀ (element : Element), otherOperation parameterValue (ps.2 element) = stepRuleForParameter parameterValue (otherOperation parameterValue element))) → otherOperation = operation)

Logical form (Lean):

```lean
theorem BinaryIteratorOperationWellDefined
    (ps : PeanoSystem Element SetObject)
    (parameterType target : Type w)
    (initialValueForParameter : parameterType -> target)
    (stepRuleForParameter : parameterType -> target -> target) :
    exists operation : parameterType -> Element -> target,
      BinaryIteratorOperationClauses
        ps
        parameterType
        target
        initialValueForParameter
        stepRuleForParameter
        operation /\
      forall otherOperation : parameterType -> Element -> target,
        BinaryIteratorOperationClauses
          ps
          parameterType
          target
          initialValueForParameter
          stepRuleForParameter
          otherOperation ->
        otherOperation = operation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem BinaryIteratorOperationWellDefined
    (ps : PeanoSystem Element SetObject)
    (parameterType target : Type w)
    (initialValueForParameter : parameterType -> target)
    (stepRuleForParameter : parameterType -> target -> target) :
    exists operation : parameterType -> Element -> target,
      BinaryIteratorOperationClauses
        ps
        parameterType
        target
        initialValueForParameter
        stepRuleForParameter
        operation /\
      forall otherOperation : parameterType -> Element -> target,
        BinaryIteratorOperationClauses
          ps
          parameterType
          target
          initialValueForParameter
          stepRuleForParameter
          otherOperation ->
        otherOperation = operation := by
  sorry
end LRA.NumberSystems.PeanoSystem.Recursion
