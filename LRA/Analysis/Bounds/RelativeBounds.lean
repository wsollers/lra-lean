
import Mathlib.Order.Basic
import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.Sqrt
import Mathlib.Data.Rat.Cast.Defs

namespace LRA.Analysis.Bounds

variable {T : Type*} [Preorder T]

/--
`IsRelativeUpperBound` TODO

Predicate logic:

  ∀ {T : Type u_1} [inst : Preorder T] (u : T) (A S : Set T), (u ∈ S ∧ (∀ (a : T), a ∈ A → inst.le a u))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (u ∈ S ∧ (∀ (a : T), a ∈ A → inst.1.le a u))

Logical form (Lean):

```lean
def IsRelativeUpperBound (u : T) (A S : Set T) : Prop :=
  u ∈ S ∧ ∀ a ∈ A, a ≤ u
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
def IsRelativeUpperBound (u : T) (A S : Set T) : Prop :=
  u ∈ S ∧ ∀ a ∈ A, a ≤ u

/--
`IsRelativeLowerBound` TODO

Predicate logic:

  ∀ {T : Type u_1} [inst : Preorder T] (l : T) (A S : Set T), (l ∈ S ∧ (∀ (a : T), a ∈ A → inst.le l a))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (l ∈ S ∧ (∀ (a : T), a ∈ A → inst.1.le l a))

Logical form (Lean):

```lean
def IsRelativeLowerBound (l : T) (A S : Set T) : Prop :=
  l ∈ S ∧ ∀ a ∈ A, l ≤ a
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
def IsRelativeLowerBound (l : T) (A S : Set T) : Prop :=
  l ∈ S ∧ ∀ a ∈ A, l ≤ a

/--
`IsRelativeSupremum` TODO

Predicate logic:

  ∀ {T : Type u_1} [inst : Preorder T] (s : T) (A S : Set T), (LRA.Analysis.Bounds.IsRelativeUpperBound s A S ∧ (∀ (u : T), u ∈ S → (∀ (a : T), a ∈ A → inst.le a u) → inst.le s u))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((s ∈ S ∧ (∀ (a : T), a ∈ A → inst.1.le a s)) ∧ (∀ (u : T), u ∈ S → (∀ (a : T), a ∈ A → inst.1.le a u) → inst.1.le s u))

Logical form (Lean):

```lean
def IsRelativeSupremum (s : T) (A S : Set T) : Prop :=
  IsRelativeUpperBound s A S ∧ ∀ u ∈ S, (∀ a ∈ A, a ≤ u) → s ≤ u
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
def IsRelativeSupremum (s : T) (A S : Set T) : Prop :=
  IsRelativeUpperBound s A S ∧ ∀ u ∈ S, (∀ a ∈ A, a ≤ u) → s ≤ u

/--
`IsRelativeInfimum` TODO

Predicate logic:

  ∀ {T : Type u_1} [inst : Preorder T] (i : T) (A S : Set T), (LRA.Analysis.Bounds.IsRelativeLowerBound i A S ∧ (∀ (l : T), l ∈ S → (∀ (a : T), a ∈ A → inst.le l a) → inst.le l i))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((i ∈ S ∧ (∀ (a : T), a ∈ A → inst.1.le i a)) ∧ (∀ (l : T), l ∈ S → (∀ (a : T), a ∈ A → inst.1.le l a) → inst.1.le l i))

Logical form (Lean):

```lean
def IsRelativeInfimum (i : T) (A S : Set T) : Prop :=
  IsRelativeLowerBound i A S ∧ ∀ l ∈ S, (∀ a ∈ A, l ≤ a) → l ≤ i
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
def IsRelativeInfimum (i : T) (A S : Set T) : Prop :=
  IsRelativeLowerBound i A S ∧ ∀ l ∈ S, (∀ a ∈ A, l ≤ a) → l ≤ i

/--
`OrdinarySupremumInSIsRelativeSupremum` TODO

Predicate logic:

  ∀ {T : Type u_1} [inst : Preorder T] (A S : Set T) (s : T), (IsLUB A s ∧ s ∈ S) → LRA.Analysis.Bounds.IsRelativeSupremum s A S

Predicate logic (unfolded):

  Ambient
    (T, ≤)
  Objects
    A S : Set T
    s : T
  Prove
    (((s ∈ fun x => ∀ ⦃a : T⦄, a ∈ A → inst.1.le a x) ∧ (s ∈ fun x => ∀ ⦃a : T⦄, a ∈ upperBounds A → inst.1.le x a)) ∧ s ∈ S) → ((s ∈ S ∧ (∀ (a : T), a ∈ A → inst.1.le a s)) ∧ (∀ (u : T), u ∈ S → (∀ (a : T), a ∈ A → inst.1.le a u) → inst.1.le s u))

Logical form (Lean):

```lean
theorem OrdinarySupremumInSIsRelativeSupremum
    (A S : Set T) (s : T) (hs : IsLUB A s) (hsS : s ∈ S) :
    IsRelativeSupremum s A S
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
theorem OrdinarySupremumInSIsRelativeSupremum
    (A S : Set T) (s : T) (hs : IsLUB A s) (hsS : s ∈ S) :
    IsRelativeSupremum s A S := by
  sorry
/--
`OrdinaryInfimumInSIsRelativeInfimum` TODO

Predicate logic:

  ∀ {T : Type u_1} [inst : Preorder T] (A S : Set T) (i : T), (IsGLB A i ∧ i ∈ S) → LRA.Analysis.Bounds.IsRelativeInfimum i A S

Predicate logic (unfolded):

  Ambient
    (T, ≤)
  Objects
    A S : Set T
    i : T
  Prove
    (((i ∈ fun x => ∀ ⦃a : T⦄, a ∈ A → inst.1.le x a) ∧ (i ∈ fun x => ∀ ⦃a : T⦄, a ∈ lowerBounds A → inst.1.le a x)) ∧ i ∈ S) → ((i ∈ S ∧ (∀ (a : T), a ∈ A → inst.1.le i a)) ∧ (∀ (l : T), l ∈ S → (∀ (a : T), a ∈ A → inst.1.le l a) → inst.1.le l i))

Logical form (Lean):

```lean
theorem OrdinaryInfimumInSIsRelativeInfimum
    (A S : Set T) (i : T) (hi : IsGLB A i) (hiS : i ∈ S) :
    IsRelativeInfimum i A S
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
theorem OrdinaryInfimumInSIsRelativeInfimum
    (A S : Set T) (i : T) (hi : IsGLB A i) (hiS : i ∈ S) :
    IsRelativeInfimum i A S := by
  sorry
/--
`RationalsWithSquareLessThanTwoInR` TODO

Predicate logic:

  ∀ (a : Real), Exists fun q => (a = q.cast ∧ Rat.instLT.lt (instHPow.hPow q 2) 2)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun q => (a = Real.instRatCast.1 q ∧ Rat.instLT.lt (instHPow.1 q 2) 2)

Logical form (Lean):

```lean
def RationalsWithSquareLessThanTwoInR : Set ℝ :=
  {x : ℝ | ∃ q : ℚ, x = (q : ℝ) ∧ q ^ 2 < 2}
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
def RationalsWithSquareLessThanTwoInR : Set ℝ :=
  {x : ℝ | ∃ q : ℚ, x = (q : ℝ) ∧ q ^ 2 < 2}

/--
`NoRelativeSupremumOfRationalsExample` TODO

Predicate logic:

  ¬ Exists fun s => LRA.Analysis.Bounds.IsRelativeSupremum s LRA.Analysis.Bounds.RationalsWithSquareLessThanTwoInR (Set.range Rat.cast)

Predicate logic (unfolded):

  Ambient
    (T, ≤)
  Objects
    (none)
  Prove
    (Exists fun s => ((s ∈ fun x => Exists fun y => y.cast = x ∧ (∀ (a : Real), a ∈ LRA.Analysis.Bounds.RationalsWithSquareLessThanTwoInR → Real.instPreorder.1.le a s)) ∧ (∀ (u : Real), u ∈ fun x => Exists fun y => Real.instRatCast.ratCast y = x → (∀ (a : Real), a ∈ LRA.Analysis.Bounds.RationalsWithSquareLessThanTwoInR → Real.instPreorder.1.le a u) → Real.instPreorder.1.le s u))) → False

Logical form (Lean):

```lean
theorem NoRelativeSupremumOfRationalsExample :
    ¬ ∃ s : ℝ, IsRelativeSupremum s RationalsWithSquareLessThanTwoInR
      (Set.range ((↑) : ℚ → ℝ))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem NoRelativeSupremumOfRationalsExample :
    ¬ ∃ s : ℝ, IsRelativeSupremum s RationalsWithSquareLessThanTwoInR
      (Set.range ((↑) : ℚ → ℝ)) := by
  sorry
/--
`RelativeSupremumOfRationalsInRExample` TODO

Predicate logic:

  LRA.Analysis.Bounds.IsRelativeSupremum (Real.sqrt 2) LRA.Analysis.Bounds.RationalsWithSquareLessThanTwoInR Set.univ

Predicate logic (unfolded):

  Ambient
    (T, ≤)
  Objects
    (none)
  Prove
    ((Real.sqrt 2 ∈ fun _a => True ∧ (∀ (a : Real), a ∈ LRA.Analysis.Bounds.RationalsWithSquareLessThanTwoInR → Real.instPreorder.1.le a (Real.sqrt 2))) ∧ (∀ (u : Real), u ∈ fun _a => True → (∀ (a : Real), a ∈ LRA.Analysis.Bounds.RationalsWithSquareLessThanTwoInR → Real.instPreorder.1.le a u) → Real.instPreorder.1.le (Real.sqrt 2) u))

Logical form (Lean):

```lean
theorem RelativeSupremumOfRationalsInRExample :
    IsRelativeSupremum (Real.sqrt 2) RationalsWithSquareLessThanTwoInR
      (Set.univ : Set ℝ)
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
theorem RelativeSupremumOfRationalsInRExample :
    IsRelativeSupremum (Real.sqrt 2) RationalsWithSquareLessThanTwoInR
      (Set.univ : Set ℝ) := by
  sorry
end LRA.Analysis.Bounds
