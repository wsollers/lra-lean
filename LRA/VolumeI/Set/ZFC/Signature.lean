import LRA.VolumeI.Logic.Language.FirstOrder.Signature

namespace LRA.VolumeI.Set.ZFC

open LRA.VolumeI.Logic

/-!
The signature of ZFC.

ZFC, viewed model-theoretically, is a first-order theory over a signature
with exactly one non-logical symbol: a single binary relation, `\in`. No
function symbols, no constants -- everything else (the empty set, pairing,
unions, subsets) is either *defined* in terms of `\in` alone (as derived
formula-building notation, mirroring how `Formula.and`/`existsQ` are
derived from `\lnot`/`\to`/`forallQ` rather than primitive) or *asserted to
exist* by an axiom, never assumed as separate vocabulary.

This is exactly why ZFC is presented as a first-order theory in the
standard treatment: it needs nothing beyond `Logic.FirstOrder`'s existing
`Signature`/`Model`/`Formula`/`Satisfies` machinery, already built and
proved in this project. A model of ZFC is, mechanically, nothing more than
a `Model zfcSignature` in which every ZFC axiom (built in `Axioms.lean`)
is satisfied.

Separation and Replacement, ZFC's two axiom *schemas*, are deliberately
kept first-order and schematic here -- one axiom instance per defining
formula, the standard textbook presentation -- rather than single
second-order sentences quantifying over "any" defining relation. The
heavier, genuinely second-order treatment (needed to state a single
Separation/Replacement sentence uniformly) is reserved for where it is
actually load-bearing: the number-systems work (N, R), not here.
-/

/-- The one relation symbol of ZFC's signature: membership, `\in`,
arity 2. -/
inductive ZFCRelationSymbol where
  | mem

/-- ZFC's signature: no function symbols, no constants, and the single
binary relation symbol `\in`. -/
def zfcSignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨ZFCRelationSymbol, fun _ => 2⟩
  Constants := Empty

theorem zfcSignature.memIsBinary :
    zfcSignature.IsBinaryRelationSymbol .mem := rfl

end LRA.VolumeI.Set.ZFC
