import Mathlib.Algebra.Group.Pointwise.Set.Basic
import Mathlib.Data.Rat.Defs
import Mathlib.Data.Real.Basic
import LRA.Analysis.Bounds.Extrema.SupremaInfima

open scoped Pointwise

namespace LRA.Analysis.Bounds.Algebra
open scoped Pointwise

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

/--
`Reciprocal` TODO

Predicate logic:

  ∀ (A : Set Real) (a : Real), Exists fun a_1 => (a_1 ∈ A ∧ (fun a => Real.instInv.inv a) a_1 = a)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun a_1 => (a_1 ∈ A ∧ (fun a => Real.instInv.1 a) a_1 = a)

Logical form (Lean):

```lean
def Reciprocal (A : Set ℝ) : Set ℝ :=
  (fun a => a⁻¹) '' A
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
def Reciprocal (A : Set ℝ) : Set ℝ :=
  (fun a => a⁻¹) '' A

/--
`ScalarImage` TODO

Predicate logic:

  ∀ (scale : Real) (A : Set Real) (a : Real), Exists fun a_1 => (a_1 ∈ A ∧ (fun a => instHMul.hMul scale a) a_1 = a)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun a_1 => (a_1 ∈ A ∧ (fun a => { hMul := fun a b => Real.instMul.mul a b }.hMul scale a) a_1 = a)

Logical form (Lean):

```lean
def ScalarImage (scale : ℝ) (A : Set ℝ) : Set ℝ :=
  (fun a => scale * a) '' A
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
def ScalarImage (scale : ℝ) (A : Set ℝ) : Set ℝ :=
  (fun a => scale * a) '' A

/--
`IsRelativeUpperBound` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : Preorder S] (ambient : Set S) (u : S) (A : Set S), (u ∈ ambient ∧ LRA.Analysis.Bounds.IsUpperBound u A)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (u ∈ ambient ∧ (∀ (x : S), x ∈ A → inst.1.le x u))

Logical form (Lean):

```lean
def IsRelativeUpperBound [Preorder S] (ambient : Set S) (u : S) (A : Set S) : Prop :=
  u ∈ ambient ∧ IsUpperBound u A
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
def IsRelativeUpperBound [Preorder S] (ambient : Set S) (u : S) (A : Set S) : Prop :=
  u ∈ ambient ∧ IsUpperBound u A

/--
`IsRelativeLowerBound` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : Preorder S] (ambient : Set S) (l : S) (A : Set S), (l ∈ ambient ∧ LRA.Analysis.Bounds.IsLowerBound l A)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (l ∈ ambient ∧ (∀ (x : S), x ∈ A → inst.1.le l x))

Logical form (Lean):

```lean
def IsRelativeLowerBound [Preorder S] (ambient : Set S) (l : S) (A : Set S) : Prop :=
  l ∈ ambient ∧ IsLowerBound l A
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
def IsRelativeLowerBound [Preorder S] (ambient : Set S) (l : S) (A : Set S) : Prop :=
  l ∈ ambient ∧ IsLowerBound l A

/--
`IsRelativeSupremum` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : Preorder S] (ambient : Set S) (s : S) (A : Set S), (LRA.Analysis.Bounds.Algebra.IsRelativeUpperBound ambient s A ∧ (∀ (u : S), LRA.Analysis.Bounds.Algebra.IsRelativeUpperBound ambient u A → inst.le s u))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((s ∈ ambient ∧ (∀ (x : S), x ∈ A → inst.1.le x s)) ∧ (∀ (u : S), (u ∈ ambient ∧ (∀ (x : S), x ∈ A → inst.1.le x u)) → inst.1.le s u))

Logical form (Lean):

```lean
def IsRelativeSupremum [Preorder S] (ambient : Set S) (s : S) (A : Set S) : Prop :=
  IsRelativeUpperBound ambient s A ∧
    ∀ u, IsRelativeUpperBound ambient u A → s ≤ u
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def IsRelativeSupremum [Preorder S] (ambient : Set S) (s : S) (A : Set S) : Prop :=
  IsRelativeUpperBound ambient s A ∧
    ∀ u, IsRelativeUpperBound ambient u A → s ≤ u

/--
`IsRelativeInfimum` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : Preorder S] (ambient : Set S) (i : S) (A : Set S), (LRA.Analysis.Bounds.Algebra.IsRelativeLowerBound ambient i A ∧ (∀ (l : S), LRA.Analysis.Bounds.Algebra.IsRelativeLowerBound ambient l A → inst.le l i))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((i ∈ ambient ∧ (∀ (x : S), x ∈ A → inst.1.le i x)) ∧ (∀ (l : S), (l ∈ ambient ∧ (∀ (x : S), x ∈ A → inst.1.le l x)) → inst.1.le l i))

Logical form (Lean):

```lean
def IsRelativeInfimum [Preorder S] (ambient : Set S) (i : S) (A : Set S) : Prop :=
  IsRelativeLowerBound ambient i A ∧
    ∀ l, IsRelativeLowerBound ambient l A → l ≤ i
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def IsRelativeInfimum [Preorder S] (ambient : Set S) (i : S) (A : Set S) : Prop :=
  IsRelativeLowerBound ambient i A ∧
    ∀ l, IsRelativeLowerBound ambient l A → l ≤ i

/--
`TranslationPreservesSuprema` TODO

Predicate logic:

  ∀ {A : Set Real}, A.Nonempty → ∀ {s : Real}, LRA.Analysis.Bounds.IsSupremum s A → ∀ (c : Real), LRA.Analysis.Bounds.IsSupremum (instHAdd.hAdd s c) (instHAdd.hAdd A (Set.instSingletonSet.singleton c))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    nonemptyHypothesis : A.Nonempty
    s : ℝ
    c : ℝ
  Prove
    (Exists fun x => x) ∈ A → ∀ {s : Real}, ((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x s) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le s u)) → ∀ (c : Real), ((∀ (x : Real), x ∈ { hAdd := fun a b => { add := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHAdd.hAdd x1 x2) a b = c))) }.add a b }.hAdd A (Set.instSingletonSet.1 c) → Real.instPreorder.1.le x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd s c)) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ { hAdd := fun a b => { add := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHAdd.hAdd x1 x2) a b = c))) }.add a b }.hAdd A (Set.instSingletonSet.1 c) → Real.instPreorder.1.le x u) → Real.instPreorder.1.le ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd s c) u))

Logical form (Lean):

```lean
theorem TranslationPreservesSuprema {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    {s : ℝ} (supremumHypothesis : IsSupremum s A) (c : ℝ) :
    IsSupremum (s + c) (A + {c})
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
theorem TranslationPreservesSuprema {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    {s : ℝ} (supremumHypothesis : IsSupremum s A) (c : ℝ) :
    IsSupremum (s + c) (A + {c}) := by
  sorry
/--
`TranslationPreservesInfima` TODO

Predicate logic:

  ∀ {A : Set Real}, A.Nonempty → ∀ {i : Real}, LRA.Analysis.Bounds.IsInfimum i A → ∀ (c : Real), LRA.Analysis.Bounds.IsInfimum (instHAdd.hAdd i c) (instHAdd.hAdd A (Set.instSingletonSet.singleton c))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    nonemptyHypothesis : A.Nonempty
    i : ℝ
    c : ℝ
  Prove
    (Exists fun x => x) ∈ A → ∀ {i : Real}, ((∀ (x : Real), x ∈ A → Real.instPreorder.1.le i x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l i)) → ∀ (c : Real), ((∀ (x : Real), x ∈ { hAdd := fun a b => { add := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHAdd.hAdd x1 x2) a b = c))) }.add a b }.hAdd A (Set.instSingletonSet.1 c) → Real.instPreorder.1.le ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd i c) x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ { hAdd := fun a b => { add := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHAdd.hAdd x1 x2) a b = c))) }.add a b }.hAdd A (Set.instSingletonSet.1 c) → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd i c)))

Logical form (Lean):

```lean
theorem TranslationPreservesInfima {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    {i : ℝ} (infimumHypothesis : IsInfimum i A) (c : ℝ) :
    IsInfimum (i + c) (A + {c})
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
theorem TranslationPreservesInfima {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    {i : ℝ} (infimumHypothesis : IsInfimum i A) (c : ℝ) :
    IsInfimum (i + c) (A + {c}) := by
  sorry
/--
`PositiveScalarMultiplicationPreservesSuprema` TODO

Predicate logic:

  ∀ {A : Set Real}, A.Nonempty → ∀ {s scale : Real}, (LRA.Analysis.Bounds.IsSupremum s A ∧ GT.gt scale 0) → LRA.Analysis.Bounds.IsSupremum (instHMul.hMul scale s) (LRA.Analysis.Bounds.Algebra.ScalarImage scale A)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    nonemptyHypothesis : A.Nonempty
    s scale : ℝ
    positiveScaleHypothesis : scale > 0
  Prove
    (Exists fun x => x) ∈ A → ∀ {s scale : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x s) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le s u)) ∧ Real.instLT.lt 0 scale) → ((∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (fun a => instHMul.hMul scale a) a = x) → Real.instPreorder.1.le x ({ hMul := fun a b => Real.instMul.mul a b }.hMul scale s)) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (fun a => instHMul.hMul scale a) a = x) → Real.instPreorder.1.le x u) → Real.instPreorder.1.le ({ hMul := fun a b => Real.instMul.mul a b }.hMul scale s) u))

Logical form (Lean):

```lean
theorem PositiveScalarMultiplicationPreservesSuprema {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {s scale : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (positiveScaleHypothesis : scale > 0) :
    IsSupremum (scale * s) (ScalarImage scale A)
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
theorem PositiveScalarMultiplicationPreservesSuprema {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {s scale : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (positiveScaleHypothesis : scale > 0) :
    IsSupremum (scale * s) (ScalarImage scale A) := by
  sorry
/--
`PositiveScalarMultiplicationPreservesInfima` TODO

Predicate logic:

  ∀ {A : Set Real}, A.Nonempty → ∀ {i scale : Real}, (LRA.Analysis.Bounds.IsInfimum i A ∧ GT.gt scale 0) → LRA.Analysis.Bounds.IsInfimum (instHMul.hMul scale i) (LRA.Analysis.Bounds.Algebra.ScalarImage scale A)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    nonemptyHypothesis : A.Nonempty
    i scale : ℝ
    positiveScaleHypothesis : scale > 0
  Prove
    (Exists fun x => x) ∈ A → ∀ {i scale : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le i x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l i)) ∧ Real.instLT.lt 0 scale) → ((∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (fun a => instHMul.hMul scale a) a = x) → Real.instPreorder.1.le ({ hMul := fun a b => Real.instMul.mul a b }.hMul scale i) x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (fun a => instHMul.hMul scale a) a = x) → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l ({ hMul := fun a b => Real.instMul.mul a b }.hMul scale i)))

Logical form (Lean):

```lean
theorem PositiveScalarMultiplicationPreservesInfima {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {i scale : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (positiveScaleHypothesis : scale > 0) :
    IsInfimum (scale * i) (ScalarImage scale A)
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
theorem PositiveScalarMultiplicationPreservesInfima {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {i scale : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (positiveScaleHypothesis : scale > 0) :
    IsInfimum (scale * i) (ScalarImage scale A) := by
  sorry
/--
`NegativeScalarMultiplicationSendsInfimaToSuprema` TODO

Predicate logic:

  ∀ {A : Set Real}, A.Nonempty → ∀ {i scale : Real}, (LRA.Analysis.Bounds.IsInfimum i A ∧ Real.instLT.lt scale 0) → LRA.Analysis.Bounds.IsSupremum (instHMul.hMul scale i) (LRA.Analysis.Bounds.Algebra.ScalarImage scale A)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    nonemptyHypothesis : A.Nonempty
    i scale : ℝ
  Prove
    (Exists fun x => x) ∈ A → ∀ {i scale : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le i x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l i)) ∧ Real.instLT.lt scale 0) → ((∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (fun a => instHMul.hMul scale a) a = x) → Real.instPreorder.1.le x ({ hMul := fun a b => Real.instMul.mul a b }.hMul scale i)) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (fun a => instHMul.hMul scale a) a = x) → Real.instPreorder.1.le x u) → Real.instPreorder.1.le ({ hMul := fun a b => Real.instMul.mul a b }.hMul scale i) u))

Logical form (Lean):

```lean
theorem NegativeScalarMultiplicationSendsInfimaToSuprema {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {i scale : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (negativeScaleHypothesis : scale < 0) :
    IsSupremum (scale * i) (ScalarImage scale A)
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
theorem NegativeScalarMultiplicationSendsInfimaToSuprema {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {i scale : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (negativeScaleHypothesis : scale < 0) :
    IsSupremum (scale * i) (ScalarImage scale A) := by
  sorry
/--
`NegativeScalarMultiplicationSendsSupremaToInfima` TODO

Predicate logic:

  ∀ {A : Set Real}, A.Nonempty → ∀ {s scale : Real}, (LRA.Analysis.Bounds.IsSupremum s A ∧ Real.instLT.lt scale 0) → LRA.Analysis.Bounds.IsInfimum (instHMul.hMul scale s) (LRA.Analysis.Bounds.Algebra.ScalarImage scale A)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    nonemptyHypothesis : A.Nonempty
    s scale : ℝ
  Prove
    (Exists fun x => x) ∈ A → ∀ {s scale : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x s) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le s u)) ∧ Real.instLT.lt scale 0) → ((∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (fun a => instHMul.hMul scale a) a = x) → Real.instPreorder.1.le ({ hMul := fun a b => Real.instMul.mul a b }.hMul scale s) x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (fun a => instHMul.hMul scale a) a = x) → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l ({ hMul := fun a b => Real.instMul.mul a b }.hMul scale s)))

Logical form (Lean):

```lean
theorem NegativeScalarMultiplicationSendsSupremaToInfima {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {s scale : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (negativeScaleHypothesis : scale < 0) :
    IsInfimum (scale * s) (ScalarImage scale A)
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
theorem NegativeScalarMultiplicationSendsSupremaToInfima {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {s scale : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (negativeScaleHypothesis : scale < 0) :
    IsInfimum (scale * s) (ScalarImage scale A) := by
  sorry
/--
`NegationExchangesInfimaAndSuprema` TODO

Predicate logic:

  ∀ {A : Set Real}, A.Nonempty → ∀ {i : Real}, LRA.Analysis.Bounds.IsInfimum i A → LRA.Analysis.Bounds.IsSupremum (Real.instNeg.neg i) (Set.neg.neg A)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    nonemptyHypothesis : A.Nonempty
    i : ℝ
  Prove
    (Exists fun x => x) ∈ A → ∀ {i : Real}, ((∀ (x : Real), x ∈ A → Real.instPreorder.1.le i x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l i)) → ((∀ (x : Real), x ∈ { neg := fun s x => Real.instNeg.neg x ∈ s }.neg A → Real.instPreorder.1.le x (Real.instNeg.neg i)) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ { neg := fun s x => Real.instNeg.neg x ∈ s }.neg A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le (Real.instNeg.neg i) u))

Logical form (Lean):

```lean
theorem NegationExchangesInfimaAndSuprema {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {i : ℝ}
    (infimumHypothesis : IsInfimum i A) :
    IsSupremum (-i) (-A)
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
theorem NegationExchangesInfimaAndSuprema {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {i : ℝ}
    (infimumHypothesis : IsInfimum i A) :
    IsSupremum (-i) (-A) := by
  sorry
/--
`SupremumOfPointwiseSum` TODO

Predicate logic:

  ∀ {A B : Set Real}, (A.Nonempty ∧ B.Nonempty) → ∀ {sA sB : Real}, (LRA.Analysis.Bounds.IsSupremum sA A ∧ LRA.Analysis.Bounds.IsSupremum sB B) → LRA.Analysis.Bounds.IsSupremum (instHAdd.hAdd sA sB) (instHAdd.hAdd A B)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A B : Set ℝ
    leftNonemptyHypothesis : A.Nonempty
    rightNonemptyHypothesis : B.Nonempty
    sA sB : ℝ
  Prove
    (Exists fun x => x ∈ A ∧ Exists fun x => x ∈ B) → ∀ {sA sB : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x sA) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le sA u)) ∧ ((∀ (x : Real), x ∈ B → Real.instPreorder.1.le x sB) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le x u) → Real.instPreorder.1.le sB u))) → ((∀ (x : Real), x ∈ { hAdd := fun a b => { add := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHAdd.hAdd x1 x2) a b = c))) }.add a b }.hAdd A B → Real.instPreorder.1.le x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd sA sB)) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ { hAdd := fun a b => { add := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHAdd.hAdd x1 x2) a b = c))) }.add a b }.hAdd A B → Real.instPreorder.1.le x u) → Real.instPreorder.1.le ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd sA sB) u))

Logical form (Lean):

```lean
theorem SupremumOfPointwiseSum {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (rightSupremumHypothesis : IsSupremum sB B) :
    IsSupremum (sA + sB) (A + B)
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
theorem SupremumOfPointwiseSum {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (rightSupremumHypothesis : IsSupremum sB B) :
    IsSupremum (sA + sB) (A + B) := by
  sorry
/--
`InfimumOfPointwiseSum` TODO

Predicate logic:

  ∀ {A B : Set Real}, (A.Nonempty ∧ B.Nonempty) → ∀ {iA iB : Real}, (LRA.Analysis.Bounds.IsInfimum iA A ∧ LRA.Analysis.Bounds.IsInfimum iB B) → LRA.Analysis.Bounds.IsInfimum (instHAdd.hAdd iA iB) (instHAdd.hAdd A B)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A B : Set ℝ
    leftNonemptyHypothesis : A.Nonempty
    rightNonemptyHypothesis : B.Nonempty
    iA iB : ℝ
  Prove
    (Exists fun x => x ∈ A ∧ Exists fun x => x ∈ B) → ∀ {iA iB : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le iA x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l iA)) ∧ ((∀ (x : Real), x ∈ B → Real.instPreorder.1.le iB x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l iB))) → ((∀ (x : Real), x ∈ { hAdd := fun a b => { add := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHAdd.hAdd x1 x2) a b = c))) }.add a b }.hAdd A B → Real.instPreorder.1.le ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd iA iB) x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ { hAdd := fun a b => { add := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHAdd.hAdd x1 x2) a b = c))) }.add a b }.hAdd A B → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd iA iB)))

Logical form (Lean):

```lean
theorem InfimumOfPointwiseSum {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {iA iB : ℝ}
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsInfimum (iA + iB) (A + B)
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
theorem InfimumOfPointwiseSum {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {iA iB : ℝ}
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsInfimum (iA + iB) (A + B) := by
  sorry
/--
`SupremumOfPointwiseDifference` TODO

Predicate logic:

  ∀ {A B : Set Real}, (A.Nonempty ∧ B.Nonempty) → ∀ {sA iB : Real}, (LRA.Analysis.Bounds.IsSupremum sA A ∧ LRA.Analysis.Bounds.IsInfimum iB B) → LRA.Analysis.Bounds.IsSupremum (instHSub.hSub sA iB) (instHSub.hSub A B)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A B : Set ℝ
    leftNonemptyHypothesis : A.Nonempty
    rightNonemptyHypothesis : B.Nonempty
    sA iB : ℝ
  Prove
    (Exists fun x => x ∈ A ∧ Exists fun x => x ∈ B) → ∀ {sA iB : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x sA) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le sA u)) ∧ ((∀ (x : Real), x ∈ B → Real.instPreorder.1.le iB x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l iB))) → ((∀ (x : Real), x ∈ { hSub := fun a b => { sub := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHSub.hSub x1 x2) a b = c))) }.sub a b }.hSub A B → Real.instPreorder.1.le x ({ hSub := fun a b => Real.instSub.sub a b }.hSub sA iB)) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ { hSub := fun a b => { sub := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHSub.hSub x1 x2) a b = c))) }.sub a b }.hSub A B → Real.instPreorder.1.le x u) → Real.instPreorder.1.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub sA iB) u))

Logical form (Lean):

```lean
theorem SupremumOfPointwiseDifference {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA iB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsSupremum (sA - iB) (A - B)
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
theorem SupremumOfPointwiseDifference {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA iB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsSupremum (sA - iB) (A - B) := by
  sorry
/--
`InfimumOfPointwiseDifference` TODO

Predicate logic:

  ∀ {A B : Set Real}, (A.Nonempty ∧ B.Nonempty) → ∀ {iA sB : Real}, (LRA.Analysis.Bounds.IsInfimum iA A ∧ LRA.Analysis.Bounds.IsSupremum sB B) → LRA.Analysis.Bounds.IsInfimum (instHSub.hSub iA sB) (instHSub.hSub A B)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A B : Set ℝ
    leftNonemptyHypothesis : A.Nonempty
    rightNonemptyHypothesis : B.Nonempty
    iA sB : ℝ
  Prove
    (Exists fun x => x ∈ A ∧ Exists fun x => x ∈ B) → ∀ {iA sB : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le iA x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l iA)) ∧ ((∀ (x : Real), x ∈ B → Real.instPreorder.1.le x sB) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le x u) → Real.instPreorder.1.le sB u))) → ((∀ (x : Real), x ∈ { hSub := fun a b => { sub := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHSub.hSub x1 x2) a b = c))) }.sub a b }.hSub A B → Real.instPreorder.1.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub iA sB) x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ { hSub := fun a b => { sub := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHSub.hSub x1 x2) a b = c))) }.sub a b }.hSub A B → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l ({ hSub := fun a b => Real.instSub.sub a b }.hSub iA sB)))

Logical form (Lean):

```lean
theorem InfimumOfPointwiseDifference {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {iA sB : ℝ}
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightSupremumHypothesis : IsSupremum sB B) :
    IsInfimum (iA - sB) (A - B)
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
theorem InfimumOfPointwiseDifference {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {iA sB : ℝ}
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightSupremumHypothesis : IsSupremum sB B) :
    IsInfimum (iA - sB) (A - B) := by
  sorry
/--
`SupremumOfDilation` TODO

Predicate logic:

  ∀ {A : Set Real}, (A.Nonempty ∧ LRA.Analysis.Bounds.IsBounded A) → ∀ (scale : Real) {s i : Real}, (LRA.Analysis.Bounds.IsSupremum s A ∧ LRA.Analysis.Bounds.IsInfimum i A) → LRA.Analysis.Bounds.IsSupremum (ite (GT.gt scale 0) (instHMul.hMul scale s) (ite (scale = 0)0 (instHMul.hMul scale i))) (LRA.Analysis.Bounds.Algebra.ScalarImage scale A)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    nonemptyHypothesis : A.Nonempty
    scale : ℝ
    s i : ℝ
  Prove
    (Exists fun x => x ∈ A ∧ ((Exists fun u => ∀ (x : Real), x ∈ A → Real.instLE.le x u) ∧ (Exists fun l => ∀ (x : Real), x ∈ A → Real.instLE.le l x))) → ∀ (scale : Real) {s i : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x s) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le s u)) ∧ ((∀ (x : Real), x ∈ A → Real.instPreorder.1.le i x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l i))) → ((∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (fun a => instHMul.hMul scale a) a = x) → Real.instPreorder.1.le x (Decidable.rec (fun h => (fun x => Decidable.rec (fun h => (fun x => instHMul.hMul scale i) h) (fun h => (fun x => 0) h) (scale.decidable0)) = h) (fun h => (fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul scale s) h) (Real.linearOrder.toDecidableLT 0 scale))) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (fun a => instHMul.hMul scale a) a = x) → Real.instPreorder.1.le x u) → Real.instPreorder.1.le (Decidable.rec (fun h => (fun x => Decidable.rec (fun h => (fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul scale i) h) (fun h => (fun x => 0) h) inferInstance) h) (fun h => (fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul scale s) h) (Real.linearOrder.8 0 scale)) u))

Logical form (Lean):

```lean
theorem SupremumOfDilation {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedHypothesis : IsBounded A)
    (scale : ℝ) {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i A) :
    IsSupremum
      (if scale > 0 then scale * s else if scale = 0 then 0 else scale * i)
      (ScalarImage scale A)
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
theorem SupremumOfDilation {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedHypothesis : IsBounded A)
    (scale : ℝ) {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i A) :
    IsSupremum
      (if scale > 0 then scale * s else if scale = 0 then 0 else scale * i)
      (ScalarImage scale A) := by
  sorry
/--
`SupremumOfAbsoluteValueImage` TODO

Predicate logic:

  ∀ {A : Set Real}, A.Nonempty → ∀ {s i : Real}, (LRA.Analysis.Bounds.IsSupremum s A ∧ LRA.Analysis.Bounds.IsInfimum i A) → LRA.Analysis.Bounds.IsSupremum (Real.instMax.max (abs i) (abs s)) (Set.image abs A)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    nonemptyHypothesis : A.Nonempty
    s i : ℝ
  Prove
    (Exists fun x => x) ∈ A → ∀ {s i : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x s) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le s u)) ∧ ((∀ (x : Real), x ∈ A → Real.instPreorder.1.le i x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l i))) → ((∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ abs a = x) → Real.instPreorder.1.le x (Real.instMax.1 (abs i) (abs s))) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ abs a = x) → Real.instPreorder.1.le x u) → Real.instPreorder.1.le (Real.instMax.1 (abs i) (abs s)) u))

Logical form (Lean):

```lean
theorem SupremumOfAbsoluteValueImage {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i A) :
    IsSupremum (max |i| |s|) (abs '' A)
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
theorem SupremumOfAbsoluteValueImage {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i A) :
    IsSupremum (max |i| |s|) (abs '' A) := by
  sorry
/--
`SupremumOfReciprocalSet` TODO

Predicate logic:

  ∀ {A : Set Real}, (A.Nonempty ∧ LRA.Analysis.Bounds.IsBounded A) → ∀ {s i : Real}, (LRA.Analysis.Bounds.IsSupremum s A ∧ (LRA.Analysis.Bounds.IsInfimum i A ∧ Or (Real.instLT.lt 0 i) (Real.instLT.lt s 0))) → LRA.Analysis.Bounds.IsSupremum (Real.instInv.inv i) (LRA.Analysis.Bounds.Algebra.Reciprocal A)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    nonemptyHypothesis : A.Nonempty
    s i : ℝ
  Prove
    (Exists fun x => x ∈ A ∧ ((Exists fun u => ∀ (x : Real), x ∈ A → Real.instLE.le x u) ∧ (Exists fun l => ∀ (x : Real), x ∈ A → Real.instLE.le l x))) → ∀ {s i : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x s) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le s u)) ∧ (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le i x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l i)) ∧ Or (Real.instLT.lt 0 i) (Real.instLT.lt s 0))) → ((∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (fun a => Real.instInv.inv a) a = x) → Real.instPreorder.1.le x (Real.instInv.1 i)) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (fun a => Real.instInv.inv a) a = x) → Real.instPreorder.1.le x u) → Real.instPreorder.1.le (Real.instInv.1 i) u))

Logical form (Lean):

```lean
theorem SupremumOfReciprocalSet {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedHypothesis : IsBounded A)
    {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i A)
    (separatedFromZeroHypothesis : 0 < i ∨ s < 0) :
    IsSupremum i⁻¹ (Reciprocal A)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases

-/
theorem SupremumOfReciprocalSet {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedHypothesis : IsBounded A)
    {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i A)
    (separatedFromZeroHypothesis : 0 < i ∨ s < 0) :
    IsSupremum i⁻¹ (Reciprocal A) := by
  sorry
/--
`InfimumOfReciprocalSet` TODO

Predicate logic:

  ∀ {A : Set Real}, (A.Nonempty ∧ LRA.Analysis.Bounds.IsBounded A) → ∀ {s i : Real}, (LRA.Analysis.Bounds.IsSupremum s A ∧ (LRA.Analysis.Bounds.IsInfimum i A ∧ Or (Real.instLT.lt 0 i) (Real.instLT.lt s 0))) → LRA.Analysis.Bounds.IsInfimum (Real.instInv.inv s) (LRA.Analysis.Bounds.Algebra.Reciprocal A)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    nonemptyHypothesis : A.Nonempty
    s i : ℝ
  Prove
    (Exists fun x => x ∈ A ∧ ((Exists fun u => ∀ (x : Real), x ∈ A → Real.instLE.le x u) ∧ (Exists fun l => ∀ (x : Real), x ∈ A → Real.instLE.le l x))) → ∀ {s i : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x s) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le s u)) ∧ (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le i x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l i)) ∧ Or (Real.instLT.lt 0 i) (Real.instLT.lt s 0))) → ((∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (fun a => Real.instInv.inv a) a = x) → Real.instPreorder.1.le (Real.instInv.1 s) x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (fun a => Real.instInv.inv a) a = x) → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l (Real.instInv.1 s)))

Logical form (Lean):

```lean
theorem InfimumOfReciprocalSet {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedHypothesis : IsBounded A)
    {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i A)
    (separatedFromZeroHypothesis : 0 < i ∨ s < 0) :
    IsInfimum s⁻¹ (Reciprocal A)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases

-/
theorem InfimumOfReciprocalSet {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedHypothesis : IsBounded A)
    {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i A)
    (separatedFromZeroHypothesis : 0 < i ∨ s < 0) :
    IsInfimum s⁻¹ (Reciprocal A) := by
  sorry
/--
`SupremumOfPointwiseProduct` TODO

Predicate logic:

  ∀ {A B : Set Real}, (A.Nonempty ∧ B.Nonempty) → ∀ {sA sB iA iB : Real}, (LRA.Analysis.Bounds.IsSupremum sA A ∧ (LRA.Analysis.Bounds.IsInfimum iA A ∧ (LRA.Analysis.Bounds.IsSupremum sB B ∧ LRA.Analysis.Bounds.IsInfimum iB B))) → LRA.Analysis.Bounds.IsSupremum (Real.instMax.max (Real.instMax.max (instHMul.hMul iA iB) (instHMul.hMul iA sB)) (Real.instMax.max (instHMul.hMul sA iB) (instHMul.hMul sA sB))) (instHMul.hMul A B)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A B : Set ℝ
    leftNonemptyHypothesis : A.Nonempty
    rightNonemptyHypothesis : B.Nonempty
    sA sB iA iB : ℝ
  Prove
    (Exists fun x => x ∈ A ∧ Exists fun x => x ∈ B) → ∀ {sA sB iA iB : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x sA) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le sA u)) ∧ (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le iA x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l iA)) ∧ (((∀ (x : Real), x ∈ B → Real.instPreorder.1.le x sB) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le x u) → Real.instPreorder.1.le sB u)) ∧ ((∀ (x : Real), x ∈ B → Real.instPreorder.1.le iB x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l iB))))) → ((∀ (x : Real), x ∈ { hMul := fun a b => { mul := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHMul.hMul x1 x2) a b = c))) }.mul a b }.hMul A B → Real.instPreorder.1.le x (Real.instMax.1 (Real.instMax.1 ({ hMul := fun a b => Real.instMul.mul a b }.hMul iA iB) ({ hMul := fun a b => Real.instMul.mul a b }.hMul iA sB)) (Real.instMax.1 ({ hMul := fun a b => Real.instMul.mul a b }.hMul sA iB) ({ hMul := fun a b => Real.instMul.mul a b }.hMul sA sB)))) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ { hMul := fun a b => { mul := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHMul.hMul x1 x2) a b = c))) }.mul a b }.hMul A B → Real.instPreorder.1.le x u) → Real.instPreorder.1.le (Real.instMax.1 (Real.instMax.1 ({ hMul := fun a b => Real.instMul.mul a b }.hMul iA iB) ({ hMul := fun a b => Real.instMul.mul a b }.hMul iA sB)) (Real.instMax.1 ({ hMul := fun a b => Real.instMul.mul a b }.hMul sA iB) ({ hMul := fun a b => Real.instMul.mul a b }.hMul sA sB))) u))

Logical form (Lean):

```lean
theorem SupremumOfPointwiseProduct {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB iA iB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightSupremumHypothesis : IsSupremum sB B)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsSupremum
      (max (max (iA * iB) (iA * sB)) (max (sA * iB) (sA * sB)))
      (A * B)
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
theorem SupremumOfPointwiseProduct {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB iA iB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightSupremumHypothesis : IsSupremum sB B)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsSupremum
      (max (max (iA * iB) (iA * sB)) (max (sA * iB) (sA * sB)))
      (A * B) := by
  sorry
/--
`InfimumOfPointwiseProduct` TODO

Predicate logic:

  ∀ {A B : Set Real}, (A.Nonempty ∧ B.Nonempty) → ∀ {sA sB iA iB : Real}, (LRA.Analysis.Bounds.IsSupremum sA A ∧ (LRA.Analysis.Bounds.IsInfimum iA A ∧ (LRA.Analysis.Bounds.IsSupremum sB B ∧ LRA.Analysis.Bounds.IsInfimum iB B))) → LRA.Analysis.Bounds.IsInfimum (Real.instMin.min (Real.instMin.min (instHMul.hMul iA iB) (instHMul.hMul iA sB)) (Real.instMin.min (instHMul.hMul sA iB) (instHMul.hMul sA sB))) (instHMul.hMul A B)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A B : Set ℝ
    leftNonemptyHypothesis : A.Nonempty
    rightNonemptyHypothesis : B.Nonempty
    sA sB iA iB : ℝ
  Prove
    (Exists fun x => x ∈ A ∧ Exists fun x => x ∈ B) → ∀ {sA sB iA iB : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x sA) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le sA u)) ∧ (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le iA x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l iA)) ∧ (((∀ (x : Real), x ∈ B → Real.instPreorder.1.le x sB) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le x u) → Real.instPreorder.1.le sB u)) ∧ ((∀ (x : Real), x ∈ B → Real.instPreorder.1.le iB x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l iB))))) → ((∀ (x : Real), x ∈ { hMul := fun a b => { mul := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHMul.hMul x1 x2) a b = c))) }.mul a b }.hMul A B → Real.instPreorder.1.le (Real.instMin.1 (Real.instMin.1 ({ hMul := fun a b => Real.instMul.mul a b }.hMul iA iB) ({ hMul := fun a b => Real.instMul.mul a b }.hMul iA sB)) (Real.instMin.1 ({ hMul := fun a b => Real.instMul.mul a b }.hMul sA iB) ({ hMul := fun a b => Real.instMul.mul a b }.hMul sA sB))) x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ { hMul := fun a b => { mul := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHMul.hMul x1 x2) a b = c))) }.mul a b }.hMul A B → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l (Real.instMin.1 (Real.instMin.1 ({ hMul := fun a b => Real.instMul.mul a b }.hMul iA iB) ({ hMul := fun a b => Real.instMul.mul a b }.hMul iA sB)) (Real.instMin.1 ({ hMul := fun a b => Real.instMul.mul a b }.hMul sA iB) ({ hMul := fun a b => Real.instMul.mul a b }.hMul sA sB)))))

Logical form (Lean):

```lean
theorem InfimumOfPointwiseProduct {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB iA iB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightSupremumHypothesis : IsSupremum sB B)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsInfimum
      (min (min (iA * iB) (iA * sB)) (min (sA * iB) (sA * sB)))
      (A * B)
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
theorem InfimumOfPointwiseProduct {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB iA iB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightSupremumHypothesis : IsSupremum sB B)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsInfimum
      (min (min (iA * iB) (iA * sB)) (min (sA * iB) (sA * sB)))
      (A * B) := by
  sorry
/--
`SupremumOfQuotientSet` TODO

Predicate logic:

  ∀ {A B : Set Real}, (A.Nonempty ∧ B.Nonempty) → ∀ {sA sB iA iB : Real}, (LRA.Analysis.Bounds.IsSupremum sA A ∧ (LRA.Analysis.Bounds.IsInfimum iA A ∧ (LRA.Analysis.Bounds.IsSupremum sB B ∧ (LRA.Analysis.Bounds.IsInfimum iB B ∧ Or (Real.instLT.lt 0 iB) (Real.instLT.lt sB 0))))) → LRA.Analysis.Bounds.IsSupremum (Real.instMax.max (Real.instMax.max (instHDiv.hDiv iA iB) (instHDiv.hDiv iA sB)) (Real.instMax.max (instHDiv.hDiv sA iB) (instHDiv.hDiv sA sB))) (instHMul.hMul A (LRA.Analysis.Bounds.Algebra.Reciprocal B))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A B : Set ℝ
    leftNonemptyHypothesis : A.Nonempty
    rightNonemptyHypothesis : B.Nonempty
    sA sB iA iB : ℝ
  Prove
    (Exists fun x => x ∈ A ∧ Exists fun x => x ∈ B) → ∀ {sA sB iA iB : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x sA) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le sA u)) ∧ (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le iA x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l iA)) ∧ (((∀ (x : Real), x ∈ B → Real.instPreorder.1.le x sB) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le x u) → Real.instPreorder.1.le sB u)) ∧ (((∀ (x : Real), x ∈ B → Real.instPreorder.1.le iB x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l iB)) ∧ Or (Real.instLT.lt 0 iB) (Real.instLT.lt sB 0))))) → ((∀ (x : Real), x ∈ { hMul := fun a b => { mul := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHMul.hMul x1 x2) a b = c))) }.mul a b }.hMul A fun x => Exists fun a => (a ∈ B ∧ (fun a => Real.instInv.inv a) a = x) → Real.instPreorder.1.le x (Real.instMax.1 (Real.instMax.1 ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv iA iB) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv iA sB)) (Real.instMax.1 ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv sA iB) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv sA sB)))) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ { hMul := fun a b => { mul := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHMul.hMul x1 x2) a b = c))) }.mul a b }.hMul A fun x => Exists fun a => (a ∈ B ∧ (fun a => Real.instInv.inv a) a = x) → Real.instPreorder.1.le x u) → Real.instPreorder.1.le (Real.instMax.1 (Real.instMax.1 ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv iA iB) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv iA sB)) (Real.instMax.1 ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv sA iB) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv sA sB))) u))

Logical form (Lean):

```lean
theorem SupremumOfQuotientSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB iA iB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightSupremumHypothesis : IsSupremum sB B)
    (rightInfimumHypothesis : IsInfimum iB B)
    (denominatorSeparatedFromZeroHypothesis : 0 < iB ∨ sB < 0) :
    IsSupremum
      (max (max (iA / iB) (iA / sB)) (max (sA / iB) (sA / sB)))
      (A * Reciprocal B)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases

-/
theorem SupremumOfQuotientSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB iA iB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightSupremumHypothesis : IsSupremum sB B)
    (rightInfimumHypothesis : IsInfimum iB B)
    (denominatorSeparatedFromZeroHypothesis : 0 < iB ∨ sB < 0) :
    IsSupremum
      (max (max (iA / iB) (iA / sB)) (max (sA / iB) (sA / sB)))
      (A * Reciprocal B) := by
  sorry
/--
`InfimumOfQuotientSet` TODO

Predicate logic:

  ∀ {A B : Set Real}, (A.Nonempty ∧ B.Nonempty) → ∀ {sA sB iA iB : Real}, (LRA.Analysis.Bounds.IsSupremum sA A ∧ (LRA.Analysis.Bounds.IsInfimum iA A ∧ (LRA.Analysis.Bounds.IsSupremum sB B ∧ (LRA.Analysis.Bounds.IsInfimum iB B ∧ Or (Real.instLT.lt 0 iB) (Real.instLT.lt sB 0))))) → LRA.Analysis.Bounds.IsInfimum (Real.instMin.min (Real.instMin.min (instHDiv.hDiv iA iB) (instHDiv.hDiv iA sB)) (Real.instMin.min (instHDiv.hDiv sA iB) (instHDiv.hDiv sA sB))) (instHMul.hMul A (LRA.Analysis.Bounds.Algebra.Reciprocal B))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A B : Set ℝ
    leftNonemptyHypothesis : A.Nonempty
    rightNonemptyHypothesis : B.Nonempty
    sA sB iA iB : ℝ
  Prove
    (Exists fun x => x ∈ A ∧ Exists fun x => x ∈ B) → ∀ {sA sB iA iB : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x sA) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le sA u)) ∧ (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le iA x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l iA)) ∧ (((∀ (x : Real), x ∈ B → Real.instPreorder.1.le x sB) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le x u) → Real.instPreorder.1.le sB u)) ∧ (((∀ (x : Real), x ∈ B → Real.instPreorder.1.le iB x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l iB)) ∧ Or (Real.instLT.lt 0 iB) (Real.instLT.lt sB 0))))) → ((∀ (x : Real), x ∈ { hMul := fun a b => { mul := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHMul.hMul x1 x2) a b = c))) }.mul a b }.hMul A fun x => Exists fun a => (a ∈ B ∧ (fun a => Real.instInv.inv a) a = x) → Real.instPreorder.1.le (Real.instMin.1 (Real.instMin.1 ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv iA iB) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv iA sB)) (Real.instMin.1 ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv sA iB) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv sA sB))) x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ { hMul := fun a b => { mul := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHMul.hMul x1 x2) a b = c))) }.mul a b }.hMul A fun x => Exists fun a => (a ∈ B ∧ (fun a => Real.instInv.inv a) a = x) → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l (Real.instMin.1 (Real.instMin.1 ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv iA iB) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv iA sB)) (Real.instMin.1 ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv sA iB) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv sA sB)))))

Logical form (Lean):

```lean
theorem InfimumOfQuotientSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB iA iB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightSupremumHypothesis : IsSupremum sB B)
    (rightInfimumHypothesis : IsInfimum iB B)
    (denominatorSeparatedFromZeroHypothesis : 0 < iB ∨ sB < 0) :
    IsInfimum
      (min (min (iA / iB) (iA / sB)) (min (sA / iB) (sA / sB)))
      (A * Reciprocal B)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases

-/
theorem InfimumOfQuotientSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB iA iB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightSupremumHypothesis : IsSupremum sB B)
    (rightInfimumHypothesis : IsInfimum iB B)
    (denominatorSeparatedFromZeroHypothesis : 0 < iB ∨ sB < 0) :
    IsInfimum
      (min (min (iA / iB) (iA / sB)) (min (sA / iB) (sA / sB)))
      (A * Reciprocal B) := by
  sorry
/--
`PointwiseSumPreservesUpperBounds` TODO

Predicate logic:

  ∀ {A B : Set Real} {uA uB : Real}, (LRA.Analysis.Bounds.IsUpperBound uA A ∧ LRA.Analysis.Bounds.IsUpperBound uB B) → LRA.Analysis.Bounds.IsUpperBound (instHAdd.hAdd uA uB) (instHAdd.hAdd A B)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A B : Set ℝ
    uA uB : ℝ
  Prove
    ((∀ (x : Real), x ∈ A → Real.instLE.le x uA) ∧ (∀ (x : Real), x ∈ B → Real.instLE.le x uB)) → ∀ (x : Real), x ∈ { hAdd := fun a b => { add := fun s t c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHAdd.hAdd x1 x2) a b = c))) }.add a b }.hAdd A B → Real.instLE.le x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd uA uB)

Logical form (Lean):

```lean
theorem PointwiseSumPreservesUpperBounds {A B : Set ℝ} {uA uB : ℝ}
    (leftUpperBoundHypothesis : IsUpperBound uA A)
    (rightUpperBoundHypothesis : IsUpperBound uB B) :
    IsUpperBound (uA + uB) (A + B)
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
theorem PointwiseSumPreservesUpperBounds {A B : Set ℝ} {uA uB : ℝ}
    (leftUpperBoundHypothesis : IsUpperBound uA A)
    (rightUpperBoundHypothesis : IsUpperBound uB B) :
    IsUpperBound (uA + uB) (A + B) := by
  sorry
/--
`PointwiseSumPreservesLowerBounds` TODO

Predicate logic:

  ∀ {A B : Set Real} {lA lB : Real}, (LRA.Analysis.Bounds.IsLowerBound lA A ∧ LRA.Analysis.Bounds.IsLowerBound lB B) → LRA.Analysis.Bounds.IsLowerBound (instHAdd.hAdd lA lB) (instHAdd.hAdd A B)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A B : Set ℝ
    lA lB : ℝ
  Prove
    ((∀ (x : Real), x ∈ A → Real.instLE.le lA x) ∧ (∀ (x : Real), x ∈ B → Real.instLE.le lB x)) → ∀ (x : Real), x ∈ { hAdd := fun a b => { add := fun s t c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHAdd.hAdd x1 x2) a b = c))) }.add a b }.hAdd A B → Real.instLE.le ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd lA lB) x

Logical form (Lean):

```lean
theorem PointwiseSumPreservesLowerBounds {A B : Set ℝ} {lA lB : ℝ}
    (leftLowerBoundHypothesis : IsLowerBound lA A)
    (rightLowerBoundHypothesis : IsLowerBound lB B) :
    IsLowerBound (lA + lB) (A + B)
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
theorem PointwiseSumPreservesLowerBounds {A B : Set ℝ} {lA lB : ℝ}
    (leftLowerBoundHypothesis : IsLowerBound lA A)
    (rightLowerBoundHypothesis : IsLowerBound lB B) :
    IsLowerBound (lA + lB) (A + B) := by
  sorry
/--
`RelativeUpperBoundsRespectAmbientOrder` TODO

Predicate logic:

  ∀ {P : Type u_1} [inst : Preorder P] {A S T : Set P}, (Set.instLE.le A S ∧ Set.instLE.le S T) → setOf fun u => LRA.Analysis.Bounds.Algebra.IsRelativeUpperBound S u A = S ∩ setOf fun u => LRA.Analysis.Bounds.Algebra.IsRelativeUpperBound T u A

Predicate logic (unfolded):

  Ambient
    (≤)
  Objects
    A S T : Set P
    setContainedInSmallerAmbient : A ⊆ S
    smallerAmbientContainedInLarger : S ⊆ T
  Prove
    (({ le := fun s₁ s₂ => ∀ ⦃a : P⦄, a ∈ s₁ → a ∈ s₂}.le A S) ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : P⦄, a ∈ s₁ → a ∈ s₂}.le S T)) → fun u => (u ∈ S ∧ (∀ (x : P), x ∈ A → inst.1.le x u)) = S ∩ funu => (u ∈ T ∧ (∀ (x : P), x ∈ A → inst.1.le x u))

Logical form (Lean):

```lean
theorem RelativeUpperBoundsRespectAmbientOrder [Preorder P] {A S T : Set P}
    (setContainedInSmallerAmbient : A ⊆ S)
    (smallerAmbientContainedInLarger : S ⊆ T) :
    {u | IsRelativeUpperBound S u A} =
      S ∩ {u | IsRelativeUpperBound T u A}
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
theorem RelativeUpperBoundsRespectAmbientOrder [Preorder P] {A S T : Set P}
    (setContainedInSmallerAmbient : A ⊆ S)
    (smallerAmbientContainedInLarger : S ⊆ T) :
    {u | IsRelativeUpperBound S u A} =
      S ∩ {u | IsRelativeUpperBound T u A} := by
  sorry
/--
`RelativeSupremaCanDependOnAmbientSet` TODO

Predicate logic:

  Exists fun A => Exists fun S => Exists fun T => (Set.instLE.le A S ∧ (Set.instLE.le S T ∧ (Exists fun sS => Exists fun sT => (LRA.Analysis.Bounds.Algebra.IsRelativeSupremum S sS A ∧ (LRA.Analysis.Bounds.Algebra.IsRelativeSupremum T sT A ∧ Ne sS sT)))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun A => Exists fun S => Exists fun T => (({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le A S) ∧ (({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le S T) ∧ (Exists fun sS => Exists fun sT => (((sS ∈ S ∧ (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x sS)) ∧ (∀ (u : Real), (u ∈ S ∧ (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u)) → Real.instPreorder.1.le sS u)) ∧ (((sT ∈ T ∧ (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x sT)) ∧ (∀ (u : Real), (u ∈ T ∧ (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u)) → Real.instPreorder.1.le sT u)) ∧ (sS = sT → False))))))

Logical form (Lean):

```lean
theorem RelativeSupremaCanDependOnAmbientSet :
    ∃ (A S T : Set ℝ), A ⊆ S ∧ S ⊆ T ∧
      ∃ sS sT : ℝ,
        IsRelativeSupremum S sS A ∧ IsRelativeSupremum T sT A ∧ sS ≠ sT
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem RelativeSupremaCanDependOnAmbientSet :
    ∃ (A S T : Set ℝ), A ⊆ S ∧ S ⊆ T ∧
      ∃ sS sT : ℝ,
        IsRelativeSupremum S sS A ∧ IsRelativeSupremum T sT A ∧ sS ≠ sT := by
  sorry
/--
`RelativeSupremumExistenceCanDependOnAmbientSet` TODO

Predicate logic:

  Exists fun A => Exists fun S => Exists fun T => (Set.instLE.le A S ∧ (Set.instLE.le S T ∧ (Exists fun s => LRA.Analysis.Bounds.Algebra.IsRelativeSupremum T s A ∧ ¬ Exists fun s => LRA.Analysis.Bounds.Algebra.IsRelativeUpperBound S s A)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun A => Exists fun S => Exists fun T => (({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le A S) ∧ (({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le S T) ∧ ((Exists fun s => ((s ∈ T ∧ (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x s)) ∧ (∀ (u : Real), (u ∈ T ∧ (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u)) → Real.instPreorder.1.le s u))) ∧ ((Exists fun s => (s ∈ S ∧ (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x s))) → False))))

Logical form (Lean):

```lean
theorem RelativeSupremumExistenceCanDependOnAmbientSet :
    ∃ (A S T : Set ℝ), A ⊆ S ∧ S ⊆ T ∧
      (∃ s, IsRelativeSupremum T s A) ∧
        ¬(∃ s, IsRelativeUpperBound S s A)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem RelativeSupremumExistenceCanDependOnAmbientSet :
    ∃ (A S T : Set ℝ), A ⊆ S ∧ S ⊆ T ∧
      (∃ s, IsRelativeSupremum T s A) ∧
        ¬(∃ s, IsRelativeUpperBound S s A) := by
  sorry
/--
`RationalSquareRootGapHasNoRationalSupremum` TODO

Predicate logic:

  (setOf fun q => Rat.instLT.lt (instHPow.hPow q 2) 2 ∧ .Nonempty) ((Exists fun u => LRA.Analysis.Bounds.IsUpperBound u (setOf fun q => Rat.instLT.lt (instHPow.hPow q 2) 2) ∧ ¬ Exists fun s => LRA.Analysis.Bounds.IsSupremum s (setOf fun q => Rat.instLT.lt (instHPow.hPow q 2) 2)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun x => x ∈ fun q => Rat.instLT.lt (instHPow.1 q 2) 2 ∧ ((Exists fun u => ∀ (x : Rat), x ∈ fun q => Rat.instLT.lt (instHPow.1 q 2) 2 → Rat.instLE.le x u) ∧ ((Exists fun s => ((∀ (x : Rat), x ∈ fun q => Rat.instLT.lt (instHPow.1 q 2) 2 → Rat.instPreorder.1.le x s) ∧ (∀ (u : Rat), (∀ (x : Rat), x ∈ fun q => Rat.instLT.lt (instHPow.1 q 2) 2 → Rat.instPreorder.1.le x u) → Rat.instPreorder.1.le s u))) → False)))

Logical form (Lean):

```lean
theorem RationalSquareRootGapHasNoRationalSupremum :
    {q : ℚ | q ^ 2 < 2}.Nonempty ∧
      (∃ u : ℚ, IsUpperBound u {q : ℚ | q ^ 2 < 2}) ∧
        ¬(∃ s : ℚ, IsSupremum s {q : ℚ | q ^ 2 < 2})
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem RationalSquareRootGapHasNoRationalSupremum :
    {q : ℚ | q ^ 2 < 2}.Nonempty ∧
      (∃ u : ℚ, IsUpperBound u {q : ℚ | q ^ 2 < 2}) ∧
        ¬(∃ s : ℚ, IsSupremum s {q : ℚ | q ^ 2 < 2}) := by
  sorry
end LRA.Analysis.Bounds.Algebra
