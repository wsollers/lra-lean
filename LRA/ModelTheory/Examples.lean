import LRA.ModelTheory.Model
import LRA.Logic.Language.Examples

open LRA.Logic

namespace LRA.ModelTheory.FirstOrder

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

  ∀ (a b : Nat), LRA.ModelTheory.FirstOrder.natMulMonoidModel.interpretFunction LRA.Logic.MonoidFunctionSymbol.mul fun i => ite (i.val = 0)a b = instHMul.hMul a b

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    a b : Nat
  Prove
    LRA.ModelTheory.FirstOrder.natMulMonoidModel.5 LRA.Logic.MonoidFunctionSymbol.mul fun i => Decidable.rec (fun h => (fun x => b) h) (fun h => (fun x => a) h) (Bool.casesOn (motive := fun x => i.val.beq 0 = x → (fun x => Decidable (i.val = 0))x) (i.val.beq 0) (fun h => Decidable.isFalse ⋯) (fun h => Decidable.isTrue ⋯) ⋯) = { hMul := fun a b => instMulNat.mul a b }.hMul a b

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
      (fun i => if i.val = 0 then a else b) = a * b := by
  sorry
/--
`natMulMonoidModel.oneComputesOne` TODO

Predicate logic:

  LRA.ModelTheory.FirstOrder.natMulMonoidModel.interpretConstant LRA.Logic.MonoidConstantSymbol.one = 1

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.ModelTheory.FirstOrder.natMulMonoidModel.7 LRA.Logic.MonoidConstantSymbol.one = 1

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
    natMulMonoidModel.interpretConstant .one = (1 : Nat) := by
  sorry
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

  ∀ (a b : Nat), LRA.ModelTheory.FirstOrder.natAddMonoidModel.interpretFunction LRA.Logic.AdditiveMonoidFunctionSymbol.add fun i => ite (i.val = 0)a b = instHAdd.hAdd a b

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    a b : Nat
  Prove
    LRA.ModelTheory.FirstOrder.natAddMonoidModel.5 LRA.Logic.AdditiveMonoidFunctionSymbol.add fun i => Decidable.rec (fun h => (fun x => b) h) (fun h => (fun x => a) h) (Bool.casesOn (motive := fun x => i.val.beq 0 = x → (fun x => Decidable (i.val = 0))x) (i.val.beq 0) (fun h => Decidable.isFalse ⋯) (fun h => Decidable.isTrue ⋯) ⋯) = { hAdd := fun a b => instAddNat.add a b }.hAdd a b

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
      (fun i => if i.val = 0 then a else b) = a + b := by
  sorry
/--
`natAddMonoidModel.zeroComputesZero` TODO

Predicate logic:

  LRA.ModelTheory.FirstOrder.natAddMonoidModel.interpretConstant LRA.Logic.AdditiveMonoidConstantSymbol.zero = 0

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.ModelTheory.FirstOrder.natAddMonoidModel.7 LRA.Logic.AdditiveMonoidConstantSymbol.zero = 0

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
    natAddMonoidModel.interpretConstant .zero = (0 : Nat) := by
  sorry
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

  ∀ (a b : Int), LRA.ModelTheory.FirstOrder.intOrderedRingModel.interpretFunction LRA.Logic.OrderedRingFunctionSymbol.add fun i => ite (i.val = 0)a b = instHAdd.hAdd a b

Predicate logic (unfolded):

  Ambient
    (Int)
  Objects
    a b : Int
  Prove
    LRA.ModelTheory.FirstOrder.intOrderedRingModel.5 LRA.Logic.OrderedRingFunctionSymbol.add fun i => Decidable.rec (fun h => (fun x => b) h) (fun h => (fun x => a) h) (Bool.casesOn (motive := fun x => i.val.beq 0 = x → (fun x => Decidable (i.val = 0))x) (i.val.beq 0) (fun h => Decidable.isFalse ⋯) (fun h => Decidable.isTrue ⋯) ⋯) = { hAdd := fun a b => Int.instAdd.add a b }.hAdd a b

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
      (fun i => if i.val = 0 then a else b) = a + b := by
  sorry
/--
`intOrderedRingModel.mulComputesMultiplication` TODO

Predicate logic:

  ∀ (a b : Int), LRA.ModelTheory.FirstOrder.intOrderedRingModel.interpretFunction LRA.Logic.OrderedRingFunctionSymbol.mul fun i => ite (i.val = 0)a b = instHMul.hMul a b

Predicate logic (unfolded):

  Ambient
    (Int)
  Objects
    a b : Int
  Prove
    LRA.ModelTheory.FirstOrder.intOrderedRingModel.5 LRA.Logic.OrderedRingFunctionSymbol.mul fun i => Decidable.rec (fun h => (fun x => b) h) (fun h => (fun x => a) h) (Bool.casesOn (motive := fun x => i.val.beq 0 = x → (fun x => Decidable (i.val = 0))x) (i.val.beq 0) (fun h => Decidable.isFalse ⋯) (fun h => Decidable.isTrue ⋯) ⋯) = { hMul := fun a b => Int.instMul.mul a b }.hMul a b

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
      (fun i => if i.val = 0 then a else b) = a * b := by
  sorry
/--
`intOrderedRingModel.negComputesNegation` TODO

Predicate logic:

  ∀ (a : Int), LRA.ModelTheory.FirstOrder.intOrderedRingModel.interpretFunction LRA.Logic.OrderedRingFunctionSymbol.neg fun x => a = Int.instNegInt.neg a

Predicate logic (unfolded):

  Ambient
    (Int)
  Objects
    a : Int
  Prove
    LRA.ModelTheory.FirstOrder.intOrderedRingModel.5 LRA.Logic.OrderedRingFunctionSymbol.neg fun x => a = Int.instNegInt.neg a

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
    intOrderedRingModel.interpretFunction .neg (fun _ => a) = -a := by
  sorry
/--
`intOrderedRingModel.ltComputesLessThan` TODO

Predicate logic:

  ∀ (a b : Int), LRA.ModelTheory.FirstOrder.intOrderedRingModel.interpretRelation LRA.Logic.OrderedRingRelationSymbol.lt fun i => ite (i.val = 0)a b = Int.instLTInt.lt a b

Predicate logic (unfolded):

  Ambient
    (Int)
  Objects
    a b : Int
  Prove
    LRA.ModelTheory.FirstOrder.intOrderedRingModel.6 LRA.Logic.OrderedRingRelationSymbol.lt fun i => Decidable.rec (fun h => (fun x => b) h) (fun h => (fun x => a) h) (Bool.casesOn (motive := fun x => i.val.beq 0 = x → (fun x => Decidable (i.val = 0))x) (i.val.beq 0) (fun h => Decidable.isFalse ⋯) (fun h => Decidable.isTrue ⋯) ⋯) = Int.instLTInt.lt a b

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
      (fun i => if i.val = 0 then a else b) = (a < b) := by
  sorry
/--
`intOrderedRingModel.zeroComputesZero` TODO

Predicate logic:

  LRA.ModelTheory.FirstOrder.intOrderedRingModel.interpretConstant LRA.Logic.OrderedRingConstantSymbol.zero = 0

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.ModelTheory.FirstOrder.intOrderedRingModel.7 LRA.Logic.OrderedRingConstantSymbol.zero = 0

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
    intOrderedRingModel.interpretConstant .zero = (0 : Int) := by
  sorry
/--
`intOrderedRingModel.oneComputesOne` TODO

Predicate logic:

  LRA.ModelTheory.FirstOrder.intOrderedRingModel.interpretConstant LRA.Logic.OrderedRingConstantSymbol.one = 1

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.ModelTheory.FirstOrder.intOrderedRingModel.7 LRA.Logic.OrderedRingConstantSymbol.one = 1

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
    intOrderedRingModel.interpretConstant .one = (1 : Int) := by
  sorry
end LRA.ModelTheory.FirstOrder
