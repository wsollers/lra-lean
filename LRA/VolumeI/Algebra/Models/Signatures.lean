-- LRA/VolumeI/Algebra/Models/Signatures.lean
-- Shared operation signatures for configurable number-system models.

import LRA.VolumeI.Set
import LRA.VolumeI.Operations
import LRA.VolumeI.Relations
import LRA.VolumeI.Logic.Model.Model

namespace LRA.Algebra.Models

/-!
Volume I label: algebraic-model-signatures
Lean module: LRA.Algebra.Models.Signatures
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

/--
Function symbols of the Peano language `(1, S)`.

Logical form:

```lean
inductive PeanoFunctionSymbol where
  | successor
```
-/
inductive PeanoFunctionSymbol where
  | successor

/--
There are no primitive relation symbols in the Peano language here.

Logical form:

```lean
def PeanoRelationSymbol : Type := Empty
```
-/
def PeanoRelationSymbol : Type := Empty

/--
Constant symbols of the Peano language.

Logical form:

```lean
inductive PeanoConstantSymbol where
  | one
```
-/
inductive PeanoConstantSymbol where
  | one
/--
`PeanoFirstOrderFunctions` exposes this formal declaration.

Logical form:

```lean
def PeanoFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := PeanoFunctionSymbol
  arity
    | .successor => 1
```
-/

def PeanoFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := PeanoFunctionSymbol
  arity
    | .successor => 1
/--
`PeanoFirstOrderRelations` exposes this formal declaration.

Logical form:

```lean
def PeanoFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := PeanoRelationSymbol
  arity := Empty.elim
```
-/

def PeanoFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := PeanoRelationSymbol
  arity := Empty.elim

/--
The first-order Peano signature `(1, S)`.

Logical form:

```lean
def PeanoFirstOrderSignature : LRA.Logic.Signature where
  Functions := PeanoFirstOrderFunctions
  Relations := PeanoFirstOrderRelations
  Constants := PeanoConstantSymbol
```
-/
def PeanoFirstOrderSignature : LRA.Logic.Signature where
  Functions := PeanoFirstOrderFunctions
  Relations := PeanoFirstOrderRelations
  Constants := PeanoConstantSymbol

/--
Function symbols of the additive ordered language `(0, 1, +, <)`.

Logical form:

```lean
inductive AdditiveOrderedFunctionSymbol where
  | add
```
-/
inductive AdditiveOrderedFunctionSymbol where
  | add

/--
Relation symbols of the additive ordered language.

Logical form:

```lean
inductive AdditiveOrderedRelationSymbol where
  | lt
```
-/
inductive AdditiveOrderedRelationSymbol where
  | lt

/--
Constant symbols of the additive ordered language.

Logical form:

```lean
inductive AdditiveOrderedConstantSymbol where
  | zero
  | one
```
-/
inductive AdditiveOrderedConstantSymbol where
  | zero
  | one
/--
`AdditiveOrderedFirstOrderFunctions` exposes this formal declaration.

Logical form:

```lean
def AdditiveOrderedFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := AdditiveOrderedFunctionSymbol
  arity
    | .add => 2
```
-/

def AdditiveOrderedFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := AdditiveOrderedFunctionSymbol
  arity
    | .add => 2
/--
`AdditiveOrderedFirstOrderRelations` exposes this formal declaration.

Logical form:

```lean
def AdditiveOrderedFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := AdditiveOrderedRelationSymbol
  arity
    | .lt => 2
```
-/

def AdditiveOrderedFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := AdditiveOrderedRelationSymbol
  arity
    | .lt => 2

/--
The first-order additive ordered signature `(0, 1, +, <)`.

Logical form:

```lean
def AdditiveOrderedFirstOrderSignature : LRA.Logic.Signature where
  Functions := AdditiveOrderedFirstOrderFunctions
  Relations := AdditiveOrderedFirstOrderRelations
  Constants := AdditiveOrderedConstantSymbol
```
-/
def AdditiveOrderedFirstOrderSignature : LRA.Logic.Signature where
  Functions := AdditiveOrderedFirstOrderFunctions
  Relations := AdditiveOrderedFirstOrderRelations
  Constants := AdditiveOrderedConstantSymbol

/--
Function symbols of the arithmetic ring language `(0, 1, +, *)`.

Logical form:

```lean
inductive ArithmeticRingFunctionSymbol where
  | add
  | mul
```
-/
inductive ArithmeticRingFunctionSymbol where
  | add
  | mul

/--
There are no primitive relation symbols in the arithmetic ring language.

Logical form:

```lean
def ArithmeticRingRelationSymbol : Type := Empty
```
-/
def ArithmeticRingRelationSymbol : Type := Empty

/--
Constant symbols of the arithmetic ring language.

Logical form:

```lean
inductive ArithmeticRingConstantSymbol where
  | zero
  | one
```
-/
inductive ArithmeticRingConstantSymbol where
  | zero
  | one
/--
`ArithmeticRingFirstOrderFunctions` exposes this formal declaration.

Logical form:

```lean
def ArithmeticRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := ArithmeticRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
```
-/

def ArithmeticRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := ArithmeticRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
/--
`ArithmeticRingFirstOrderRelations` exposes this formal declaration.

Logical form:

```lean
def ArithmeticRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := ArithmeticRingRelationSymbol
  arity := Empty.elim
```
-/

def ArithmeticRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := ArithmeticRingRelationSymbol
  arity := Empty.elim

/--
The first-order arithmetic ring signature `(0, 1, +, *)`.

Logical form:

```lean
def ArithmeticRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := ArithmeticRingFirstOrderFunctions
  Relations := ArithmeticRingFirstOrderRelations
  Constants := ArithmeticRingConstantSymbol
```
-/
def ArithmeticRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := ArithmeticRingFirstOrderFunctions
  Relations := ArithmeticRingFirstOrderRelations
  Constants := ArithmeticRingConstantSymbol

/--
Function symbols of the ordered-semiring language `(0, 1, +, *, <)`.

Logical form:

```lean
inductive OrderedSemiringFunctionSymbol where
  | add
  | mul
```
-/
inductive OrderedSemiringFunctionSymbol where
  | add
  | mul

/--
Relation symbols of the ordered-semiring language.

Logical form:

```lean
inductive OrderedSemiringRelationSymbol where
  | lt
```
-/
inductive OrderedSemiringRelationSymbol where
  | lt

/--
Constant symbols of the ordered-semiring language.

Logical form:

```lean
inductive OrderedSemiringConstantSymbol where
  | zero
  | one
```
-/
inductive OrderedSemiringConstantSymbol where
  | zero
  | one
/--
`OrderedSemiringFirstOrderFunctions` exposes this formal declaration.

Logical form:

```lean
def OrderedSemiringFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedSemiringFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
```
-/

def OrderedSemiringFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedSemiringFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
/--
`OrderedSemiringFirstOrderRelations` exposes this formal declaration.

Logical form:

```lean
def OrderedSemiringFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedSemiringRelationSymbol
  arity
    | .lt => 2
```
-/

def OrderedSemiringFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedSemiringRelationSymbol
  arity
    | .lt => 2

/--
The first-order ordered-semiring signature `(0, 1, +, *, <)`.

Logical form:

```lean
def OrderedSemiringFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedSemiringFirstOrderFunctions
  Relations := OrderedSemiringFirstOrderRelations
  Constants := OrderedSemiringConstantSymbol
```
-/
def OrderedSemiringFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedSemiringFirstOrderFunctions
  Relations := OrderedSemiringFirstOrderRelations
  Constants := OrderedSemiringConstantSymbol

/--
Function symbols of the ordered-ring language `(0, 1, +, *, -, <)`.

Logical form:

```lean
inductive OrderedRingFunctionSymbol where
  | add
  | mul
  | neg
```
-/
inductive OrderedRingFunctionSymbol where
  | add
  | mul
  | neg

/--
Relation symbols of the ordered-ring language.

Logical form:

```lean
inductive OrderedRingRelationSymbol where
  | lt
```
-/
inductive OrderedRingRelationSymbol where
  | lt

/--
Constant symbols of the ordered-ring language.

Logical form:

```lean
inductive OrderedRingConstantSymbol where
  | zero
  | one
```
-/
inductive OrderedRingConstantSymbol where
  | zero
  | one
/--
`OrderedRingFirstOrderFunctions` exposes this formal declaration.

Logical form:

```lean
def OrderedRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1
```
-/

def OrderedRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1
/--
`OrderedRingFirstOrderRelations` exposes this formal declaration.

Logical form:

```lean
def OrderedRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedRingRelationSymbol
  arity
    | .lt => 2
```
-/

def OrderedRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedRingRelationSymbol
  arity
    | .lt => 2

/--
The first-order ordered-ring signature `(0, 1, +, *, -, <)`.

Logical form:

```lean
def OrderedRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedRingFirstOrderFunctions
  Relations := OrderedRingFirstOrderRelations
  Constants := OrderedRingConstantSymbol
```
-/
def OrderedRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedRingFirstOrderFunctions
  Relations := OrderedRingFirstOrderRelations
  Constants := OrderedRingConstantSymbol

/--
Function symbols of the field language `(0, 1, +, *, -, ⁻¹)`.

Logical form:

```lean
inductive FieldFunctionSymbol where
  | add
  | mul
  | neg
  | inv
```
-/
inductive FieldFunctionSymbol where
  | add
  | mul
  | neg
  | inv

/--
There are no primitive relation symbols in the field language.

Logical form:

```lean
def FieldRelationSymbol : Type := Empty
```
-/
def FieldRelationSymbol : Type := Empty

/--
Constant symbols of the field language.

Logical form:

```lean
inductive FieldConstantSymbol where
  | zero
  | one
```
-/
inductive FieldConstantSymbol where
  | zero
  | one
/--
`FieldFirstOrderFunctions` exposes this formal declaration.

Logical form:

```lean
def FieldFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := FieldFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1
    | .inv => 1
```
-/

def FieldFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := FieldFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1
    | .inv => 1
/--
`FieldFirstOrderRelations` exposes this formal declaration.

Logical form:

```lean
def FieldFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := FieldRelationSymbol
  arity := Empty.elim
```
-/

def FieldFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := FieldRelationSymbol
  arity := Empty.elim

/--
The first-order field signature `(0, 1, +, *, -, ⁻¹)`.

Logical form:

```lean
def FieldFirstOrderSignature : LRA.Logic.Signature where
  Functions := FieldFirstOrderFunctions
  Relations := FieldFirstOrderRelations
  Constants := FieldConstantSymbol
```
-/
def FieldFirstOrderSignature : LRA.Logic.Signature where
  Functions := FieldFirstOrderFunctions
  Relations := FieldFirstOrderRelations
  Constants := FieldConstantSymbol

/--
Function symbols of the ordered-field language `(0, 1, +, *, -, ⁻¹, <)`.

Logical form:

```lean
inductive OrderedFieldFunctionSymbol where
  | add
  | mul
  | neg
  | inv
```
-/
inductive OrderedFieldFunctionSymbol where
  | add
  | mul
  | neg
  | inv

/--
Relation symbols of the ordered-field language.

Logical form:

```lean
inductive OrderedFieldRelationSymbol where
  | lt
```
-/
inductive OrderedFieldRelationSymbol where
  | lt

/--
Constant symbols of the ordered-field language.

Logical form:

```lean
inductive OrderedFieldConstantSymbol where
  | zero
  | one
```
-/
inductive OrderedFieldConstantSymbol where
  | zero
  | one
/--
`OrderedFieldFirstOrderFunctions` exposes this formal declaration.

Logical form:

```lean
def OrderedFieldFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedFieldFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1
    | .inv => 1
```
-/

def OrderedFieldFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedFieldFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1
    | .inv => 1
/--
`OrderedFieldFirstOrderRelations` exposes this formal declaration.

Logical form:

```lean
def OrderedFieldFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedFieldRelationSymbol
  arity
    | .lt => 2
```
-/

def OrderedFieldFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedFieldRelationSymbol
  arity
    | .lt => 2

/--
The first-order ordered-field signature `(0, 1, +, *, -, ⁻¹, <)`.

Logical form:

```lean
def OrderedFieldFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedFieldFirstOrderFunctions
  Relations := OrderedFieldFirstOrderRelations
  Constants := OrderedFieldConstantSymbol
```
-/
def OrderedFieldFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedFieldFirstOrderFunctions
  Relations := OrderedFieldFirstOrderRelations
  Constants := OrderedFieldConstantSymbol

/--
**[Definition — Ordered Ring Signature]**

An ordered-ring signature contains only carrier data, operations, distinguished
elements, and order relations. Laws are stored separately.

Logical form:

```lean
structure OrderedRingSignature where
  carrier : Type u
  zero : LRA.Algebra.Operation.NullaryOperation carrier
  one : LRA.Algebra.Operation.NullaryOperation carrier
  addition : LRA.Algebra.Operation.BinaryOperation carrier
  negation : LRA.Algebra.Operation.UnaryOperation carrier
  multiplication : LRA.Algebra.Operation.BinaryOperation carrier
  StrictOrder : LRA.Relation.Endorelation carrier
  NonstrictOrder : LRA.Relation.Endorelation carrier
```
-/
structure OrderedRingSignature where
  carrier : Type u
  zero : LRA.Algebra.Operation.NullaryOperation carrier
  one : LRA.Algebra.Operation.NullaryOperation carrier
  addition : LRA.Algebra.Operation.BinaryOperation carrier
  negation : LRA.Algebra.Operation.UnaryOperation carrier
  multiplication : LRA.Algebra.Operation.BinaryOperation carrier
  StrictOrder : LRA.Relation.Endorelation carrier
  NonstrictOrder : LRA.Relation.Endorelation carrier

/--
The operation bundle for an ordered semiring.

Logical form:

```lean
structure OrderedSemiringSignature where
  carrier : Type u
  zero : LRA.Algebra.Operation.NullaryOperation carrier
  one : LRA.Algebra.Operation.NullaryOperation carrier
  addition : LRA.Algebra.Operation.BinaryOperation carrier
  multiplication : LRA.Algebra.Operation.BinaryOperation carrier
  StrictOrder : LRA.Relation.Endorelation carrier
  NonstrictOrder : LRA.Relation.Endorelation carrier
```
-/
structure OrderedSemiringSignature where
  carrier : Type u
  zero : LRA.Algebra.Operation.NullaryOperation carrier
  one : LRA.Algebra.Operation.NullaryOperation carrier
  addition : LRA.Algebra.Operation.BinaryOperation carrier
  multiplication : LRA.Algebra.Operation.BinaryOperation carrier
  StrictOrder : LRA.Relation.Endorelation carrier
  NonstrictOrder : LRA.Relation.Endorelation carrier

/--
**[Definition — Ordered Field Signature]**

Logical form:

```lean
structure OrderedFieldSignature extends OrderedRingSignature where
  inverse : LRA.Algebra.Operation.UnaryOperation carrier
```
-/
structure OrderedFieldSignature extends OrderedRingSignature where
  inverse : LRA.Algebra.Operation.UnaryOperation carrier

/--
The operation bundle for a field without an order relation.

Logical form:

```lean
structure FieldSignature where
  carrier : Type u
  zero : LRA.Algebra.Operation.NullaryOperation carrier
  one : LRA.Algebra.Operation.NullaryOperation carrier
  addition : LRA.Algebra.Operation.BinaryOperation carrier
  negation : LRA.Algebra.Operation.UnaryOperation carrier
  multiplication : LRA.Algebra.Operation.BinaryOperation carrier
  inverse : LRA.Algebra.Operation.UnaryOperation carrier
```
-/
structure FieldSignature where
  carrier : Type u
  zero : LRA.Algebra.Operation.NullaryOperation carrier
  one : LRA.Algebra.Operation.NullaryOperation carrier
  addition : LRA.Algebra.Operation.BinaryOperation carrier
  negation : LRA.Algebra.Operation.UnaryOperation carrier
  multiplication : LRA.Algebra.Operation.BinaryOperation carrier
  inverse : LRA.Algebra.Operation.UnaryOperation carrier

/--
The operation bundle for a Peano system.

Logical form:

```lean
structure PeanoSignature where
  carrier : Type u
  one : LRA.Algebra.Operation.NullaryOperation carrier
  successor : LRA.Algebra.Operation.UnaryOperation carrier
```
-/
structure PeanoSignature where
  carrier : Type u
  one : LRA.Algebra.Operation.NullaryOperation carrier
  successor : LRA.Algebra.Operation.UnaryOperation carrier

/--
The operation bundle for the additive ordered language.

Logical form:

```lean
structure AdditiveOrderedSignature where
  carrier : Type u
  zero : LRA.Algebra.Operation.NullaryOperation carrier
  one : LRA.Algebra.Operation.NullaryOperation carrier
  addition : LRA.Algebra.Operation.BinaryOperation carrier
  StrictOrder : LRA.Relation.Endorelation carrier
  NonstrictOrder : LRA.Relation.Endorelation carrier
```
-/
structure AdditiveOrderedSignature where
  carrier : Type u
  zero : LRA.Algebra.Operation.NullaryOperation carrier
  one : LRA.Algebra.Operation.NullaryOperation carrier
  addition : LRA.Algebra.Operation.BinaryOperation carrier
  StrictOrder : LRA.Relation.Endorelation carrier
  NonstrictOrder : LRA.Relation.Endorelation carrier

/--
The operation bundle for the arithmetic ring language.

Logical form:

```lean
structure ArithmeticRingSignature where
  carrier : Type u
  zero : LRA.Algebra.Operation.NullaryOperation carrier
  one : LRA.Algebra.Operation.NullaryOperation carrier
  addition : LRA.Algebra.Operation.BinaryOperation carrier
  multiplication : LRA.Algebra.Operation.BinaryOperation carrier
```
-/
structure ArithmeticRingSignature where
  carrier : Type u
  zero : LRA.Algebra.Operation.NullaryOperation carrier
  one : LRA.Algebra.Operation.NullaryOperation carrier
  addition : LRA.Algebra.Operation.BinaryOperation carrier
  multiplication : LRA.Algebra.Operation.BinaryOperation carrier


end LRA.Algebra.Models


namespace LRA.Algebra.Models.OrderedRingSignature
/--
`Subtraction` exposes this formal declaration.

Logical form:

```lean
abbrev Subtraction
    (signature : OrderedRingSignature) :
    LRA.Algebra.Operation.BinaryOperation signature.carrier :=
  fun first second =>
    signature.addition first (signature.negation second)
```
-/

abbrev Subtraction
    (signature : OrderedRingSignature) :
    LRA.Algebra.Operation.BinaryOperation signature.carrier :=
  fun first second =>
    signature.addition first (signature.negation second)

end LRA.Algebra.Models.OrderedRingSignature

namespace LRA.Algebra.Models.OrderedFieldSignature
/--
`InverseDomain` exposes this formal declaration.

Logical form:

```lean
def InverseDomain
    (signature : OrderedFieldSignature)
    (value : signature.carrier) : Prop :=
  value ≠ signature.zero
```
-/

def InverseDomain
    (signature : OrderedFieldSignature)
    (value : signature.carrier) : Prop :=
  value ≠ signature.zero
/--
`PartialInverse` exposes this formal declaration.

Logical form:

```lean
def PartialInverse
    (signature : OrderedFieldSignature) :
    LRA.Algebra.Operation.PartialUnaryOperation signature.carrier where
  Domain := InverseDomain signature
  Value := fun value _ => signature.inverse value
```
-/

def PartialInverse
    (signature : OrderedFieldSignature) :
    LRA.Algebra.Operation.PartialUnaryOperation signature.carrier where
  Domain := InverseDomain signature
  Value := fun value _ => signature.inverse value
/--
`PartialDivision` exposes this formal declaration.

Logical form:

```lean
def PartialDivision
    (signature : OrderedFieldSignature) :
    LRA.Algebra.Operation.PartialBinaryOperation signature.carrier where
  Domain := fun _ divisor => divisor ≠ signature.zero
  Value := fun dividend divisor _ =>
    signature.multiplication dividend (signature.inverse divisor)
```
-/

def PartialDivision
    (signature : OrderedFieldSignature) :
    LRA.Algebra.Operation.PartialBinaryOperation signature.carrier where
  Domain := fun _ divisor => divisor ≠ signature.zero
  Value := fun dividend divisor _ =>
    signature.multiplication dividend (signature.inverse divisor)

end LRA.Algebra.Models.OrderedFieldSignature

namespace LRA.Algebra.Models

/--
Build a first-order model of the Peano signature from a carrier and operations.

Logical form:

```lean
def BuildPeanoModel
    (signature : PeanoSignature) :
    LRA.Logic.FirstOrder.Model PeanoFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one
```
-/
def BuildPeanoModel
    (signature : PeanoSignature) :
    LRA.Logic.FirstOrder.Model PeanoFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one

/--
Build a first-order model of the additive ordered signature.

Logical form:

```lean
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
```
-/
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

/--
Build a first-order model of the arithmetic ring signature.

Logical form:

```lean
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
```
-/
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

/--
Build a first-order model of the ordered-semiring signature.

Logical form:

```lean
def BuildOrderedSemiringModel
    (signature : OrderedSemiringSignature) :
    LRA.Logic.FirstOrder.Model OrderedSemiringFirstOrderSignature where
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
```
-/
def BuildOrderedSemiringModel
    (signature : OrderedSemiringSignature) :
    LRA.Logic.FirstOrder.Model OrderedSemiringFirstOrderSignature where
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

/--
Build a first-order model of the ordered-ring signature.

Logical form:

```lean
def BuildOrderedRingModel
    (signature : OrderedRingSignature) :
    LRA.Logic.FirstOrder.Model OrderedRingFirstOrderSignature where
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
```
-/
def BuildOrderedRingModel
    (signature : OrderedRingSignature) :
    LRA.Logic.FirstOrder.Model OrderedRingFirstOrderSignature where
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

/--
Build a first-order model of the field signature.

Logical form:

```lean
def BuildFieldModel
    (signature : FieldSignature) :
    LRA.Logic.FirstOrder.Model FieldFirstOrderSignature where
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
```
-/
def BuildFieldModel
    (signature : FieldSignature) :
    LRA.Logic.FirstOrder.Model FieldFirstOrderSignature where
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

/--
Build a first-order model of the ordered-field signature.

Logical form:

```lean
def BuildOrderedFieldModel
    (signature : OrderedFieldSignature) :
    LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature where
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
```
-/
def BuildOrderedFieldModel
    (signature : OrderedFieldSignature) :
    LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature where
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

end LRA.Algebra.Models
