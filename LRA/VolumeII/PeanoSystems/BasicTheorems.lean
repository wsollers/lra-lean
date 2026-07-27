import LRA.VolumeII.PeanoSystems.Induction

namespace LRA
namespace VolumeII
namespace PeanoSystems

/--
**[Theorem - Successor Preserves Inequality]**

If two elements of a Peano system are unequal, then their successors are
unequal.
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
**[Theorem - Every Element Is Either One or a Successor]**

Every element of a Peano system is either the distinguished element or the
successor of some element of the system.
-/
theorem every_element_is_one_or_successor
    (ps : PeanoSystem) :
    forall element : ps.carrier,
      element = ps.one \/
        exists predecessor : ps.carrier,
          ps.successor predecessor = element := by

  let D : LRA.VolumeI.Set.LRASet ps.carrier :=
    fun candidate_element =>
      candidate_element = ps.one \/
        exists predecessor : ps.carrier,
          ps.successor predecessor = candidate_element

  apply induction_principle ps D

  · exact Or.inl rfl

  · intro element _induction_hypothesis
    exact Or.inr ⟨element, rfl⟩

/--
**[Theorem - Successor Is Not Self]**

No element of a Peano system is equal to its own successor.
-/
theorem successor_not_self
    (ps : PeanoSystem) :
    forall element : ps.carrier,
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
**[Definition - Unique Predecessor]**

An element has a unique predecessor exactly when there exists a predecessor and
every other predecessor is equal to it.
-/
def unique_predecessor
    (ps : PeanoSystem)
    (element : ps.carrier) : Prop :=
  exists predecessor : ps.carrier,
    ps.successor predecessor = element /\
      forall other_predecessor : ps.carrier,
        ps.successor other_predecessor = element ->
        other_predecessor = predecessor

/--
**[Theorem - Successors Have Unique Predecessors]**

The successor of an element has that element as its unique predecessor.
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
**[Theorem - Predecessor Exists Unique Away From One]**

Every element different from the distinguished element has a unique predecessor.
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
**[Theorem - One Is the Unique Non-Successor]**

An element of a Peano system is not a successor of any element if and only if it
is the distinguished element.
-/
theorem one_unique_non_successor
    (ps : PeanoSystem)
    (element : ps.carrier) :
    (forall predecessor : ps.carrier,
      ps.successor predecessor ≠ element) <->
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

/--
**[Theorem - Elements Other Than One Have a Predecessor]**

Every element other than the distinguished element is a successor.
-/
theorem predecessor_exists_of_not_one
    (ps : PeanoSystem)
    (element : ps.carrier) :
    element ≠ ps.one ->
      exists predecessor : ps.carrier,
        ps.successor predecessor = element := by
  sorry

/--
**[Theorem - Unique Predecessor Characterization Away From One]**

An element is not the distinguished element if and only if it has a unique
predecessor.
-/
theorem not_one_iff_has_unique_predecessor
    (ps : PeanoSystem)
    (element : ps.carrier) :
    element ≠ ps.one <->
      exists unique_predecessor : ps.carrier,
        ps.successor unique_predecessor = element /\
          forall other_predecessor : ps.carrier,
            ps.successor other_predecessor = element ->
              other_predecessor = unique_predecessor := by
  sorry

end PeanoSystems
end VolumeII
end LRA
