import LRA.VolumeI.Set.MathlibZFSet.Instances
import LRA.VolumeI.Set.MathlibZFSet.Laws
import LRA.VolumeI.Set.MathlibZFSet.Pairing
import LRA.VolumeI.Set.MathlibZFSet.FunctionSets

/-!
Aggregate import for the MathlibZFSet backend: Mathlib's `ZFSet` -- the
ZFC universe -- as an LRA set backend.

The Mathlib-backed sibling of `Enderton`: single-sorted, every element is
itself a set, membership tower `ZFSet`/`ZFSet`/`ZFSet`. It registers
exactly the families Enderton registers -- everything except the
complement/universal family, which ZFC forbids (Russell) -- so the
capability boundary that was designed into the interface is now enforced
against Mathlib's own model of ZFC, not just this project's axioms.

Everything is redirection to `ZFSet`'s membership lemmas; the symmetric
difference is derived as `(A \ B) ∪ (B \ A)`, mirroring Enderton's
`TheSymmetricDifference`. No `sorry` anywhere.
-/
