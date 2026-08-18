import LRA.VolumeI.Function.Typed.Definition

/-!
Compile-time evidence that the typed function abbreviation admits distinct
domain and codomain types at independent universe levels.
-/

namespace LRA.Function.Typed

universe u v

/-- A typed function between two different types. -/
example : LRA.Function Nat Bool := fun value => value = 0

/-- A typed function between two different types in the other direction. -/
example : LRA.Function Bool Nat := fun flag => if flag then 1 else 0

/-- The domain and codomain universes are independent. -/
example (Domain : Type u) (Codomain : Type v) :
    LRA.Function Domain Codomain = (Domain -> Codomain) := rfl

/-- A universe-polymorphic identity witness at an arbitrary single universe. -/
example (Domain : Type u) : LRA.Function.Endofunction Domain :=
  fun element => element

/-- Independent universes accept a genuinely universe-crossing function. -/
example (Domain : Type u) (Codomain : Type v) (value : Codomain) :
    LRA.Function Domain Codomain :=
  fun _ => value

end LRA.Function.Typed
