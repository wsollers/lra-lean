import LRA.VolumeI.Set
import LRA.VolumeI.Operations.Operations

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

Mathematical statement (Lean): `def successor_closed_subset (ps : PeanoSystem) (subset : LRA.VolumeI.Set.LRASet ps.carrier) : Prop`.
-/
def successor_closed_subset
    (ps : PeanoSystem)
    (subset : LRA.VolumeI.Set.LRASet ps.carrier) : Prop :=
  forall element : ps.carrier,
    LRA.VolumeI.Set.LRASet.member element subset ->
    LRA.VolumeI.Set.LRASet.member (ps.successor element) subset

def SuccessorClosedSubset
    (ps : PeanoSystem)
    (subset : LRA.VolumeI.Set.LRASet ps.carrier) : Prop :=
  successor_closed_subset ps subset

/--
**[Definition - Inductive Subset of a Peano System]**

A subset is inductive exactly when it contains the distinguished element and is
successor-closed.

Mathematical statement (Lean): `def inductive_subset (ps : PeanoSystem) (subset : LRA.VolumeI.Set.LRASet ps.carrier) : Prop`.
-/
def inductive_subset
    (ps : PeanoSystem)
    (subset : LRA.VolumeI.Set.LRASet ps.carrier) : Prop :=
  LRA.VolumeI.Set.LRASet.member ps.one subset /\
    successor_closed_subset ps subset

def InductiveSubsetOfPeanoSystem
    (ps : PeanoSystem)
    (subset : LRA.VolumeI.Set.LRASet ps.carrier) : Prop :=
  inductive_subset ps subset

/--
**[Definition - Predecessor in a Peano System]**

An element is a predecessor of another element exactly when its successor equals
that element.

Mathematical statement (Lean): `def is_predecessor (ps : PeanoSystem) (predecessor element : ps.carrier) : Prop`.
-/
def is_predecessor
    (ps : PeanoSystem)
    (predecessor element : ps.carrier) : Prop :=
  ps.successor predecessor = element

def PredecessorInPeanoSystem
    (ps : PeanoSystem)
    (predecessor element : ps.carrier) : Prop :=
  is_predecessor ps predecessor element

end LRA.VolumeII.PeanoSystems
