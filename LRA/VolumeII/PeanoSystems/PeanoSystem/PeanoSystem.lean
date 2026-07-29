import LRA.VolumeI.Set

/-!
Current TeX-facing Peano-system carrier for Volume II.

This is the root namespace for the active Volume II Peano-system buildout.
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
    LRA.VolumeI.Set.LRASet.Member element subset ->
    LRA.VolumeI.Set.LRASet.Member (ps.successor element) subset

/--
**[Definition - Inductive Subset of a Peano System]**

A subset is inductive exactly when it contains the distinguished element and is
successor-closed.

Mathematical statement (Lean): `def InductiveSubsetOfPeanoSystem (ps : PeanoSystem) (subset : LRA.VolumeI.Set.LRASet ps.carrier) : Prop`.
-/
def InductiveSubsetOfPeanoSystem
    (ps : PeanoSystem)
    (subset : LRA.VolumeI.Set.LRASet ps.carrier) : Prop :=
  LRA.VolumeI.Set.LRASet.Member ps.one subset /\
    SuccessorClosedSubset ps subset

end LRA.VolumeII.PeanoSystems
