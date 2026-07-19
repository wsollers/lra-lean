-- LRA/VolumeII/PeanoSystems/ParameterizedIteration.lean
-- Parameterized wrapper over the proved Peano iterator architecture.

import LRA.VolumeII.PeanoSystems.Recursion

namespace LRA
namespace VolumeII
namespace PeanoSystems

/-!
Volume II label: parameterized-peano-iterator-theorem
Lean module: LRA.VolumeII.PeanoSystems.ParameterizedIteration
Blueprint label: parameterized-peano-iterator-theorem
Verification status: statement-accepted-proof-pending

This module does not introduce a second recursion construction. It packages the
existing iterator pointwise in a parameter so binary and higher operations are
obtained as functions of the correct arity.
-/

/--
**[Definition — Parameterized Iterator Clauses]**
-/
def satisfies_parameterized_iterator_clauses
    (peano_system : PeanoSystem)
    (Parameter Target : Type)
    (initial_value : Parameter → Target)
    (step_rule : Parameter → Target → Target)
    (iterator_function : Parameter → peano_system.carrier → Target) : Prop :=
  (∀ parameter_value : Parameter,
      iterator_function parameter_value peano_system.one =
        initial_value parameter_value) ∧
  (∀ parameter_value : Parameter,
    ∀ element : peano_system.carrier,
      iterator_function
          parameter_value
          (peano_system.successor element) =
        step_rule
          parameter_value
          (iterator_function parameter_value element))

/--
**[Definition — Parameterized Peano Iterator]**

For each parameter value, reuse the unique iterator supplied by the existing
Peano recursion development.
-/
noncomputable def parameterized_iter
    (peano_system : PeanoSystem)
    (Parameter Target : Type)
    (initial_value : Parameter → Target)
    (step_rule : Parameter → Target → Target) :
    Parameter → peano_system.carrier → Target :=
  fun parameter_value =>
    iter
      peano_system
      Target
      (initial_value parameter_value)
      (step_rule parameter_value)

/--
**[Lemma — Parameterized Iterator Base Clause]**
-/
lemma parameterized_iter_base
    (peano_system : PeanoSystem)
    (Parameter Target : Type)
    (initial_value : Parameter → Target)
    (step_rule : Parameter → Target → Target)
    (parameter_value : Parameter) :
    parameterized_iter
        peano_system Parameter Target initial_value step_rule
        parameter_value peano_system.one =
      initial_value parameter_value := by
  sorry

/--
**[Lemma — Parameterized Iterator Successor Clause]**
-/
lemma parameterized_iter_step
    (peano_system : PeanoSystem)
    (Parameter Target : Type)
    (initial_value : Parameter → Target)
    (step_rule : Parameter → Target → Target)
    (parameter_value : Parameter)
    (element : peano_system.carrier) :
    parameterized_iter
        peano_system Parameter Target initial_value step_rule
        parameter_value
        (peano_system.successor element) =
      step_rule parameter_value
        (parameterized_iter
          peano_system Parameter Target initial_value step_rule
          parameter_value element) := by
  sorry

/--
**[Theorem — Parameterized Peano Iterator Theorem]**

There is exactly one parameterized function satisfying the base and successor
clauses.
-/
theorem parameterized_peano_iterator_theorem
    (peano_system : PeanoSystem)
    (Parameter Target : Type)
    (initial_value : Parameter → Target)
    (step_rule : Parameter → Target → Target) :
    ∃ iterator_function : Parameter → peano_system.carrier → Target,
      satisfies_parameterized_iterator_clauses
        peano_system Parameter Target
        initial_value step_rule iterator_function ∧
      ∀ other_iterator : Parameter → peano_system.carrier → Target,
        satisfies_parameterized_iterator_clauses
          peano_system Parameter Target
          initial_value step_rule other_iterator →
        ∀ parameter_value element,
          other_iterator parameter_value element =
            iterator_function parameter_value element := by
  sorry

/--
**[Corollary — Recursive Binary Operation Exists Uniquely]**

When the parameter and target are the Peano carrier, parameterized iteration
constructs a unique binary operation.
-/
theorem recursive_binary_operation_exists_uniquely
    (peano_system : PeanoSystem)
    (initial_value : peano_system.carrier → peano_system.carrier)
    (step_rule :
      peano_system.carrier →
      peano_system.carrier →
      peano_system.carrier) :
    ∃ operation :
        peano_system.carrier →
        peano_system.carrier →
        peano_system.carrier,
      (∀ parameter_value,
        operation parameter_value peano_system.one =
          initial_value parameter_value) ∧
      (∀ parameter_value element,
        operation parameter_value
            (peano_system.successor element) =
          step_rule parameter_value
            (operation parameter_value element)) ∧
      (∀ other_operation,
        (∀ parameter_value,
          other_operation parameter_value peano_system.one =
            initial_value parameter_value) →
        (∀ parameter_value element,
          other_operation parameter_value
              (peano_system.successor element) =
            step_rule parameter_value
              (other_operation parameter_value element)) →
        ∀ parameter_value element,
          other_operation parameter_value element =
            operation parameter_value element) := by
  sorry

end PeanoSystems
end VolumeII
end LRA
