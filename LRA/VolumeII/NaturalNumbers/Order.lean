import LRA.VolumeII.NaturalNumbers.Addition

namespace Peano

def lt
    (ps : PeanoSystem)
    (x y : ps.carrier) : Prop :=
  ∃ k : ps.carrier, y = plus ps x k

def le
    (ps : PeanoSystem)
    (x y : ps.carrier) : Prop :=
  lt ps x y ∨ x = y

theorem lt_irrefl
    (ps : PeanoSystem) (x : ps.carrier) :
    ¬ lt ps x x := by
  sorry

theorem lt_trans
    (ps : PeanoSystem) (x y z : ps.carrier) :
    lt ps x y → lt ps y z → lt ps x z := by
  sorry

theorem lt_asymm
    (ps : PeanoSystem) (x y : ps.carrier) :
    lt ps x y → ¬ lt ps y x := by
  sorry

theorem lt_trichotomy
    (ps : PeanoSystem) (x y : ps.carrier) :
    lt ps x y ∨ x = y ∨ lt ps y x := by
  sorry

theorem lt_succ
    (ps : PeanoSystem) (x : ps.carrier) :
    lt ps x (ps.successor x) := by
  sorry

theorem le_antisymm
    (ps : PeanoSystem) (x y : ps.carrier) :
    le ps x y → le ps y x → x = y := by
  sorry

def is_minimum
    (ps : PeanoSystem)
    (P : ps.carrier → Prop)
    (m : ps.carrier) : Prop :=
  P m ∧ ∀ k : ps.carrier, P k → ¬ lt ps k m

theorem well_ordering
    (ps : PeanoSystem)
    (P : ps.carrier → Prop)
    (P_nonempty : ∃ element : ps.carrier, P element) :
    ∃ minimum : ps.carrier, is_minimum ps P minimum := by
  sorry

end Peano
