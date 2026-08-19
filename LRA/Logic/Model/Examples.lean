import LRA.Logic.Model.Model
import LRA.Logic.Language.Examples

namespace LRA.Logic.FirstOrder

/-!
Worked examples of `Model`.

Concrete interpretations of the three signatures built in
`Language.Examples`: `Nat` under multiplication for `L_Monoid`, `Nat` under
addition for `L_AdditiveMonoid`, and `Int` under the full ring operations
and order for `L_OrderedRing`. These are the first models built against real
signatures, and the first place `interpretFunction`/`interpretRelation`/
`interpretConstant` are actually filled in with concrete behavior rather
than left as abstract fields.

Two recurring pitfalls, worth naming once:

1. `Fin (S.functionArity f)` is not a literal-sized `Fin` as far as Lean's
   elaborator is concerned -- `S.functionArity f` is an opaque `Nat`-valued
   expression, not a numeral, even though it reduces to one (e.g. `2`) by
   `rfl`. Numeral-literal indexing like `args 0` fails to synthesize an
   `OfNat` instance. The fix is to build the `Fin` index explicitly, with
   the bound proof spelled out (`⟨0, by decide⟩`).

2. `natMulMonoidModel.Domain` is definitionally `Nat` (and `intOrderedRingModel.Domain`
   definitionally `Int`), but a theorem statement built by projecting a
   variable's type through `M.Domain` does not reliably let the elaborator
   find operation/numeral instances (`HMul`, `Neg`, `LT`, `OfNat`, ...) for
   the underlying concrete type -- whether it does depends on how deeply
   the elaborator is willing to unfold the projection, which varied between
   `Nat` (worked) and `Int` (did not) in practice here. The robust fix is
   to state such theorems with variables and numerals typed directly
   against the concrete underlying type (`Int`, not `intOrderedRingModel.Domain`),
   and let defeq bridge the two sides when `rfl` checks the goal -- rather
   than relying on the elaborator to unfold a field projection during
   instance search.
-/

/-!
`Nat` as a model of `L_Monoid = ⟨*, 1⟩`, under multiplication.
-/

/-- `Nat` under multiplication, interpreting `L_Monoid`: `mul` as `Nat`
multiplication, `one` as `1`.

Logical form:

```lean
def natMulMonoidModel : Model monoidSignature where
  Domain := Nat
  domainNonempty := ⟨0⟩
  interpretFunction
    | .mul, args => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
  interpretRelation := fun r => nomatch r
  interpretConstant
    | .one => 1
```
-/
def natMulMonoidModel : Model monoidSignature where
  Domain := Nat
  domainNonempty := ⟨0⟩
  interpretFunction
    | .mul, args => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
  interpretRelation := fun r => nomatch r
  interpretConstant
    | .one => 1

/--
`natMulMonoidModel.mulComputesMultiplication` states mul computes multiplication.

Logical form:

```lean
theorem natMulMonoidModel.mulComputesMultiplication
    (a b : Nat) :
    natMulMonoidModel.interpretFunction .mul
      (fun i => if i.val = 0 then a else b) = a * b
```
-/
theorem natMulMonoidModel.mulComputesMultiplication
    (a b : Nat) :
    natMulMonoidModel.interpretFunction .mul
      (fun i => if i.val = 0 then a else b) = a * b := rfl

/--
`natMulMonoidModel.oneComputesOne` states one computes one.

Logical form:

```lean
theorem natMulMonoidModel.oneComputesOne :
    natMulMonoidModel.interpretConstant .one = (1 : Nat)
```
-/
theorem natMulMonoidModel.oneComputesOne :
    natMulMonoidModel.interpretConstant .one = (1 : Nat) := rfl

/-!
`Nat` as a model of `L_AdditiveMonoid = ⟨+, 0⟩`, under addition.
-/

/-- `Nat` under addition, interpreting `L_AdditiveMonoid`: `add` as `Nat`
addition, `zero` as `0`.

Logical form:

```lean
def natAddMonoidModel : Model additiveMonoidSignature where
  Domain := Nat
  domainNonempty := ⟨0⟩
  interpretFunction
    | .add, args => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
  interpretRelation := fun r => nomatch r
  interpretConstant
    | .zero => 0
```
-/
def natAddMonoidModel : Model additiveMonoidSignature where
  Domain := Nat
  domainNonempty := ⟨0⟩
  interpretFunction
    | .add, args => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
  interpretRelation := fun r => nomatch r
  interpretConstant
    | .zero => 0

/--
`natAddMonoidModel.addComputesAddition` states add computes addition.

Logical form:

```lean
theorem natAddMonoidModel.addComputesAddition
    (a b : Nat) :
    natAddMonoidModel.interpretFunction .add
      (fun i => if i.val = 0 then a else b) = a + b
```
-/
theorem natAddMonoidModel.addComputesAddition
    (a b : Nat) :
    natAddMonoidModel.interpretFunction .add
      (fun i => if i.val = 0 then a else b) = a + b := rfl

/--
`natAddMonoidModel.zeroComputesZero` states zero computes zero.

Logical form:

```lean
theorem natAddMonoidModel.zeroComputesZero :
    natAddMonoidModel.interpretConstant .zero = (0 : Nat)
```
-/
theorem natAddMonoidModel.zeroComputesZero :
    natAddMonoidModel.interpretConstant .zero = (0 : Nat) := rfl

/-!
`Int` as a model of `L_OrderedRing = ⟨+, *, -, 0, 1, <⟩`.

The first model exercising all three symbol kinds together, and the first
with a genuinely non-uniform `interpretFunction` (binary `add`/`mul`, unary
`neg`) and an actual (non-`Empty`) `interpretRelation`.
-/

/-- `Int` under the usual ring operations and strict order, interpreting
`L_OrderedRing`: `add`/`mul` as `Int` addition/multiplication, `neg` as
`Int` negation, `zero`/`one` as `0`/`1`, `lt` as the usual strict order.

Logical form:

```lean
def intOrderedRingModel : Model orderedRingSignature where
  Domain := Int
  domainNonempty := ⟨0⟩
  interpretFunction
    | .add, args => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
    | .mul, args => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
    | .neg, args => -(args ⟨0, by decide⟩)
  interpretRelation
    | .lt, args => args ⟨0, by decide⟩ < args ⟨1, by decide⟩
  interpretConstant
    | .zero => 0
    | .one => 1
```
-/
def intOrderedRingModel : Model orderedRingSignature where
  Domain := Int
  domainNonempty := ⟨0⟩
  interpretFunction
    | .add, args => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
    | .mul, args => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
    | .neg, args => -(args ⟨0, by decide⟩)
  interpretRelation
    | .lt, args => args ⟨0, by decide⟩ < args ⟨1, by decide⟩
  interpretConstant
    | .zero => 0
    | .one => 1

/--
`intOrderedRingModel.addComputesAddition` states add computes addition.

Logical form:

```lean
theorem intOrderedRingModel.addComputesAddition
    (a b : Int) :
    intOrderedRingModel.interpretFunction .add
      (fun i => if i.val = 0 then a else b) = a + b
```
-/
theorem intOrderedRingModel.addComputesAddition
    (a b : Int) :
    intOrderedRingModel.interpretFunction .add
      (fun i => if i.val = 0 then a else b) = a + b := rfl

/--
`intOrderedRingModel.mulComputesMultiplication` states mul computes multiplication.

Logical form:

```lean
theorem intOrderedRingModel.mulComputesMultiplication
    (a b : Int) :
    intOrderedRingModel.interpretFunction .mul
      (fun i => if i.val = 0 then a else b) = a * b
```
-/
theorem intOrderedRingModel.mulComputesMultiplication
    (a b : Int) :
    intOrderedRingModel.interpretFunction .mul
      (fun i => if i.val = 0 then a else b) = a * b := rfl

/--
`intOrderedRingModel.negComputesNegation` states neg computes negation.

Logical form:

```lean
theorem intOrderedRingModel.negComputesNegation
    (a : Int) :
    intOrderedRingModel.interpretFunction .neg (fun _ => a) = -a
```
-/
theorem intOrderedRingModel.negComputesNegation
    (a : Int) :
    intOrderedRingModel.interpretFunction .neg (fun _ => a) = -a := rfl

/--
`intOrderedRingModel.ltComputesLessThan` states lt computes less than.

Logical form:

```lean
theorem intOrderedRingModel.ltComputesLessThan
    (a b : Int) :
    intOrderedRingModel.interpretRelation .lt
      (fun i => if i.val = 0 then a else b) = (a < b)
```
-/
theorem intOrderedRingModel.ltComputesLessThan
    (a b : Int) :
    intOrderedRingModel.interpretRelation .lt
      (fun i => if i.val = 0 then a else b) = (a < b) := rfl

/--
`intOrderedRingModel.zeroComputesZero` states zero computes zero.

Logical form:

```lean
theorem intOrderedRingModel.zeroComputesZero :
    intOrderedRingModel.interpretConstant .zero = (0 : Int)
```
-/
theorem intOrderedRingModel.zeroComputesZero :
    intOrderedRingModel.interpretConstant .zero = (0 : Int) := rfl

/--
`intOrderedRingModel.oneComputesOne` states one computes one.

Logical form:

```lean
theorem intOrderedRingModel.oneComputesOne :
    intOrderedRingModel.interpretConstant .one = (1 : Int)
```
-/
theorem intOrderedRingModel.oneComputesOne :
    intOrderedRingModel.interpretConstant .one = (1 : Int) := rfl

end LRA.Logic.FirstOrder
