import LRA.Function.Properties.Definition

/-!
The two ways a function fails to be bijective: it collides, or it misses a value.
-/

namespace LRA.Function

universe u v

/-- A function sends two distinct inputs to the same value. -/
def HasCollision {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  ∃ first second : Domain, first ≠ second ∧ function first = function second

/-- A function omits some value of its codomain. -/
def MissesValue {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  ∃ output : Codomain, ∀ input : Domain, function input ≠ output

/-- A function fails to be bijective exactly when it collides or misses a value. -/
def FailsBijective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  HasCollision function ∨ MissesValue function

/-- Having a collision is exactly failing to be injective. -/
theorem HasCollisionIffNotInjective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    HasCollision function ↔ ¬ Injective function := by
  sorry

/-- Missing a value is exactly failing to be surjective. -/
theorem MissesValueIffNotSurjective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    MissesValue function ↔ ¬ Surjective function := by
  sorry

end LRA.Function
