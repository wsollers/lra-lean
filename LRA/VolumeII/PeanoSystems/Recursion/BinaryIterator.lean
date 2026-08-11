import LRA.VolumeII.PeanoSystems.Recursion.Iterator

namespace LRA.VolumeII.PeanoSystems

universe u v w

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


/--
`BinaryIteratorOperationClauses` defines the displayed object for binary iterator operation clauses.

Logical form:

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
**[Theorem - Existence of a Binary Iterator Operation]**

A parameterized iterator specification determines at least one binary
operation.

Mathematical statement (Lean): `theorem ExistenceOfBinaryIteratorOperation`.


Logical form:

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
**[Corollary - Uniqueness of Binary Iterator Operations]**

For each fixed parameter, a binary operation satisfying a parameterized
iterator specification is unique.

Mathematical statement (Lean): `theorem UniquenessOfBinaryIteratorOperations`.


Logical form:

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
**[Theorem - Binary Iterator Operation Well-Definedness]**

A parameterized iterator specification determines exactly one binary operation.

Mathematical statement (Lean): `theorem BinaryIteratorOperationWellDefined`.


Logical form:

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

end LRA.VolumeII.PeanoSystems
