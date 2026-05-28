-- LRA/VolumeII/PeanoSystems/Recursion.lean
--
-- Recursion and iterator machinery for abstract Peano systems.
-- No Mathlib.

import LRA.VolumeII.PeanoSystems.Induction

namespace Peano

/--
**[Definition — Iterator Data]**

Iterator data for a Peano system consists of a target type,
an initial value, and a step rule on the target type.

*Dependencies:* `PeanoSystem`

*Sources:*
  Feferman, *The Number Systems*, §3.4
  Mendelson, *Number Systems*, §2.2

*Notes cross-ref:* §1.2 [#definition-iterator-data](../notes/section_1_2_main.md#definition-iterator-data)
-/
structure IteratorData (ps : PeanoSystem) where
  target : Type
  initial_value : target
  step_rule : target → target

/--
**[Definition — Iterator Function Clauses]**

A function satisfies the iterator clauses exactly when it sends
the distinguished element to the initial value and sends successors
according to the step rule.

*Dependencies:* `PeanoSystem`

*Sources:*
  Feferman, *The Number Systems*, §3.4
  Mendelson, *Number Systems*, §2.2

*Notes cross-ref:* §1.2 [#definition-iterator-function-clauses](../notes/section_1_2_main.md#definition-iterator-function-clauses)
-/
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

/--
**[Definition — Iterator Relation]**

An iterator relation contains the initial pair and is closed under
the iterator step.

*Dependencies:* `IteratorData`

*Sources:*
  Feferman, *The Number Systems*, §3.4
  Mendelson, *Number Systems*, §2.2

*Notes cross-ref:* §1.2 [#definition-iterator-relation](../notes/section_1_2_main.md#definition-iterator-relation)
-/
def iterator_relation
    (ps : PeanoSystem)
    (data : IteratorData ps)
    (relation : ps.carrier → data.target → Prop) : Prop :=
  relation ps.one data.initial_value ∧
    ∀ element : ps.carrier,
      ∀ value : data.target,
        relation element value →
        relation (ps.successor element) (data.step_rule value)

/--
**[Definition — Minimal Iterator Relation]**

The minimal iterator relation contains exactly the pairs forced by
every iterator relation.

*Dependencies:* `iterator_relation`

*Sources:*
  Feferman, *The Number Systems*, §3.4
  Mendelson, *Number Systems*, §2.2

*Notes cross-ref:* §1.2 [#definition-minimal-iterator-relation](../notes/section_1_2_main.md#definition-minimal-iterator-relation)
-/
def minimal_iterator_relation
    (ps : PeanoSystem)
    (data : IteratorData ps)
    (element : ps.carrier)
    (value : data.target) : Prop :=
  ∀ relation : ps.carrier → data.target → Prop,
    iterator_relation ps data relation →
    relation element value

/--
**[Theorem — The Minimal Iterator Relation Is an Iterator Relation]**

The minimal iterator relation contains the initial pair and is closed
under the iterator step.

*Dependencies:* `iterator_relation`, `minimal_iterator_relation`

*Sources:*
  Feferman, *The Number Systems*, §3.4
  Mendelson, *Number Systems*, §2.2

*Notes cross-ref:* §1.2 [#theorem-minimal-iterator-relation-is-an-iterator-relation](../notes/section_1_2_main.md#theorem-minimal-iterator-relation-is-an-iterator-relation)
-/
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

/--
**[Theorem — Completeness of the Minimal Iterator Relation]**

Every stage has at least one value in the minimal iterator relation.

*Dependencies:* `minimal_iterator_relation_is_iterator_relation`,
`induction_principle`

*Sources:*
  Feferman, *The Number Systems*, §3.4
  Mendelson, *Number Systems*, §2.2

*Notes cross-ref:* §1.2 [#theorem-completeness-of-the-minimal-iterator-relation](../notes/section_1_2_main.md#theorem-completeness-of-the-minimal-iterator-relation)
-/
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

/--
**[Theorem — Base Value Is Unique in the Minimal Iterator Relation]**

If the minimal iterator relation relates the distinguished element
to a value, then that value must be the initial value.

*Dependencies:* `minimal_iterator_relation`, `iterator_relation`,
`PeanoSystem.one_not_successor`

*Sources:*
  Feferman, *The Number Systems*, §3.4
  Mendelson, *Number Systems*, §2.2

*Notes cross-ref:* §1.2 [#theorem-base-value-is-unique-in-the-minimal-iterator-relation](../notes/section_1_2_main.md#theorem-base-value-is-unique-in-the-minimal-iterator-relation)
-/
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


/--
**[Theorem — Forced Successor Values Are Unique]**

Assume the minimal iterator relation is already deterministic at an
element. If a value is forced at that element, and another value is
forced at its successor, then the successor-stage value is the step
of the element-stage value.

This is the corrected bridge theorem. Closure is used only because
`iterator_relation` includes closure as part of its definition.

*Dependencies:* `minimal_iterator_relation`, `iterator_relation`,
`minimal_iterator_relation_is_iterator_relation`,
`PeanoSystem.successor_injective`, `PeanoSystem.one_not_successor`

*Sources:*
  Feferman, *The Number Systems*, §3.4
  Mendelson, *Number Systems*, §2.2

*Notes cross-ref:* §1.2 [#theorem-forced-successor-values-are-unique](../notes/section_1_2_main.md#theorem-forced-successor-values-are-unique)
-/
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

/--
**[Theorem — Determinism of the Minimal Iterator Relation]**

For each element of the Peano system, the minimal iterator relation
forces at most one value.

*Dependencies:* `minimal_iterator_relation_base_unique`,
`forced_successor_values_are_unique`, `minimal_iterator_relation_complete`,
`induction_principle`

*Sources:*
  Feferman, *The Number Systems*, §3.4
  Mendelson, *Number Systems*, §2.2

*Notes cross-ref:* §1.2 [#theorem-determinism-of-the-minimal-iterator-relation](../notes/section_1_2_main.md#theorem-determinism-of-the-minimal-iterator-relation)
-/
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

/--
**[Existence of an Iterator Function]**

For every target type, initial value, and step rule, there exists
an iterator function satisfying the iterator clauses.

This is the temporary architectural existence interface. It should
eventually be replaced by the constructed proof from the minimal
iterator relation.

*Dependencies:* `PeanoSystem`, `satisfies_iterator_clauses`

*Sources:*
  Feferman, *The Number Systems*, §3.4
  Mendelson, *Number Systems*, §2.2

*Notes cross-ref:* §1.2 [#existence-of-an-iterator-function](../notes/section_1_2_main.md#existence-of-an-iterator-function)
-/
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

/--
**[Uniqueness of Iterator Functions]**

Any two iterator functions satisfying the same iterator clauses
are pointwise equal.

This is the temporary architectural uniqueness interface. It should
eventually be replaced by the induction proof.

*Dependencies:* `PeanoSystem`, `induction_principle`,
`satisfies_iterator_clauses`

*Sources:*
  Feferman, *The Number Systems*, §3.4
  Mendelson, *Number Systems*, §2.2

*Notes cross-ref:* §1.2 [#uniqueness-of-iterator-functions](../notes/section_1_2_main.md#uniqueness-of-iterator-functions)
-/
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

/--
**[Definition — Iterator-Generated Function]**

The iterator-generated function determined by a target type,
an initial value, and a step rule.

*Dependencies:* `iterator_function_exists`

*Sources:*
  Feferman, *The Number Systems*, §3.4
  Mendelson, *Number Systems*, §2.2

*Notes cross-ref:* §1.2 [#definition-iterator-generated-function](../notes/section_1_2_main.md#definition-iterator-generated-function)
-/
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

/--
**[Theorem — Iterator-Generated Function Satisfies the Iterator Clauses]**

The function generated by `iter` satisfies the base and successor
clauses for the given iterator data.

*Dependencies:* `iter`, `iterator_function_exists`

*Sources:*
  Feferman, *The Number Systems*, §3.4
  Mendelson, *Number Systems*, §2.2

*Notes cross-ref:* §1.2 [#theorem-iterator-generated-function-satisfies-the-iterator-clauses](../notes/section_1_2_main.md#theorem-iterator-generated-function-satisfies-the-iterator-clauses)
-/
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

/--
**[Theorem — Iterator Base Clause]**

The iterator-generated function sends the distinguished element
to the initial value.

*Dependencies:* `iter_satisfies_iterator_clauses`

*Sources:*
  Feferman, *The Number Systems*, §3.4
  Mendelson, *Number Systems*, §2.2

*Notes cross-ref:* §1.2 [#theorem-iterator-base-clause](../notes/section_1_2_main.md#theorem-iterator-base-clause)
-/
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

/--
**[Theorem — Iterator Successor Clause]**

The iterator-generated function sends successors according to
the step rule.

*Dependencies:* `iter_satisfies_iterator_clauses`

*Sources:*
  Feferman, *The Number Systems*, §3.4
  Mendelson, *Number Systems*, §2.2

*Notes cross-ref:* §1.2 [#theorem-iterator-successor-clause](../notes/section_1_2_main.md#theorem-iterator-successor-clause)
-/
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

/--
**[Theorem — Peano Iterator Theorem]**

For every target type, initial value, and step rule, there exists
an iterator function satisfying the iterator clauses, and any other
such function is pointwise equal to it.

*Dependencies:* `iterator_function_exists`, `iterator_function_unique`

*Sources:*
  Feferman, *The Number Systems*, §3.4
  Mendelson, *Number Systems*, §2.2

*Notes cross-ref:* §1.2 [#theorem-peano-iterator-theorem](../notes/section_1_2_main.md#theorem-peano-iterator-theorem)
-/
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
