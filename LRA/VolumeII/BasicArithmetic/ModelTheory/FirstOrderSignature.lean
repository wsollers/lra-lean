import LRA.VolumeI.Logic.Model.Model
import LRA.VolumeI.Operations

namespace LRA.NumberSystems.BasicArithmetic.ModelTheory

universe u

/-!
First-order arithmetic-ring vocabulary used by concrete Volume II
constructions that expose only `0`, `1`, addition, and multiplication.
-/

inductive ArithmeticRingFunctionSymbol where
  | add
  | mul

def ArithmeticRingRelationSymbol : Type := Empty

inductive ArithmeticRingConstantSymbol where
  | zero
  | one

def ArithmeticRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := ArithmeticRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2

def ArithmeticRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := ArithmeticRingRelationSymbol
  arity := Empty.elim

def ArithmeticRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := ArithmeticRingFirstOrderFunctions
  Relations := ArithmeticRingFirstOrderRelations
  Constants := ArithmeticRingConstantSymbol

structure ArithmeticRingSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  addition : LRA.Operation.BinaryOperation carrier
  multiplication : LRA.Operation.BinaryOperation carrier

def BuildArithmeticRingModel
    (signature : ArithmeticRingSignature) :
    LRA.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiplication (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

def arithmeticRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  BuildArithmeticRingModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      multiplication := (· * ·) }

end LRA.NumberSystems.BasicArithmetic.ModelTheory
