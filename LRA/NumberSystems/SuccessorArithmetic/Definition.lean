import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.SuccessorArithmetic

/-
`SuccessorArithmetic` gives the abstract Peano base its arithmetic reading.
The underlying Peano system owns induction, predecessor theory, recursion, and
categoricity; this subject names its base `zero` and derives `one` from it.
-/
universe u v

structure SuccessorArithmetic (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  peanoSystem : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject

abbrev zero [Membership Element SetObject]
    (arithmetic : SuccessorArithmetic Element SetObject) : Element :=
  arithmetic.peanoSystem.base

abbrev one [Membership Element SetObject]
    (arithmetic : SuccessorArithmetic Element SetObject) : Element :=
  arithmetic.peanoSystem.successor (zero arithmetic)

abbrev StandardCarrier := Nat

end LRA.NumberSystems.SuccessorArithmetic
