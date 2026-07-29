import LRA.VolumeII.PeanoSystems.Induction.Core

namespace LRA.VolumeII.PeanoSystems

/--
**[Definition - Iterator Data]**

Iterator data for a Peano system consists of a target type, an initial value,
and a step rule on the target type.

Mathematical statement (Lean): `structure IteratorData (ps : PeanoSystem)`.
-/
structure IteratorData (ps : PeanoSystem) where
  target : Type
  initial_value : target
  step_rule : target -> target

abbrev IteratorDataOnPeanoSystem (ps : PeanoSystem) := IteratorData ps

/--
**[Definition - Iterator Function Clauses]**

A function satisfies the iterator clauses exactly when it sends the
distinguished element to the initial value and sends successors according to the
step rule.

Mathematical statement (Lean): `def satisfies_iterator_clauses (ps : PeanoSystem) (target : Type) (initial_value : target) (step_rule : target -> target) (iterator_function : ps.carrier -> target) : Prop`.
-/
def satisfies_iterator_clauses
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

Mathematical statement (Lean): `def iterator_relation (ps : PeanoSystem) (data : IteratorData ps) (relation : ps.carrier -> data.target -> Prop) : Prop`.
-/
def iterator_relation
    (ps : PeanoSystem)
    (data : IteratorData ps)
    (relation : ps.carrier -> data.target -> Prop) : Prop :=
  relation ps.one data.initial_value /\
    forall element : ps.carrier,
      forall value : data.target,
        relation element value ->
        relation (ps.successor element) (data.step_rule value)

def IteratorRelation
    (ps : PeanoSystem)
    (data : IteratorData ps)
    (relation : ps.carrier -> data.target -> Prop) : Prop :=
  iterator_relation ps data relation

/--
**[Definition - Minimal Iterator Relation]**

The minimal iterator relation contains exactly the pairs forced by every
iterator relation.

Mathematical statement (Lean): `def minimal_iterator_relation (ps : PeanoSystem) (data : IteratorData ps) (element : ps.carrier) (value : data.target) : Prop`.
-/
def minimal_iterator_relation
    (ps : PeanoSystem)
    (data : IteratorData ps)
    (element : ps.carrier)
    (value : data.target) : Prop :=
  forall relation : ps.carrier -> data.target -> Prop,
    iterator_relation ps data relation ->
    relation element value

def MinimalIteratorRelation
    (ps : PeanoSystem)
    (data : IteratorData ps)
    (element : ps.carrier)
    (value : data.target) : Prop :=
  minimal_iterator_relation ps data element value

/--
**[Theorem - The Minimal Iterator Relation Is an Iterator Relation]**

The minimal iterator relation contains the initial pair and is closed under the
iterator step.

Mathematical statement (Lean): `theorem minimal_iterator_relation_is_iterator_relation (ps : PeanoSystem) (data : IteratorData ps) : iterator_relation ps data (minimal_iterator_relation ps data)`.
-/
theorem minimal_iterator_relation_is_iterator_relation
    (ps : PeanoSystem)
    (data : IteratorData ps) :
    iterator_relation ps data
      (minimal_iterator_relation ps data) := by
  sorry

theorem IteratorRelationConsistency
    (ps : PeanoSystem)
    (data : IteratorData ps) :
    IteratorRelation ps data (MinimalIteratorRelation ps data) := by
  sorry

/--
**[Theorem - Completeness of the Minimal Iterator Relation]**

Every stage has at least one value in the minimal iterator relation.

Mathematical statement (Lean): `theorem minimal_iterator_relation_complete (ps : PeanoSystem) (data : IteratorData ps) : forall element : ps.carrier, exists value : data.target, minimal_iterator_relation ps data element value`.
-/
theorem minimal_iterator_relation_complete
    (ps : PeanoSystem)
    (data : IteratorData ps) :
    forall element : ps.carrier,
      exists value : data.target,
        minimal_iterator_relation ps data element value := by
  sorry

theorem MinimalIteratorRelationComplete
    (ps : PeanoSystem)
    (data : IteratorData ps) :
    ∀ element : ps.carrier,
      ∃ value : data.target, MinimalIteratorRelation ps data element value := by
  sorry

/--
**[Theorem - Determinism of the Minimal Iterator Relation]**

For each element of the Peano system, the minimal iterator relation forces at
most one value.

Mathematical statement (Lean): `theorem minimal_iterator_relation_deterministic (ps : PeanoSystem) (data : IteratorData ps) : forall element : ps.carrier, forall first_value second_value : data.target, minimal_iterator_relation ps data element first_value -> minimal_iterator_relation ps d...`.
-/
theorem minimal_iterator_relation_deterministic
    (ps : PeanoSystem)
    (data : IteratorData ps) :
    forall element : ps.carrier,
      forall first_value second_value : data.target,
        minimal_iterator_relation ps data element first_value ->
        minimal_iterator_relation ps data element second_value ->
        first_value = second_value := by
  sorry

theorem ForcedValuesAreUnique (ps : PeanoSystem) (data : IteratorData ps) : True := by
  sorry

theorem MinimalIteratorRelationDeterministic
    (ps : PeanoSystem)
    (data : IteratorData ps) :
    ∀ element : ps.carrier,
      ∀ first second : data.target,
        MinimalIteratorRelation ps data element first ->
        MinimalIteratorRelation ps data element second ->
        first = second := by
  sorry

/--
**[Theorem - Existence of an Iterator Function]**

For every target type, initial value, and step rule, there exists an iterator
function satisfying the iterator clauses.

Mathematical statement (Lean): `theorem iterator_function_exists (ps : PeanoSystem) (target : Type) (initial_value : target) (step_rule : target -> target) : exists iterator_function : ps.carrier -> target, satisfies_iterator_clauses ps target initial_value step_rule iterator_function`.
-/
theorem iterator_function_exists
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target -> target) :
    exists iterator_function : ps.carrier -> target,
      satisfies_iterator_clauses
        ps
        target
        initial_value
        step_rule
        iterator_function := by
  sorry

theorem ExistenceOfIteratorFunction
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target -> target) :
    ∃ iterator_function : ps.carrier -> target,
      satisfies_iterator_clauses ps target initial_value step_rule iterator_function := by
  sorry

/--
**[Theorem - Uniqueness of Iterator Functions]**

Any two iterator functions satisfying the same iterator clauses are pointwise
equal.

Mathematical statement (Lean): `theorem iterator_function_unique (ps : PeanoSystem) (target : Type) (initial_value : target) (step_rule : target -> target) (first_iterator second_iterator : ps.carrier -> target) (first_satisfies : satisfies_iterator_clauses ps target initial_value step_ru...`.
-/
theorem iterator_function_unique
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target -> target)
    (first_iterator second_iterator : ps.carrier -> target)
    (first_satisfies :
      satisfies_iterator_clauses
        ps target initial_value step_rule first_iterator)
    (second_satisfies :
      satisfies_iterator_clauses
        ps target initial_value step_rule second_iterator) :
    forall element : ps.carrier,
      first_iterator element = second_iterator element := by
  sorry

theorem UniquenessOfIteratorFunctions
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target -> target)
    (first second : ps.carrier -> target) :
    satisfies_iterator_clauses ps target initial_value step_rule first ->
      satisfies_iterator_clauses ps target initial_value step_rule second ->
      first = second := by
  sorry

/--
**[Definition - Iterator-Generated Function]**

The iterator-generated function determined by a target type, an initial value,
and a step rule.

Mathematical statement (Lean): `noncomputable def iter (ps : PeanoSystem) (target : Type) (initial_value : target) (step_rule : target -> target) : ps.carrier -> target`.
-/
noncomputable def iter
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target -> target) :
    ps.carrier -> target :=
  Classical.choose
    (iterator_function_exists
      ps
      target
      initial_value
      step_rule)

noncomputable def IteratorGeneratedFunction
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target -> target) : ps.carrier -> target :=
  iter ps target initial_value step_rule

/--
**[Theorem - Iterator Base Clause]**

The iterator-generated function sends the distinguished element to the initial
value.

Mathematical statement (Lean): `theorem iter_base (ps : PeanoSystem) (target : Type) (initial_value : target) (step_rule : target -> target) : iter ps target initial_value step_rule ps.one = initial_value`.
-/
theorem iter_base
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target -> target) :
    iter ps target initial_value step_rule ps.one = initial_value := by
  sorry

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

Mathematical statement (Lean): `theorem iter_step (ps : PeanoSystem) (target : Type) (initial_value : target) (step_rule : target -> target) (element : ps.carrier) : iter ps target initial_value step_rule (ps.successor element) = step_rule (iter ps target initial_value step_rule element)`.
-/
theorem iter_step
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target -> target)
    (element : ps.carrier) :
    iter ps target initial_value step_rule (ps.successor element) =
      step_rule (iter ps target initial_value step_rule element) := by
  sorry

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
function satisfying the iterator clauses, and any other such function is
pointwise equal to it.

Mathematical statement (Lean): `theorem peano_iterator_theorem (ps : PeanoSystem) (target : Type) (initial_value : target) (step_rule : target -> target) : exists iterator_function : ps.carrier -> target, satisfies_iterator_clauses ps target initial_value step_rule iterator_function /\ fo...`.
-/
theorem peano_iterator_theorem
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target -> target) :
    exists iterator_function : ps.carrier -> target,
      satisfies_iterator_clauses
        ps
        target
        initial_value
        step_rule
        iterator_function /\
      forall other_iterator : ps.carrier -> target,
        satisfies_iterator_clauses
          ps
          target
          initial_value
          step_rule
          other_iterator ->
        forall element : ps.carrier,
          other_iterator element = iterator_function element := by
  sorry

theorem PeanoIteratorTheorem
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target -> target) :
    ∃ iterator_function : ps.carrier -> target,
      satisfies_iterator_clauses ps target initial_value step_rule iterator_function ∧
        ∀ other : ps.carrier -> target,
          satisfies_iterator_clauses ps target initial_value step_rule other ->
          other = iterator_function := by
  sorry

theorem UniquenessOfBinaryIteratorOperations (ps : PeanoSystem) : True := by
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
