
import Mathlib.SetTheory.ZFC.Basic
import LRA.Set.Interface.Definitions.Pairing
import LRA.Set.Interface.Laws.Pairing

namespace LRA.Set.MathlibZFSet

open LRA.Set

noncomputable instance (priority := high) :
    HasPairing ZFSet ZFSet ZFSet :=
  ⟨ZFSet.pair⟩

instance : PairingLaws ZFSet ZFSet ZFSet :=
  ⟨fun _ _ _ _ => ZFSet.pair_inj⟩

end LRA.Set.MathlibZFSet
