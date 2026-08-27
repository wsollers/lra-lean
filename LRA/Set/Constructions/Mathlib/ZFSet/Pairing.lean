
import Mathlib.SetTheory.ZFC.Basic
import LRA.Set.Interface.Pairing

namespace LRA.Set.MathlibZFSet

open LRA.Set

noncomputable instance (priority := high) :
    HasPairing ZFSet ZFSet ZFSet :=
  ⟨ZFSet.pair⟩

end LRA.Set.MathlibZFSet
