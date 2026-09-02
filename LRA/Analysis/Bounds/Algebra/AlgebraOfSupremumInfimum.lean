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

  ∀ (A : Set Real) (a : Real), Exists fun a_1 => (Set.instMembership.mem A a_1 ∧ (fun a => Real.instInv.inv a) a_1 = a)

Predicate logic (unfolded):

  ∀ (A : Real → Prop) (a : Real), Exists fun a_1 => (Set.instMembership.1 A a_1 ∧ (fun a => Real.instInv.1 a) a_1 = a)

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

  ∀ (scale : Real) (A : Set Real) (a : Real), Exists fun a_1 => (Set.instMembership.mem A a_1 ∧ (fun a => instHMul.hMul scale a) a_1 = a)

Predicate logic (unfolded):

  ∀ (scale : Real) (A : Real → Prop) (a : Real), Exists fun a_1 => (Set.instMembership.1 A a_1 ∧ (fun a => instHMul.1 scale a) a_1 = a)

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

  ∀ {S : Type u_1} [inst : Preorder S] (ambient : Set S) (u : S) (A : Set S), (Set.instMembership.mem ambient u ∧ LRA.Analysis.Bounds.IsUpperBound u A)

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : Preorder S] (ambient : S → Prop) (u : S) (A : S → Prop), (Set.instMembership.1 ambient u ∧ ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x u)

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

  ∀ {S : Type u_1} [inst : Preorder S] (ambient : Set S) (l : S) (A : Set S), (Set.instMembership.mem ambient l ∧ LRA.Analysis.Bounds.IsLowerBound l A)

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : Preorder S] (ambient : S → Prop) (l : S) (A : S → Prop), (Set.instMembership.1 ambient l ∧ ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 l x)

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

  ∀ {S : Type u_1} [inst : Preorder S] (ambient : Set S) (s : S) (A : Set S), (LRA.Analysis.Bounds.Algebra.IsRelativeUpperBound ambient s A ∧ ∀ (u : S), LRA.Analysis.Bounds.Algebra.IsRelativeUpperBound ambient u A → inst.le s u)

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : Preorder S] (ambient : S → Prop) (s : S) (A : S → Prop), ((Set.instMembership.1 ambient s ∧ ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x s) ∧ ∀ (u : S), (Set.instMembership.1 ambient u ∧ ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x u) → inst.toLE.1 s u)

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

  ∀ {S : Type u_1} [inst : Preorder S] (ambient : Set S) (i : S) (A : Set S), (LRA.Analysis.Bounds.Algebra.IsRelativeLowerBound ambient i A ∧ ∀ (l : S), LRA.Analysis.Bounds.Algebra.IsRelativeLowerBound ambient l A → inst.le l i)

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : Preorder S] (ambient : S → Prop) (i : S) (A : S → Prop), ((Set.instMembership.1 ambient i ∧ ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 i x) ∧ ∀ (l : S), (Set.instMembership.1 ambient l ∧ ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 l x) → inst.toLE.1 l i)

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

  (∀ nonemptyHypothesis ∈ A.Nonempty), (IsSupremum s A) → IsSupremum (s + c) (A + {c})

Predicate logic (unfolded):

  ∀ {A : Real → Prop}, (Exists fun x => Set.instMembership.1 A x) → ∀ {s : Real}, (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x s ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 s u) → ∀ (c : Real), (∀ (x : Real), Set.instMembership.1 (instHAdd.1 A (Set.instSingletonSet.1 c)) x → Real.instPreorder.toLE.1 x (instHAdd.1 s c) ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (instHAdd.1 A (Set.instSingletonSet.1 c)) x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 (instHAdd.1 s c) u)

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

  (∀ nonemptyHypothesis ∈ A.Nonempty), (IsInfimum i A) → IsInfimum (i + c) (A + {c})

Predicate logic (unfolded):

  ∀ {A : Real → Prop}, (Exists fun x => Set.instMembership.1 A x) → ∀ {i : Real}, (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 i x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l i) → ∀ (c : Real), (∀ (x : Real), Set.instMembership.1 (instHAdd.1 A (Set.instSingletonSet.1 c)) x → Real.instPreorder.toLE.1 (instHAdd.1 i c) x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 (instHAdd.1 A (Set.instSingletonSet.1 c)) x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l (instHAdd.1 i c))

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

  (∀ nonemptyHypothesis ∈ A.Nonempty), (IsSupremum s A) → IsSupremum (scale * s) (ScalarImage scale A)

Predicate logic (unfolded):

  ∀ {A : Real → Prop}, (Exists fun x => Set.instMembership.1 A x) → ∀ {s scale : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x s ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 s u) ∧ Real.instLT.1 Zero.toOfNat0.1 scale) → (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.mem A a ∧ (fun a => instHMul.hMul scale a) a = x)) x → Real.instPreorder.toLE.1 x (instHMul.1 scale s) ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.mem A a ∧ (fun a => instHMul.hMul scale a) a = x)) x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 (instHMul.1 scale s) u)

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

  (∀ nonemptyHypothesis ∈ A.Nonempty), (IsInfimum i A) → IsInfimum (scale * i) (ScalarImage scale A)

Predicate logic (unfolded):

  ∀ {A : Real → Prop}, (Exists fun x => Set.instMembership.1 A x) → ∀ {i scale : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 i x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l i) ∧ Real.instLT.1 Zero.toOfNat0.1 scale) → (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.mem A a ∧ (fun a => instHMul.hMul scale a) a = x)) x → Real.instPreorder.toLE.1 (instHMul.1 scale i) x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.mem A a ∧ (fun a => instHMul.hMul scale a) a = x)) x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l (instHMul.1 scale i))

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

  (∀ nonemptyHypothesis ∈ A.Nonempty), (IsInfimum i A ∧ scale < 0) → IsSupremum (scale * i) (ScalarImage scale A)

Predicate logic (unfolded):

  ∀ {A : Real → Prop}, (Exists fun x => Set.instMembership.1 A x) → ∀ {i scale : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 i x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l i) ∧ Real.instLT.1 scale Zero.toOfNat0.1) → (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.mem A a ∧ (fun a => instHMul.hMul scale a) a = x)) x → Real.instPreorder.toLE.1 x (instHMul.1 scale i) ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.mem A a ∧ (fun a => instHMul.hMul scale a) a = x)) x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 (instHMul.1 scale i) u)

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

  (∀ nonemptyHypothesis ∈ A.Nonempty), (IsSupremum s A ∧ scale < 0) → IsInfimum (scale * s) (ScalarImage scale A)

Predicate logic (unfolded):

  ∀ {A : Real → Prop}, (Exists fun x => Set.instMembership.1 A x) → ∀ {s scale : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x s ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 s u) ∧ Real.instLT.1 scale Zero.toOfNat0.1) → (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.mem A a ∧ (fun a => instHMul.hMul scale a) a = x)) x → Real.instPreorder.toLE.1 (instHMul.1 scale s) x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.mem A a ∧ (fun a => instHMul.hMul scale a) a = x)) x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l (instHMul.1 scale s))

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

  (∀ nonemptyHypothesis ∈ A.Nonempty), (IsInfimum i A) → IsSupremum (-i) (-A)

Predicate logic (unfolded):

  ∀ {A : Real → Prop}, (Exists fun x => Set.instMembership.1 A x) → ∀ {i : Real}, (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 i x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l i) → (∀ (x : Real), Set.instMembership.1 (Set.neg.1 A) x → Real.instPreorder.toLE.1 x (Real.instNeg.1 i) ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (Set.neg.1 A) x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 (Real.instNeg.1 i) u)

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

  (∀ leftNonemptyHypothesis ∈ A.Nonempty ∀ rightNonemptyHypothesis ∈ B.Nonempty), (IsSupremum sA A ∧ IsSupremum sB B) → IsSupremum (sA + sB) (A + B)

Predicate logic (unfolded):

  ∀ {A B : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ Exists fun x => Set.instMembership.1 B x) → ∀ {sA sB : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x sA ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 sA u) ∧ (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 x sB ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 sB u)) → (∀ (x : Real), Set.instMembership.1 (instHAdd.1 A B) x → Real.instPreorder.toLE.1 x (instHAdd.1 sA sB) ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (instHAdd.1 A B) x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 (instHAdd.1 sA sB) u)

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

  (∀ leftNonemptyHypothesis ∈ A.Nonempty ∀ rightNonemptyHypothesis ∈ B.Nonempty), (IsInfimum iA A ∧ IsInfimum iB B) → IsInfimum (iA + iB) (A + B)

Predicate logic (unfolded):

  ∀ {A B : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ Exists fun x => Set.instMembership.1 B x) → ∀ {iA iB : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 iA x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l iA) ∧ (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 iB x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l iB)) → (∀ (x : Real), Set.instMembership.1 (instHAdd.1 A B) x → Real.instPreorder.toLE.1 (instHAdd.1 iA iB) x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 (instHAdd.1 A B) x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l (instHAdd.1 iA iB))

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

  (∀ leftNonemptyHypothesis ∈ A.Nonempty ∀ rightNonemptyHypothesis ∈ B.Nonempty), (IsSupremum sA A ∧ IsInfimum iB B) → IsSupremum (sA - iB) (A - B)

Predicate logic (unfolded):

  ∀ {A B : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ Exists fun x => Set.instMembership.1 B x) → ∀ {sA iB : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x sA ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 sA u) ∧ (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 iB x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l iB)) → (∀ (x : Real), Set.instMembership.1 (instHSub.1 A B) x → Real.instPreorder.toLE.1 x (instHSub.1 sA iB) ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (instHSub.1 A B) x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 (instHSub.1 sA iB) u)

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

  (∀ leftNonemptyHypothesis ∈ A.Nonempty ∀ rightNonemptyHypothesis ∈ B.Nonempty), (IsInfimum iA A ∧ IsSupremum sB B) → IsInfimum (iA - sB) (A - B)

Predicate logic (unfolded):

  ∀ {A B : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ Exists fun x => Set.instMembership.1 B x) → ∀ {iA sB : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 iA x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l iA) ∧ (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 x sB ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 sB u)) → (∀ (x : Real), Set.instMembership.1 (instHSub.1 A B) x → Real.instPreorder.toLE.1 (instHSub.1 iA sB) x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 (instHSub.1 A B) x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l (instHSub.1 iA sB))

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

  (∀ nonemptyHypothesis ∈ A.Nonempty), (IsBounded A ∧ IsSupremum s A ∧ IsInfimum i A) → IsSupremum (if scale > 0 then scale * s else if scale = 0 then 0 else scale * i) (ScalarImage scale A)

Predicate logic (unfolded):

  ∀ {A : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ (Exists fun u => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 x u ∧ Exists fun l => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 l x)) → ∀ (scale : Real) {s i : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x s ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 s u) ∧ (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 i x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l i)) → (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.mem A a ∧ (fun a => instHMul.hMul scale a) a = x)) x → Real.instPreorder.toLE.1 x (Decidable.rec (fun h => (fun x => Decidable.casesOn (scale.decidable0) = fun x => instHMul.hMul scale i fun x => 0) h) (fun h => (fun x => instHMul.1 scale s) h) inferInstance) ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.mem A a ∧ (fun a => instHMul.hMul scale a) a = x)) x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 (Decidable.rec (fun h => (fun x => Decidable.rec (fun h => (fun x => instHMul.hMul scale i) h) (fun h => (fun x => 0) h) (scale.decidable0)) = h) (fun h => (fun x => instHMul.1 scale s) h) (Real.linearOrder.toDecidableLT 0 scale)) u)

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

  (∀ nonemptyHypothesis ∈ A.Nonempty), (IsSupremum s A ∧ IsInfimum i A) → IsSupremum (max |i| |s|) (abs '' A)

Predicate logic (unfolded):

  ∀ {A : Real → Prop}, (Exists fun x => Set.instMembership.1 A x) → ∀ {s i : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x s ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 s u) ∧ (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 i x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l i)) → (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ SemilatticeSup.toMax.max a (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg a) = x)) x → Real.instPreorder.toLE.1 x (Real.instMax.1 (SemilatticeSup.toMax.1 i (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg i)) (SemilatticeSup.toMax.1 s (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg s))) ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ SemilatticeSup.toMax.max a (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg a) = x)) x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 (Real.instMax.1 (SemilatticeSup.toMax.1 i (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 i)) (SemilatticeSup.toMax.1 s (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 s))) u)

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

  (∀ nonemptyHypothesis ∈ A.Nonempty), (IsBounded A ∧ IsSupremum s A ∧ IsInfimum i A ∧ 0 < i ∨ s < 0) → IsSupremum i⁻¹ (Reciprocal A)

Predicate logic (unfolded):

  ∀ {A : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ (Exists fun u => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 x u ∧ Exists fun l => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 l x)) → ∀ {s i : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x s ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 s u) ∧ ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 i x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l i) ∧ Or (Real.instLT.1 Zero.toOfNat0.1 i) (Real.instLT.1 s Zero.toOfNat0.1))) → (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.mem A a ∧ (fun a => Real.instInv.inv a) a = x)) x → Real.instPreorder.toLE.1 x (Real.instInv.1 i) ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.mem A a ∧ (fun a => Real.instInv.inv a) a = x)) x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 (Real.instInv.1 i) u)

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

  (∀ nonemptyHypothesis ∈ A.Nonempty), (IsBounded A ∧ IsSupremum s A ∧ IsInfimum i A ∧ 0 < i ∨ s < 0) → IsInfimum s⁻¹ (Reciprocal A)

Predicate logic (unfolded):

  ∀ {A : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ (Exists fun u => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 x u ∧ Exists fun l => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 l x)) → ∀ {s i : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x s ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 s u) ∧ ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 i x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l i) ∧ Or (Real.instLT.1 Zero.toOfNat0.1 i) (Real.instLT.1 s Zero.toOfNat0.1))) → (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.mem A a ∧ (fun a => Real.instInv.inv a) a = x)) x → Real.instPreorder.toLE.1 (Real.instInv.1 s) x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.mem A a ∧ (fun a => Real.instInv.inv a) a = x)) x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l (Real.instInv.1 s))

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

  (∀ leftNonemptyHypothesis ∈ A.Nonempty ∀ rightNonemptyHypothesis ∈ B.Nonempty), (IsSupremum sA A ∧ IsInfimum iA A ∧ IsSupremum sB B ∧ IsInfimum iB B) → IsSupremum (max (max (iA * iB) (iA * sB)) (max (sA * iB) (sA * sB))) (A * B)

Predicate logic (unfolded):

  ∀ {A B : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ Exists fun x => Set.instMembership.1 B x) → ∀ {sA sB iA iB : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x sA ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 sA u) ∧ ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 iA x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l iA) ∧ ((∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 x sB ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 sB u) ∧ (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 iB x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l iB)))) → (∀ (x : Real), Set.instMembership.1 (instHMul.1 A B) x → Real.instPreorder.toLE.1 x (Real.instMax.1 (Real.instMax.1 (instHMul.1 iA iB) (instHMul.1 iA sB)) (Real.instMax.1 (instHMul.1 sA iB) (instHMul.1 sA sB))) ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (instHMul.1 A B) x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 (Real.instMax.1 (Real.instMax.1 (instHMul.1 iA iB) (instHMul.1 iA sB)) (Real.instMax.1 (instHMul.1 sA iB) (instHMul.1 sA sB))) u)

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

  (∀ leftNonemptyHypothesis ∈ A.Nonempty ∀ rightNonemptyHypothesis ∈ B.Nonempty), (IsSupremum sA A ∧ IsInfimum iA A ∧ IsSupremum sB B ∧ IsInfimum iB B) → IsInfimum (min (min (iA * iB) (iA * sB)) (min (sA * iB) (sA * sB))) (A * B)

Predicate logic (unfolded):

  ∀ {A B : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ Exists fun x => Set.instMembership.1 B x) → ∀ {sA sB iA iB : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x sA ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 sA u) ∧ ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 iA x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l iA) ∧ ((∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 x sB ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 sB u) ∧ (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 iB x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l iB)))) → (∀ (x : Real), Set.instMembership.1 (instHMul.1 A B) x → Real.instPreorder.toLE.1 (Real.instMin.1 (Real.instMin.1 (instHMul.1 iA iB) (instHMul.1 iA sB)) (Real.instMin.1 (instHMul.1 sA iB) (instHMul.1 sA sB))) x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 (instHMul.1 A B) x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l (Real.instMin.1 (Real.instMin.1 (instHMul.1 iA iB) (instHMul.1 iA sB)) (Real.instMin.1 (instHMul.1 sA iB) (instHMul.1 sA sB))))

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

  (∀ leftNonemptyHypothesis ∈ A.Nonempty ∀ rightNonemptyHypothesis ∈ B.Nonempty), (IsSupremum sA A ∧ IsInfimum iA A ∧ IsSupremum sB B ∧ IsInfimum iB B ∧ 0 < iB ∨ sB < 0) → IsSupremum (max (max (iA / iB) (iA / sB)) (max (sA / iB) (sA / sB))) (A * Reciprocal B)

Predicate logic (unfolded):

  ∀ {A B : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ Exists fun x => Set.instMembership.1 B x) → ∀ {sA sB iA iB : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x sA ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 sA u) ∧ ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 iA x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l iA) ∧ ((∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 x sB ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 sB u) ∧ ((∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 iB x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l iB) ∧ Or (Real.instLT.1 Zero.toOfNat0.1 iB) (Real.instLT.1 sB Zero.toOfNat0.1))))) → (∀ (x : Real), Set.instMembership.1 (instHMul.1 A (setOf fun x => Exists fun a => (Set.instMembership.mem B a ∧ (fun a => Real.instInv.inv a) a = x))) x → Real.instPreorder.toLE.1 x (Real.instMax.1 (Real.instMax.1 (instHDiv.1 iA iB) (instHDiv.1 iA sB)) (Real.instMax.1 (instHDiv.1 sA iB) (instHDiv.1 sA sB))) ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (instHMul.1 A (setOf fun x => Exists fun a => (Set.instMembership.mem B a ∧ (fun a => Real.instInv.inv a) a = x))) x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 (Real.instMax.1 (Real.instMax.1 (instHDiv.1 iA iB) (instHDiv.1 iA sB)) (Real.instMax.1 (instHDiv.1 sA iB) (instHDiv.1 sA sB))) u)

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

  (∀ leftNonemptyHypothesis ∈ A.Nonempty ∀ rightNonemptyHypothesis ∈ B.Nonempty), (IsSupremum sA A ∧ IsInfimum iA A ∧ IsSupremum sB B ∧ IsInfimum iB B ∧ 0 < iB ∨ sB < 0) → IsInfimum (min (min (iA / iB) (iA / sB)) (min (sA / iB) (sA / sB))) (A * Reciprocal B)

Predicate logic (unfolded):

  ∀ {A B : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ Exists fun x => Set.instMembership.1 B x) → ∀ {sA sB iA iB : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x sA ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 sA u) ∧ ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 iA x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l iA) ∧ ((∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 x sB ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 sB u) ∧ ((∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 iB x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l iB) ∧ Or (Real.instLT.1 Zero.toOfNat0.1 iB) (Real.instLT.1 sB Zero.toOfNat0.1))))) → (∀ (x : Real), Set.instMembership.1 (instHMul.1 A (setOf fun x => Exists fun a => (Set.instMembership.mem B a ∧ (fun a => Real.instInv.inv a) a = x))) x → Real.instPreorder.toLE.1 (Real.instMin.1 (Real.instMin.1 (instHDiv.1 iA iB) (instHDiv.1 iA sB)) (Real.instMin.1 (instHDiv.1 sA iB) (instHDiv.1 sA sB))) x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 (instHMul.1 A (setOf fun x => Exists fun a => (Set.instMembership.mem B a ∧ (fun a => Real.instInv.inv a) a = x))) x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l (Real.instMin.1 (Real.instMin.1 (instHDiv.1 iA iB) (instHDiv.1 iA sB)) (Real.instMin.1 (instHDiv.1 sA iB) (instHDiv.1 sA sB))))

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

  (IsUpperBound uA A ∧ IsUpperBound uB B) → IsUpperBound (uA + uB) (A + B)

Predicate logic (unfolded):

  ∀ {A B : Real → Prop} {uA uB : Real}, (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 x uA ∧ ∀ (x : Real), Set.instMembership.1 B x → Real.instLE.1 x uB) → ∀ (x : Real), Set.instMembership.1 (instHAdd.1 A B) x → Real.instLE.1 x (instHAdd.1 uA uB)

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

  (IsLowerBound lA A ∧ IsLowerBound lB B) → IsLowerBound (lA + lB) (A + B)

Predicate logic (unfolded):

  ∀ {A B : Real → Prop} {lA lB : Real}, (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 lA x ∧ ∀ (x : Real), Set.instMembership.1 B x → Real.instLE.1 lB x) → ∀ (x : Real), Set.instMembership.1 (instHAdd.1 A B) x → Real.instLE.1 (instHAdd.1 lA lB) x

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

  {u | IsRelativeUpperBound S u A} = S ∩ {u | IsRelativeUpperBound T u A}

Predicate logic (unfolded):

  ∀ {P : Type u_1} [inst : Preorder P] {A S T : P → Prop}, (Set.instLE.1 A S ∧ Set.instLE.1 S T) → fun u => (Set.instMembership.1 S u ∧ ∀ (x : P), Set.instMembership.1 A x → inst.toLE.1 x u) = Set.instInter.1 S fun u => (Set.instMembership.1 T u ∧ ∀ (x : P), Set.instMembership.1 A x → inst.toLE.1 x u)

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

  ∃ A S T ∈ Set ℝ, A ⊆ S ∧ S ⊆ T ∧ ∃ sS sT ∈ ℝ, IsRelativeSupremum S sS A ∧ IsRelativeSupremum T sT A ∧ sS ≠ sT

Predicate logic (unfolded):

  Exists fun A => Exists fun S => Exists fun T => (Set.instLE.1 A S ∧ (Set.instLE.1 S T ∧ Exists fun sS => Exists fun sT => (((Set.instMembership.1 S sS ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x sS) ∧ ∀ (u : Real), (Set.instMembership.1 S u ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 sS u) ∧ (((Set.instMembership.1 T sT ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x sT) ∧ ∀ (u : Real), (Set.instMembership.1 T u ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 sT u) ∧ sS = sT → False))))

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

  ∃ A S T ∈ Set ℝ, A ⊆ S ∧ S ⊆ T ∧ (∃ s, IsRelativeSupremum T s A) ∧ ¬(∃ s, IsRelativeUpperBound S s A)

Predicate logic (unfolded):

  Exists fun A => Exists fun S => Exists fun T => (Set.instLE.1 A S ∧ (Set.instLE.1 S T ∧ (Exists fun s => ((Set.instMembership.1 T s ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x s) ∧ ∀ (u : Real), (Set.instMembership.1 T u ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 s u) ∧ (Exists fun s => (Set.instMembership.1 S s ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x s)) → False)))

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

  {q : ℚ | q ^ 2 < 2}.Nonempty ∧ ∃ u ∈ ℚ, IsUpperBound u {q : ℚ | q ^ 2 < 2} ∧ ¬∃ s ∈ ℚ, IsSupremum s {q : ℚ | q ^ 2 < 2}

Predicate logic (unfolded):

  (Exists fun x => Set.instMembership.1 (fun q => Rat.instLT.1 (instHPow.1 q (instOfNatNat 2).1) Rat.instOfNat.1) x ∧ (Exists fun u => ∀ (x : Rat), Set.instMembership.1 (fun q => Rat.instLT.1 (instHPow.1 q (instOfNatNat 2).1) Rat.instOfNat.1) x → Rat.instLE.1 x u ∧ (Exists fun s => (∀ (x : Rat), Set.instMembership.1 (fun q => Rat.instLT.1 (instHPow.hPow q 2) 2) x → Rat.instPreorder.toLE.1 x s ∧ ∀ (u : Rat), (∀ (x : Rat), Set.instMembership.1 (fun q => Rat.instLT.1 (instHPow.hPow q 2) 2) x → Rat.instPreorder.toLE.1 x u) → Rat.instPreorder.toLE.1 s u)) → False))

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
