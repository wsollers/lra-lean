import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Operations
import LRA.Logic.Language.FirstOrder.Signature
import LRA.Logic.Model.Model

/-!
The first-order Presburger signature (`{0, S, +, <}`) and the model
obligation it carries -- moved, unchanged in substance, from
`LRA.VolumeII.PeanoSystems.Presburger.{Presburger,Operations.Addition}`
when that generic tree was collapsed into this construction.

Per §1.6.1, a construction discharges its model obligation once, here, by
exhibiting the `LRA.Logic.FirstOrder.Model`; nothing downstream restates it.
-/

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Presburger

universe u v
variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

inductive PresburgerFunctionSymbol where
  | successor
  | addition

inductive PresburgerRelationSymbol where
  | lessThan

inductive PresburgerConstantSymbol where
  | zero

def PresburgerFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := PresburgerFunctionSymbol
  arity
    | .successor => 1
    | .addition => 2

def PresburgerRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := PresburgerRelationSymbol
  arity
    | .lessThan => 2

def PresburgerSignature : LRA.Logic.Signature where
  Functions := PresburgerFunctions
  Relations := PresburgerRelations
  Constants := PresburgerConstantSymbol

/-- A generic `PresburgerModel` exhibits an `LRA.Logic.FirstOrder.Model` of
`PresburgerSignature`, discharging this construction's model obligation. -/
noncomputable def PresburgerModel.toFirstOrderModel
    (model : PresburgerModel Element SetObject) :
    LRA.Logic.FirstOrder.Model PresburgerSignature where
  Domain := Element
  domainNonempty := ⟨model.zero⟩
  interpretFunction
    | .successor, args => model.successor (args ⟨0, by decide⟩)
    | .addition, args =>
        PresburgerAddition model (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation
    | .lessThan, args =>
        model.lessThan (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => model.zero

end LRA.NumberSystems.NaturalNumbers.Constructions.Presburger
