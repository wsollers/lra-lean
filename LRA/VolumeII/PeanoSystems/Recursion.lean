import LRA.VolumeII.PeanoSystems.Induction

namespace Peano

structure IteratorData (ps : PeanoSystem) where
  target : Type
  initial_value : target
  step_rule : target → target

def satisfies_iterator_clauses
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target → target)
    (iterator_function : ps.carrier → target) : Prop :=
  iterator_function ps.one = initial_value ∧
    ∀ element : ps.carrier,
      iterator_function (ps.successor element) =
        step_rule (iterator_function element)

def iterator_relation
    (ps : PeanoSystem)
    (data : IteratorData ps)
    (relation : ps.carrier → data.target → Prop) : Prop :=
  relation ps.one data.initial_value ∧
    ∀ element : ps.carrier,
      ∀ value : data.target,
        relation element value →
        relation (ps.successor element) (data.step_rule value)

def minimal_iterator_relation
    (ps : PeanoSystem)
    (data : IteratorData ps)
    (element : ps.carrier)
    (value : data.target) : Prop :=
  ∀ relation : ps.carrier → data.target → Prop,
    iterator_relation ps data relation →
    relation element value

theorem minimal_iterator_relation_is_iterator_relation
    (ps : PeanoSystem)
    (data : IteratorData ps) :
    iterator_relation ps data
      (minimal_iterator_relation ps data) := by
  constructor

  · intro relation relation_is_iterator
    exact relation_is_iterator.left

  · intro element value pair_is_forced relation relation_is_iterator
    exact
      relation_is_iterator.right
        element
        value
        (pair_is_forced relation relation_is_iterator)

theorem minimal_iterator_relation_complete
    (ps : PeanoSystem)
    (data : IteratorData ps) :
    ∀ element : ps.carrier,
      ∃ value : data.target,
        minimal_iterator_relation ps data element value := by
  apply induction_principle ps

  · exact
      ⟨data.initial_value,
        (minimal_iterator_relation_is_iterator_relation ps data).left⟩

  · intro element induction_hypothesis
    cases induction_hypothesis with
    | intro value value_is_forced =>
        exact
          ⟨data.step_rule value,
            (minimal_iterator_relation_is_iterator_relation ps data).right
              element
              value
              value_is_forced⟩

theorem minimal_iterator_relation_base_unique
    (ps : PeanoSystem)
    (data : IteratorData ps)
    (value : data.target)
    (value_is_forced :
      minimal_iterator_relation
        ps
        data
        ps.one
        value) :
    value = data.initial_value := by

  let base_unique_relation : ps.carrier → data.target → Prop :=
    fun element candidate_value =>
      element = ps.one →
        candidate_value = data.initial_value

  have base_unique_relation_is_iterator :
      iterator_relation ps data base_unique_relation := by
    constructor

    · intro one_equals_one
      rfl

    · intro element candidate_value relation_holds successor_equals_one
      exact
        False.elim
          ((ps.one_not_successor element) successor_equals_one)

  have value_satisfies_base_unique_relation :
      base_unique_relation ps.one value :=
    value_is_forced
      base_unique_relation
      base_unique_relation_is_iterator

  exact value_satisfies_base_unique_relation rfl

theorem forced_successor_values_are_unique
    (ps : PeanoSystem)
    (data : IteratorData ps)
    (element : ps.carrier)
    (current_value successor_value : data.target)
    (prior_stage_is_deterministic :
      ∀ first_value second_value : data.target,
        minimal_iterator_relation ps data element first_value →
        minimal_iterator_relation ps data element second_value →
        first_value = second_value)
    (current_value_is_forced :
      minimal_iterator_relation ps data element current_value)
    (successor_value_is_forced :
      minimal_iterator_relation ps data (ps.successor element) successor_value) :
    successor_value = data.step_rule current_value := by

  let successor_value_relation :
      ps.carrier → data.target → Prop :=
    fun candidate_element candidate_value =>
      minimal_iterator_relation ps data candidate_element candidate_value ∧
        (candidate_element = ps.successor element →
          candidate_value = data.step_rule current_value)

  have successor_value_relation_is_iterator :
      iterator_relation ps data successor_value_relation := by
    constructor

    · constructor

      · exact
          (minimal_iterator_relation_is_iterator_relation ps data).left

      · intro one_eq_successor_element
        exact
          False.elim
            ((ps.one_not_successor element)
              one_eq_successor_element.symm)

    · intro candidate_element candidate_value relation_holds
      constructor

      · exact
          (minimal_iterator_relation_is_iterator_relation ps data).right
            candidate_element
            candidate_value
            relation_holds.left

      · intro successor_candidate_eq_successor_element

        have candidate_eq_element :
            candidate_element = element :=
          ps.successor_injective
            candidate_element
            element
            successor_candidate_eq_successor_element

        have candidate_value_is_forced_at_element :
            minimal_iterator_relation ps data element candidate_value := by
          cases candidate_eq_element
          exact relation_holds.left

        have candidate_value_eq_current_value :
            candidate_value = current_value :=
          prior_stage_is_deterministic
            candidate_value
            current_value
            candidate_value_is_forced_at_element
            current_value_is_forced

        rw [candidate_value_eq_current_value]

  have successor_value_satisfies_relation :
      successor_value_relation (ps.successor element) successor_value :=
    successor_value_is_forced
      successor_value_relation
      successor_value_relation_is_iterator

  exact successor_value_satisfies_relation.right rfl

theorem minimal_iterator_relation_deterministic
    (ps : PeanoSystem)
    (data : IteratorData ps) :
    ∀ element : ps.carrier,
      ∀ first_value second_value : data.target,
        minimal_iterator_relation ps data element first_value →
        minimal_iterator_relation ps data element second_value →
        first_value = second_value := by
  apply induction_principle ps

  · intro first_value second_value first_value_is_forced second_value_is_forced

    have first_value_is_initial :
        first_value = data.initial_value :=
      minimal_iterator_relation_base_unique
        ps
        data
        first_value
        first_value_is_forced

    have second_value_is_initial :
        second_value = data.initial_value :=
      minimal_iterator_relation_base_unique
        ps
        data
        second_value
        second_value_is_forced

    exact Eq.trans first_value_is_initial second_value_is_initial.symm

  · intro element induction_hypothesis
    intro first_successor_value second_successor_value
    intro first_successor_value_is_forced second_successor_value_is_forced

    cases minimal_iterator_relation_complete ps data element with
    | intro current_value current_value_is_forced =>

        have first_successor_value_is_step :
            first_successor_value = data.step_rule current_value :=
          forced_successor_values_are_unique
            ps
            data
            element
            current_value
            first_successor_value
            induction_hypothesis
            current_value_is_forced
            first_successor_value_is_forced

        have second_successor_value_is_step :
            second_successor_value = data.step_rule current_value :=
          forced_successor_values_are_unique
            ps
            data
            element
            current_value
            second_successor_value
            induction_hypothesis
            current_value_is_forced
            second_successor_value_is_forced

        exact
          Eq.trans
            first_successor_value_is_step
            second_successor_value_is_step.symm

theorem iterator_function_exists
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target → target) :
    ∃ iterator_function : ps.carrier → target,
      satisfies_iterator_clauses
        ps
        target
        initial_value
        step_rule
        iterator_function := by

  let data : IteratorData ps :=
    { target := target,
      initial_value := initial_value,
      step_rule := step_rule }

  let iterator_function : ps.carrier → target :=
    fun element =>
      Classical.choose
        (minimal_iterator_relation_complete ps data element)

  refine ⟨iterator_function, ?_⟩
  constructor

  · have chosen_value_is_forced :
        minimal_iterator_relation ps data ps.one (iterator_function ps.one) :=
      Classical.choose_spec
        (minimal_iterator_relation_complete ps data ps.one)

    exact
      minimal_iterator_relation_base_unique
        ps
        data
        (iterator_function ps.one)
        chosen_value_is_forced

  · intro element

    have current_value_is_forced :
        minimal_iterator_relation ps data element (iterator_function element) :=
      Classical.choose_spec
        (minimal_iterator_relation_complete ps data element)

    have successor_value_is_forced :
        minimal_iterator_relation
          ps
          data
          (ps.successor element)
          (iterator_function (ps.successor element)) :=
      Classical.choose_spec
        (minimal_iterator_relation_complete ps data (ps.successor element))

    exact
      forced_successor_values_are_unique
        ps
        data
        element
        (iterator_function element)
        (iterator_function (ps.successor element))
        (minimal_iterator_relation_deterministic ps data element)
        current_value_is_forced
        successor_value_is_forced

theorem iterator_function_unique
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target → target)
    (first_iterator second_iterator : ps.carrier → target)
    (first_satisfies :
      satisfies_iterator_clauses
        ps target initial_value step_rule first_iterator)
    (second_satisfies :
      satisfies_iterator_clauses
        ps target initial_value step_rule second_iterator) :
    ∀ element : ps.carrier,
      first_iterator element = second_iterator element := by
  apply induction_principle ps

  · rw [first_satisfies.left, second_satisfies.left]

  · intro element induction_hypothesis
    rw [
      first_satisfies.right element,
      second_satisfies.right element,
      induction_hypothesis
    ]

noncomputable def iter
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target → target) :
    ps.carrier → target :=
  Classical.choose
    (iterator_function_exists
      ps
      target
      initial_value
      step_rule)

theorem iter_satisfies_iterator_clauses
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target → target) :
    satisfies_iterator_clauses
      ps
      target
      initial_value
      step_rule
      (iter ps target initial_value step_rule) :=
  Classical.choose_spec
    (iterator_function_exists
      ps
      target
      initial_value
      step_rule)

theorem iter_base
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target → target) :
    iter ps target initial_value step_rule ps.one = initial_value :=
  (iter_satisfies_iterator_clauses
    ps
    target
    initial_value
    step_rule).left

theorem iter_step
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target → target)
    (element : ps.carrier) :
    iter ps target initial_value step_rule (ps.successor element) =
      step_rule (iter ps target initial_value step_rule element) :=
  (iter_satisfies_iterator_clauses
    ps
    target
    initial_value
    step_rule).right element

theorem peano_iterator_theorem
    (ps : PeanoSystem)
    (target : Type)
    (initial_value : target)
    (step_rule : target → target) :
    ∃ iterator_function : ps.carrier → target,
      satisfies_iterator_clauses
        ps
        target
        initial_value
        step_rule
        iterator_function ∧
      ∀ other_iterator : ps.carrier → target,
        satisfies_iterator_clauses
          ps
          target
          initial_value
          step_rule
          other_iterator →
        ∀ element : ps.carrier,
          other_iterator element = iterator_function element := by
  refine
    ⟨iter ps target initial_value step_rule,
      iter_satisfies_iterator_clauses ps target initial_value step_rule,
      ?_⟩
  intro other_iterator other_iterator_satisfies_clauses element
  exact
    Eq.symm
      (iterator_function_unique
        ps
        target
        initial_value
        step_rule
        (iter ps target initial_value step_rule)
        other_iterator
        (iter_satisfies_iterator_clauses
          ps
          target
          initial_value
          step_rule)
        other_iterator_satisfies_clauses
        element)

end Peano
