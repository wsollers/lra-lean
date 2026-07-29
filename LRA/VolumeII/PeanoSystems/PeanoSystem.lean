import LRA.VolumeI.Set

/-!
Current TeX-facing Peano-system carrier for Volume II.

This is the root namespace reserved for the new buildout.  The earlier
implementation is quarantined under `LRA.VolumeII.PeanoSystems.Old`.
-/

namespace LRA.VolumeII.PeanoSystems

universe u

/--
**[Definition - Peano System]**

A one-based Peano system is a carrier equipped with a distinguished element,
a successor operation, and the Peano axioms.

Mathematical statement (Lean): `structure PeanoSystem`.
-/
structure PeanoSystem where
  carrier : Type u
  one : carrier
  successor : carrier -> carrier
  one_not_successor :
    forall element : carrier,
      successor element ≠ one
  successor_injective :
    forall first_element second_element : carrier,
      successor first_element = successor second_element ->
      first_element = second_element
  induction :
    forall predicate : LRA.VolumeI.Set.LRASet carrier,
      predicate one ->
      (forall element : carrier,
        predicate element ->
        predicate (successor element)) ->
      forall element : carrier,
        predicate element

abbrev PeanoSystemFromTex := PeanoSystem

/--
**[Definition - Successor-Closed Subset of a Peano System]**

A subset of a Peano system is successor-closed exactly when membership is
preserved by the successor operation.

Mathematical statement (Lean): `def SuccessorClosedSubset (ps : PeanoSystem) (subset : LRA.VolumeI.Set.LRASet ps.carrier) : Prop`.
-/
def SuccessorClosedSubset
    (ps : PeanoSystem)
    (subset : LRA.VolumeI.Set.LRASet ps.carrier) : Prop :=
  forall element : ps.carrier,
    LRA.VolumeI.Set.LRASet.member element subset ->
    LRA.VolumeI.Set.LRASet.member (ps.successor element) subset

/--
**[Definition - Inductive Subset of a Peano System]**

A subset is inductive exactly when it contains the distinguished element and is
successor-closed.

Mathematical statement (Lean): `def InductiveSubsetOfPeanoSystem (ps : PeanoSystem) (subset : LRA.VolumeI.Set.LRASet ps.carrier) : Prop`.
-/
def InductiveSubsetOfPeanoSystem
    (ps : PeanoSystem)
    (subset : LRA.VolumeI.Set.LRASet ps.carrier) : Prop :=
  LRA.VolumeI.Set.LRASet.member ps.one subset /\
    SuccessorClosedSubset ps subset

/--
**[Definition - Predecessor in a Peano System]**

An element is a predecessor of another element exactly when its successor equals
that element.

Mathematical statement (Lean): `def PredecessorInPeanoSystem (ps : PeanoSystem) (predecessor element : ps.carrier) : Prop`.
-/
def PredecessorInPeanoSystem
    (ps : PeanoSystem)
    (predecessor element : ps.carrier) : Prop :=
  ps.successor predecessor = element

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
