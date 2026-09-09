import Mathlib.Data.Real.Basic
import LRA.EuclideanSpace.RealLine.Definition.RealLine

namespace LRA.EuclideanSpace

/--
`RealLineDistanceNonneg` TODO

Predicate logic:

  ∀ (a b : Real), GE.ge (LRA.EuclideanSpace.RealLineDistance a b) 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    Real.instLE.le 0 (Decidable.rec (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub a b) h) (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub b a) h) (Real.linearOrder.toDecidableLE a b))

Logical form (Lean):

```lean
theorem RealLineDistanceNonneg (a b : ℝ) : RealLineDistance a b ≥ 0
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
theorem RealLineDistanceNonneg (a b : ℝ) : RealLineDistance a b ≥ 0 := by
  sorry
/--
`RealLineDistanceSelf` TODO

Predicate logic:

  ∀ (a : Real), LRA.EuclideanSpace.RealLineDistance a a = 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a : ℝ
  Prove
    Decidable.rec (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub a a) h) (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub a a) h) (Real.linearOrder.6 a a) = 0

Logical form (Lean):

```lean
theorem RealLineDistanceSelf (a : ℝ) : RealLineDistance a a = 0
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
theorem RealLineDistanceSelf (a : ℝ) : RealLineDistance a a = 0 := by
  sorry
/--
`RealLineDistanceSymm` TODO

Predicate logic:

  ∀ (a b : Real), LRA.EuclideanSpace.RealLineDistance a b = LRA.EuclideanSpace.RealLineDistance b a

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    Decidable.rec (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub a b) h) (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub b a) h) (Real.linearOrder.6 a b) = Decidable.rec (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub b a) h) (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub a b) h) (Real.linearOrder.6 b a)

Logical form (Lean):

```lean
theorem RealLineDistanceSymm (a b : ℝ) :
    RealLineDistance a b = RealLineDistance b a
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
theorem RealLineDistanceSymm (a b : ℝ) :
    RealLineDistance a b = RealLineDistance b a := by
  sorry
/--
`RealLineDistanceEqZeroIff` TODO

Predicate logic:

  ∀ (a b : Real), LRA.EuclideanSpace.RealLineDistance a b = 0 ↔ a = b

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    LRA.EuclideanSpace.RealLineDistance a b = 0 ↔ a = b

Logical form (Lean):

```lean
theorem RealLineDistanceEqZeroIff (a b : ℝ) :
    RealLineDistance a b = 0 ↔ a = b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem RealLineDistanceEqZeroIff (a b : ℝ) :
    RealLineDistance a b = 0 ↔ a = b := by
  sorry
/--
`RealLineDistanceTriangleInequality` TODO

Predicate logic:

  ∀ (a b c : Real), Real.instLE.le (LRA.EuclideanSpace.RealLineDistance a c) (instHAdd.hAdd (LRA.EuclideanSpace.RealLineDistance a b) (LRA.EuclideanSpace.RealLineDistance b c))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b c : ℝ
  Prove
    Real.instLE.le (Decidable.rec (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub a c) h) (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub c a) h) (Real.linearOrder.6 a c)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (Decidable.rec (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub a b) h) (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub b a) h) (Real.linearOrder.6 a b)) (Decidable.rec (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub b c) h) (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub c b) h) (Real.linearOrder.6 b c)))

Logical form (Lean):

```lean
theorem RealLineDistanceTriangleInequality (a b c : ℝ) :
    RealLineDistance a c ≤ RealLineDistance a b + RealLineDistance b c
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
theorem RealLineDistanceTriangleInequality (a b c : ℝ) :
    RealLineDistance a c ≤ RealLineDistance a b + RealLineDistance b c := by
  sorry
/--
`OpenIntervalNonemptyIff` TODO

Predicate logic:

  ∀ (a b : Real), LRA.EuclideanSpace.OpenInterval a b ↔ .Nonempty(Real.instLT.lt a b)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    LRA.EuclideanSpace.OpenInterval a b ↔ .Nonempty(Real.instLT.lt a b)

Logical form (Lean):

```lean
theorem OpenIntervalNonemptyIff (a b : ℝ) :
    (OpenInterval a b).Nonempty ↔ a < b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem OpenIntervalNonemptyIff (a b : ℝ) :
    (OpenInterval a b).Nonempty ↔ a < b := by
  sorry
/--
`OpenIntervalSubsetClosedInterval` TODO

Predicate logic:

  ∀ (a b : Real), Set.instLE.le (LRA.EuclideanSpace.OpenInterval a b) (LRA.EuclideanSpace.ClosedInterval a b)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => (Real.instLT.lt a x ∧ Real.instLT.lt x b)) fun x => (Real.instLE.le a x ∧ Real.instLE.le x b)

Logical form (Lean):

```lean
theorem OpenIntervalSubsetClosedInterval (a b : ℝ) :
    OpenInterval a b ⊆ ClosedInterval a b
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
theorem OpenIntervalSubsetClosedInterval (a b : ℝ) :
    OpenInterval a b ⊆ ClosedInterval a b := by
  sorry
/--
`TranslateMapsOpenIntervalToOpenInterval` TODO

Predicate logic:

  ∀ (c a b : Real), Set.image (LRA.EuclideanSpace.Translate1 c) (LRA.EuclideanSpace.OpenInterval a b) = LRA.EuclideanSpace.OpenInterval (instHAdd.hAdd a c) (instHAdd.hAdd b c)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    c a b : ℝ
  Prove
    fun x => Exists fun a_1 => ((a_1 ∈ fun x => (Real.instLT.lt a x ∧ Real.instLT.lt x b)) ∧ { hAdd := fun a b => Real.instAdd.add a b }.hAdd a_1 c = x) = funx => (Real.instLT.lt ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a c) x ∧ Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd b c))

Logical form (Lean):

```lean
theorem TranslateMapsOpenIntervalToOpenInterval (c a b : ℝ) :
    (Translate1 c) '' (OpenInterval a b) = OpenInterval (a + c) (b + c)
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
theorem TranslateMapsOpenIntervalToOpenInterval (c a b : ℝ) :
    (Translate1 c) '' (OpenInterval a b) = OpenInterval (a + c) (b + c) := by
  sorry
/--
`TranslateMapsClosedIntervalToClosedInterval` TODO

Predicate logic:

  ∀ (c a b : Real), Set.image (LRA.EuclideanSpace.Translate1 c) (LRA.EuclideanSpace.ClosedInterval a b) = LRA.EuclideanSpace.ClosedInterval (instHAdd.hAdd a c) (instHAdd.hAdd b c)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    c a b : ℝ
  Prove
    fun x => Exists fun a_1 => ((a_1 ∈ fun x => (Real.instLE.le a x ∧ Real.instLE.le x b)) ∧ { hAdd := fun a b => Real.instAdd.add a b }.hAdd a_1 c = x) = funx => (Real.instLE.le ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a c) x ∧ Real.instLE.le x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd b c))

Logical form (Lean):

```lean
theorem TranslateMapsClosedIntervalToClosedInterval (c a b : ℝ) :
    (Translate1 c) '' (ClosedInterval a b) =
      ClosedInterval (a + c) (b + c)
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
theorem TranslateMapsClosedIntervalToClosedInterval (c a b : ℝ) :
    (Translate1 c) '' (ClosedInterval a b) =
      ClosedInterval (a + c) (b + c) := by
  sorry
/--
`PositiveDilateMapsOpenIntervalToOpenInterval` TODO

Predicate logic:

  ∀ {k : Real} (a b : Real), Real.instLT.lt 0 k → Set.image (LRA.EuclideanSpace.Dilate1 k) (LRA.EuclideanSpace.OpenInterval a b) = LRA.EuclideanSpace.OpenInterval (instHMul.hMul k a) (instHMul.hMul k b)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    k : ℝ
    a b : ℝ
  Prove
    Real.instLT.lt 0 k → fun x => Exists fun a_2 => ((a_2 ∈ fun x => (Real.instLT.lt a x ∧ Real.instLT.lt x b)) ∧ { hMul := fun a b => Real.instMul.mul a b }.hMul k a_2 = x) = funx => (Real.instLT.lt ({ hMul := fun a b => Real.instMul.mul a b }.hMul k a) x ∧ Real.instLT.lt x ({ hMul := fun a b => Real.instMul.mul a b }.hMul k b))

Logical form (Lean):

```lean
theorem PositiveDilateMapsOpenIntervalToOpenInterval {k : ℝ} (a b : ℝ)
    (positiveScale : 0 < k) :
    (Dilate1 k) '' (OpenInterval a b) = OpenInterval (k * a) (k * b)
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
theorem PositiveDilateMapsOpenIntervalToOpenInterval {k : ℝ} (a b : ℝ)
    (positiveScale : 0 < k) :
    (Dilate1 k) '' (OpenInterval a b) = OpenInterval (k * a) (k * b) := by
  sorry
/--
`NegativeDilateReversesOpenInterval` TODO

Predicate logic:

  ∀ {k : Real} (a b : Real), Real.instLT.lt k 0 → Set.image (LRA.EuclideanSpace.Dilate1 k) (LRA.EuclideanSpace.OpenInterval a b) = LRA.EuclideanSpace.OpenInterval (instHMul.hMul k b) (instHMul.hMul k a)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    k : ℝ
    a b : ℝ
  Prove
    Real.instLT.lt k 0 → fun x => Exists fun a_2 => ((a_2 ∈ fun x => (Real.instLT.lt a x ∧ Real.instLT.lt x b)) ∧ { hMul := fun a b => Real.instMul.mul a b }.hMul k a_2 = x) = funx => (Real.instLT.lt ({ hMul := fun a b => Real.instMul.mul a b }.hMul k b) x ∧ Real.instLT.lt x ({ hMul := fun a b => Real.instMul.mul a b }.hMul k a))

Logical form (Lean):

```lean
theorem NegativeDilateReversesOpenInterval {k : ℝ} (a b : ℝ)
    (negativeScale : k < 0) :
    (Dilate1 k) '' (OpenInterval a b) = OpenInterval (k * b) (k * a)
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
theorem NegativeDilateReversesOpenInterval {k : ℝ} (a b : ℝ)
    (negativeScale : k < 0) :
    (Dilate1 k) '' (OpenInterval a b) = OpenInterval (k * b) (k * a) := by
  sorry
/--
`TranslateDistanceInvariant` TODO

Predicate logic:

  ∀ (c a b : Real), LRA.EuclideanSpace.RealLineDistance (LRA.EuclideanSpace.Translate1 c a) (LRA.EuclideanSpace.Translate1 c b) = LRA.EuclideanSpace.RealLineDistance a b

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    c a b : ℝ
  Prove
    Decidable.rec (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a c) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd b c)) h) (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd b c) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a c)) h) (Real.linearOrder.6 (LRA.EuclideanSpace.Translate1 c a) (LRA.EuclideanSpace.Translate1 c b)) = Decidable.rec (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub a b) h) (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub b a) h) (Real.linearOrder.6 a b)

Logical form (Lean):

```lean
theorem TranslateDistanceInvariant (c a b : ℝ) :
    RealLineDistance (Translate1 c a) (Translate1 c b) =
      RealLineDistance a b
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
theorem TranslateDistanceInvariant (c a b : ℝ) :
    RealLineDistance (Translate1 c a) (Translate1 c b) =
      RealLineDistance a b := by
  sorry
/--
`DilateScalesDistance` TODO

Predicate logic:

  ∀ (k a b : Real), LRA.EuclideanSpace.RealLineDistance (LRA.EuclideanSpace.Dilate1 k a) (LRA.EuclideanSpace.Dilate1 k b) = instHMul.hMul (LRA.EuclideanSpace.RealLineDistance 0 k) (LRA.EuclideanSpace.RealLineDistance a b)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    k a b : ℝ
  Prove
    Decidable.rec (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub ({ hMul := fun a b => Real.instMul.mul a b }.hMul k a) ({ hMul := fun a b => Real.instMul.mul a b }.hMul k b)) h) (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub ({ hMul := fun a b => Real.instMul.mul a b }.hMul k b) ({ hMul := fun a b => Real.instMul.mul a b }.hMul k a)) h) (Real.linearOrder.6 (LRA.EuclideanSpace.Dilate1 k a) (LRA.EuclideanSpace.Dilate1 k b)) = { hMul := fun a b => Real.instMul.mul a b }.hMul (Decidable.rec (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub 0 k) h) (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub k 0) h) (Real.linearOrder.6 0 k)) (Decidable.rec (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub a b) h) (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub b a) h) (Real.linearOrder.6 a b))

Logical form (Lean):

```lean
theorem DilateScalesDistance (k a b : ℝ) :
    RealLineDistance (Dilate1 k a) (Dilate1 k b) =
      (RealLineDistance 0 k) * RealLineDistance a b
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
theorem DilateScalesDistance (k a b : ℝ) :
    RealLineDistance (Dilate1 k a) (Dilate1 k b) =
      (RealLineDistance 0 k) * RealLineDistance a b := by
  sorry
end LRA.EuclideanSpace
