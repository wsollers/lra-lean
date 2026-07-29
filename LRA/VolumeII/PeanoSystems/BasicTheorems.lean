import LRA.VolumeII.PeanoSystems.Induction.Core

namespace LRA.VolumeII.PeanoSystems

/--
**[Theorem - Successor Preserves Inequality]**

If two elements of a Peano system are unequal, then their successors are
unequal.

Mathematical statement (Lean): `theorem SuccessorPreservesInequality (ps : PeanoSystem) (first_element second_element : ps.carrier) (elements_not_equal : first_element ≠ second_element) : ps.successor first_element ≠ ps.successor second_element`.
-/
theorem SuccessorPreservesInequality
    (ps : PeanoSystem)
    (first_element second_element : ps.carrier)
    (elements_not_equal : first_element ≠ second_element) :
    ps.successor first_element ≠ ps.successor second_element := by
  sorry

/--
**[Theorem - Every Element Is Either One or a Successor]**

Every element of a Peano system is either the distinguished element or the
successor of some element of the system.

Mathematical statement (Lean): `theorem EveryElementIsOneOrASuccessor (ps : PeanoSystem) : forall element : ps.carrier, element = ps.one \/ exists predecessor : ps.carrier, ps.successor predecessor = element`.
-/
theorem EveryElementIsOneOrASuccessor
    (ps : PeanoSystem) :
    forall element : ps.carrier,
      element = ps.one \/
        exists predecessor : ps.carrier,
          ps.successor predecessor = element := by
  sorry

theorem SuccessorInequalityReflection
    (ps : PeanoSystem)
    (first second : ps.carrier) :
    ps.successor first ≠ ps.successor second -> first ≠ second := by
  sorry

/--
**[Theorem - Successor Is Not Self]**

No element of a Peano system is equal to its own successor.

Mathematical statement (Lean): `theorem NoObjectIsItsOwnSuccessor (ps : PeanoSystem) : forall element : ps.carrier, ps.successor element ≠ element`.
-/
theorem NoObjectIsItsOwnSuccessor
    (ps : PeanoSystem) :
    forall element : ps.carrier,
      ps.successor element ≠ element := by
  sorry

/--
**[Definition - Unique Predecessor]**

An element has a unique predecessor exactly when there exists a predecessor and
every other predecessor is equal to it.

Mathematical statement (Lean): `def UniquePredecessor (ps : PeanoSystem) (element : ps.carrier) : Prop`.
-/
def UniquePredecessor
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

Mathematical statement (Lean): `theorem SuccessorsHaveUniquePredecessors (ps : PeanoSystem) (element : ps.carrier) : UniquePredecessor ps (ps.successor element)`.
-/
theorem SuccessorsHaveUniquePredecessors
    (ps : PeanoSystem)
    (element : ps.carrier) :
    UniquePredecessor ps (ps.successor element) := by
  sorry

/--
**[Theorem - Predecessor Exists Unique Away From One]**

Every element different from the distinguished element has a unique predecessor.

Mathematical statement (Lean): `theorem PredecessorExistsUniqueAwayFromOne (ps : PeanoSystem) (element : ps.carrier) (element_not_one : element ≠ ps.one) : UniquePredecessor ps element`.
-/
theorem PredecessorExistsUniqueAwayFromOne
    (ps : PeanoSystem)
    (element : ps.carrier) :
    element ≠ ps.one -> UniquePredecessor ps element := by
  sorry

/--
**[Theorem - One Is the Unique Non-Successor]**

An element of a Peano system is not a successor of any element if and only if it
is the distinguished element.

Mathematical statement (Lean): `theorem OneIsTheUniqueNonSuccessor (ps : PeanoSystem) (element : ps.carrier) : (forall predecessor : ps.carrier, ps.successor predecessor ≠ element) <-> element = ps.one`.
-/
theorem OneIsTheUniqueNonSuccessor
    (ps : PeanoSystem)
    (element : ps.carrier) :
    (forall predecessor : ps.carrier,
      ps.successor predecessor ≠ element) <->
    element = ps.one := by
  sorry

theorem OneIsUniqueNonSuccessor
    (ps : PeanoSystem)
    (element : ps.carrier) :
    (∀ predecessor : ps.carrier, ps.successor predecessor ≠ element) ↔ element = ps.one := by
  sorry

/--
**[Theorem - Elements Other Than One Have a Predecessor]**

Every element other than the distinguished element is a successor.

Mathematical statement (Lean): `theorem NonOneElementsHaveAPredecessor (ps : PeanoSystem) (element : ps.carrier) : element ≠ ps.one -> exists predecessor : ps.carrier, ps.successor predecessor = element`.
-/
theorem NonOneElementsHaveAPredecessor
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

Mathematical statement (Lean): `theorem UniquePredecessorCharacterizationAwayFromOne (ps : PeanoSystem) (element : ps.carrier) : element ≠ ps.one <-> exists chosen_predecessor : ps.carrier, ps.successor chosen_predecessor = element /\ forall other_predecessor : ps.carrier, ps.successor other_predec...`.
-/
theorem UniquePredecessorCharacterizationAwayFromOne
    (ps : PeanoSystem)
    (element : ps.carrier) :
    element ≠ ps.one ↔ UniquePredecessor ps element := by
  sorry

end LRA.VolumeII.PeanoSystems
