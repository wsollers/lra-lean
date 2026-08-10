import LRA.VolumeI.Logic.Language.FirstOrder.Signature

namespace LRA.VolumeI.Set.Implementations.ZFC

open LRA.VolumeI.Logic

/-!
The first-order signature of ZFC.

ZFC's model-theoretic language has one non-logical symbol: binary membership.
Set operations such as empty, pair, union, and powerset are not primitive
function symbols here; they are supplied by axioms or derived descriptions.
-/

/-- The one relation symbol of ZFC's signature: membership. -/
inductive ZFCRelationSymbol where
  | member

/-- ZFC's first-order signature: no functions, no constants, one binary relation. -/
def zfcSignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨ZFCRelationSymbol, fun _ => 2⟩
  Constants := Empty

theorem zfcSignature.memberIsBinary :
    zfcSignature.IsBinaryRelationSymbol .member := by
  sorry

end LRA.VolumeI.Set.Implementations.ZFC
