import Mathlib.SetTheory.ZFC.Basic
import LRA.VolumeI.Set.ZFC.Model.Model

namespace LRA.VolumeI.Set.ZFC

open LRA.VolumeI.Logic

/-!
A concrete model of the ZFC signature over Mathlib's `ZFSet`.

This is the intended witness that the ZFC axiomatization built in
`Theory/` is not vacuous: `ZFSet` -- Mathlib's type of well-founded sets,
already carrying membership, extensionality, pairing, union, power set,
regularity, and an `ω` -- interprets the one relation symbol `∈` as its
own membership, and (the signature having no function or constant symbols)
needs nothing else.

The interpretation is all this file provides. That `zfSetModel` actually
*satisfies* the ZFC axioms -- i.e. `SatisfiesZFCAxiomsWithoutChoice
zfSetModel` -- is a separate, load-bearing result: each axiom, once
`Satisfies` and the ZFC vocabulary are unfolded, reduces to a Mathlib
`ZFSet` fact (`ZFSet.ext`, `ZFSet.mem_pair`, `ZFSet.mem_sUnion`,
`ZFSet.mem_powerset`, `ZFSet.mem_sep`, the regularity/`mem_wf` and
`omega` lemmas, and the image/replacement API). Those proofs are added
incrementally alongside this model rather than asserted here.

This model is also the anchor for "the switch": once a second concrete
set representation is in play, a `ModelIsomorphism` between it and
`zfSetModel` lets constructions built against one transfer to the other.
-/

/-- The ZFC signature interpreted over `ZFSet`: the domain is `ZFSet`,
membership `∈` is interpreted as `ZFSet` membership, and there is nothing
else to interpret (no function or constant symbols). -/
def zfSetModel : ZFCModel where
  Domain := ZFSet
  domainNonempty := ⟨∅⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation
    | .member, args => args ⟨0, by decide⟩ ∈ args ⟨1, by decide⟩
  interpretConstant := Empty.elim

/-- Checkpoint: the model interprets the `∈` relation symbol as genuine
`ZFSet` membership. With the argument tuple sending index `0` to `a` and
index `1` to `b`, the interpreted relation is exactly `a ∈ b`. -/
theorem zfSetModel.interpretsMembership (a b : ZFSet) :
    zfSetModel.interpretRelation .member (fun i => if i.val = 0 then a else b)
      = (a ∈ b) := rfl

end LRA.VolumeI.Set.ZFC
