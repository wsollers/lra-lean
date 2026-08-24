
import Mathlib.Order.Basic
import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.Sqrt
import Mathlib.Data.Rat.Cast.Defs

namespace LRA.Analysis.Bounds

variable {T : Type*} [Preorder T]

/--
`IsRelativeUpperBound` TODO

Predicate logic:

  ∀ {T : Type u_1} [inst : Preorder T] (u : T) (A S : Set T), (Set.instMembership.mem S u ∧ ∀ (a : T), Set.instMembership.mem A a → inst.le a u)

Predicate logic (unfolded):

  ∀ {T : Type u_1} [inst : Preorder T] (u : T) (A S : T → Prop), (Set.instMembership.1 S u ∧ ∀ (a : T), Set.instMembership.1 A a → inst.toLE.1 a u)

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

  ∀ {T : Type u_1} [inst : Preorder T] (l : T) (A S : Set T), (Set.instMembership.mem S l ∧ ∀ (a : T), Set.instMembership.mem A a → inst.le l a)

Predicate logic (unfolded):

  ∀ {T : Type u_1} [inst : Preorder T] (l : T) (A S : T → Prop), (Set.instMembership.1 S l ∧ ∀ (a : T), Set.instMembership.1 A a → inst.toLE.1 l a)

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

  ∀ {T : Type u_1} [inst : Preorder T] (s : T) (A S : Set T), (LRA.Analysis.Bounds.IsRelativeUpperBound s A S ∧ ∀ (u : T), Set.instMembership.mem S u → (∀ (a : T), Set.instMembership.mem A a → inst.le a u) → inst.le s u)

Predicate logic (unfolded):

  ∀ {T : Type u_1} [inst : Preorder T] (s : T) (A S : T → Prop), ((Set.instMembership.1 S s ∧ ∀ (a : T), Set.instMembership.1 A a → inst.toLE.1 a s) ∧ ∀ (u : T), Set.instMembership.1 S u → (∀ (a : T), Set.instMembership.1 A a → inst.toLE.1 a u) → inst.toLE.1 s u)

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

  ∀ {T : Type u_1} [inst : Preorder T] (i : T) (A S : Set T), (LRA.Analysis.Bounds.IsRelativeLowerBound i A S ∧ ∀ (l : T), Set.instMembership.mem S l → (∀ (a : T), Set.instMembership.mem A a → inst.le l a) → inst.le l i)

Predicate logic (unfolded):

  ∀ {T : Type u_1} [inst : Preorder T] (i : T) (A S : T → Prop), ((Set.instMembership.1 S i ∧ ∀ (a : T), Set.instMembership.1 A a → inst.toLE.1 i a) ∧ ∀ (l : T), Set.instMembership.1 S l → (∀ (a : T), Set.instMembership.1 A a → inst.toLE.1 l a) → inst.toLE.1 l i)

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

  (∀ s ∈ T), (IsLUB A s ∧ s ∈ S) → IsRelativeSupremum s A S

Predicate logic (unfolded):

  ∀ {T : Type u_1} [inst : Preorder T] (A S : T → Prop) (s : T), ((Set.instMembership.1 (fun x => ∀ ⦃a : T⦄, Set.instMembership.1 A a → inst.toLE.1 a x) s ∧ Set.instMembership.1 (fun x => ∀ ⦃a : T⦄, Set.instMembership.1 (upperBounds A) a → inst.toLE.1 x a) s) ∧ Set.instMembership.1 S s) → ((Set.instMembership.1 S s ∧ ∀ (a : T), Set.instMembership.1 A a → inst.toLE.1 a s) ∧ ∀ (u : T), Set.instMembership.1 S u → (∀ (a : T), Set.instMembership.1 A a → inst.toLE.1 a u) → inst.toLE.1 s u)

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

  (∀ i ∈ T), (IsGLB A i ∧ i ∈ S) → IsRelativeInfimum i A S

Predicate logic (unfolded):

  ∀ {T : Type u_1} [inst : Preorder T] (A S : T → Prop) (i : T), ((Set.instMembership.1 (fun x => ∀ ⦃a : T⦄, Set.instMembership.1 A a → inst.toLE.1 x a) i ∧ Set.instMembership.1 (fun x => ∀ ⦃a : T⦄, Set.instMembership.1 (lowerBounds A) a → inst.toLE.1 a x) i) ∧ Set.instMembership.1 S i) → ((Set.instMembership.1 S i ∧ ∀ (a : T), Set.instMembership.1 A a → inst.toLE.1 i a) ∧ ∀ (l : T), Set.instMembership.1 S l → (∀ (a : T), Set.instMembership.1 A a → inst.toLE.1 l a) → inst.toLE.1 l i)

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

  ∀ (a : Real), Exists fun q => (a = Real.instRatCast.1 q ∧ Rat.instLT.1 (instHPow.1 q (instOfNatNat 2).1) Rat.instOfNat.1)

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

  ¬ ∃ s ∈ ℝ, IsRelativeSupremum s RationalsWithSquareLessThanTwoInR (Set.range ((↑) : ℚ → ℝ))

Predicate logic (unfolded):

  (Exists fun s => ((Set.instMembership.1 (fun x => Exists fun y => y.cast = x)s ∧ ∀ (a : Real), Set.instMembership.1 LRA.Analysis.Bounds.RationalsWithSquareLessThanTwoInR a → Real.instPreorder.toLE.1 a s) ∧ ∀ (u : Real), Set.instMembership.1 (fun x => Exists fun y => Real.instRatCast.ratCast y = x)u → (∀ (a : Real), Set.instMembership.1 LRA.Analysis.Bounds.RationalsWithSquareLessThanTwoInR a → Real.instPreorder.toLE.1 a u) → Real.instPreorder.toLE.1 s u)) → False

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

  IsRelativeSupremum (Real.sqrt 2) RationalsWithSquareLessThanTwoInR Set.univ ∈ Set ℝ

Predicate logic (unfolded):

  ((Set.instMembership.1 (fun _a => True) instOfNatAtLeastTwo.1.sqrt ∧ ∀ (a : Real), Set.instMembership.1 LRA.Analysis.Bounds.RationalsWithSquareLessThanTwoInR a → Real.instPreorder.toLE.1 a instOfNatAtLeastTwo.1.sqrt) ∧ ∀ (u : Real), Set.instMembership.1 (fun _a => True) u → (∀ (a : Real), Set.instMembership.1 LRA.Analysis.Bounds.RationalsWithSquareLessThanTwoInR a → Real.instPreorder.toLE.1 a u) → Real.instPreorder.toLE.1 instOfNatAtLeastTwo.1.sqrt u)

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
