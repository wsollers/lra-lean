
import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas

namespace LRA.Analysis.Functions

/--
`FunctionBoundedAbove` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real), Exists fun M => ∀ (x : Real), x ∈ A → Real.instLE.le (f x) M

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun M => ∀ (x : Real), x ∈ A → Real.instLE.le (f x) M

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

  ∀ (f : Real → Real) (A : Set Real), Exists fun m => ∀ (x : Real), x ∈ A → Real.instLE.le m (f x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun m => ∀ (x : Real), x ∈ A → Real.instLE.le m (f x)

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

  ∀ (f : Real → Real) (A : Set Real), Exists fun B => (GT.gt B 0 ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) B))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) B))

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

  ∀ (f : Real → Real) (c : Real) (A : Set Real), Exists fun δ => (GT.gt δ 0 ∧ (Exists fun B => (GT.gt B 0 ∧ (∀ (x : Real), x ∈ A → (Real.instLT.lt 0 (abs (instHSub.hSub x c)) ∧ Real.instLT.lt (abs (instHSub.hSub x c)) δ) → Real.instLE.le (abs (f x)) B))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun δ => (Real.instLT.lt 0 δ ∧ (Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → (Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ) → Real.instLE.le (abs (f x)) B))))

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

  ∀ (f : Real → Real) (A : Set Real), Exists fun ε => (GT.gt ε 0 ∧ (∀ (x : Real), x ∈ A → GE.ge (abs (f x)) ε))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun ε => (Real.instLT.lt 0 ε ∧ (∀ (x : Real), x ∈ A → Real.instLE.le ε (abs (f x))))

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

  ∀ (f : Real → Real) (c : Real) (A : Set Real), Exists fun δ => (GT.gt δ 0 ∧ (Exists fun ε => (GT.gt ε 0 ∧ (∀ (x : Real), x ∈ A → (Real.instLT.lt 0 (abs (instHSub.hSub x c)) ∧ Real.instLT.lt (abs (instHSub.hSub x c)) δ) → GE.ge (abs (f x)) ε))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun δ => (Real.instLT.lt 0 δ ∧ (Exists fun ε => (Real.instLT.lt 0 ε ∧ (∀ (x : Real), x ∈ A → (Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ) → Real.instLE.le ε (abs (f x))))))

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

  ∀ {I : Type u_1} (f : I → Real → Real) (A : Set Real), Exists fun B => (GT.gt B 0 ∧ (∀ (α : I) (x : Real), x ∈ A → Real.instLE.le (abs (f α x)) B))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (α : I) (x : Real), x ∈ A → Real.instLE.le (abs (f α x)) B))

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

  ∀ (f : Real → Real) (A : Set Real), LRA.Analysis.Functions.FunctionBounded f A ↔ LRA.Analysis.Functions.FunctionBoundedAbove (fun x => abs (f x)) A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
  Prove
    LRA.Analysis.Functions.FunctionBounded f A ↔ LRA.Analysis.Functions.FunctionBoundedAbove (fun x => abs (f x)) A

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

  ∀ (f : Real → Real) (S A : Set Real), (Set.instLE.le S A ∧ LRA.Analysis.Functions.FunctionBounded f A) → LRA.Analysis.Functions.FunctionBounded f S

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    S A : Set ℝ
    hS : S ⊆ A
    h : FunctionBounded f A
  Prove
    (({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le S A) ∧ (Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) B)))) → Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ S → Real.instLE.le (abs (f x)) B))

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

  Exists fun A => Exists fun B => Exists fun f => Exists fun g => (Set.instLE.le A B ∧ (LRA.Analysis.Functions.FunctionBounded f A ∧ ((∀ (x : Real), x ∈ A → g x = f x) ∧ ¬ LRA.Analysis.Functions.FunctionBounded g B)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun A => Exists fun B => Exists fun f => Exists fun g => (({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le A B) ∧ ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) B))) ∧ ((∀ (x : Real), x ∈ A → g x = f x) ∧ ((Exists fun B_1 => (Real.instLT.lt 0 B_1 ∧ (∀ (x : Real), x ∈ B → Real.instLE.le (abs (g x)) B_1))) → False))))

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

  ∀ (f : Real → Real) (A : Set Real), LRA.Analysis.Functions.FunctionBoundedAwayFromZero f A → ∀ (x : Real), x ∈ A → Ne (f x) 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    h : FunctionBoundedAwayFromZero f A
  Prove
    (Exists fun ε => (Real.instLT.lt 0 ε ∧ (∀ (x : Real), x ∈ A → Real.instLE.le ε (abs (f x))))) → ∀ (x : Real), (x ∈ A ∧ f x = 0) → False

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

  ∀ (f : Real → Real) (c : Real) (A : Set Real), LRA.Analysis.Functions.FunctionBoundedAwayFromZeroNear f c A → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → (Real.instLT.lt 0 (abs (instHSub.hSub x c)) ∧ Real.instLT.lt (abs (instHSub.hSub x c)) δ) → Ne (f x) 0))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    c : ℝ
    A : Set ℝ
    h : FunctionBoundedAwayFromZeroNear f c A
  Prove
    (Exists fun δ => (Real.instLT.lt 0 δ ∧ (Exists fun ε => (Real.instLT.lt 0 ε ∧ (∀ (x : Real), x ∈ A → (Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ) → Real.instLE.le ε (abs (f x))))))) → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → (Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ) → f x = 0 → False))

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

  ∀ (f : Real → Real) (A : Set Real), LRA.Analysis.Functions.FunctionBoundedAwayFromZero f A → LRA.Analysis.Functions.FunctionBounded (fun x => instHDiv.hDiv 1 (f x)) A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    h : FunctionBoundedAwayFromZero f A
  Prove
    (Exists fun ε => (Real.instLT.lt 0 ε ∧ (∀ (x : Real), x ∈ A → Real.instLE.le ε (abs (f x))))) → Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 (f x)) x)) B))

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

  ∀ (f : Real → Real) (c : Real) (A : Set Real), LRA.Analysis.Functions.FunctionBoundedAwayFromZeroNear f c A → LRA.Analysis.Functions.FunctionBoundedNear (fun x => instHDiv.hDiv 1 (f x)) c A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    c : ℝ
    A : Set ℝ
    h : FunctionBoundedAwayFromZeroNear f c A
  Prove
    (Exists fun δ => (Real.instLT.lt 0 δ ∧ (Exists fun ε => (Real.instLT.lt 0 ε ∧ (∀ (x : Real), x ∈ A → (Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ) → Real.instLE.le ε (abs (f x))))))) → Exists fun δ => (Real.instLT.lt 0 δ ∧ (Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → (Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ) → Real.instLE.le (abs ((fun x => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 (f x)) x)) B))))

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

  ∀ (f : Nat → Real → Real) (F : Real → Real) (A : Set Real), (LRA.Analysis.Functions.UniformlyBoundedFamily f A ∧ (∀ (x : Real), x ∈ A → Filter.Tendsto (fun n => f n x) Filter.atTop (nhds (F x)))) → LRA.Analysis.Functions.FunctionBounded F A

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    f : ℕ → ℝ → ℝ
    F : ℝ → ℝ
    A : Set ℝ
    hunif : UniformlyBoundedFamily f A
  Prove
    ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (α : Nat) (x : Real), x ∈ A → Real.instLE.le (abs (f α x)) B))) ∧ (∀ (x : Real), x ∈ A → Filter.instPartialOrder.toPreorder.1.le { sets := fun x_1 => setOf fun x_2 => (fun n => f n x) x_2 ∈ x_1 ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (F x)))) → Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (F x)) B))

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

  ∀ (f g : Real → Real) (A : Set Real) (lam : Real), (LRA.Analysis.Functions.FunctionBounded f A ∧ LRA.Analysis.Functions.FunctionBounded g A) → (LRA.Analysis.Functions.FunctionBounded (fun x => instHAdd.hAdd (f x) (g x)) A ∧ (LRA.Analysis.Functions.FunctionBounded (fun x => instHSub.hSub (f x) (g x)) A ∧ (LRA.Analysis.Functions.FunctionBounded (fun x => instHMul.hMul (f x) (g x)) A ∧ (LRA.Analysis.Functions.FunctionBounded (fun x => instHMul.hMul lam (f x)) A ∧ (LRA.Analysis.Functions.FunctionBounded (fun x => abs (f x)) A ∧ (LRA.Analysis.Functions.FunctionBounded (fun x => Real.instMax.max (f x) (g x)) A ∧ LRA.Analysis.Functions.FunctionBounded (fun x => Real.instMin.min (f x) (g x)) A))))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    lam : ℝ
    hf : FunctionBounded f A
    hg : FunctionBounded g A
  Prove
    ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) B))) ∧ (Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (g x)) B)))) → ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x)) x)) B))) ∧ ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (g x)) x)) B))) ∧ ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul (f x) (g x)) x)) B))) ∧ ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul lam (f x)) x)) B))) ∧ ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => abs (f x)) x)) B))) ∧ ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => Real.instMax.1 (f x) (g x)) x)) B))) ∧ (Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => Real.instMin.1 (f x) (g x)) x)) B)))))))))

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

  ∀ (f g : Real → Real) (A : Set Real), (LRA.Analysis.Functions.FunctionBounded f A ∧ LRA.Analysis.Functions.FunctionBounded g A) → LRA.Analysis.Functions.FunctionBounded (fun x => instHAdd.hAdd (f x) (g x)) A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    hf : FunctionBounded f A
    hg : FunctionBounded g A
  Prove
    ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) B))) ∧ (Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (g x)) B)))) → Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x)) x)) B))

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

  ∀ (f g : Real → Real) (A : Set Real), (LRA.Analysis.Functions.FunctionBounded f A ∧ LRA.Analysis.Functions.FunctionBounded g A) → LRA.Analysis.Functions.FunctionBounded (fun x => instHSub.hSub (f x) (g x)) A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    hf : FunctionBounded f A
    hg : FunctionBounded g A
  Prove
    ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) B))) ∧ (Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (g x)) B)))) → Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (g x)) x)) B))

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

  ∀ (f g : Real → Real) (A : Set Real), (LRA.Analysis.Functions.FunctionBounded f A ∧ LRA.Analysis.Functions.FunctionBounded g A) → LRA.Analysis.Functions.FunctionBounded (fun x => instHMul.hMul (f x) (g x)) A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    hf : FunctionBounded f A
    hg : FunctionBounded g A
  Prove
    ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) B))) ∧ (Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (g x)) B)))) → Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul (f x) (g x)) x)) B))

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

  ∀ (f : Real → Real) (A : Set Real) (lam : Real), LRA.Analysis.Functions.FunctionBounded f A → LRA.Analysis.Functions.FunctionBounded (fun x => instHMul.hMul lam (f x)) A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    lam : ℝ
    hf : FunctionBounded f A
  Prove
    (Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) B))) → Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul lam (f x)) x)) B))

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

  ∀ (f : Real → Real) (A : Set Real), LRA.Analysis.Functions.FunctionBounded f A → LRA.Analysis.Functions.FunctionBounded (fun x => abs (f x)) A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    hf : FunctionBounded f A
  Prove
    (Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) B))) → Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => abs (f x)) x)) B))

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

  ∀ (f g : Real → Real) (A : Set Real), (LRA.Analysis.Functions.FunctionBounded f A ∧ LRA.Analysis.Functions.FunctionBounded g A) → (LRA.Analysis.Functions.FunctionBounded (fun x => Real.instMax.max (f x) (g x)) A ∧ LRA.Analysis.Functions.FunctionBounded (fun x => Real.instMin.min (f x) (g x)) A)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    hf : FunctionBounded f A
    hg : FunctionBounded g A
  Prove
    ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) B))) ∧ (Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (g x)) B)))) → ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => Real.instMax.1 (f x) (g x)) x)) B))) ∧ (Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => Real.instMin.1 (f x) (g x)) x)) B))))

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

  ∀ (A : Set Real) (f g : Real → Real), (LRA.Analysis.Functions.FunctionBounded f A ∧ LRA.Analysis.Functions.FunctionBounded g A) → (LRA.Analysis.Functions.FunctionBounded (fun x => instHAdd.hAdd (f x) (g x)) A ∧ (LRA.Analysis.Functions.FunctionBounded (fun x => Real.instNeg.neg (f x)) A ∧ (LRA.Analysis.Functions.FunctionBounded (fun x => instHMul.hMul (f x) (g x)) A ∧ (LRA.Analysis.Functions.FunctionBounded (fun x => 0) A ∧ LRA.Analysis.Functions.FunctionBounded (fun x => 1) A))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
  Prove
    ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) B))) ∧ (Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (g x)) B)))) → ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x)) x)) B))) ∧ ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => Real.instNeg.neg (f x)) x)) B))) ∧ ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul (f x) (g x)) x)) B))) ∧ ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => 0) x)) B))) ∧ (Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => 1) x)) B)))))))

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

  ∀ (A : Set Real) (f g : Real → Real) (lam : Real), (LRA.Analysis.Functions.FunctionBounded f A ∧ LRA.Analysis.Functions.FunctionBounded g A) → (LRA.Analysis.Functions.FunctionBounded (fun x => instHAdd.hAdd (f x) (g x)) A ∧ (LRA.Analysis.Functions.FunctionBounded (fun x => Real.instNeg.neg (f x)) A ∧ (LRA.Analysis.Functions.FunctionBounded (fun x => instHMul.hMul lam (f x)) A ∧ LRA.Analysis.Functions.FunctionBounded (fun x => 0) A)))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
  Prove
    ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) B))) ∧ (Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (g x)) B)))) → ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x)) x)) B))) ∧ ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => Real.instNeg.neg (f x)) x)) B))) ∧ ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul lam (f x)) x)) B))) ∧ (Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => 0) x)) B))))))

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

  ∀ (f g : Real → Real) (A : Set Real), (LRA.Analysis.Functions.FunctionBounded f A ∧ LRA.Analysis.Functions.FunctionBoundedAwayFromZero g A) → LRA.Analysis.Functions.FunctionBounded (fun x => instHDiv.hDiv (f x) (g x)) A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    hf : FunctionBounded f A
    hg : FunctionBoundedAwayFromZero g A
  Prove
    ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) B))) ∧ (Exists fun ε => (Real.instLT.lt 0 ε ∧ (∀ (x : Real), x ∈ A → Real.instLE.le ε (abs (g x)))))) → Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (f x) (g x)) x)) B))

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

  ∀ (f g : Real → Real) (A : Set Real), (LRA.Analysis.Functions.FunctionBounded f A ∧ LRA.Analysis.Functions.FunctionBoundedAwayFromZero g A) → LRA.Analysis.Functions.FunctionBounded (fun x => instHDiv.hDiv (f x) (g x)) A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    hf : FunctionBounded f A
    hg : FunctionBoundedAwayFromZero g A
  Prove
    ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) B))) ∧ (Exists fun ε => (Real.instLT.lt 0 ε ∧ (∀ (x : Real), x ∈ A → Real.instLE.le ε (abs (g x)))))) → Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ((fun x => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (f x) (g x)) x)) B))

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
