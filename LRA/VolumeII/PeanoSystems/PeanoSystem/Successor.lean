import LRA.VolumeII.PeanoSystems.PeanoSystem.PeanoSystem

namespace LRA.VolumeII.PeanoSystems

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


/--
**[Theorem - Successor Is Injective]**

The successor operation of a Peano system is injective.

Mathematical statement (Lean): `theorem SuccessorInjective`.
-/
theorem SuccessorInjective
    (ps : PeanoSystem Element SetObject) :
    forall first second : Element,
      ps.successor first = ps.successor second -> first = second :=
  ps.successor_injective

/--
**[Theorem - One Is Not a Successor]**

The distinguished element of a Peano system is not the successor of any
element.

Mathematical statement (Lean): `theorem OneIsNotSuccessor`.
-/
theorem OneIsNotSuccessor
    (ps : PeanoSystem Element SetObject) :
    forall element : Element,
      ps.successor element ≠ ps.one :=
  ps.one_not_successor

/--
**[Theorem - Successor Preserves Inequality]**

If two elements of a Peano system are unequal, then their successors are
unequal.

Mathematical statement (Lean): `theorem SuccessorPreservesInequality`.
-/
theorem SuccessorPreservesInequality
    (ps : PeanoSystem Element SetObject)
    (first_element second_element : Element)
    (elements_not_equal : first_element ≠ second_element) :
    ps.successor first_element ≠ ps.successor second_element := by
  intro successors_equal
  exact elements_not_equal (SuccessorInjective ps first_element second_element successors_equal)

/--
**[Theorem - Successor Inequality Reflection]**

If two successors are unequal, then their predecessors are unequal.

Mathematical statement (Lean): `theorem SuccessorInequalityReflection`.
-/
theorem SuccessorInequalityReflection
    (ps : PeanoSystem Element SetObject)
    (first second : Element) :
    ps.successor first ≠ ps.successor second -> first ≠ second := by
  intro successors_not_equal elements_equal
  exact successors_not_equal (congrArg ps.successor elements_equal)

/--
**[Theorem - Every Element Is Either One or a Successor]**

Every element of a Peano system is either the distinguished element or the
successor of some element of the system.

Mathematical statement (Lean): `theorem EveryElementIsOneOrASuccessor`.
-/
theorem EveryElementIsOneOrASuccessor
    (ps : PeanoSystem Element SetObject) :
    forall element : Element,
      element = ps.one \/
        exists predecessor : Element,
          ps.successor predecessor = element := by
  sorry

/--
**[Theorem - Successor Is Not Self]**

No element of a Peano system is equal to its own successor.

Mathematical statement (Lean): `theorem NoObjectIsItsOwnSuccessor`.
-/
theorem NoObjectIsItsOwnSuccessor
    (ps : PeanoSystem Element SetObject) :
    forall element : Element,
      ps.successor element ≠ element := by
  sorry

/--
**[Theorem - One Is the Unique Non-Successor]**

An element of a Peano system is not a successor of any element if and only if it
is the distinguished element.

Mathematical statement (Lean): `theorem OneIsUniqueNonSuccessor`.
-/
theorem OneIsUniqueNonSuccessor
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    (forall predecessor : Element,
      ps.successor predecessor ≠ element) <->
    element = ps.one := by
  sorry

abbrev OneIsTheUniqueNonSuccessor := @OneIsUniqueNonSuccessor

end LRA.VolumeII.PeanoSystems
