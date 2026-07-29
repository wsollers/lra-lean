import LRA.VolumeI.Logic.Language.FirstOrder.Signature

/-!
First-order signature data for Presburger arithmetic.

The signature is the source-facing `\{0,S,+,<\}` Presburger language.  Equality
is logical equality, not a nonlogical relation symbol.
-/

namespace LRA.VolumeII.PeanoSystems

inductive PresburgerFunctionSymbol where
  | successor
  | addition

inductive PresburgerRelationSymbol where
  | lessThan

inductive PresburgerConstantSymbol where
  | zero

def PresburgerFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := PresburgerFunctionSymbol
  arity
    | .successor => 1
    | .addition => 2

def PresburgerRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := PresburgerRelationSymbol
  arity
    | .lessThan => 2

/- Volume II label: def:presburger-signature
   Lean declaration: LRA.VolumeII.PeanoSystems.PresburgerSignature
   Status: pending -/
def PresburgerSignature : LRA.VolumeI.Logic.Signature where
  Functions := PresburgerFunctions
  Relations := PresburgerRelations
  Constants := PresburgerConstantSymbol

end LRA.VolumeII.PeanoSystems
