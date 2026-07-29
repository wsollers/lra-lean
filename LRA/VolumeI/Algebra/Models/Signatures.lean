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

Lower-case names such as `orderedRingSignature` are model-theoretic
signatures: they describe the non-logical language interpreted by a
`FirstOrder.Model`.

Upper-case names such as `OrderedRingSignature` are operation bundles: a
carrier together with concrete operations and relations. The model builders
below turn those bundles into first-order models.
-/

/-- Function symbols of the Peano language `(1, S)`. -/
inductive PeanoFunctionSymbol where
  | successor

/-- There are no primitive relation symbols in the Peano language here. -/
def PeanoRelationSymbol : Type := Empty

/-- Constant symbols of the Peano language. -/
inductive PeanoConstantSymbol where
  | one

def peanoFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := PeanoFunctionSymbol
  arity
    | .successor => 1

def peanoRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := PeanoRelationSymbol
  arity := Empty.elim

/-- The first-order Peano signature `(1, S)`. -/
def peanoSignature : LRA.VolumeI.Logic.Signature where
  Functions := peanoFunctions
  Relations := peanoRelations
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

def additiveOrderedFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := AdditiveOrderedFunctionSymbol
  arity
    | .add => 2

def additiveOrderedRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := AdditiveOrderedRelationSymbol
  arity
    | .lt => 2

/-- The first-order additive ordered signature `(0, 1, +, <)`. -/
def additiveOrderedSignature : LRA.VolumeI.Logic.Signature where
  Functions := additiveOrderedFunctions
  Relations := additiveOrderedRelations
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

def arithmeticRingFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := ArithmeticRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2

def arithmeticRingRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := ArithmeticRingRelationSymbol
  arity := Empty.elim

/-- The first-order arithmetic ring signature `(0, 1, +, *)`. -/
def arithmeticRingSignature : LRA.VolumeI.Logic.Signature where
  Functions := arithmeticRingFunctions
  Relations := arithmeticRingRelations
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

def orderedSemiringFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := OrderedSemiringFunctionSymbol
  arity
    | .add => 2
    | .mul => 2

def orderedSemiringRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := OrderedSemiringRelationSymbol
  arity
    | .lt => 2

/-- The first-order ordered-semiring signature `(0, 1, +, *, <)`. -/
def orderedSemiringSignature : LRA.VolumeI.Logic.Signature where
  Functions := orderedSemiringFunctions
  Relations := orderedSemiringRelations
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

def orderedRingFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := OrderedRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1

def orderedRingRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := OrderedRingRelationSymbol
  arity
    | .lt => 2

/-- The first-order ordered-ring signature `(0, 1, +, *, -, <)`. -/
def orderedRingSignature : LRA.VolumeI.Logic.Signature where
  Functions := orderedRingFunctions
  Relations := orderedRingRelations
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

def fieldFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := FieldFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1
    | .inv => 1

def fieldRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := FieldRelationSymbol
  arity := Empty.elim

/-- The first-order field signature `(0, 1, +, *, -, ⁻¹)`. -/
def fieldSignature : LRA.VolumeI.Logic.Signature where
  Functions := fieldFunctions
  Relations := fieldRelations
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

def orderedFieldFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := OrderedFieldFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1
    | .inv => 1

def orderedFieldRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := OrderedFieldRelationSymbol
  arity
    | .lt => 2

/-- The first-order ordered-field signature `(0, 1, +, *, -, ⁻¹, <)`. -/
def orderedFieldSignature : LRA.VolumeI.Logic.Signature where
  Functions := orderedFieldFunctions
  Relations := orderedFieldRelations
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
  strict_order : LRA.VolumeI.Relations.Endorelation carrier
  nonstrict_order : LRA.VolumeI.Relations.Endorelation carrier

/-- The operation bundle for an ordered semiring. -/
structure OrderedSemiringSignature where
  carrier : LRA.VolumeI.Set.LRACarrier
  zero : LRA.VolumeI.Operations.NullaryOperation carrier
  one : LRA.VolumeI.Operations.NullaryOperation carrier
  addition : LRA.VolumeI.Operations.BinaryOperation carrier
  multiplication : LRA.VolumeI.Operations.BinaryOperation carrier
  strict_order : LRA.VolumeI.Relations.Endorelation carrier
  nonstrict_order : LRA.VolumeI.Relations.Endorelation carrier

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
  strict_order : LRA.VolumeI.Relations.Endorelation carrier
  nonstrict_order : LRA.VolumeI.Relations.Endorelation carrier

/-- The operation bundle for the arithmetic ring language. -/
structure ArithmeticRingSignature where
  carrier : LRA.VolumeI.Set.LRACarrier
  zero : LRA.VolumeI.Operations.NullaryOperation carrier
  one : LRA.VolumeI.Operations.NullaryOperation carrier
  addition : LRA.VolumeI.Operations.BinaryOperation carrier
  multiplication : LRA.VolumeI.Operations.BinaryOperation carrier

namespace OrderedRingSignature

abbrev subtraction
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
def peanoModel
    (signature : PeanoSignature) :
    LRA.VolumeI.Logic.FirstOrder.Model peanoSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
  interpretRelation := fun relation_symbol => nomatch relation_symbol
  interpretConstant
    | .one => signature.one

/-- Build a first-order model of the additive ordered signature. -/
def additiveOrderedModel
    (signature : AdditiveOrderedSignature) :
    LRA.VolumeI.Logic.FirstOrder.Model additiveOrderedSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation
    | .lt, args =>
        signature.strict_order (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

/-- Build a first-order model of the arithmetic ring signature. -/
def arithmeticRingModel
    (signature : ArithmeticRingSignature) :
    LRA.VolumeI.Logic.FirstOrder.Model arithmeticRingSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiplication (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun relation_symbol => nomatch relation_symbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

/-- Build a first-order model of the ordered-semiring signature. -/
def orderedSemiringModel
    (signature : OrderedSemiringSignature) :
    LRA.VolumeI.Logic.FirstOrder.Model orderedSemiringSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiplication (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation
    | .lt, args =>
        signature.strict_order (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

/-- Build a first-order model of the ordered-ring signature. -/
def orderedRingModel
    (signature : OrderedRingSignature) :
    LRA.VolumeI.Logic.FirstOrder.Model orderedRingSignature where
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
        signature.strict_order (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

/-- Build a first-order model of the field signature. -/
def fieldModel
    (signature : FieldSignature) :
    LRA.VolumeI.Logic.FirstOrder.Model fieldSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiplication (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.negation (args ⟨0, by decide⟩)
    | .inv, args => signature.inverse (args ⟨0, by decide⟩)
  interpretRelation := fun relation_symbol => nomatch relation_symbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

/-- Build a first-order model of the ordered-field signature. -/
def orderedFieldModel
    (signature : OrderedFieldSignature) :
    LRA.VolumeI.Logic.FirstOrder.Model orderedFieldSignature where
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
        signature.strict_order (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

end LRA.VolumeI.Algebra.Models
