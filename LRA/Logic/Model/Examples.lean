import LRA.Logic.Model.Model
import LRA.Logic.Language.Examples

namespace LRA.Logic.FirstOrder

/--
`natMulMonoidModel` TODO

Predicate logic:

  def natMulMonoidModel : Model monoidSignature where
  Domain := Nat
  domainNonempty := ⟨0⟩
  interpretFunction
    | .mul, args => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
  interpretRelation := fun r => nomatch r
  interpretConstant
    | .one => 1

Predicate logic (unfolded):

  def natMulMonoidModel : Model monoidSignature where
  Domain := Nat
  domainNonempty := ⟨0⟩
  interpretFunction
    | .mul, args => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
  interpretRelation := fun r => nomatch r
  interpretConstant
    | .one => 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

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
`natMulMonoidModel.mulComputesMultiplication` TODO

Predicate logic:

  (∀ a b ∈ Nat), natMulMonoidModel.interpretFunction .mul (fun i => if i.val = 0 then a else b) = a * b

Predicate logic (unfolded):

  ∀ (a b : Nat), LRA.Logic.FirstOrder.natMulMonoidModel.5 LRA.Logic.MonoidFunctionSymbol.mul fun i => Decidable.rec (fun h => (fun x => b) h) (fun h => (fun x => a) h) (Bool.casesOn (motive := fun x => i.val.beq 0 = x → (fun x => Decidable (i.val = 0))x) (i.val.beq 0) (fun h => Decidable.isFalse ⋯) (fun h => Decidable.isTrue ⋯) ⋯) = instHMul.1 a b

Logical form (Lean):

```lean
theorem natMulMonoidModel.mulComputesMultiplication
    (a b : Nat) :
    natMulMonoidModel.interpretFunction .mul
      (fun i => if i.val = 0 then a else b) = a * b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem natMulMonoidModel.mulComputesMultiplication
    (a b : Nat) :
    natMulMonoidModel.interpretFunction .mul
      (fun i => if i.val = 0 then a else b) = a * b := rfl

/--
`natMulMonoidModel.oneComputesOne` TODO

Predicate logic:

  natMulMonoidModel.interpretConstant .one = 1 ∈ Nat

Predicate logic (unfolded):

  LRA.Logic.FirstOrder.natMulMonoidModel.7 LRA.Logic.MonoidConstantSymbol.one = instOfNatNat 1.1

Logical form (Lean):

```lean
theorem natMulMonoidModel.oneComputesOne :
    natMulMonoidModel.interpretConstant .one = (1 : Nat)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem natMulMonoidModel.oneComputesOne :
    natMulMonoidModel.interpretConstant .one = (1 : Nat) := rfl

/--
`natAddMonoidModel` TODO

Predicate logic:

  def natAddMonoidModel : Model additiveMonoidSignature where
  Domain := Nat
  domainNonempty := ⟨0⟩
  interpretFunction
    | .add, args => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
  interpretRelation := fun r => nomatch r
  interpretConstant
    | .zero => 0

Predicate logic (unfolded):

  def natAddMonoidModel : Model additiveMonoidSignature where
  Domain := Nat
  domainNonempty := ⟨0⟩
  interpretFunction
    | .add, args => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
  interpretRelation := fun r => nomatch r
  interpretConstant
    | .zero => 0 (source fallback; no compiled unfold data available)

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

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
`natAddMonoidModel.addComputesAddition` TODO

Predicate logic:

  (∀ a b ∈ Nat), natAddMonoidModel.interpretFunction .add (fun i => if i.val = 0 then a else b) = a + b

Predicate logic (unfolded):

  ∀ (a b : Nat), LRA.Logic.FirstOrder.natAddMonoidModel.5 LRA.Logic.AdditiveMonoidFunctionSymbol.add fun i => Decidable.rec (fun h => (fun x => b) h) (fun h => (fun x => a) h) (Bool.casesOn (motive := fun x => i.val.beq 0 = x → (fun x => Decidable (i.val = 0))x) (i.val.beq 0) (fun h => Decidable.isFalse ⋯) (fun h => Decidable.isTrue ⋯) ⋯) = instHAdd.1 a b

Logical form (Lean):

```lean
theorem natAddMonoidModel.addComputesAddition
    (a b : Nat) :
    natAddMonoidModel.interpretFunction .add
      (fun i => if i.val = 0 then a else b) = a + b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem natAddMonoidModel.addComputesAddition
    (a b : Nat) :
    natAddMonoidModel.interpretFunction .add
      (fun i => if i.val = 0 then a else b) = a + b := rfl

/--
`natAddMonoidModel.zeroComputesZero` TODO

Predicate logic:

  natAddMonoidModel.interpretConstant .zero = 0 ∈ Nat

Predicate logic (unfolded):

  LRA.Logic.FirstOrder.natAddMonoidModel.7 LRA.Logic.AdditiveMonoidConstantSymbol.zero = instOfNatNat 0.1

Logical form (Lean):

```lean
theorem natAddMonoidModel.zeroComputesZero :
    natAddMonoidModel.interpretConstant .zero = (0 : Nat)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem natAddMonoidModel.zeroComputesZero :
    natAddMonoidModel.interpretConstant .zero = (0 : Nat) := rfl

/--
`intOrderedRingModel` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
    | .one => 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

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
`intOrderedRingModel.addComputesAddition` TODO

Predicate logic:

  (∀ a b ∈ Int), intOrderedRingModel.interpretFunction .add (fun i => if i.val = 0 then a else b) = a + b

Predicate logic (unfolded):

  ∀ (a b : Int), LRA.Logic.FirstOrder.intOrderedRingModel.5 LRA.Logic.OrderedRingFunctionSymbol.add fun i => Decidable.rec (fun h => (fun x => b) h) (fun h => (fun x => a) h) (Bool.casesOn (motive := fun x => i.val.beq 0 = x → (fun x => Decidable (i.val = 0))x) (i.val.beq 0) (fun h => Decidable.isFalse ⋯) (fun h => Decidable.isTrue ⋯) ⋯) = instHAdd.1 a b

Logical form (Lean):

```lean
theorem intOrderedRingModel.addComputesAddition
    (a b : Int) :
    intOrderedRingModel.interpretFunction .add
      (fun i => if i.val = 0 then a else b) = a + b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem intOrderedRingModel.addComputesAddition
    (a b : Int) :
    intOrderedRingModel.interpretFunction .add
      (fun i => if i.val = 0 then a else b) = a + b := rfl

/--
`intOrderedRingModel.mulComputesMultiplication` TODO

Predicate logic:

  (∀ a b ∈ Int), intOrderedRingModel.interpretFunction .mul (fun i => if i.val = 0 then a else b) = a * b

Predicate logic (unfolded):

  ∀ (a b : Int), LRA.Logic.FirstOrder.intOrderedRingModel.5 LRA.Logic.OrderedRingFunctionSymbol.mul fun i => Decidable.rec (fun h => (fun x => b) h) (fun h => (fun x => a) h) (Bool.casesOn (motive := fun x => i.val.beq 0 = x → (fun x => Decidable (i.val = 0))x) (i.val.beq 0) (fun h => Decidable.isFalse ⋯) (fun h => Decidable.isTrue ⋯) ⋯) = instHMul.1 a b

Logical form (Lean):

```lean
theorem intOrderedRingModel.mulComputesMultiplication
    (a b : Int) :
    intOrderedRingModel.interpretFunction .mul
      (fun i => if i.val = 0 then a else b) = a * b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem intOrderedRingModel.mulComputesMultiplication
    (a b : Int) :
    intOrderedRingModel.interpretFunction .mul
      (fun i => if i.val = 0 then a else b) = a * b := rfl

/--
`intOrderedRingModel.negComputesNegation` TODO

Predicate logic:

  (∀ a ∈ Int), intOrderedRingModel.interpretFunction .neg (fun _ => a) = -a

Predicate logic (unfolded):

  ∀ (a : Int), LRA.Logic.FirstOrder.intOrderedRingModel.5 LRA.Logic.OrderedRingFunctionSymbol.neg fun x => a = Int.instNegInt.1 a

Logical form (Lean):

```lean
theorem intOrderedRingModel.negComputesNegation
    (a : Int) :
    intOrderedRingModel.interpretFunction .neg (fun _ => a) = -a
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem intOrderedRingModel.negComputesNegation
    (a : Int) :
    intOrderedRingModel.interpretFunction .neg (fun _ => a) = -a := rfl

/--
`intOrderedRingModel.ltComputesLessThan` TODO

Predicate logic:

  (∀ a b ∈ Int), intOrderedRingModel.interpretRelation .lt (fun i => if i.val = 0 then a else b) = (a < b)

Predicate logic (unfolded):

  ∀ (a b : Int), LRA.Logic.FirstOrder.intOrderedRingModel.6 LRA.Logic.OrderedRingRelationSymbol.lt fun i => Decidable.rec (fun h => (fun x => b) h) (fun h => (fun x => a) h) (Bool.casesOn (motive := fun x => i.val.beq 0 = x → (fun x => Decidable (i.val = 0))x) (i.val.beq 0) (fun h => Decidable.isFalse ⋯) (fun h => Decidable.isTrue ⋯) ⋯) = Int.instLTInt.1 a b

Logical form (Lean):

```lean
theorem intOrderedRingModel.ltComputesLessThan
    (a b : Int) :
    intOrderedRingModel.interpretRelation .lt
      (fun i => if i.val = 0 then a else b) = (a < b)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem intOrderedRingModel.ltComputesLessThan
    (a b : Int) :
    intOrderedRingModel.interpretRelation .lt
      (fun i => if i.val = 0 then a else b) = (a < b) := rfl

/--
`intOrderedRingModel.zeroComputesZero` TODO

Predicate logic:

  intOrderedRingModel.interpretConstant .zero = 0 ∈ Int

Predicate logic (unfolded):

  LRA.Logic.FirstOrder.intOrderedRingModel.7 LRA.Logic.OrderedRingConstantSymbol.zero = instOfNat.1

Logical form (Lean):

```lean
theorem intOrderedRingModel.zeroComputesZero :
    intOrderedRingModel.interpretConstant .zero = (0 : Int)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem intOrderedRingModel.zeroComputesZero :
    intOrderedRingModel.interpretConstant .zero = (0 : Int) := rfl

/--
`intOrderedRingModel.oneComputesOne` TODO

Predicate logic:

  intOrderedRingModel.interpretConstant .one = 1 ∈ Int

Predicate logic (unfolded):

  LRA.Logic.FirstOrder.intOrderedRingModel.7 LRA.Logic.OrderedRingConstantSymbol.one = instOfNat.1

Logical form (Lean):

```lean
theorem intOrderedRingModel.oneComputesOne :
    intOrderedRingModel.interpretConstant .one = (1 : Int)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem intOrderedRingModel.oneComputesOne :
    intOrderedRingModel.interpretConstant .one = (1 : Int) := rfl

end LRA.Logic.FirstOrder
