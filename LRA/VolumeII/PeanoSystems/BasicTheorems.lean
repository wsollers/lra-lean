-- LRA/VolumeII/PeanoSystems/BasicTheorems.lean
--
-- Basic theorems for abstract Peano systems.
-- No Mathlib.
--
-- Sources:
--   Landau, Foundations of Analysis, §1–§2
--   Feferman, The Number Systems, §3.1
--
-- Running table of contents:
--
--   Theorem | successor_preserves_inequality          | x ≠ y → Sx ≠ Sy
--   Theorem | every_element_is_one_or_successor       | every element is one or a successor
--   Theorem | successor_not_self                      | Sx ≠ x
--   Def     | unique_predecessor                      | explicit unique-predecessor predicate
--   Theorem | successor_has_unique_predecessor        | Sx has unique predecessor x
--   Theorem | predecessor_exists_unique_away_from_one | every non-one element has unique predecessor
--   Theorem | one_unique_non_successor                | one is the unique non-successor

import LRA.VolumeII.PeanoSystems.Induction

namespace Peano

/--
**[Theorem — Successor Preserves Inequality]**

If two elements of a Peano system are unequal, then their successors
are unequal.

*Dependencies:* `PeanoSystem.successor_injective`

*Sources:*
  Landau, *Foundations of Analysis*, §2 Theorem 1

*Notes cross-ref:* §1.1 [#theorem-successor-preserves-inequality](../notes/section_1_1_main.md#theorem-successor-preserves-inequality)
-/
theorem successor_preserves_inequality
    (ps : PeanoSystem)
    (first_element second_element : ps.carrier)
    (elements_not_equal : first_element ≠ second_element) :
    ps.successor first_element ≠ ps.successor second_element := by
  intro successors_equal
  exact
    elements_not_equal
      (ps.successor_injective
        first_element
        second_element
        successors_equal)


/--
**[Theorem — Successor Preserves Inequality]**

If two elements of a Peano system are unequal, then their successors
are unequal.

*Dependencies:* `PeanoSystem.successor_injective`

*Sources:*
  Landau, *Foundations of Analysis*, §2 Theorem 1

*Notes cross-ref:* §1.1 [#theorem-successor-preserves-inequality](../notes/section_1_1_main.md#theorem-successor-preserves-inequality)
-/
theorem successor_preserves_inequality
    (ps : PeanoSystem)
    (first_element second_element : ps.carrier)
    (elements_not_equal : first_element ≠ second_element) :
    ps.successor first_element ≠ ps.successor second_element := by
  intro successors_equal
  exact
    elements_not_equal
      (ps.successor_injective
        first_element
        second_element
        successors_equal)

/--
**[Theorem — Every Element Is Either One or a Successor]**

Every element of a Peano system is either the distinguished element
or the successor of some element of the system.

*Dependencies:* `PeanoSystem`, `induction_principle`

*Sources:*
  Landau, *Foundations of Analysis*, §1
  Feferman, *The Number Systems*, §3.1

*Notes cross-ref:* §1.1 [#theorem-every-element-is-either-one-or-a-successor](../notes/section_1_1_main.md#theorem-every-element-is-either-one-or-a-successor)
-/
theorem every_element_is_one_or_successor
    (ps : PeanoSystem) :
    ∀ element : ps.carrier,
      element = ps.one ∨
        ∃ predecessor : ps.carrier,
          ps.successor predecessor = element := by

  -- Define the subset D of elements that already have the desired form:
  -- D = {x ∈ P : x = 1 or ∃u ∈ P, S(u) = x}.
  let D : ps.carrier → Prop :=
    fun candidate_element =>
      candidate_element = ps.one ∨
        ∃ predecessor : ps.carrier,
          ps.successor predecessor = candidate_element

  -- It is enough to prove every element belongs to D.
  apply induction_principle ps D

  · -- Base case:
    -- Show that the distinguished element belongs to D.
    -- In ordinary notation: prove 1 ∈ D.
    sorry

  · -- Successor step:
    -- Assume an arbitrary element belongs to D.
    -- Show that its successor also belongs to D.
    intro element induction_hypothesis

    -- Goal:
    --   D (ps.successor element)
    --
    -- Since ps.successor element is literally a successor,
    -- choose `element` itself as the predecessor witness.
    sorry

/--
**[Theorem — Successor Is Not Self]**

No element of a Peano system is equal to its own successor.

*Dependencies:* `induction_principle`, `successor_preserves_inequality`

*Sources:*
  Landau, *Foundations of Analysis*, §2 Theorem 2

*Notes cross-ref:* §1.1 [#theorem-successor-is-not-self](../notes/section_1_1_main.md#theorem-successor-is-not-self)
-/
theorem successor_not_self
    (ps : PeanoSystem) :
    ∀ element : ps.carrier,
      ps.successor element ≠ element := by
  apply induction_principle ps

  · exact ps.one_not_successor ps.one

  · intro element induction_hypothesis
    exact
      successor_preserves_inequality
        ps
        (ps.successor element)
        element
        induction_hypothesis

/--
**[Definition — Unique Predecessor]**

An element has a unique predecessor exactly when there exists a
predecessor and every other predecessor is equal to it.

*Dependencies:* `PeanoSystem`

*Sources:*
  Landau, *Foundations of Analysis*, §2 Theorem 3

*Notes cross-ref:* §1.1 [#definition-unique-predecessor](../notes/section_1_1_main.md#definition-unique-predecessor)
-/
def unique_predecessor
    (ps : PeanoSystem)
    (element : ps.carrier) : Prop :=
  ∃ predecessor : ps.carrier,
    ps.successor predecessor = element ∧
      ∀ other_predecessor : ps.carrier,
        ps.successor other_predecessor = element →
        other_predecessor = predecessor

/--
**[Theorem — Successors Have Unique Predecessors]**

The successor of an element has that element as its unique predecessor.

*Dependencies:* `unique_predecessor`, `PeanoSystem.successor_injective`

*Sources:*
  Landau, *Foundations of Analysis*, §2 Theorem 3

*Notes cross-ref:* §1.1 [#theorem-successors-have-unique-predecessors](../notes/section_1_1_main.md#theorem-successors-have-unique-predecessors)
-/
theorem successor_has_unique_predecessor
    (ps : PeanoSystem)
    (element : ps.carrier) :
    unique_predecessor ps (ps.successor element) := by
  refine ⟨element, rfl, ?_⟩
  intro other_predecessor successor_eq_successor
  exact
    ps.successor_injective
      other_predecessor
      element
      successor_eq_successor

/--
**[Theorem — Predecessor Exists Unique Away From One]**

Every element different from the distinguished element has a unique
predecessor.

*Dependencies:* `every_element_is_one_or_successor`, `unique_predecessor`,
`PeanoSystem.successor_injective`

*Sources:*
  Landau, *Foundations of Analysis*, §2 Theorem 3

*Notes cross-ref:* §1.1 [#theorem-predecessor-exists-unique-away-from-one](../notes/section_1_1_main.md#theorem-predecessor-exists-unique-away-from-one)
-/
theorem predecessor_exists_unique_away_from_one
    (ps : PeanoSystem)
    (element : ps.carrier)
    (element_not_one : element ≠ ps.one) :
    unique_predecessor ps element := by
  cases every_element_is_one_or_successor ps element with
  | inl element_is_one =>
      exact False.elim (element_not_one element_is_one)
  | inr element_has_predecessor =>
      cases element_has_predecessor with
      | intro predecessor successor_eq_element =>
          refine ⟨predecessor, successor_eq_element, ?_⟩
          intro other_predecessor other_successor_eq_element
          exact
            ps.successor_injective
              other_predecessor
              predecessor
              (Eq.trans
                other_successor_eq_element
                successor_eq_element.symm)

/--
**[Theorem — One Is the Unique Non-Successor]**

An element of a Peano system is not a successor of any element
if and only if it is the distinguished element.

*Dependencies:* `every_element_is_one_or_successor`,
`PeanoSystem.one_not_successor`

*Sources:*
  Landau, *Foundations of Analysis*, §1–§2

*Notes cross-ref:* §1.1 [#theorem-one-is-the-unique-non-successor](../notes/section_1_1_main.md#theorem-one-is-the-unique-non-successor)
-/
theorem one_unique_non_successor
    (ps : PeanoSystem)
    (element : ps.carrier) :
    (∀ predecessor : ps.carrier,
      ps.successor predecessor ≠ element) ↔
    element = ps.one := by
  constructor

  · intro element_has_no_predecessor
    cases every_element_is_one_or_successor ps element with
    | inl element_is_one =>
        exact element_is_one
    | inr element_has_predecessor =>
        cases element_has_predecessor with
        | intro predecessor successor_eq_element =>
            exact
              False.elim
                ((element_has_no_predecessor predecessor)
                  successor_eq_element)

  · intro element_is_one
    intro predecessor successor_eq_element
    exact
      ps.one_not_successor
        predecessor
        (Eq.trans successor_eq_element element_is_one)

end Peano
