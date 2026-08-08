import LRA.VolumeI.Set

/-!
Current TeX-facing Peano-system carrier for Volume II.

This is the root namespace for the active Volume II Peano-system buildout.
-/

namespace LRA.VolumeII.PeanoSystems

universe u v

open LRA.VolumeI.Set

/--
**[Definition - Peano System]**

A one-based Peano system is a carrier equipped with a distinguished element,
a successor operation, and the Peano axioms.

Mathematical statement (Lean): `structure PeanoSystem`.
-/
structure PeanoSystem where
  setInterface : SetInterface.{u, v}
  one : setInterface.Element
  successor : setInterface.Element -> setInterface.Element
  one_not_successor :
    forall element : setInterface.Element,
      successor element ≠ one
  successor_injective :
    forall first_element second_element : setInterface.Element,
      successor first_element = successor second_element ->
      first_element = second_element
  induction :
    forall subset : setInterface.SetObject,
      setInterface.Member one subset ->
      (forall element : setInterface.Element,
        setInterface.Member element subset ->
        setInterface.Member (successor element) subset) ->
      forall element : setInterface.Element,
        setInterface.Member element subset

abbrev PeanoSystemFromTex := PeanoSystem

namespace PeanoSystem

/-- The element carrier of a Peano system, read from its generic set interface. -/
abbrev carrier (ps : PeanoSystem) : Type v :=
  ps.setInterface.Element

end PeanoSystem

/--
**[Definition - Successor-Closed Subset of a Peano System]**

A subset of a Peano system is successor-closed exactly when membership is
preserved by the successor operation.

Mathematical statement (Lean): `def SuccessorClosedSubset (ps : PeanoSystem) (subset : ps.setInterface.SetObject) : Prop`.
-/
def SuccessorClosedSubset
    (ps : PeanoSystem)
    (subset : ps.setInterface.SetObject) : Prop :=
  forall element : ps.carrier,
    ps.setInterface.Member element subset ->
    ps.setInterface.Member (ps.successor element) subset

/--
**[Definition - Inductive Subset of a Peano System]**

A subset is inductive exactly when it contains the distinguished element and is
successor-closed.

Mathematical statement (Lean): `def InductiveSubsetOfPeanoSystem (ps : PeanoSystem) (subset : ps.setInterface.SetObject) : Prop`.
-/
def InductiveSubsetOfPeanoSystem
    (ps : PeanoSystem)
    (subset : ps.setInterface.SetObject) : Prop :=
  ps.setInterface.Member ps.one subset /\
    SuccessorClosedSubset ps subset

end LRA.VolumeII.PeanoSystems
