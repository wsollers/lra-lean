import LRA.VolumeII.PeanoSystems.Induction

namespace Peano

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

theorem every_element_is_one_or_successor
    (ps : PeanoSystem) :
    ∀ element : ps.carrier,
      element = ps.one ∨
        ∃ predecessor : ps.carrier,
          ps.successor predecessor = element := by

  let D : ps.carrier → Prop :=
    fun candidate_element =>
      candidate_element = ps.one ∨
        ∃ predecessor : ps.carrier,
          ps.successor predecessor = candidate_element

  apply induction_principle ps D

  ·

    exact Or.inl rfl

  ·

    intro element induction_hypothesis

    exact Or.inr ⟨element, rfl⟩

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

def unique_predecessor
    (ps : PeanoSystem)
    (element : ps.carrier) : Prop :=
  ∃ predecessor : ps.carrier,
    ps.successor predecessor = element ∧
      ∀ other_predecessor : ps.carrier,
        ps.successor other_predecessor = element →
        other_predecessor = predecessor

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

theorem successor_inequality_reflects
    (ps : PeanoSystem)
    (first_element second_element : ps.carrier) :
    first_element ≠ second_element →
      ps.successor first_element ≠ ps.successor second_element := by
  sorry

theorem predecessor_exists_of_not_one
    (ps : PeanoSystem)
    (element : ps.carrier) :
    element ≠ ps.one →
      ∃ predecessor : ps.carrier,
        ps.successor predecessor = element := by
  sorry

theorem not_one_iff_has_unique_predecessor
    (ps : PeanoSystem)
    (element : ps.carrier) :
    element ≠ ps.one ↔
      ∃ unique_predecessor : ps.carrier,
        ps.successor unique_predecessor = element ∧
          ∀ other_predecessor : ps.carrier,
            ps.successor other_predecessor = element →
              other_predecessor = unique_predecessor := by
  sorry

end Peano
