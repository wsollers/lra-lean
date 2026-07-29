import LRA.VolumeII.PeanoSystems.Induction.Core

namespace LRA.VolumeII.PeanoSystems

/--
**[Definition - Iterator Data]**

Iterator data for a Peano system consists of a target type, an initial value,
and a step rule on the target type.

Mathematical statement (Lean): `structure IteratorData (ps : PeanoSystem)`.
-/
structure IteratorData (ps : PeanoSystem) where
  Target : Type
  InitialValue : Target
  StepRule : Target -> Target

abbrev IteratorDataOnPeanoSystem (ps : PeanoSystem) := IteratorData ps

/--
**[Definition - Iterator Function Clauses]**

A function satisfies the iterator clauses exactly when it sends the
distinguished element to the initial value and sends successors according to the
step rule.

Mathematical statement (Lean): `def IteratorFunctionClauses (ps : PeanoSystem) (target : Type) (initial_value : target) (step_rule : target -> target) (iterator_function : ps.carrier -> target) : Prop`.
-/
def IteratorFunctionClauses
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target -> target)
    (iterator_function : ps.carrier -> target) : Prop :=
  iterator_function ps.one = initial_value /\
    forall element : ps.carrier,
      iterator_function (ps.successor element) =
        step_rule (iterator_function element)

/--
**[Definition - Iterator Relation]**

An iterator relation contains the initial pair and is closed under the iterator
step.

Mathematical statement (Lean): `def IteratorRelation (ps : PeanoSystem) (data : IteratorData ps) (relation : ps.carrier -> data.target -> Prop) : Prop`.
-/
def IteratorRelation
    (ps : PeanoSystem)
    (data : IteratorData ps)
    (relation : ps.carrier -> data.Target -> Prop) : Prop :=
  relation ps.one data.InitialValue /\
    forall element : ps.carrier,
      forall value : data.Target,
        relation element value ->
        relation (ps.successor element) (data.StepRule value)

/--
**[Definition - Minimal Iterator Relation]**

The minimal iterator relation contains exactly the pairs forced by every
iterator relation.

Mathematical statement (Lean): `def MinimalIteratorRelation (ps : PeanoSystem) (data : IteratorData ps) (element : ps.carrier) (value : data.target) : Prop`.
-/
def MinimalIteratorRelation
    (ps : PeanoSystem)
    (data : IteratorData ps)
    (element : ps.carrier)
    (value : data.Target) : Prop :=
  forall relation : ps.carrier -> data.Target -> Prop,
    IteratorRelation ps data relation ->
    relation element value

/--
**[Theorem - The Minimal Iterator Relation Is an Iterator Relation]**

The minimal iterator relation contains the initial pair and is closed under the
iterator step.

Mathematical statement (Lean): `theorem MinimalIteratorRelationIsIteratorRelation (ps : PeanoSystem) (data : IteratorData ps) : IteratorRelation ps data (MinimalIteratorRelation ps data)`.
-/
theorem MinimalIteratorRelationIsIteratorRelation
    (ps : PeanoSystem)
    (data : IteratorData ps) :
    IteratorRelation ps data
      (MinimalIteratorRelation ps data) := by
  sorry

theorem IteratorRelationConsistency
    (ps : PeanoSystem)
    (data : IteratorData ps) :
    IteratorRelation ps data (MinimalIteratorRelation ps data) := by
  sorry

/--
**[Theorem - Completeness of the Minimal Iterator Relation]**

Every stage has at least one value in the minimal iterator relation.

Mathematical statement (Lean): `theorem MinimalIteratorRelationComplete (ps : PeanoSystem) (data : IteratorData ps) : forall element : ps.carrier, exists value : data.target, MinimalIteratorRelation ps data element value`.
-/
theorem MinimalIteratorRelationComplete
    (ps : PeanoSystem)
    (data : IteratorData ps) :
    forall element : ps.carrier,
      exists value : data.Target,
        MinimalIteratorRelation ps data element value := by
  sorry

/--
**[Theorem - Determinism of the Minimal Iterator Relation]**

For each element of the Peano system, the minimal iterator relation forces at
most one value.

Mathematical statement (Lean): `theorem MinimalIteratorRelationDeterministic (ps : PeanoSystem) (data : IteratorData ps) : forall element : ps.carrier, forall first_value second_value : data.target, MinimalIteratorRelation ps data element first_value -> MinimalIteratorRelation ps data element second_value -> first_value = second_value`.
-/
theorem MinimalIteratorRelationDeterministic
    (ps : PeanoSystem)
    (data : IteratorData ps) :
    forall element : ps.carrier,
      forall first_value second_value : data.Target,
        MinimalIteratorRelation ps data element first_value ->
        MinimalIteratorRelation ps data element second_value ->
        first_value = second_value := by
  sorry

theorem ForcedValuesAreUnique (ps : PeanoSystem) (data : IteratorData ps) : True := by
  sorry

/--
**[Theorem - Existence of an Iterator Function]**

For every target type, initial value, and step rule, there exists an iterator
function satisfying the iterator clauses.

Mathematical statement (Lean): `theorem ExistenceOfIteratorFunction (ps : PeanoSystem) (target : Type) (initial_value : target) (step_rule : target -> target) : exists iterator_function : ps.carrier -> target, IteratorFunctionClauses ps target initial_value step_rule iterator_function`.
-/
theorem ExistenceOfIteratorFunction
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target -> target) :
    exists iterator_function : ps.carrier -> target,
      IteratorFunctionClauses
        ps
        target
        initial_value
        step_rule
        iterator_function := by
  sorry

/--
**[Theorem - Uniqueness of Iterator Functions]**

Any two iterator functions satisfying the same iterator clauses are equal.

Mathematical statement (Lean): `theorem UniquenessOfIteratorFunctions (ps : PeanoSystem) (target : Type) (initial_value : target) (step_rule : target -> target) (first_iterator second_iterator : ps.carrier -> target) : IteratorFunctionClauses ps target initial_value step_rule first_iterator -> IteratorFunctionClauses ps target initial_value step_rule second_iterator -> first_iterator = second_iterator`.
-/
theorem UniquenessOfIteratorFunctions
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target -> target)
    (first_iterator second_iterator : ps.carrier -> target) :
    IteratorFunctionClauses ps target initial_value step_rule first_iterator ->
      IteratorFunctionClauses ps target initial_value step_rule second_iterator ->
      first_iterator = second_iterator := by
  sorry

/--
**[Definition - Iterator-Generated Function]**

The iterator-generated function determined by a target type, an initial value,
and a step rule.

Mathematical statement (Lean): `noncomputable def IteratorGeneratedFunction (ps : PeanoSystem) (target : Type) (initial_value : target) (step_rule : target -> target) : ps.carrier -> target`.
-/
noncomputable def IteratorGeneratedFunction
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target -> target) :
    ps.carrier -> target :=
  Classical.choose
    (ExistenceOfIteratorFunction
      ps
      target
      initial_value
      step_rule)

/--
**[Theorem - Iterator Base Clause]**

The iterator-generated function sends the distinguished element to the initial
value.

Mathematical statement (Lean): `theorem IteratorBaseValue (ps : PeanoSystem) (target : Type) (initial_value : target) (step_rule : target -> target) : IteratorGeneratedFunction ps target initial_value step_rule ps.one = initial_value`.
-/
theorem IteratorBaseValue
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target -> target) :
    IteratorGeneratedFunction ps target initial_value step_rule ps.one = initial_value := by
  sorry

/--
**[Theorem - Iterator Successor Clause]**

The iterator-generated function sends successors according to the step rule.

Mathematical statement (Lean): `theorem IteratorSuccessorStep (ps : PeanoSystem) (target : Type) (initial_value : target) (step_rule : target -> target) (element : ps.carrier) : IteratorGeneratedFunction ps target initial_value step_rule (ps.successor element) = step_rule (IteratorGeneratedFunction ps target initial_value step_rule element)`.
-/
theorem IteratorSuccessorStep
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target -> target)
    (element : ps.carrier) :
    IteratorGeneratedFunction ps target initial_value step_rule (ps.successor element) =
      step_rule (IteratorGeneratedFunction ps target initial_value step_rule element) := by
  sorry

noncomputable def IterationOfASelfMap
    (ps : PeanoSystem)
    (initial_value : ps.carrier)
    (step_rule : ps.carrier -> ps.carrier) : ps.carrier -> ps.carrier :=
  IteratorGeneratedFunction ps ps.carrier initial_value step_rule

/--
**[Theorem - Peano Iterator Theorem]**

For every target type, initial value, and step rule, there exists an iterator
function satisfying the iterator clauses, and any other such function is equal
to it.

Mathematical statement (Lean): `theorem PeanoIteratorTheorem (ps : PeanoSystem) (target : Type) (initial_value : target) (step_rule : target -> target) : exists iterator_function : ps.carrier -> target, IteratorFunctionClauses ps target initial_value step_rule iterator_function /\ forall other_iterator : ps.carrier -> target, IteratorFunctionClauses ps target initial_value step_rule other_iterator -> other_iterator = iterator_function`.
-/
theorem PeanoIteratorTheorem
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target -> target) :
    exists iterator_function : ps.carrier -> target,
      IteratorFunctionClauses
        ps
        target
        initial_value
        step_rule
        iterator_function /\
      forall other_iterator : ps.carrier -> target,
        IteratorFunctionClauses
          ps
          target
          initial_value
          step_rule
          other_iterator ->
        other_iterator = iterator_function := by
  sorry

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

def StageDependentStepRule (_ps : PeanoSystem) (_target : Type) : Prop := True

def GeneralRecursiveFunction (_ps : PeanoSystem) (_target : Type) : Prop := True

theorem UniquenessOfGeneralRecursiveFunctions (ps : PeanoSystem) : True := by
  sorry

theorem GeneralRecursionByStateEncoding (ps : PeanoSystem) : True := by
  sorry

theorem GeneralRecursionTheoremForPeanoSystem (ps : PeanoSystem) : True := by
  sorry

theorem UniquenessOfPeanoSystemsUpToIsomorphism
    (first second : PeanoSystem) : True := by
  sorry

end LRA.VolumeII.PeanoSystems
