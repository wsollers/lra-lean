import LRA.VolumeII.PeanoSystems.Recursion.Iterator

namespace LRA.VolumeII.PeanoSystems

def BinaryIteratorOperationClauses
    (ps : PeanoSystem)
    (parameterType target : Type)
    (initialValueForParameter : parameterType -> target)
    (stepRuleForParameter : parameterType -> target -> target)
    (operation : parameterType -> ps.carrier -> target) : Prop :=
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
-/
theorem ExistenceOfBinaryIteratorOperation
    (ps : PeanoSystem)
    (parameterType target : Type)
    (initialValueForParameter : parameterType -> target)
    (stepRuleForParameter : parameterType -> target -> target) :
    exists operation : parameterType -> ps.carrier -> target,
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
-/
theorem UniquenessOfBinaryIteratorOperations
    (ps : PeanoSystem)
    (parameterType target : Type)
    (initialValueForParameter : parameterType -> target)
    (stepRuleForParameter : parameterType -> target -> target)
    (firstOperation secondOperation :
      parameterType -> ps.carrier -> target) :
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
-/
theorem BinaryIteratorOperationWellDefined
    (ps : PeanoSystem)
    (parameterType target : Type)
    (initialValueForParameter : parameterType -> target)
    (stepRuleForParameter : parameterType -> target -> target) :
    exists operation : parameterType -> ps.carrier -> target,
      BinaryIteratorOperationClauses
        ps
        parameterType
        target
        initialValueForParameter
        stepRuleForParameter
        operation /\
      forall otherOperation : parameterType -> ps.carrier -> target,
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
