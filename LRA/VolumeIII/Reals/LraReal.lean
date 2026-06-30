-- LRA/VolumeIII/Reals/LraReal.lean
--
-- LraReal — the carrier only: the Dedekind-cut structure, the raw field
-- operations (data, cut formulas stubbed), and the ONE genuinely-proved piece
-- of structure: the order.
--
-- The algebraic LAWS are not here. They live in `Contracts/Real.lean` as named
-- obligations, because that file is the contract you prove against and the
-- thing the green/red scoreboard tracks. Keeping the carrier law-free keeps
-- "what is the object" separate from "what must I prove about it."
--
-- PLACEHOLDER: cuts over Mathlib `ℚ`; swap for Volume II's rationals later.

import Mathlib

namespace LraReals

/-- **[LraReal]** A real as a lower Dedekind cut of ℚ. -/
structure LraReal where
  lower      : Set ℚ
  nonempty   : lower.Nonempty
  not_all    : ∃ q : ℚ, q ∉ lower
  downward   : ∀ {p : ℚ}, p ∈ lower → ∀ {q : ℚ}, q < p → q ∈ lower
  open_above : ∀ {p : ℚ}, p ∈ lower → ∃ r ∈ lower, p < r

namespace LraReal

/-- Order is cut inclusion. This instance is GREEN — fully proved, no `sorry`.
It is the structure the `Bounds` primitives need, so `LraReal` is a real
carrier today even though its arithmetic is not built yet. -/
instance : Preorder LraReal where
  le x y := x.lower ⊆ y.lower
  le_refl x := Set.Subset.refl x.lower
  le_trans _ _ _ hxy hyz := Set.Subset.trans hxy hyz

-- Field operation DATA (cut formulas: clear ones written, subtle ones stubbed).
instance : Zero LraReal where
  zero := { lower := {q : ℚ | q < 0},
            nonempty := sorry, not_all := sorry, downward := sorry, open_above := sorry }
instance : One LraReal where
  one := { lower := {q : ℚ | q < 1},
           nonempty := sorry, not_all := sorry, downward := sorry, open_above := sorry }
instance : Add LraReal where
  add x y := { lower := {s : ℚ | ∃ p ∈ x.lower, ∃ r ∈ y.lower, s = p + r},
               nonempty := sorry, not_all := sorry, downward := sorry, open_above := sorry }
instance : Neg LraReal where
  neg _ := { lower := sorry, nonempty := sorry, not_all := sorry, downward := sorry, open_above := sorry }
instance : Mul LraReal where
  mul _ _ := { lower := sorry, nonempty := sorry, not_all := sorry, downward := sorry, open_above := sorry }
instance : Inv LraReal where
  inv _ := { lower := sorry, nonempty := sorry, not_all := sorry, downward := sorry, open_above := sorry }

end LraReal
end LraReals
