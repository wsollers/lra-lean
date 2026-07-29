-- LRA/VolumeI/Algebra/Models/Signatures.lean
-- Shared operation signatures for configurable number-system models.

import LRA.VolumeI.Set
import LRA.VolumeI.Operations
import LRA.VolumeI.Relations
import LRA.VolumeI.Logic.Model.Model

namespace LRA.VolumeI.Algebra.Models

/-!
Volume I label: algebraic-model-signatures
Lean module: LRA.VolumeI.Algebra.Models.Signatures
Verification status: checked-data-definitions
-/

/-!
First-order signatures for standard algebraic number-system structures.

Names ending in `FirstOrderSignature` are model-theoretic signatures: they
describe the non-logical language interpreted by a `FirstOrder.Model`.

Names such as `OrderedRingSignature` are operation bundles: a carrier together
with concrete operations and relations. The model builders below turn those
bundles into first-order models.
-/

/-- Function symbols of the Peano language `(1, S)`. -/
inductive PeanoFunctionSymbol where
  | successor

/-- There are no primitive relation symbols in the Peano language here. -/
def PeanoRelationSymbol : Type := Empty

/-- Constant symbols of the Peano language. -/
inductive PeanoConstantSymbol where
  | one

def PeanoFirstOrderFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := PeanoFunctionSymbol
  arity
    | .successor => 1

def PeanoFirstOrderRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := PeanoRelationSymbol
  arity := Empty.elim

/-- The first-order Peano signature `(1, S)`. -/
def PeanoFirstOrderSignature : LRA.VolumeI.Logic.Signature where
  Functions := PeanoFirstOrderFunctions
  Relations := PeanoFirstOrderRelations
  Constants := PeanoConstantSymbol

/-- Function symbols of the additive ordered language `(0, 1, +, <)`. -/
inductive AdditiveOrderedFunctionSymbol where
  | add

/-- Relation symbols of the additive ordered language. -/
inductive AdditiveOrderedRelationSymbol where
  | lt

/-- Constant symbols of the additive ordered language. -/
inductive AdditiveOrderedConstantSymbol where
  | zero
  | one

def AdditiveOrderedFirstOrderFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := AdditiveOrderedFunctionSymbol
  arity
    | .add => 2

def AdditiveOrderedFirstOrderRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := AdditiveOrderedRelationSymbol
  arity
    | .lt => 2

/-- The first-order additive ordered signature `(0, 1, +, <)`. -/
def AdditiveOrderedFirstOrderSignature : LRA.VolumeI.Logic.Signature where
  Functions := AdditiveOrderedFirstOrderFunctions
  Relations := AdditiveOrderedFirstOrderRelations
  Constants := AdditiveOrderedConstantSymbol

/-- Function symbols of the arithmetic ring language `(0, 1, +, *)`. -/
inductive ArithmeticRingFunctionSymbol where
  | add
  | mul

/-- There are no primitive relation symbols in the arithmetic ring language. -/
def ArithmeticRingRelationSymbol : Type := Empty

/-- Constant symbols of the arithmetic ring language. -/
inductive ArithmeticRingConstantSymbol where
  | zero
  | one

def ArithmeticRingFirstOrderFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := ArithmeticRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2

def ArithmeticRingFirstOrderRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := ArithmeticRingRelationSymbol
  arity := Empty.elim

/-- The first-order arithmetic ring signature `(0, 1, +, *)`. -/
def ArithmeticRingFirstOrderSignature : LRA.VolumeI.Logic.Signature where
  Functions := ArithmeticRingFirstOrderFunctions
  Relations := ArithmeticRingFirstOrderRelations
  Constants := ArithmeticRingConstantSymbol

/-- Function symbols of the ordered-semiring language `(0, 1, +, *, <)`. -/
inductive OrderedSemiringFunctionSymbol where
  | add
  | mul

/-- Relation symbols of the ordered-semiring language. -/
inductive OrderedSemiringRelationSymbol where
  | lt

/-- Constant symbols of the ordered-semiring language. -/
inductive OrderedSemiringConstantSymbol where
  | zero
  | one

def OrderedSemiringFirstOrderFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := OrderedSemiringFunctionSymbol
  arity
    | .add => 2
    | .mul => 2

def OrderedSemiringFirstOrderRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := OrderedSemiringRelationSymbol
  arity
    | .lt => 2

/-- The first-order ordered-semiring signature `(0, 1, +, *, <)`. -/
def OrderedSemiringFirstOrderSignature : LRA.VolumeI.Logic.Signature where
  Functions := OrderedSemiringFirstOrderFunctions
  Relations := OrderedSemiringFirstOrderRelations
  Constants := OrderedSemiringConstantSymbol

/-- Function symbols of the ordered-ring language `(0, 1, +, *, -, <)`. -/
inductive OrderedRingFunctionSymbol where
  | add
  | mul
  | neg

/-- Relation symbols of the ordered-ring language. -/
inductive OrderedRingRelationSymbol where
  | lt

/-- Constant symbols of the ordered-ring language. -/
inductive OrderedRingConstantSymbol where
  | zero
  | one

def OrderedRingFirstOrderFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := OrderedRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1

def OrderedRingFirstOrderRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := OrderedRingRelationSymbol
  arity
    | .lt => 2

/-- The first-order ordered-ring signature `(0, 1, +, *, -, <)`. -/
def OrderedRingFirstOrderSignature : LRA.VolumeI.Logic.Signature where
  Functions := OrderedRingFirstOrderFunctions
  Relations := OrderedRingFirstOrderRelations
  Constants := OrderedRingConstantSymbol

/-- Function symbols of the field language `(0, 1, +, *, -, ⁻¹)`. -/
inductive FieldFunctionSymbol where
  | add
  | mul
  | neg
  | inv

/-- There are no primitive relation symbols in the field language. -/
def FieldRelationSymbol : Type := Empty

/-- Constant symbols of the field language. -/
inductive FieldConstantSymbol where
  | zero
  | one

def FieldFirstOrderFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := FieldFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1
    | .inv => 1

def FieldFirstOrderRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := FieldRelationSymbol
  arity := Empty.elim

/-- The first-order field signature `(0, 1, +, *, -, ⁻¹)`. -/
def FieldFirstOrderSignature : LRA.VolumeI.Logic.Signature where
  Functions := FieldFirstOrderFunctions
  Relations := FieldFirstOrderRelations
  Constants := FieldConstantSymbol

/-- Function symbols of the ordered-field language `(0, 1, +, *, -, ⁻¹, <)`. -/
inductive OrderedFieldFunctionSymbol where
  | add
  | mul
  | neg
  | inv

/-- Relation symbols of the ordered-field language. -/
inductive OrderedFieldRelationSymbol where
  | lt

/-- Constant symbols of the ordered-field language. -/
inductive OrderedFieldConstantSymbol where
  | zero
  | one

def OrderedFieldFirstOrderFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := OrderedFieldFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1
    | .inv => 1

def OrderedFieldFirstOrderRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := OrderedFieldRelationSymbol
  arity
    | .lt => 2

/-- The first-order ordered-field signature `(0, 1, +, *, -, ⁻¹, <)`. -/
def OrderedFieldFirstOrderSignature : LRA.VolumeI.Logic.Signature where
  Functions := OrderedFieldFirstOrderFunctions
  Relations := OrderedFieldFirstOrderRelations
  Constants := OrderedFieldConstantSymbol

/--
**[Definition — Ordered Ring Signature]**

An ordered-ring signature contains only carrier data, operations, distinguished
elements, and order relations. Laws are stored separately.
-/
structure OrderedRingSignature where
  carrier : LRA.VolumeI.Set.LRACarrier
  zero : LRA.VolumeI.Operations.NullaryOperation carrier
  one : LRA.VolumeI.Operations.NullaryOperation carrier
  addition : LRA.VolumeI.Operations.BinaryOperation carrier
  negation : LRA.VolumeI.Operations.UnaryOperation carrier
  multiplication : LRA.VolumeI.Operations.BinaryOperation carrier
  StrictOrder : LRA.VolumeI.Relations.Endorelation carrier
  NonstrictOrder : LRA.VolumeI.Relations.Endorelation carrier

/-- The operation bundle for an ordered semiring. -/
structure OrderedSemiringSignature where
  carrier : LRA.VolumeI.Set.LRACarrier
  zero : LRA.VolumeI.Operations.NullaryOperation carrier
  one : LRA.VolumeI.Operations.NullaryOperation carrier
  addition : LRA.VolumeI.Operations.BinaryOperation carrier
  multiplication : LRA.VolumeI.Operations.BinaryOperation carrier
  StrictOrder : LRA.VolumeI.Relations.Endorelation carrier
  NonstrictOrder : LRA.VolumeI.Relations.Endorelation carrier

/--
**[Definition — Ordered Field Signature]**
-/
structure OrderedFieldSignature extends OrderedRingSignature where
  inverse : LRA.VolumeI.Operations.UnaryOperation carrier

/-- The operation bundle for a field without an order relation. -/
structure FieldSignature where
  carrier : LRA.VolumeI.Set.LRACarrier
  zero : LRA.VolumeI.Operations.NullaryOperation carrier
  one : LRA.VolumeI.Operations.NullaryOperation carrier
  addition : LRA.VolumeI.Operations.BinaryOperation carrier
  negation : LRA.VolumeI.Operations.UnaryOperation carrier
  multiplication : LRA.VolumeI.Operations.BinaryOperation carrier
  inverse : LRA.VolumeI.Operations.UnaryOperation carrier

/-- The operation bundle for a Peano system. -/
structure PeanoSignature where
  carrier : LRA.VolumeI.Set.LRACarrier
  one : LRA.VolumeI.Operations.NullaryOperation carrier
  successor : LRA.VolumeI.Operations.UnaryOperation carrier

/-- The operation bundle for the additive ordered language. -/
structure AdditiveOrderedSignature where
  carrier : LRA.VolumeI.Set.LRACarrier
  zero : LRA.VolumeI.Operations.NullaryOperation carrier
  one : LRA.VolumeI.Operations.NullaryOperation carrier
  addition : LRA.VolumeI.Operations.BinaryOperation carrier
  StrictOrder : LRA.VolumeI.Relations.Endorelation carrier
  NonstrictOrder : LRA.VolumeI.Relations.Endorelation carrier

/-- The operation bundle for the arithmetic ring language. -/
structure ArithmeticRingSignature where
  carrier : LRA.VolumeI.Set.LRACarrier
  zero : LRA.VolumeI.Operations.NullaryOperation carrier
  one : LRA.VolumeI.Operations.NullaryOperation carrier
  addition : LRA.VolumeI.Operations.BinaryOperation carrier
  multiplication : LRA.VolumeI.Operations.BinaryOperation carrier

namespace OrderedRingSignature

abbrev Subtraction
    (signature : OrderedRingSignature) :
    LRA.VolumeI.Operations.BinaryOperation signature.carrier :=
  fun first second =>
    signature.addition first (signature.negation second)

end OrderedRingSignature

namespace OrderedFieldSignature

def InverseDomain
    (signature : OrderedFieldSignature)
    (value : signature.carrier) : Prop :=
  value ≠ signature.zero

def PartialInverse
    (signature : OrderedFieldSignature) :
    LRA.VolumeI.Operations.PartialUnaryOperation signature.carrier where
  domain := InverseDomain signature
  value := fun value _ => signature.inverse value

def PartialDivision
    (signature : OrderedFieldSignature) :
    LRA.VolumeI.Operations.PartialBinaryOperation signature.carrier where
  domain := fun _ divisor => divisor ≠ signature.zero
  value := fun dividend divisor _ =>
    signature.multiplication dividend (signature.inverse divisor)

end OrderedFieldSignature

/-- Build a first-order model of the Peano signature from a carrier and operations. -/
def BuildPeanoModel
    (signature : PeanoSignature) :
    LRA.VolumeI.Logic.FirstOrder.Model PeanoFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one

/-- Build a first-order model of the additive ordered signature. -/
def BuildAdditiveOrderedModel
    (signature : AdditiveOrderedSignature) :
    LRA.VolumeI.Logic.FirstOrder.Model AdditiveOrderedFirstOrderSignature where
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

/-- Build a first-order model of the arithmetic ring signature. -/
def BuildArithmeticRingModel
    (signature : ArithmeticRingSignature) :
    LRA.VolumeI.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature where
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

/-- Build a first-order model of the ordered-semiring signature. -/
def BuildOrderedSemiringModel
    (signature : OrderedSemiringSignature) :
    LRA.VolumeI.Logic.FirstOrder.Model OrderedSemiringFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiplication (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation
    | .lt, args =>
        signature.StrictOrder (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

/-- Build a first-order model of the ordered-ring signature. -/
def BuildOrderedRingModel
    (signature : OrderedRingSignature) :
    LRA.VolumeI.Logic.FirstOrder.Model OrderedRingFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiplication (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.negation (args ⟨0, by decide⟩)
  interpretRelation
    | .lt, args =>
        signature.StrictOrder (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

/-- Build a first-order model of the field signature. -/
def BuildFieldModel
    (signature : FieldSignature) :
    LRA.VolumeI.Logic.FirstOrder.Model FieldFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiplication (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.negation (args ⟨0, by decide⟩)
    | .inv, args => signature.inverse (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

/-- Build a first-order model of the ordered-field signature. -/
def BuildOrderedFieldModel
    (signature : OrderedFieldSignature) :
    LRA.VolumeI.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiplication (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.negation (args ⟨0, by decide⟩)
    | .inv, args => signature.inverse (args ⟨0, by decide⟩)
  interpretRelation
    | .lt, args =>
        signature.StrictOrder (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

end LRA.VolumeI.Algebra.Models
