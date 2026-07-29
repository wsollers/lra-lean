import LRA.VolumeII.PeanoSystems.PeanoSystem
import LRA.VolumeI.Logic.Model.Model

/-!
First-order signature and model data for the Peano-system natural-number
language.
-/

namespace LRA.VolumeII.NaturalNumbers

inductive NFunctionSymbol where
  | successor

def NRelationSymbol : Type := Empty

inductive NConstantSymbol where
  | one

def NFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := NFunctionSymbol
  arity
    | .successor => 1

def NRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := NRelationSymbol
  arity := Empty.elim

def NSignature : LRA.VolumeI.Logic.Signature where
  Functions := NFunctions
  Relations := NRelations
  Constants := NConstantSymbol

structure NModel extends LRA.VolumeII.PeanoSystems.PeanoSystem

def NModel.toFirstOrderModel
    (model : NModel) :
    LRA.VolumeI.Logic.FirstOrder.Model NSignature where
  Domain := model.carrier
  domainNonempty := ⟨model.one⟩
  interpretFunction
    | .successor, args => model.successor (args ⟨0, by decide⟩)
  interpretRelation := fun relation_symbol => nomatch relation_symbol
  interpretConstant
    | .one => model.one

end LRA.VolumeII.NaturalNumbers
