import Mathlib.Data.Real.Basic
import LRA.EuclideanSpace.RealLine.Definition.RealLine

namespace LRA.EuclideanSpace

/--
`RealLineDistanceNonneg` TODO

Predicate logic:

  RealLineDistance a b ≥ 0

Predicate logic (unfolded):

  ∀ (a b : Real), Real.instLE.1 Zero.toOfNat0.1 (Decidable.rec (fun h => (fun x => instHSub.1 a b) h) (fun h => (fun x => instHSub.1 b a) h) inferInstance)

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

  RealLineDistance a a = 0

Predicate logic (unfolded):

  ∀ (a : Real), Decidable.rec (fun h => (fun x => instHSub.1 a a) h) (fun h => (fun x => instHSub.1 a a) h) (Real.linearOrder.6 a a) = Zero.toOfNat0.1

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

  RealLineDistance a b = RealLineDistance b a

Predicate logic (unfolded):

  ∀ (a b : Real), Decidable.rec (fun h => (fun x => instHSub.1 a b) h) (fun h => (fun x => instHSub.1 b a) h) (Real.linearOrder.6 a b) = Decidable.rec (fun h => (fun x => instHSub.1 b a) h) (fun h => (fun x => instHSub.1 a b) h) (Real.linearOrder.6 b a)

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

  RealLineDistance a b = 0 ↔ a = b

Predicate logic (unfolded):

  ∀ (a b : Real), Decidable.rec (fun h => (fun x => instHSub.1 a b) h) (fun h => (fun x => instHSub.1 b a) h) (Real.linearOrder.6 a b) = Zero.toOfNat0.1 ↔ a = b

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

  RealLineDistance a c ≤ RealLineDistance a b + RealLineDistance b c

Predicate logic (unfolded):

  ∀ (a b c : Real), Real.instLE.1 (Decidable.rec (fun h => (fun x => instHSub.1 a c) h) (fun h => (fun x => instHSub.1 c a) h) (Real.linearOrder.toDecidableLE a c)) (instHAdd.1 (Decidable.rec (fun h => (fun x => instHSub.1 a b) h) (fun h => (fun x => instHSub.1 b a) h) inferInstance) (Decidable.rec (fun h => (fun x => instHSub.1 b c) h) (fun h => (fun x => instHSub.1 c b) h) inferInstance))

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

  (OpenInterval a b).Nonempty ↔ a < b

Predicate logic (unfolded):

  ∀ (a b : Real), Exists fun x => Set.instMembership.1 (fun x => (Real.instLT.1 a x ∧ Real.instLT.1 x b)) x ↔ Real.instLT.1 a b

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

  OpenInterval a b ⊆ ClosedInterval a b

Predicate logic (unfolded):

  ∀ (a b : Real), Set.instLE.1 (fun x => (Real.instLT.1 a x ∧ Real.instLT.1 x b)) fun x => (Real.instLE.1 a x ∧ Real.instLE.1 x b)

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

  (Translate1 c) '' (OpenInterval a b) = OpenInterval (a + c) (b + c)

Predicate logic (unfolded):

  ∀ (c a b : Real), fun x => Exists fun a_1 => (Set.instMembership.1 (fun x => (Real.instLT.1 a x ∧ Real.instLT.1 x b)) a_1 ∧ instHAdd.1 a_1 c = x) = funx => (Real.instLT.1 (instHAdd.1 a c) x ∧ Real.instLT.1 x (instHAdd.1 b c))

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

  (Translate1 c) '' (ClosedInterval a b) = ClosedInterval (a + c) (b + c)

Predicate logic (unfolded):

  ∀ (c a b : Real), fun x => Exists fun a_1 => (Set.instMembership.1 (fun x => (Real.instLE.1 a x ∧ Real.instLE.1 x b)) a_1 ∧ instHAdd.1 a_1 c = x) = funx => (Real.instLE.1 (instHAdd.1 a c) x ∧ Real.instLE.1 x (instHAdd.1 b c))

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

  (0 < k) → (Dilate1 k) '' (OpenInterval a b) = OpenInterval (k * a) (k * b)

Predicate logic (unfolded):

  ∀ {k : Real} (a b : Real), Real.instLT.1 Zero.toOfNat0.1 k → fun x => Exists fun a_2 => (Set.instMembership.1 (fun x => (Real.instLT.1 a x ∧ Real.instLT.1 x b)) a_2 ∧ instHMul.1 k a_2 = x) = funx => (Real.instLT.1 (instHMul.1 k a) x ∧ Real.instLT.1 x (instHMul.1 k b))

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

  (k < 0) → (Dilate1 k) '' (OpenInterval a b) = OpenInterval (k * b) (k * a)

Predicate logic (unfolded):

  ∀ {k : Real} (a b : Real), Real.instLT.1 k Zero.toOfNat0.1 → fun x => Exists fun a_2 => (Set.instMembership.1 (fun x => (Real.instLT.1 a x ∧ Real.instLT.1 x b)) a_2 ∧ instHMul.1 k a_2 = x) = funx => (Real.instLT.1 (instHMul.1 k b) x ∧ Real.instLT.1 x (instHMul.1 k a))

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

  RealLineDistance (Translate1 c a) (Translate1 c b) = RealLineDistance a b

Predicate logic (unfolded):

  ∀ (c a b : Real), Decidable.rec (fun h => (fun x => instHSub.1 (instHAdd.1 a c) (instHAdd.1 b c)) h) (fun h => (fun x => instHSub.1 (instHAdd.1 b c) (instHAdd.1 a c)) h) (Real.linearOrder.6 (LRA.EuclideanSpace.Translate1 c a) (LRA.EuclideanSpace.Translate1 c b)) = Decidable.rec (fun h => (fun x => instHSub.1 a b) h) (fun h => (fun x => instHSub.1 b a) h) (Real.linearOrder.6 a b)

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

  RealLineDistance (Dilate1 k a) (Dilate1 k b) = (RealLineDistance 0 k) * RealLineDistance a b

Predicate logic (unfolded):

  ∀ (k a b : Real), Decidable.rec (fun h => (fun x => instHSub.1 (instHMul.1 k a) (instHMul.1 k b)) h) (fun h => (fun x => instHSub.1 (instHMul.1 k b) (instHMul.1 k a)) h) (Real.linearOrder.6 (LRA.EuclideanSpace.Dilate1 k a) (LRA.EuclideanSpace.Dilate1 k b)) = instHMul.1 (Decidable.rec (fun h => (fun x => instHSub.1 Zero.toOfNat0.1 k) h) (fun h => (fun x => instHSub.1 k Zero.toOfNat0.1) h) (Real.linearOrder.toDecidableLE 0 k)) (Decidable.rec (fun h => (fun x => instHSub.1 a b) h) (fun h => (fun x => instHSub.1 b a) h) (Real.linearOrder.toDecidableLE a b))

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
