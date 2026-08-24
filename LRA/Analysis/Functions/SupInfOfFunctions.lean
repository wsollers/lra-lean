
import Mathlib.Data.Real.Basic
import Mathlib.Data.Fintype.Basic
import Mathlib.Order.ConditionallyCompleteLattice.Basic

namespace LRA.Analysis.Functions

/--
`FunctionSupremumOnSet` TODO

Predicate logic:

  noncomputable def FunctionSupremumOnSet (f : ℝ → ℝ) (A : Set ℝ) : ℝ :=
  0

Predicate logic (unfolded):

  noncomputable def FunctionSupremumOnSet (f : ℝ → ℝ) (A : Set ℝ) : ℝ :=
  0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def FunctionSupremumOnSet (f : ℝ → ℝ) (A : Set ℝ) : ℝ :=
  0
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
noncomputable def FunctionSupremumOnSet (f : ℝ → ℝ) (A : Set ℝ) : ℝ :=
  0

/--
`FunctionInfimumOnSet` TODO

Predicate logic:

  noncomputable def FunctionInfimumOnSet (f : ℝ → ℝ) (A : Set ℝ) : ℝ :=
  0

Predicate logic (unfolded):

  noncomputable def FunctionInfimumOnSet (f : ℝ → ℝ) (A : Set ℝ) : ℝ :=
  0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def FunctionInfimumOnSet (f : ℝ → ℝ) (A : Set ℝ) : ℝ :=
  0
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
noncomputable def FunctionInfimumOnSet (f : ℝ → ℝ) (A : Set ℝ) : ℝ :=
  0

/--
`PointwiseSupremumFamily` TODO

Predicate logic:

  noncomputable def PointwiseSupremumFamily {I : Type*} (f : I → ℝ → ℝ) (x : ℝ) : ℝ :=
  0

Predicate logic (unfolded):

  noncomputable def PointwiseSupremumFamily {I : Type*} (f : I → ℝ → ℝ) (x : ℝ) : ℝ :=
  0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def PointwiseSupremumFamily {I : Type*} (f : I → ℝ → ℝ) (x : ℝ) : ℝ :=
  0
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
noncomputable def PointwiseSupremumFamily {I : Type*} (f : I → ℝ → ℝ) (x : ℝ) : ℝ :=
  0

/--
`PointwiseInfimumFamily` TODO

Predicate logic:

  noncomputable def PointwiseInfimumFamily {I : Type*} (f : I → ℝ → ℝ) (x : ℝ) : ℝ :=
  0

Predicate logic (unfolded):

  noncomputable def PointwiseInfimumFamily {I : Type*} (f : I → ℝ → ℝ) (x : ℝ) : ℝ :=
  0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def PointwiseInfimumFamily {I : Type*} (f : I → ℝ → ℝ) (x : ℝ) : ℝ :=
  0
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
noncomputable def PointwiseInfimumFamily {I : Type*} (f : I → ℝ → ℝ) (x : ℝ) : ℝ :=
  0

/--
`FunctionSupremumExistence` TODO

Predicate logic:

  (∀ hA ∈ A.Nonempty), (ℝ → ℝ ∧ ∃ M, ∀ x ∈ A, f x ≤ M) → ∃ s ∈ ℝ, IsLUB (f '' A) s

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), (Exists fun x => Set.instMembership.1 A x ∧ Exists fun M => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) M) → Exists fun s => (Set.instMembership.1 (fun x => ∀ ⦃a : Real⦄, Set.instMembership.1 (Set.image f A) a → Real.instLE.1 a x) s ∧ Set.instMembership.1 (fun x => ∀ ⦃a : Real⦄, Set.instMembership.1 (upperBounds (Set.image f A)) a → Real.instLE.1 x a) s)

Logical form (Lean):

```lean
theorem FunctionSupremumExistence (f : ℝ → ℝ) (A : Set ℝ) (hA : A.Nonempty)
    (hbdd : ∃ M, ∀ x ∈ A, f x ≤ M) :
    ∃ s : ℝ, IsLUB (f '' A) s
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
theorem FunctionSupremumExistence (f : ℝ → ℝ) (A : Set ℝ) (hA : A.Nonempty)
    (hbdd : ∃ M, ∀ x ∈ A, f x ≤ M) :
    ∃ s : ℝ, IsLUB (f '' A) s := by
  sorry

/--
`FunctionInfimumExistence` TODO

Predicate logic:

  (∀ hA ∈ A.Nonempty), (ℝ → ℝ ∧ ∃ m, ∀ x ∈ A, m ≤ f x) → ∃ s ∈ ℝ, IsGLB (f '' A) s

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), (Exists fun x => Set.instMembership.1 A x ∧ Exists fun m => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 m (f x)) → Exists fun s => (Set.instMembership.1 (fun x => ∀ ⦃a : Real⦄, Set.instMembership.1 (Set.image f A) a → Real.instLE.1 x a) s ∧ Set.instMembership.1 (fun x => ∀ ⦃a : Real⦄, Set.instMembership.1 (lowerBounds (Set.image f A)) a → Real.instLE.1 a x) s)

Logical form (Lean):

```lean
theorem FunctionInfimumExistence (f : ℝ → ℝ) (A : Set ℝ) (hA : A.Nonempty)
    (hbdd : ∃ m, ∀ x ∈ A, m ≤ f x) :
    ∃ s : ℝ, IsGLB (f '' A) s
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
theorem FunctionInfimumExistence (f : ℝ → ℝ) (A : Set ℝ) (hA : A.Nonempty)
    (hbdd : ∃ m, ∀ x ∈ A, m ≤ f x) :
    ∃ s : ℝ, IsGLB (f '' A) s := by
  sorry

/--
`SupremumMonotoneUnderPointwiseOrder` TODO

Predicate logic:

  (∀ hA ∈ A.Nonempty), (∃ M, ∀ x ∈ A, f x ≤ M ∧ ∃ M, ∀ x ∈ A, g x ≤ M ∧ ∀ x ∈ A, f x ≤ g x) → FunctionSupremumOnSet f A ≤ FunctionSupremumOnSet g A

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop), (Exists fun x => Set.instMembership.1 A x ∧ (Exists fun M => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) M ∧ (Exists fun M => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (g x) M ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) (g x)))) → Real.instLE.1 Zero.toOfNat0.1 Zero.toOfNat0.1

Logical form (Lean):

```lean
theorem SupremumMonotoneUnderPointwiseOrder (f g : ℝ → ℝ) (A : Set ℝ)
    (hA : A.Nonempty)
    (hbddf : ∃ M, ∀ x ∈ A, f x ≤ M) (hbddg : ∃ M, ∀ x ∈ A, g x ≤ M)
    (h : ∀ x ∈ A, f x ≤ g x) :
    FunctionSupremumOnSet f A ≤ FunctionSupremumOnSet g A
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
theorem SupremumMonotoneUnderPointwiseOrder (f g : ℝ → ℝ) (A : Set ℝ)
    (hA : A.Nonempty)
    (hbddf : ∃ M, ∀ x ∈ A, f x ≤ M) (hbddg : ∃ M, ∀ x ∈ A, g x ≤ M)
    (h : ∀ x ∈ A, f x ≤ g x) :
    FunctionSupremumOnSet f A ≤ FunctionSupremumOnSet g A := by
  sorry

/--
`InfimumMonotoneUnderPointwiseOrder` TODO

Predicate logic:

  (∀ hA ∈ A.Nonempty), (∃ m, ∀ x ∈ A, m ≤ f x ∧ ∃ m, ∀ x ∈ A, m ≤ g x ∧ ∀ x ∈ A, f x ≤ g x) → FunctionInfimumOnSet f A ≤ FunctionInfimumOnSet g A

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop), (Exists fun x => Set.instMembership.1 A x ∧ (Exists fun m => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 m (f x) ∧ (Exists fun m => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 m (g x) ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) (g x)))) → Real.instLE.1 Zero.toOfNat0.1 Zero.toOfNat0.1

Logical form (Lean):

```lean
theorem InfimumMonotoneUnderPointwiseOrder (f g : ℝ → ℝ) (A : Set ℝ)
    (hA : A.Nonempty)
    (hbddf : ∃ m, ∀ x ∈ A, m ≤ f x) (hbddg : ∃ m, ∀ x ∈ A, m ≤ g x)
    (h : ∀ x ∈ A, f x ≤ g x) :
    FunctionInfimumOnSet f A ≤ FunctionInfimumOnSet g A
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
theorem InfimumMonotoneUnderPointwiseOrder (f g : ℝ → ℝ) (A : Set ℝ)
    (hA : A.Nonempty)
    (hbddf : ∃ m, ∀ x ∈ A, m ≤ f x) (hbddg : ∃ m, ∀ x ∈ A, m ≤ g x)
    (h : ∀ x ∈ A, f x ≤ g x) :
    FunctionInfimumOnSet f A ≤ FunctionInfimumOnSet g A := by
  sorry

/--
`SupremumMonotonicityConverseFails` TODO

Predicate logic:

  ∃ A ∈ Set ℝ f g ∈ ℝ → ℝ, A.Nonempty ∧ (∃ M, ∀ x ∈ A, f x ≤ M) ∧ (∃ M, ∀ x ∈ A, g x ≤ M) ∧ FunctionSupremumOnSet f A ≤ FunctionSupremumOnSet g A ∧ ¬ (∀ x ∈ A, f x ≤ g x)

Predicate logic (unfolded):

  Exists fun A => Exists fun f => Exists fun g => (Exists fun x => Set.instMembership.1 A x ∧ (Exists fun M => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) M ∧ (Exists fun M => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (g x) M ∧ (Real.instLE.1 Zero.toOfNat0.1 Zero.toOfNat0.1 ∧ (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) (g x)) → False))))

Logical form (Lean):

```lean
theorem SupremumMonotonicityConverseFails :
    ∃ (A : Set ℝ) (f g : ℝ → ℝ), A.Nonempty ∧
      (∃ M, ∀ x ∈ A, f x ≤ M) ∧ (∃ M, ∀ x ∈ A, g x ≤ M) ∧
      FunctionSupremumOnSet f A ≤ FunctionSupremumOnSet g A ∧
      ¬ (∀ x ∈ A, f x ≤ g x)
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
theorem SupremumMonotonicityConverseFails :
    ∃ (A : Set ℝ) (f g : ℝ → ℝ), A.Nonempty ∧
      (∃ M, ∀ x ∈ A, f x ≤ M) ∧ (∃ M, ∀ x ∈ A, g x ≤ M) ∧
      FunctionSupremumOnSet f A ≤ FunctionSupremumOnSet g A ∧
      ¬ (∀ x ∈ A, f x ≤ g x) := by
  sorry

/--
`PointwiseSupremumEvaluation` TODO

Predicate logic:

  (I → ℝ → ℝ) → ∃ α ∈ I, PointwiseSupremumFamily f x = f α x ∧ ∀ β : I, f β x ≤ f α x

Predicate logic (unfolded):

  ∀ {I : Type u_1} [Fintype I] [Inhabited I] (f : I → Real → Real) (x : Real), Exists fun α => (LRA.Analysis.Functions.PointwiseSupremumFamily f x = f α x ∧ ∀ (β : I), Real.instLE.le (f β x) (f α x)) (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
theorem PointwiseSupremumEvaluation {I : Type*} [Fintype I] [Inhabited I]
    (f : I → ℝ → ℝ) (x : ℝ) :
    ∃ α : I, PointwiseSupremumFamily f x = f α x ∧ ∀ β : I, f β x ≤ f α x
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
theorem PointwiseSupremumEvaluation {I : Type*} [Fintype I] [Inhabited I]
    (f : I → ℝ → ℝ) (x : ℝ) :
    ∃ α : I, PointwiseSupremumFamily f x = f α x ∧ ∀ β : I, f β x ≤ f α x := by
  sorry

/--
`PointwiseInfimumEvaluation` TODO

Predicate logic:

  (I → ℝ → ℝ) → ∃ α ∈ I, PointwiseInfimumFamily f x = f α x ∧ ∀ β : I, f α x ≤ f β x

Predicate logic (unfolded):

  ∀ {I : Type u_1} [Fintype I] [Inhabited I] (f : I → Real → Real) (x : Real), Exists fun α => (LRA.Analysis.Functions.PointwiseInfimumFamily f x = f α x ∧ ∀ (β : I), Real.instLE.le (f α x) (f β x)) (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
theorem PointwiseInfimumEvaluation {I : Type*} [Fintype I] [Inhabited I]
    (f : I → ℝ → ℝ) (x : ℝ) :
    ∃ α : I, PointwiseInfimumFamily f x = f α x ∧ ∀ β : I, f α x ≤ f β x
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
theorem PointwiseInfimumEvaluation {I : Type*} [Fintype I] [Inhabited I]
    (f : I → ℝ → ℝ) (x : ℝ) :
    ∃ α : I, PointwiseInfimumFamily f x = f α x ∧ ∀ β : I, f α x ≤ f β x := by
  sorry

/--
`SupremumSubadditivity` TODO

Predicate logic:

  (∀ hA ∈ A.Nonempty), (∃ M, ∀ x ∈ A, f x ≤ M ∧ ∃ M, ∀ x ∈ A, g x ≤ M) → FunctionSupremumOnSet (fun x => f x + g x) A ≤ FunctionSupremumOnSet f A + FunctionSupremumOnSet g A

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop), (Exists fun x => Set.instMembership.1 A x ∧ (Exists fun M => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) M ∧ Exists fun M => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (g x) M)) → Real.instLE.1 Zero.toOfNat0.1 (instHAdd.1 Zero.toOfNat0.1 Zero.toOfNat0.1)

Logical form (Lean):

```lean
theorem SupremumSubadditivity (f g : ℝ → ℝ) (A : Set ℝ) (hA : A.Nonempty)
    (hbddf : ∃ M, ∀ x ∈ A, f x ≤ M) (hbddg : ∃ M, ∀ x ∈ A, g x ≤ M) :
    FunctionSupremumOnSet (fun x => f x + g x) A ≤
      FunctionSupremumOnSet f A + FunctionSupremumOnSet g A
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
theorem SupremumSubadditivity (f g : ℝ → ℝ) (A : Set ℝ) (hA : A.Nonempty)
    (hbddf : ∃ M, ∀ x ∈ A, f x ≤ M) (hbddg : ∃ M, ∀ x ∈ A, g x ≤ M) :
    FunctionSupremumOnSet (fun x => f x + g x) A ≤
      FunctionSupremumOnSet f A + FunctionSupremumOnSet g A := by
  sorry

/--
`InfimumSuperadditivity` TODO

Predicate logic:

  (∀ hA ∈ A.Nonempty), (∃ m, ∀ x ∈ A, m ≤ f x ∧ ∃ m, ∀ x ∈ A, m ≤ g x) → FunctionInfimumOnSet f A + FunctionInfimumOnSet g A ≤ FunctionInfimumOnSet (fun x => f x + g x) A

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop), (Exists fun x => Set.instMembership.1 A x ∧ (Exists fun m => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 m (f x) ∧ Exists fun m => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 m (g x))) → Real.instLE.1 (instHAdd.1 Zero.toOfNat0.1 Zero.toOfNat0.1) Zero.toOfNat0.1

Logical form (Lean):

```lean
theorem InfimumSuperadditivity (f g : ℝ → ℝ) (A : Set ℝ) (hA : A.Nonempty)
    (hbddf : ∃ m, ∀ x ∈ A, m ≤ f x) (hbddg : ∃ m, ∀ x ∈ A, m ≤ g x) :
    FunctionInfimumOnSet f A + FunctionInfimumOnSet g A ≤
      FunctionInfimumOnSet (fun x => f x + g x) A
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
theorem InfimumSuperadditivity (f g : ℝ → ℝ) (A : Set ℝ) (hA : A.Nonempty)
    (hbddf : ∃ m, ∀ x ∈ A, m ≤ f x) (hbddg : ∃ m, ∀ x ∈ A, m ≤ g x) :
    FunctionInfimumOnSet f A + FunctionInfimumOnSet g A ≤
      FunctionInfimumOnSet (fun x => f x + g x) A := by
  sorry

/--
`SupremumNegation` TODO

Predicate logic:

  (∀ hA ∈ A.Nonempty), (ℝ → ℝ ∧ ∃ M, ∀ x ∈ A, f x ≤ M) → FunctionSupremumOnSet (fun x => -f x) A = - FunctionInfimumOnSet f A

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), (Exists fun x => Set.instMembership.1 A x ∧ Exists fun M => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) M) → Zero.toOfNat0.1 = Real.instNeg.1 Zero.toOfNat0.1

Logical form (Lean):

```lean
theorem SupremumNegation (f : ℝ → ℝ) (A : Set ℝ) (hA : A.Nonempty)
    (hbdd : ∃ M, ∀ x ∈ A, f x ≤ M) :
    FunctionSupremumOnSet (fun x => -f x) A = - FunctionInfimumOnSet f A
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
theorem SupremumNegation (f : ℝ → ℝ) (A : Set ℝ) (hA : A.Nonempty)
    (hbdd : ∃ M, ∀ x ∈ A, f x ≤ M) :
    FunctionSupremumOnSet (fun x => -f x) A = - FunctionInfimumOnSet f A := by
  sorry

/--
`InfimumNegation` TODO

Predicate logic:

  (∀ hA ∈ A.Nonempty), (ℝ → ℝ ∧ ∃ m, ∀ x ∈ A, m ≤ f x) → FunctionInfimumOnSet (fun x => -f x) A = - FunctionSupremumOnSet f A

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), (Exists fun x => Set.instMembership.1 A x ∧ Exists fun m => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 m (f x)) → Zero.toOfNat0.1 = Real.instNeg.1 Zero.toOfNat0.1

Logical form (Lean):

```lean
theorem InfimumNegation (f : ℝ → ℝ) (A : Set ℝ) (hA : A.Nonempty)
    (hbdd : ∃ m, ∀ x ∈ A, m ≤ f x) :
    FunctionInfimumOnSet (fun x => -f x) A = - FunctionSupremumOnSet f A
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
theorem InfimumNegation (f : ℝ → ℝ) (A : Set ℝ) (hA : A.Nonempty)
    (hbdd : ∃ m, ∀ x ∈ A, m ≤ f x) :
    FunctionInfimumOnSet (fun x => -f x) A = - FunctionSupremumOnSet f A := by
  sorry

/--
`SupremumScalarMultiple` TODO

Predicate logic:

  (∀ hA ∈ A.Nonempty), (ℝ → ℝ ∧ ∃ M, ∀ x ∈ A, f x ≤ M) → (0 ≤ lam → FunctionSupremumOnSet (fun x => lam * f x) A = lam * FunctionSupremumOnSet f A) ∧ (lam ≤ 0 → FunctionSupremumOnSet (fun x => lam * f x) A = lam * FunctionInfimumOnSet f A)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (lam : Real), (Exists fun x => Set.instMembership.1 A x ∧ Exists fun M => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) M) → (Real.instLE.1 Zero.toOfNat0.1 lam → Zero.toOfNat0.1 = instHMul.1 lam Zero.toOfNat0.1 ∧ Real.instLE.1 lam Zero.toOfNat0.1 → Zero.toOfNat0.1 = instHMul.1 lam Zero.toOfNat0.1)

Logical form (Lean):

```lean
theorem SupremumScalarMultiple (f : ℝ → ℝ) (A : Set ℝ) (lam : ℝ) (hA : A.Nonempty)
    (hbdd : ∃ M, ∀ x ∈ A, f x ≤ M) :
    (0 ≤ lam → FunctionSupremumOnSet (fun x => lam * f x) A
      = lam * FunctionSupremumOnSet f A) ∧
    (lam ≤ 0 → FunctionSupremumOnSet (fun x => lam * f x) A
      = lam * FunctionInfimumOnSet f A)
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
theorem SupremumScalarMultiple (f : ℝ → ℝ) (A : Set ℝ) (lam : ℝ) (hA : A.Nonempty)
    (hbdd : ∃ M, ∀ x ∈ A, f x ≤ M) :
    (0 ≤ lam → FunctionSupremumOnSet (fun x => lam * f x) A
      = lam * FunctionSupremumOnSet f A) ∧
    (lam ≤ 0 → FunctionSupremumOnSet (fun x => lam * f x) A
      = lam * FunctionInfimumOnSet f A) := by
  sorry

/--
`InfimumScalarMultiple` TODO

Predicate logic:

  (∀ hA ∈ A.Nonempty), (ℝ → ℝ ∧ ∃ m, ∀ x ∈ A, m ≤ f x) → (0 ≤ lam → FunctionInfimumOnSet (fun x => lam * f x) A = lam * FunctionInfimumOnSet f A) ∧ (lam ≤ 0 → FunctionInfimumOnSet (fun x => lam * f x) A = lam * FunctionSupremumOnSet f A)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (lam : Real), (Exists fun x => Set.instMembership.1 A x ∧ Exists fun m => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 m (f x)) → (Real.instLE.1 Zero.toOfNat0.1 lam → Zero.toOfNat0.1 = instHMul.1 lam Zero.toOfNat0.1 ∧ Real.instLE.1 lam Zero.toOfNat0.1 → Zero.toOfNat0.1 = instHMul.1 lam Zero.toOfNat0.1)

Logical form (Lean):

```lean
theorem InfimumScalarMultiple (f : ℝ → ℝ) (A : Set ℝ) (lam : ℝ) (hA : A.Nonempty)
    (hbdd : ∃ m, ∀ x ∈ A, m ≤ f x) :
    (0 ≤ lam → FunctionInfimumOnSet (fun x => lam * f x) A
      = lam * FunctionInfimumOnSet f A) ∧
    (lam ≤ 0 → FunctionInfimumOnSet (fun x => lam * f x) A
      = lam * FunctionSupremumOnSet f A)
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
theorem InfimumScalarMultiple (f : ℝ → ℝ) (A : Set ℝ) (lam : ℝ) (hA : A.Nonempty)
    (hbdd : ∃ m, ∀ x ∈ A, m ≤ f x) :
    (0 ≤ lam → FunctionInfimumOnSet (fun x => lam * f x) A
      = lam * FunctionInfimumOnSet f A) ∧
    (lam ≤ 0 → FunctionInfimumOnSet (fun x => lam * f x) A
      = lam * FunctionSupremumOnSet f A) := by
  sorry

/--
`FiniteFamilyPointwiseSupremumIsMaximum` TODO

Predicate logic:

  (I → ℝ → ℝ) → ∃ α ∈ I, PointwiseSupremumFamily f x = f α x

Predicate logic (unfolded):

  ∀ {I : Type u_1} [Fintype I] [Inhabited I] (f : I → Real → Real) (x : Real), Exists fun α => LRA.Analysis.Functions.PointwiseSupremumFamily f x = f α x (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
theorem FiniteFamilyPointwiseSupremumIsMaximum {I : Type*} [Fintype I] [Inhabited I]
    (f : I → ℝ → ℝ) (x : ℝ) :
    ∃ α : I, PointwiseSupremumFamily f x = f α x
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
theorem FiniteFamilyPointwiseSupremumIsMaximum {I : Type*} [Fintype I] [Inhabited I]
    (f : I → ℝ → ℝ) (x : ℝ) :
    ∃ α : I, PointwiseSupremumFamily f x = f α x := by
  sorry

/--
`FiniteFamilyPointwiseInfimumIsMinimum` TODO

Predicate logic:

  (I → ℝ → ℝ) → ∃ α ∈ I, PointwiseInfimumFamily f x = f α x

Predicate logic (unfolded):

  ∀ {I : Type u_1} [Fintype I] [Inhabited I] (f : I → Real → Real) (x : Real), Exists fun α => LRA.Analysis.Functions.PointwiseInfimumFamily f x = f α x (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
theorem FiniteFamilyPointwiseInfimumIsMinimum {I : Type*} [Fintype I] [Inhabited I]
    (f : I → ℝ → ℝ) (x : ℝ) :
    ∃ α : I, PointwiseInfimumFamily f x = f α x
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
theorem FiniteFamilyPointwiseInfimumIsMinimum {I : Type*} [Fintype I] [Inhabited I]
    (f : I → ℝ → ℝ) (x : ℝ) :
    ∃ α : I, PointwiseInfimumFamily f x = f α x := by
  sorry

end LRA.Analysis.Functions
