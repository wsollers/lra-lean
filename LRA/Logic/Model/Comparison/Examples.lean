import Mathlib.Data.Rat.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Int.Cast.Lemmas
import Mathlib.Algebra.Order.Ring.Cast
import Mathlib.Data.Rat.Cast.Order
import LRA.Logic.Model.Examples
import LRA.Logic.Model.Comparison.ModelEmbedding
import LRA.Logic.Model.Comparison.ModelIsomorphism
import LRA.Logic.Model.Comparison.Automorphism

namespace LRA.Logic.FirstOrder

/--
`qOrderedRingModel` TODO

Predicate logic:

  def qOrderedRingModel : Model orderedRingSignature where
  Domain := Rat
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

  def qOrderedRingModel : Model orderedRingSignature where
  Domain := Rat
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
def qOrderedRingModel : Model orderedRingSignature where
  Domain := Rat
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
def qOrderedRingModel : Model orderedRingSignature where
  Domain := Rat
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
`qOrderedRingModel.addComputesAddition` TODO

Predicate logic:

  (∀ a b ∈ Rat), qOrderedRingModel.interpretFunction .add (fun i => if i.val = 0 then a else b) = a + b

Predicate logic (unfolded):

  ∀ (a b : Rat), LRA.Logic.FirstOrder.qOrderedRingModel.5 LRA.Logic.OrderedRingFunctionSymbol.add fun i => Decidable.rec (fun h => (fun x => b) h) (fun h => (fun x => a) h) (Bool.casesOn (motive := fun x => i.val.beq 0 = x → (fun x => Decidable (i.val = 0))x) (i.val.beq 0) (fun h => Decidable.isFalse ⋯) (fun h => Decidable.isTrue ⋯) ⋯) = instHAdd.1 a b

Logical form (Lean):

```lean
theorem qOrderedRingModel.addComputesAddition
    (a b : Rat) :
    qOrderedRingModel.interpretFunction .add
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
theorem qOrderedRingModel.addComputesAddition
    (a b : Rat) :
    qOrderedRingModel.interpretFunction .add
      (fun i => if i.val = 0 then a else b) = a + b := by
  sorry
/--
`qOrderedRingModel.zeroComputesZero` TODO

Predicate logic:

  qOrderedRingModel.interpretConstant .zero = 0 ∈ Rat

Predicate logic (unfolded):

  LRA.Logic.FirstOrder.qOrderedRingModel.7 LRA.Logic.OrderedRingConstantSymbol.zero = Rat.instOfNat.1

Logical form (Lean):

```lean
theorem qOrderedRingModel.zeroComputesZero :
    qOrderedRingModel.interpretConstant .zero = (0 : Rat)
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
theorem qOrderedRingModel.zeroComputesZero :
    qOrderedRingModel.interpretConstant .zero = (0 : Rat) := by
  sorry
/--
`qOrderedRingModel.oneComputesOne` TODO

Predicate logic:

  qOrderedRingModel.interpretConstant .one = 1 ∈ Rat

Predicate logic (unfolded):

  LRA.Logic.FirstOrder.qOrderedRingModel.7 LRA.Logic.OrderedRingConstantSymbol.one = Rat.instOfNat.1

Logical form (Lean):

```lean
theorem qOrderedRingModel.oneComputesOne :
    qOrderedRingModel.interpretConstant .one = (1 : Rat)
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
theorem qOrderedRingModel.oneComputesOne :
    qOrderedRingModel.interpretConstant .one = (1 : Rat) := by
  sorry
/--
`rOrderedRingModel` TODO

Predicate logic:

  def rOrderedRingModel : Model orderedRingSignature where
  Domain := Real
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

  def rOrderedRingModel : Model orderedRingSignature where
  Domain := Real
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
def rOrderedRingModel : Model orderedRingSignature where
  Domain := Real
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
def rOrderedRingModel : Model orderedRingSignature where
  Domain := Real
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
`rOrderedRingModel.addComputesAddition` TODO

Predicate logic:

  (∀ a b ∈ Real), rOrderedRingModel.interpretFunction .add (fun i => if i.val = 0 then a else b) = a + b

Predicate logic (unfolded):

  ∀ (a b : Real), LRA.Logic.FirstOrder.rOrderedRingModel.5 LRA.Logic.OrderedRingFunctionSymbol.add fun i => Decidable.rec (fun h => (fun x => b) h) (fun h => (fun x => a) h) (Bool.casesOn (motive := fun x => i.val.beq 0 = x → (fun x => Decidable (i.val = 0))x) (i.val.beq 0) (fun h => Decidable.isFalse ⋯) (fun h => Decidable.isTrue ⋯) ⋯) = instHAdd.1 a b

Logical form (Lean):

```lean
theorem rOrderedRingModel.addComputesAddition
    (a b : Real) :
    rOrderedRingModel.interpretFunction .add
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
theorem rOrderedRingModel.addComputesAddition
    (a b : Real) :
    rOrderedRingModel.interpretFunction .add
      (fun i => if i.val = 0 then a else b) = a + b := by
  sorry
/--
`rOrderedRingModel.zeroComputesZero` TODO

Predicate logic:

  rOrderedRingModel.interpretConstant .zero = 0 ∈ Real

Predicate logic (unfolded):

  LRA.Logic.FirstOrder.rOrderedRingModel.7 LRA.Logic.OrderedRingConstantSymbol.zero = Zero.toOfNat0.1

Logical form (Lean):

```lean
theorem rOrderedRingModel.zeroComputesZero :
    rOrderedRingModel.interpretConstant .zero = (0 : Real)
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
theorem rOrderedRingModel.zeroComputesZero :
    rOrderedRingModel.interpretConstant .zero = (0 : Real) := by
  sorry
/--
`rOrderedRingModel.oneComputesOne` TODO

Predicate logic:

  rOrderedRingModel.interpretConstant .one = 1 ∈ Real

Predicate logic (unfolded):

  LRA.Logic.FirstOrder.rOrderedRingModel.7 LRA.Logic.OrderedRingConstantSymbol.one = One.toOfNat1.1

Logical form (Lean):

```lean
theorem rOrderedRingModel.oneComputesOne :
    rOrderedRingModel.interpretConstant .one = (1 : Real)
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
theorem rOrderedRingModel.oneComputesOne :
    rOrderedRingModel.interpretConstant .one = (1 : Real) := by
  sorry
/--
`zToQEmbedding` TODO

Predicate logic:

  def zToQEmbedding : ModelEmbedding intOrderedRingModel qOrderedRingModel where
  toFun := (Int.cast : Int -> Rat)
  injective := (Int.cast_injective : Function.Injective (Int.cast : Int -> Rat))
  preservesFunction
    | .add, args => by simp [intOrderedRingModel, qOrderedRingModel]
    | .mul, args => by simp [intOrderedRingModel, qOrderedRingModel]
    | .neg, args => by simp [intOrderedRingModel, qOrderedRingModel]
  preservesConstant
    | .zero => by simp [intOrderedRingModel, qOrderedRingModel]
    | .one => by simp [intOrderedRingModel, qOrderedRingModel]
  preservesRelation
    | .lt, args => by simp [intOrderedRingModel, qOrderedRingModel, Int.cast_lt]

Predicate logic (unfolded):

  def zToQEmbedding : ModelEmbedding intOrderedRingModel qOrderedRingModel where
  toFun := (Int.cast : Int -> Rat)
  injective := (Int.cast_injective : Function.Injective (Int.cast : Int -> Rat))
  preservesFunction
    | .add, args => by simp [intOrderedRingModel, qOrderedRingModel]
    | .mul, args => by simp [intOrderedRingModel, qOrderedRingModel]
    | .neg, args => by simp [intOrderedRingModel, qOrderedRingModel]
  preservesConstant
    | .zero => by simp [intOrderedRingModel, qOrderedRingModel]
    | .one => by simp [intOrderedRingModel, qOrderedRingModel]
  preservesRelation
    | .lt, args => by simp [intOrderedRingModel, qOrderedRingModel, Int.cast_lt] (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def zToQEmbedding : ModelEmbedding intOrderedRingModel qOrderedRingModel where
  toFun := (Int.cast : Int -> Rat)
  injective := (Int.cast_injective : Function.Injective (Int.cast : Int -> Rat))
  preservesFunction
    | .add, args => by simp [intOrderedRingModel, qOrderedRingModel]
    | .mul, args => by simp [intOrderedRingModel, qOrderedRingModel]
    | .neg, args => by simp [intOrderedRingModel, qOrderedRingModel]
  preservesConstant
    | .zero => by simp [intOrderedRingModel, qOrderedRingModel]
    | .one => by simp [intOrderedRingModel, qOrderedRingModel]
  preservesRelation
    | .lt, args => by simp [intOrderedRingModel, qOrderedRingModel, Int.cast_lt]
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def zToQEmbedding : ModelEmbedding intOrderedRingModel qOrderedRingModel where
  toFun := (Int.cast : Int -> Rat)
  injective := (Int.cast_injective : Function.Injective (Int.cast : Int -> Rat))
  preservesFunction
    | .add, args => by simp [intOrderedRingModel, qOrderedRingModel]
    | .mul, args => by simp [intOrderedRingModel, qOrderedRingModel]
    | .neg, args => by simp [intOrderedRingModel, qOrderedRingModel]
  preservesConstant
    | .zero => by simp [intOrderedRingModel, qOrderedRingModel]
    | .one => by simp [intOrderedRingModel, qOrderedRingModel]
  preservesRelation
    | .lt, args => by simp [intOrderedRingModel, qOrderedRingModel, Int.cast_lt]

/--
`qToREmbedding` TODO

Predicate logic:

  def qToREmbedding : ModelEmbedding qOrderedRingModel rOrderedRingModel where
  toFun := (Rat.cast : Rat -> Real)
  injective := (Rat.cast_injective : Function.Injective (Rat.cast : Rat -> Real))
  preservesFunction
    | .add, args => by simp [qOrderedRingModel, rOrderedRingModel]
    | .mul, args => by simp [qOrderedRingModel, rOrderedRingModel]
    | .neg, args => by simp [qOrderedRingModel, rOrderedRingModel]
  preservesConstant
    | .zero => by simp [qOrderedRingModel, rOrderedRingModel]
    | .one => by simp [qOrderedRingModel, rOrderedRingModel]
  preservesRelation
    | .lt, args => by simp [qOrderedRingModel, rOrderedRingModel, Rat.cast_lt]

Predicate logic (unfolded):

  def qToREmbedding : ModelEmbedding qOrderedRingModel rOrderedRingModel where
  toFun := (Rat.cast : Rat -> Real)
  injective := (Rat.cast_injective : Function.Injective (Rat.cast : Rat -> Real))
  preservesFunction
    | .add, args => by simp [qOrderedRingModel, rOrderedRingModel]
    | .mul, args => by simp [qOrderedRingModel, rOrderedRingModel]
    | .neg, args => by simp [qOrderedRingModel, rOrderedRingModel]
  preservesConstant
    | .zero => by simp [qOrderedRingModel, rOrderedRingModel]
    | .one => by simp [qOrderedRingModel, rOrderedRingModel]
  preservesRelation
    | .lt, args => by simp [qOrderedRingModel, rOrderedRingModel, Rat.cast_lt] (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def qToREmbedding : ModelEmbedding qOrderedRingModel rOrderedRingModel where
  toFun := (Rat.cast : Rat -> Real)
  injective := (Rat.cast_injective : Function.Injective (Rat.cast : Rat -> Real))
  preservesFunction
    | .add, args => by simp [qOrderedRingModel, rOrderedRingModel]
    | .mul, args => by simp [qOrderedRingModel, rOrderedRingModel]
    | .neg, args => by simp [qOrderedRingModel, rOrderedRingModel]
  preservesConstant
    | .zero => by simp [qOrderedRingModel, rOrderedRingModel]
    | .one => by simp [qOrderedRingModel, rOrderedRingModel]
  preservesRelation
    | .lt, args => by simp [qOrderedRingModel, rOrderedRingModel, Rat.cast_lt]
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def qToREmbedding : ModelEmbedding qOrderedRingModel rOrderedRingModel where
  toFun := (Rat.cast : Rat -> Real)
  injective := (Rat.cast_injective : Function.Injective (Rat.cast : Rat -> Real))
  preservesFunction
    | .add, args => by simp [qOrderedRingModel, rOrderedRingModel]
    | .mul, args => by simp [qOrderedRingModel, rOrderedRingModel]
    | .neg, args => by simp [qOrderedRingModel, rOrderedRingModel]
  preservesConstant
    | .zero => by simp [qOrderedRingModel, rOrderedRingModel]
    | .one => by simp [qOrderedRingModel, rOrderedRingModel]
  preservesRelation
    | .lt, args => by simp [qOrderedRingModel, rOrderedRingModel, Rat.cast_lt]

/--
`qToQIsomorphism` TODO

Predicate logic:

  def qToQIsomorphism : ModelIsomorphism qOrderedRingModel qOrderedRingModel :=
  Automorphism.identity qOrderedRingModel

Predicate logic (unfolded):

  def qToQIsomorphism : ModelIsomorphism qOrderedRingModel qOrderedRingModel :=
  Automorphism.identity qOrderedRingModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def qToQIsomorphism : ModelIsomorphism qOrderedRingModel qOrderedRingModel :=
  Automorphism.identity qOrderedRingModel
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
def qToQIsomorphism : ModelIsomorphism qOrderedRingModel qOrderedRingModel :=
  Automorphism.identity qOrderedRingModel

/--
`qToQAutomorphism` TODO

Predicate logic:

  def qToQAutomorphism : Automorphism qOrderedRingModel :=
  Automorphism.identity qOrderedRingModel

Predicate logic (unfolded):

  def qToQAutomorphism : Automorphism qOrderedRingModel :=
  Automorphism.identity qOrderedRingModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def qToQAutomorphism : Automorphism qOrderedRingModel :=
  Automorphism.identity qOrderedRingModel
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
def qToQAutomorphism : Automorphism qOrderedRingModel :=
  Automorphism.identity qOrderedRingModel

/--
`qToQIsomorphism.toFunIsIdentity` TODO

Predicate logic:

  qToQIsomorphism.toFun = id ∈ Rat -> Rat

Predicate logic (unfolded):

  LRA.Logic.FirstOrder.qToQIsomorphism.toModelEmbedding.1 = funa => a

Logical form (Lean):

```lean
theorem qToQIsomorphism.toFunIsIdentity :
    qToQIsomorphism.toFun = (id : Rat -> Rat)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem qToQIsomorphism.toFunIsIdentity :
    qToQIsomorphism.toFun = (id : Rat -> Rat) := by
  sorry
end LRA.Logic.FirstOrder
