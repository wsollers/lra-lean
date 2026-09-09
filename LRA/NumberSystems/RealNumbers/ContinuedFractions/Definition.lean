import LRA.Arithmetic.ContinuedFractions
import LRA.NumberSystems.RationalNumbers.ContinuedFractions
import LRA.NumberSystems.RealNumbers.Irrationals

namespace LRA.NumberSystems.RealNumbers.ContinuedFractions

open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory
open LRA.Arithmetic.ContinuedFractions

universe u

/--
`FinitePrefix` TODO

Predicate logic:

  def FinitePrefix
      {integerModel : IntegerModel.{u}}
      (fraction : InfiniteSimpleContinuedFraction integerModel)
      (depth : Nat) : FiniteSimpleContinuedFraction integerModel where
    Head := fraction 0
    Tail := (List.range depth).map (fun index => fraction (index + 1))

Predicate logic (unfolded):

  def FinitePrefix
      {integerModel : IntegerModel.{u}}
      (fraction : InfiniteSimpleContinuedFraction integerModel)
      (depth : Nat) : FiniteSimpleContinuedFraction integerModel where
    Head := fraction 0
    Tail := (List.range depth).map (fun index => fraction (index + 1)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def FinitePrefix
    {integerModel : IntegerModel.{u}}
    (fraction : InfiniteSimpleContinuedFraction integerModel)
    (depth : Nat) : FiniteSimpleContinuedFraction integerModel where
  Head := fraction 0
  Tail := (List.range depth).map (fun index => fraction (index + 1))
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
def FinitePrefix
    {integerModel : IntegerModel.{u}}
    (fraction : InfiniteSimpleContinuedFraction integerModel)
    (depth : Nat) : FiniteSimpleContinuedFraction integerModel where
  Head := fraction 0
  Tail := (List.range depth).map (fun index => fraction (index + 1))

/--
`IsConvergentAt` TODO

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (fraction : LRA.Arithmetic.ContinuedFractions.InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model) (depth : Nat) (value : rationalSystem.FieldModel.Carrier), LRA.NumberSystems.RationalNumbers.ContinuedFractions.CoefficientsEvaluateTo rationalSystem (List.cons (LRA.NumberSystems.RealNumbers.ContinuedFractions.FinitePrefix fraction depth).Head (LRA.NumberSystems.RealNumbers.ContinuedFractions.FinitePrefix fraction depth).Tail) value

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.NumberSystems.RationalNumbers.ContinuedFractions.CoefficientsEvaluateTo rationalSystem (List.cons (LRA.NumberSystems.RealNumbers.ContinuedFractions.FinitePrefix fraction depth).1 (LRA.NumberSystems.RealNumbers.ContinuedFractions.FinitePrefix fraction depth).2) value

Logical form (Lean):

```lean
def IsConvergentAt
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (depth : Nat)
    (value : rationalSystem.FieldModel.Carrier) : Prop :=
  LRA.NumberSystems.RationalNumbers.ContinuedFractions.FiniteSimpleContinuedFractionEvaluatesTo
    rationalSystem (FinitePrefix fraction depth) value
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
def IsConvergentAt
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (depth : Nat)
    (value : rationalSystem.FieldModel.Carrier) : Prop :=
  LRA.NumberSystems.RationalNumbers.ContinuedFractions.FiniteSimpleContinuedFractionEvaluatesTo
    rationalSystem (FinitePrefix fraction depth) value

/--
`ConvergentsConvergeTo` TODO

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (realExtension : LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem) (fraction : LRA.Arithmetic.ContinuedFractions.InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model) (limit epsilon : realExtension.RealModel.Carrier), realExtension.RealModel.ltInst.lt 0 epsilon → Exists fun N => ∀ (depth : Nat), instLENat.le N depth → Exists fun convergent => (LRA.NumberSystems.RealNumbers.ContinuedFractions.IsConvergentAt rationalSystem fraction depth convergent ∧ (realExtension.RealModel.leInst.le (realExtension.RealModel.negInst.neg epsilon) (instHAdd.hAdd (realExtension.DenseOrderedFieldEmbedding.ToReal convergent) (realExtension.RealModel.negInst.neg limit)) ∧ realExtension.RealModel.leInst.le (instHAdd.hAdd (realExtension.DenseOrderedFieldEmbedding.ToReal convergent) (realExtension.RealModel.negInst.neg limit)) epsilon))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    realExtension.RealModel.8.lt 0 epsilon → Exists fun N => ∀ (depth : Nat), instLENat.le N depth → Exists fun convergent => (LRA.NumberSystems.RationalNumbers.ContinuedFractions.CoefficientsEvaluateTo rationalSystem (List.cons (LRA.NumberSystems.RealNumbers.ContinuedFractions.FinitePrefix fraction depth).1 (LRA.NumberSystems.RealNumbers.ContinuedFractions.FinitePrefix fraction depth).2) convergent ∧ (realExtension.RealModel.9.le (realExtension.RealModel.4.neg epsilon) ({ hAdd := fun a b => realExtension.RealModel.2.add a b }.hAdd (realExtension.DenseOrderedFieldEmbedding.1 convergent) (realExtension.RealModel.4.neg limit)) ∧ realExtension.RealModel.9.le ({ hAdd := fun a b => realExtension.RealModel.2.add a b }.hAdd (realExtension.DenseOrderedFieldEmbedding.1 convergent) (realExtension.RealModel.4.neg limit)) epsilon))

Logical form (Lean):

```lean
def ConvergentsConvergeTo
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (limit : realExtension.RealModel.Carrier) : Prop :=
  ∀ epsilon : realExtension.RealModel.Carrier,
    0 < epsilon →
      ∃ N : Nat, ∀ depth : Nat, N ≤ depth →
        ∃ convergent : rationalSystem.FieldModel.Carrier,
          IsConvergentAt rationalSystem fraction depth convergent ∧
          -epsilon ≤ realExtension.DenseOrderedFieldEmbedding.ToReal convergent + -limit ∧
          realExtension.DenseOrderedFieldEmbedding.ToReal convergent + -limit ≤ epsilon
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def ConvergentsConvergeTo
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (limit : realExtension.RealModel.Carrier) : Prop :=
  ∀ epsilon : realExtension.RealModel.Carrier,
    0 < epsilon →
      ∃ N : Nat, ∀ depth : Nat, N ≤ depth →
        ∃ convergent : rationalSystem.FieldModel.Carrier,
          IsConvergentAt rationalSystem fraction depth convergent ∧
          -epsilon ≤ realExtension.DenseOrderedFieldEmbedding.ToReal convergent + -limit ∧
          realExtension.DenseOrderedFieldEmbedding.ToReal convergent + -limit ≤ epsilon

/--
`IsInfiniteSimpleContinuedFractionExpansionOf` TODO

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (realExtension : LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem) (fraction : LRA.Arithmetic.ContinuedFractions.InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model) (value : realExtension.RealModel.Carrier), (LRA.Arithmetic.ContinuedFractions.IsProperInfiniteSimpleContinuedFraction fraction ∧ LRA.NumberSystems.RealNumbers.ContinuedFractions.ConvergentsConvergeTo rationalSystem realExtension fraction value)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (index : Nat), rationalSystem.IntegerSystem.Model.7.lt 0 (fraction ({ hAdd := fun a b => instAddNat.add a b }.hAdd index 1))) ∧ (∀ (epsilon : realExtension.RealModel.1), realExtension.RealModel.8.lt 0 epsilon → Exists fun N => ∀ (depth : Nat), instLENat.le N depth → Exists fun convergent => (LRA.NumberSystems.RationalNumbers.ContinuedFractions.CoefficientsEvaluateTo rationalSystem (List.cons (LRA.NumberSystems.RealNumbers.ContinuedFractions.FinitePrefix fraction depth).1 (LRA.NumberSystems.RealNumbers.ContinuedFractions.FinitePrefix fraction depth).2) convergent ∧ (realExtension.RealModel.9.le (realExtension.RealModel.4.neg epsilon) ({ hAdd := fun a b => realExtension.RealModel.2.add a b }.hAdd (realExtension.DenseOrderedFieldEmbedding.1 convergent) (realExtension.RealModel.4.neg value)) ∧ realExtension.RealModel.9.le ({ hAdd := fun a b => realExtension.RealModel.2.add a b }.hAdd (realExtension.DenseOrderedFieldEmbedding.1 convergent) (realExtension.RealModel.4.neg value)) epsilon))))

Logical form (Lean):

```lean
def IsInfiniteSimpleContinuedFractionExpansionOf
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (value : realExtension.RealModel.Carrier) : Prop :=
  IsProperInfiniteSimpleContinuedFraction fraction ∧
    ConvergentsConvergeTo rationalSystem realExtension fraction value
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def IsInfiniteSimpleContinuedFractionExpansionOf
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (value : realExtension.RealModel.Carrier) : Prop :=
  IsProperInfiniteSimpleContinuedFraction fraction ∧
    ConvergentsConvergeTo rationalSystem realExtension fraction value

/--
`IsQuadraticIrrational` TODO

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (realExtension : LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem) (value : realExtension.RealModel.Carrier), (LRA.NumberSystems.RealNumbers.Irrationals.IsIrrational rationalSystem realExtension value ∧ (Exists fun a => Exists fun b => Exists fun c => (Ne a 0 ∧ have embedInteger := fun z => realExtension.DenseOrderedFieldEmbedding.ToReal (rationalSystem.IntegerEmbedding.ToField z); instHAdd.hAdd (instHAdd.hAdd (instHMul.hMul (embedInteger a) (instHMul.hMul value value)) (instHMul.hMul (embedInteger b) value)) (embedInteger c) = 0)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((Exists fun rational_value => realExtension.DenseOrderedFieldEmbedding.1 rational_value = value) → False) ∧ (Exists fun a => Exists fun b => Exists fun c => ((a = 0 → False) ∧ have embedInteger := fun z => realExtension.DenseOrderedFieldEmbedding.ToReal (rationalSystem.IntegerEmbedding.ToField z); instHAdd.hAdd (instHAdd.hAdd (instHMul.hMul (embedInteger a) (instHMul.hMul value value)) (instHMul.hMul (embedInteger b) value)) (embedInteger c) = 0)))

Logical form (Lean):

```lean
def IsQuadraticIrrational
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (value : realExtension.RealModel.Carrier) : Prop :=
  LRA.NumberSystems.RealNumbers.Irrationals.IsIrrational
      rationalSystem realExtension value ∧
    ∃ a b c : rationalSystem.IntegerSystem.Model.Carrier,
      a ≠ 0 ∧
        let embedInteger := fun z =>
          realExtension.DenseOrderedFieldEmbedding.ToReal
            (rationalSystem.IntegerEmbedding.ToField z)
        embedInteger a * (value * value) +
            embedInteger b * value + embedInteger c = 0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def IsQuadraticIrrational
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (value : realExtension.RealModel.Carrier) : Prop :=
  LRA.NumberSystems.RealNumbers.Irrationals.IsIrrational
      rationalSystem realExtension value ∧
    ∃ a b c : rationalSystem.IntegerSystem.Model.Carrier,
      a ≠ 0 ∧
        let embedInteger := fun z =>
          realExtension.DenseOrderedFieldEmbedding.ToReal
            (rationalSystem.IntegerEmbedding.ToField z)
        embedInteger a * (value * value) +
            embedInteger b * value + embedInteger c = 0

end LRA.NumberSystems.RealNumbers.ContinuedFractions
