-- LRA/VolumeII/PeanoSystems/PeanoSystem.lean

import LRA.VolumeII.PeanoSystems.PeanoAxioms

namespace Peano

-- ============================================================
-- Primitive notions
-- ============================================================




structure PeanoSystem where
  carrier : Type
  one : carrier
  successor : carrier → carrier
  one_not_successor : ∀ x, successor x ≠ one
  successor_injective : ∀ x y, successor x = successor y → x = y
  induction :
    ∀ P : carrier → Prop,
      P one →
      (∀ x, P x → P (successor x)) →
      ∀ x, P x

noncomputable def canonicalPeanoSystem : PeanoSystem where
  carrier := N
  one := one
  successor := successor
  one_not_successor := ax_one_not_successor
  successor_injective := ax_successor_injective
  induction := ax_induction

end Peano
