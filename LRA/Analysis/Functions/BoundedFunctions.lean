
import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas

namespace LRA.Analysis.Functions

/--
`FunctionBoundedAbove` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real), Exists fun M => ∀ (x : Real), Set.instMembership.mem A x → Real.instLE.le (f x) M

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), Exists fun M => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) M

Logical form (Lean):

```lean
def FunctionBoundedAbove (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ M : ℝ, ∀ x ∈ A, f x ≤ M
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def FunctionBoundedAbove (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ M : ℝ, ∀ x ∈ A, f x ≤ M

/--
`FunctionBoundedBelow` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real), Exists fun m => ∀ (x : Real), Set.instMembership.mem A x → Real.instLE.le m (f x)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), Exists fun m => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 m (f x)

Logical form (Lean):

```lean
def FunctionBoundedBelow (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ m : ℝ, ∀ x ∈ A, m ≤ f x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def FunctionBoundedBelow (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ m : ℝ, ∀ x ∈ A, m ≤ f x

/--
`FunctionBounded` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real), Exists fun B => (GT.gt B 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLE.le (abs (f x)) B)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) B)

Logical form (Lean):

```lean
def FunctionBounded (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ B > 0, ∀ x ∈ A, |f x| ≤ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def FunctionBounded (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ B > 0, ∀ x ∈ A, |f x| ≤ B

/--
`FunctionBoundedNear` TODO

Predicate logic:

  ∀ (f : Real → Real) (c : Real) (A : Set Real), Exists fun δ => (GT.gt δ 0 ∧ Exists fun B => (GT.gt B 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → (Real.instLT.lt 0 (abs (instHSub.hSub x c)) ∧ Real.instLT.lt (abs (instHSub.hSub x c)) δ) → Real.instLE.le (abs (f x)) B))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (c : Real) (A : Real → Prop), Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ) → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) B))

Logical form (Lean):

```lean
def FunctionBoundedNear (f : ℝ → ℝ) (c : ℝ) (A : Set ℝ) : Prop :=
  ∃ δ > 0, ∃ B > 0, ∀ x ∈ A, 0 < |x - c| ∧ |x - c| < δ → |f x| ≤ B
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
def FunctionBoundedNear (f : ℝ → ℝ) (c : ℝ) (A : Set ℝ) : Prop :=
  ∃ δ > 0, ∃ B > 0, ∀ x ∈ A, 0 < |x - c| ∧ |x - c| < δ → |f x| ≤ B

/--
`FunctionBoundedAwayFromZero` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real), Exists fun ε => (GT.gt ε 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → GE.ge (abs (f x)) ε)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), Exists fun ε => (Real.instLT.1 Zero.toOfNat0.1 ε ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 ε (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))))

Logical form (Lean):

```lean
def FunctionBoundedAwayFromZero (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ ε > 0, ∀ x ∈ A, |f x| ≥ ε
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def FunctionBoundedAwayFromZero (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ ε > 0, ∀ x ∈ A, |f x| ≥ ε

/--
`FunctionBoundedAwayFromZeroNear` TODO

Predicate logic:

  ∀ (f : Real → Real) (c : Real) (A : Set Real), Exists fun δ => (GT.gt δ 0 ∧ Exists fun ε => (GT.gt ε 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → (Real.instLT.lt 0 (abs (instHSub.hSub x c)) ∧ Real.instLT.lt (abs (instHSub.hSub x c)) δ) → GE.ge (abs (f x)) ε))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (c : Real) (A : Real → Prop), Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ Exists fun ε => (Real.instLT.1 Zero.toOfNat0.1 ε ∧ ∀ (x : Real), Set.instMembership.1 A x → (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ) → Real.instLE.1 ε (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x)))))

Logical form (Lean):

```lean
def FunctionBoundedAwayFromZeroNear (f : ℝ → ℝ) (c : ℝ) (A : Set ℝ) : Prop :=
  ∃ δ > 0, ∃ ε > 0, ∀ x ∈ A, 0 < |x - c| ∧ |x - c| < δ → |f x| ≥ ε
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
def FunctionBoundedAwayFromZeroNear (f : ℝ → ℝ) (c : ℝ) (A : Set ℝ) : Prop :=
  ∃ δ > 0, ∃ ε > 0, ∀ x ∈ A, 0 < |x - c| ∧ |x - c| < δ → |f x| ≥ ε

/--
`UniformlyBoundedFamily` TODO

Predicate logic:

  ∀ {I : Type u_1} (f : I → Real → Real) (A : Set Real), Exists fun B => (GT.gt B 0 ∧ ∀ (α : I) (x : Real), Set.instMembership.mem A x → Real.instLE.le (abs (f α x)) B)

Predicate logic (unfolded):

  ∀ {I : Type u_1} (f : I → Real → Real) (A : Real → Prop), Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (α : I) (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f α x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f α x))) B)

Logical form (Lean):

```lean
def UniformlyBoundedFamily {I : Type*} (f : I → ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ B > 0, ∀ α : I, ∀ x ∈ A, |f α x| ≤ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def UniformlyBoundedFamily {I : Type*} (f : I → ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ B > 0, ∀ α : I, ∀ x ∈ A, |f α x| ≤ B

/--
`BoundedIffAbsoluteValueBoundedAbove` TODO

Predicate logic:

  (ℝ → ℝ) → FunctionBounded f A ↔ FunctionBoundedAbove (fun x => |f x|) A

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) B) ↔ Exists fun M => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 ((fun x => SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) x) M

Logical form (Lean):

```lean
theorem BoundedIffAbsoluteValueBoundedAbove (f : ℝ → ℝ) (A : Set ℝ) :
    FunctionBounded f A ↔ FunctionBoundedAbove (fun x => |f x|) A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem BoundedIffAbsoluteValueBoundedAbove (f : ℝ → ℝ) (A : Set ℝ) :
    FunctionBounded f A ↔ FunctionBoundedAbove (fun x => |f x|) A := by
  sorry
/--
`BoundednessRestriction` TODO

Predicate logic:

  (ℝ → ℝ) → FunctionBounded f S

Predicate logic (unfolded):

  ∀ (f : Real → Real) (S A : Real → Prop), (Set.instLE.1 S A ∧ Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) B)) → Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 S x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) B)

Logical form (Lean):

```lean
theorem BoundednessRestriction (f : ℝ → ℝ) (S A : Set ℝ) (hS : S ⊆ A)
    (h : FunctionBounded f A) : FunctionBounded f S
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
theorem BoundednessRestriction (f : ℝ → ℝ) (S A : Set ℝ) (hS : S ⊆ A)
    (h : FunctionBounded f A) : FunctionBounded f S := by
  sorry
/--
`BoundednessNotPreservedUnderExtension` TODO

Predicate logic:

  ∃ A B ∈ Set ℝ f g ∈ ℝ → ℝ, A ⊆ B ∧ FunctionBounded f A ∧ (∀ x ∈ A, g x = f x) ∧ ¬ FunctionBounded g B

Predicate logic (unfolded):

  Exists fun A => Exists fun B => Exists fun f => Exists fun g => (Set.instLE.1 A B ∧ (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) B) ∧ (∀ (x : Real), Set.instMembership.1 A x → g x = f x ∧ (Exists fun B_1 => (Real.instLT.1 Zero.toOfNat0.1 B_1 ∧ ∀ (x : Real), Set.instMembership.1 B x → Real.instLE.1 (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x))) B_1)) → False)))

Logical form (Lean):

```lean
theorem BoundednessNotPreservedUnderExtension :
    ∃ (A B : Set ℝ) (f g : ℝ → ℝ),
      A ⊆ B ∧ FunctionBounded f A ∧ (∀ x ∈ A, g x = f x) ∧
        ¬ FunctionBounded g B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem BoundednessNotPreservedUnderExtension :
    ∃ (A B : Set ℝ) (f g : ℝ → ℝ),
      A ⊆ B ∧ FunctionBounded f A ∧ (∀ x ∈ A, g x = f x) ∧
        ¬ FunctionBounded g B := by
  sorry
/--
`BoundedAwayFromZeroImpliesNonzero` TODO

Predicate logic:

  (ℝ → ℝ) → ∀ x ∈ A, f x ≠ 0

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), (Exists fun ε => (Real.instLT.1 Zero.toOfNat0.1 ε ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 ε (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))))) → ∀ (x : Real), (Set.instMembership.1 A x ∧ f x = Zero.toOfNat0.1) → False

Logical form (Lean):

```lean
theorem BoundedAwayFromZeroImpliesNonzero (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionBoundedAwayFromZero f A) : ∀ x ∈ A, f x ≠ 0
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
theorem BoundedAwayFromZeroImpliesNonzero (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionBoundedAwayFromZero f A) : ∀ x ∈ A, f x ≠ 0 := by
  sorry
/--
`BoundedAwayFromZeroNearImpliesNonzeroNear` TODO

Predicate logic:

  (ℝ → ℝ) → ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| ∧ |x - c| < δ → f x ≠ 0

Predicate logic (unfolded):

  ∀ (f : Real → Real) (c : Real) (A : Real → Prop), (Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ Exists fun ε => (Real.instLT.1 Zero.toOfNat0.1 ε ∧ ∀ (x : Real), Set.instMembership.1 A x → (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ) → Real.instLE.1 ε (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x)))))) → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ) → f x = Zero.toOfNat0.1 → False)

Logical form (Lean):

```lean
theorem BoundedAwayFromZeroNearImpliesNonzeroNear (f : ℝ → ℝ)
    (c : ℝ) (A : Set ℝ) (h : FunctionBoundedAwayFromZeroNear f c A) :
    ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| ∧ |x - c| < δ → f x ≠ 0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem BoundedAwayFromZeroNearImpliesNonzeroNear (f : ℝ → ℝ)
    (c : ℝ) (A : Set ℝ) (h : FunctionBoundedAwayFromZeroNear f c A) :
    ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| ∧ |x - c| < δ → f x ≠ 0 := by
  sorry
/--
`BoundedAwayFromZeroGivesBoundedReciprocal` TODO

Predicate logic:

  (ℝ → ℝ) → FunctionBounded (fun x => 1 / f x) A

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), (Exists fun ε => (Real.instLT.1 Zero.toOfNat0.1 ε ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 ε (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))))) → Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => instHDiv.1 One.toOfNat1.1 (f x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => instHDiv.1 1 (f x)) x))) B)

Logical form (Lean):

```lean
theorem BoundedAwayFromZeroGivesBoundedReciprocal (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionBoundedAwayFromZero f A) :
    FunctionBounded (fun x => 1 / f x) A
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
theorem BoundedAwayFromZeroGivesBoundedReciprocal (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionBoundedAwayFromZero f A) :
    FunctionBounded (fun x => 1 / f x) A := by
  sorry
/--
`LocalBoundedAwayFromZeroGivesLocalBoundedReciprocal` TODO

Predicate logic:

  (ℝ → ℝ) → FunctionBoundedNear (fun x => 1 / f x) c A

Predicate logic (unfolded):

  ∀ (f : Real → Real) (c : Real) (A : Real → Prop), (Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ Exists fun ε => (Real.instLT.1 Zero.toOfNat0.1 ε ∧ ∀ (x : Real), Set.instMembership.1 A x → (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ) → Real.instLE.1 ε (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x)))))) → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ) → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => instHDiv.1 One.toOfNat1.1 (f x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => instHDiv.1 1 (f x)) x))) B))

Logical form (Lean):

```lean
theorem LocalBoundedAwayFromZeroGivesLocalBoundedReciprocal
    (f : ℝ → ℝ) (c : ℝ) (A : Set ℝ) (h : FunctionBoundedAwayFromZeroNear f c A) :
    FunctionBoundedNear (fun x => 1 / f x) c A
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
theorem LocalBoundedAwayFromZeroGivesLocalBoundedReciprocal
    (f : ℝ → ℝ) (c : ℝ) (A : Set ℝ) (h : FunctionBoundedAwayFromZeroNear f c A) :
    FunctionBoundedNear (fun x => 1 / f x) c A := by
  sorry
/--
`UniformBoundednessTransferUnderPointwiseLimit` TODO

Predicate logic:

  (ℕ → ℝ → ℝ ∧ ℝ → ℝ ∧ ∀ x ∈ A, Filter.Tendsto (fun n => f n x) Filter.atTop (nhds (F x))) → FunctionBounded F A

Predicate logic (unfolded):

  ∀ (f : Nat → Real → Real) (F : Real → Real) (A : Real → Prop), (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (α : Nat) (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f α x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f α x))) B) ∧ ∀ (x : Real), Set.instMembership.1 A x → Filter.instPartialOrder.toLE.1 { sets := fun x_1 => Set.instMembership.1 Filter.atTop.sets (Set.preimage (fun n => f n x) x_1), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (F x))) → Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (F x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (F x))) B)

Logical form (Lean):

```lean
theorem UniformBoundednessTransferUnderPointwiseLimit
    (f : ℕ → ℝ → ℝ) (F : ℝ → ℝ) (A : Set ℝ)
    (hunif : UniformlyBoundedFamily f A)
    (hlim : ∀ x ∈ A, Filter.Tendsto (fun n => f n x) Filter.atTop (nhds (F x))) :
    FunctionBounded F A
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
theorem UniformBoundednessTransferUnderPointwiseLimit
    (f : ℕ → ℝ → ℝ) (F : ℝ → ℝ) (A : Set ℝ)
    (hunif : UniformlyBoundedFamily f A)
    (hlim : ∀ x ∈ A, Filter.Tendsto (fun n => f n x) Filter.atTop (nhds (F x))) :
    FunctionBounded F A := by
  sorry
/--
`BoundedFunctionAlgebraClosure` TODO

Predicate logic:

  FunctionBounded (fun x => f x + g x) A ∧ FunctionBounded (fun x => f x - g x) A ∧ FunctionBounded (fun x => f x * g x) A ∧ FunctionBounded (fun x => lam * f x) A ∧ FunctionBounded (fun x => |f x|) A ∧ FunctionBounded (fun x => max (f x) (g x)) A ∧ FunctionBounded (fun x => min (f x) (g x)) A

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop) (lam : Real), (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) B) ∧ Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x))) B)) → (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => instHAdd.1 (f x) (g x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => instHAdd.1 (f x) (g x)) x))) B) ∧ (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => instHSub.1 (f x) (g x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => instHSub.1 (f x) (g x)) x))) B) ∧ (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => instHMul.1 (f x) (g x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => instHMul.1 (f x) (g x)) x))) B) ∧ (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => instHMul.1 lam (f x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => instHMul.1 lam (f x)) x))) B) ∧ (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (f x))) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => SemilatticeSup.toMax.max (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (f x))) x))) B) ∧ (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => Real.instMax.1 (f x) (g x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => Real.instMax.1 (f x) (g x)) x))) B) ∧ Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => Real.instMin.1 (f x) (g x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => Real.instMin.1 (f x) (g x)) x))) B)))))))

Logical form (Lean):

```lean
theorem BoundedFunctionAlgebraClosure (f g : ℝ → ℝ) (A : Set ℝ) (lam : ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBounded g A) :
    FunctionBounded (fun x => f x + g x) A ∧
      FunctionBounded (fun x => f x - g x) A ∧
      FunctionBounded (fun x => f x * g x) A ∧
      FunctionBounded (fun x => lam * f x) A ∧
      FunctionBounded (fun x => |f x|) A ∧
      FunctionBounded (fun x => max (f x) (g x)) A ∧
      FunctionBounded (fun x => min (f x) (g x)) A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem BoundedFunctionAlgebraClosure (f g : ℝ → ℝ) (A : Set ℝ) (lam : ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBounded g A) :
    FunctionBounded (fun x => f x + g x) A ∧
      FunctionBounded (fun x => f x - g x) A ∧
      FunctionBounded (fun x => f x * g x) A ∧
      FunctionBounded (fun x => lam * f x) A ∧
      FunctionBounded (fun x => |f x|) A ∧
      FunctionBounded (fun x => max (f x) (g x)) A ∧
      FunctionBounded (fun x => min (f x) (g x)) A := by
  sorry
/--
`BoundedSum` TODO

Predicate logic:

  FunctionBounded (fun x => f x + g x) A

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop), (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) B) ∧ Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x))) B)) → Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => instHAdd.1 (f x) (g x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => instHAdd.1 (f x) (g x)) x))) B)

Logical form (Lean):

```lean
theorem BoundedSum (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBounded g A) :
    FunctionBounded (fun x => f x + g x) A
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
theorem BoundedSum (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBounded g A) :
    FunctionBounded (fun x => f x + g x) A := by
  sorry
/--
`BoundedDifference` TODO

Predicate logic:

  FunctionBounded (fun x => f x - g x) A

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop), (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) B) ∧ Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x))) B)) → Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => instHSub.1 (f x) (g x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => instHSub.1 (f x) (g x)) x))) B)

Logical form (Lean):

```lean
theorem BoundedDifference (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBounded g A) :
    FunctionBounded (fun x => f x - g x) A
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
theorem BoundedDifference (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBounded g A) :
    FunctionBounded (fun x => f x - g x) A := by
  sorry
/--
`BoundedProduct` TODO

Predicate logic:

  FunctionBounded (fun x => f x * g x) A

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop), (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) B) ∧ Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x))) B)) → Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => instHMul.1 (f x) (g x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => instHMul.1 (f x) (g x)) x))) B)

Logical form (Lean):

```lean
theorem BoundedProduct (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBounded g A) :
    FunctionBounded (fun x => f x * g x) A
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
theorem BoundedProduct (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBounded g A) :
    FunctionBounded (fun x => f x * g x) A := by
  sorry
/--
`BoundedScalarMultiple` TODO

Predicate logic:

  (ℝ → ℝ) → FunctionBounded (fun x => lam * f x) A

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (lam : Real), (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) B)) → Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => instHMul.1 lam (f x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => instHMul.1 lam (f x)) x))) B)

Logical form (Lean):

```lean
theorem BoundedScalarMultiple (f : ℝ → ℝ) (A : Set ℝ) (lam : ℝ)
    (hf : FunctionBounded f A) : FunctionBounded (fun x => lam * f x) A
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
theorem BoundedScalarMultiple (f : ℝ → ℝ) (A : Set ℝ) (lam : ℝ)
    (hf : FunctionBounded f A) : FunctionBounded (fun x => lam * f x) A := by
  sorry
/--
`BoundedAbsoluteValue` TODO

Predicate logic:

  (ℝ → ℝ) → FunctionBounded (fun x => |f x|) A

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) B)) → Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (f x))) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => SemilatticeSup.toMax.max (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (f x))) x))) B)

Logical form (Lean):

```lean
theorem BoundedAbsoluteValue (f : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) : FunctionBounded (fun x => |f x|) A
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
theorem BoundedAbsoluteValue (f : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) : FunctionBounded (fun x => |f x|) A := by
  sorry
/--
`BoundedMaxMin` TODO

Predicate logic:

  FunctionBounded (fun x => max (f x) (g x)) A ∧ FunctionBounded (fun x => min (f x) (g x)) A

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop), (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) B) ∧ Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x))) B)) → (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => Real.instMax.1 (f x) (g x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => Real.instMax.1 (f x) (g x)) x))) B) ∧ Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => Real.instMin.1 (f x) (g x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => Real.instMin.1 (f x) (g x)) x))) B))

Logical form (Lean):

```lean
theorem BoundedMaxMin (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBounded g A) :
    FunctionBounded (fun x => max (f x) (g x)) A ∧
      FunctionBounded (fun x => min (f x) (g x)) A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem BoundedMaxMin (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBounded g A) :
    FunctionBounded (fun x => max (f x) (g x)) A ∧
      FunctionBounded (fun x => min (f x) (g x)) A := by
  sorry
/--
`BoundedFunctionsFormCommutativeRing` TODO

Predicate logic:

  ∀ f g : ℝ → ℝ, FunctionBounded f A → FunctionBounded g A → FunctionBounded (fun x => f x + g x) A ∧ FunctionBounded (fun x => -f x) A ∧ FunctionBounded (fun x => f x * g x) A ∧ FunctionBounded (fun _ => 0 ∈ ℝ) A ∧ FunctionBounded (fun _ => 1 ∈ ℝ) A

Predicate logic (unfolded):

  ∀ (A : Real → Prop) (f g : Real → Real), (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) B) ∧ Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x))) B)) → (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => instHAdd.1 (f x) (g x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => instHAdd.1 (f x) (g x)) x))) B) ∧ (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => Real.instNeg.1 (f x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => Real.instNeg.1 (f x)) x))) B) ∧ (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => instHMul.1 (f x) (g x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => instHMul.1 (f x) (g x)) x))) B) ∧ (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => Zero.toOfNat0.1) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => Zero.toOfNat0.1) x))) B) ∧ Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => One.toOfNat1.1) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => One.toOfNat1.1) x))) B)))))

Logical form (Lean):

```lean
theorem BoundedFunctionsFormCommutativeRing (A : Set ℝ) :
    ∀ f g : ℝ → ℝ, FunctionBounded f A → FunctionBounded g A →
      FunctionBounded (fun x => f x + g x) A ∧
        FunctionBounded (fun x => -f x) A ∧
        FunctionBounded (fun x => f x * g x) A ∧
        FunctionBounded (fun _ => (0 : ℝ)) A ∧
        FunctionBounded (fun _ => (1 : ℝ)) A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem BoundedFunctionsFormCommutativeRing (A : Set ℝ) :
    ∀ f g : ℝ → ℝ, FunctionBounded f A → FunctionBounded g A →
      FunctionBounded (fun x => f x + g x) A ∧
        FunctionBounded (fun x => -f x) A ∧
        FunctionBounded (fun x => f x * g x) A ∧
        FunctionBounded (fun _ => (0 : ℝ)) A ∧
        FunctionBounded (fun _ => (1 : ℝ)) A := by
  sorry
/--
`BoundedFunctionsFormRealVectorSpace` TODO

Predicate logic:

  ∀ f g : ℝ → ℝ, ∀ lam : ℝ, FunctionBounded f A → FunctionBounded g A → FunctionBounded (fun x => f x + g x) A ∧ FunctionBounded (fun x => -f x) A ∧ FunctionBounded (fun x => lam * f x) A ∧ FunctionBounded (fun _ => 0 ∈ ℝ) A

Predicate logic (unfolded):

  ∀ (A : Real → Prop) (f g : Real → Real) (lam : Real), (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) B) ∧ Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x))) B)) → (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => instHAdd.1 (f x) (g x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => instHAdd.1 (f x) (g x)) x))) B) ∧ (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => Real.instNeg.1 (f x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => Real.instNeg.1 (f x)) x))) B) ∧ (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => instHMul.1 lam (f x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => instHMul.1 lam (f x)) x))) B) ∧ Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => Zero.toOfNat0.1) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => Zero.toOfNat0.1) x))) B))))

Logical form (Lean):

```lean
theorem BoundedFunctionsFormRealVectorSpace (A : Set ℝ) :
    ∀ f g : ℝ → ℝ, ∀ lam : ℝ, FunctionBounded f A → FunctionBounded g A →
      FunctionBounded (fun x => f x + g x) A ∧
        FunctionBounded (fun x => -f x) A ∧
        FunctionBounded (fun x => lam * f x) A ∧
        FunctionBounded (fun _ => (0 : ℝ)) A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem BoundedFunctionsFormRealVectorSpace (A : Set ℝ) :
    ∀ f g : ℝ → ℝ, ∀ lam : ℝ, FunctionBounded f A → FunctionBounded g A →
      FunctionBounded (fun x => f x + g x) A ∧
        FunctionBounded (fun x => -f x) A ∧
        FunctionBounded (fun x => lam * f x) A ∧
        FunctionBounded (fun _ => (0 : ℝ)) A := by
  sorry
/--
`BoundedAwayQuotient` TODO

Predicate logic:

  FunctionBounded (fun x => f x / g x) A

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop), (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) B) ∧ Exists fun ε => (Real.instLT.1 Zero.toOfNat0.1 ε ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 ε (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x))))) → Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => instHDiv.1 (f x) (g x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => instHDiv.1 (f x) (g x)) x))) B)

Logical form (Lean):

```lean
theorem BoundedAwayQuotient (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBoundedAwayFromZero g A) :
    FunctionBounded (fun x => f x / g x) A
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
theorem BoundedAwayQuotient (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBoundedAwayFromZero g A) :
    FunctionBounded (fun x => f x / g x) A := by
  sorry
/--
`BoundedQuotientByBoundedAwayDenominator` TODO

Predicate logic:

  FunctionBounded (fun x => f x / g x) A

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop), (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) B) ∧ Exists fun ε => (Real.instLT.1 Zero.toOfNat0.1 ε ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 ε (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x))))) → Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => instHDiv.1 (f x) (g x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => instHDiv.1 (f x) (g x)) x))) B)

Logical form (Lean):

```lean
theorem BoundedQuotientByBoundedAwayDenominator (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBoundedAwayFromZero g A) :
    FunctionBounded (fun x => f x / g x) A
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
theorem BoundedQuotientByBoundedAwayDenominator (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBoundedAwayFromZero g A) :
    FunctionBounded (fun x => f x / g x) A := by
  sorry
end LRA.Analysis.Functions
