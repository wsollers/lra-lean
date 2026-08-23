import LRA.Logic.Model.Model
import LRA.Operation
import LRA.Relation

namespace LRA.NumberSystems.PeanoSystems.Presburger.ModelTheory

universe u

   
                                                                         
  

inductive AdditiveOrderedFunctionSymbol where
  | add

inductive AdditiveOrderedRelationSymbol where
  | lt

inductive AdditiveOrderedConstantSymbol where
  | zero
  | one

def AdditiveOrderedFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := AdditiveOrderedFunctionSymbol
  arity
    | .add => 2

def AdditiveOrderedFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := AdditiveOrderedRelationSymbol
  arity
    | .lt => 2

def AdditiveOrderedFirstOrderSignature : LRA.Logic.Signature where
  Functions := AdditiveOrderedFirstOrderFunctions
  Relations := AdditiveOrderedFirstOrderRelations
  Constants := AdditiveOrderedConstantSymbol

structure AdditiveOrderedSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  addition : LRA.Operation.BinaryOperation carrier
  StrictOrder : LRA.Relation.Endorelation carrier
  NonstrictOrder : LRA.Relation.Endorelation carrier

def BuildAdditiveOrderedModel
    (signature : AdditiveOrderedSignature) :
    LRA.Logic.FirstOrder.Model AdditiveOrderedFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation
    | .lt, args =>
        signature.StrictOrder (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

def additiveOrderedFirstOrderModel (R : Type u)
    [Add R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model AdditiveOrderedFirstOrderSignature :=
  BuildAdditiveOrderedModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      StrictOrder := (· < ·), NonstrictOrder := (· ≤ ·) }

end LRA.NumberSystems.PeanoSystems.Presburger.ModelTheory
