
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.Real.Sqrt
import LRA.Analysis.Continuity.GlobalTheorems

namespace LRA.Analysis.Continuity

/--
`IsUniformlyContinuous` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt (abs (instHSub.hSub x y)) δ → Real.instLT.lt (abs (instHSub.hSub (f x) (f y))) ε))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f y))) ε))

Logical form (Lean):

```lean
def IsUniformlyContinuous (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, ∀ y ∈ A, |x - y| < δ → |f x - f y| < ε
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
def IsUniformlyContinuous (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, ∀ y ∈ A, |x - y| < δ → |f x - f y| < ε

/--
`UcAdd` TODO

Predicate logic:

  ∀ (f g : Real → Real) (A : Set Real), (LRA.Analysis.Continuity.IsUniformlyContinuous f A ∧ LRA.Analysis.Continuity.IsUniformlyContinuous g A) → LRA.Analysis.Continuity.IsUniformlyContinuous (fun x => instHAdd.hAdd (f x) (g x)) A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f y))) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g x) (g y))) ε)))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x)) x) ((fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x)) y))) ε))

Logical form (Lean):

```lean
theorem UcAdd (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hg : IsUniformlyContinuous g A) :
    IsUniformlyContinuous (fun x => f x + g x) A
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
theorem UcAdd (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hg : IsUniformlyContinuous g A) :
    IsUniformlyContinuous (fun x => f x + g x) A := by
  sorry
/--
`UcMulOfBounded` TODO

Predicate logic:

  ∀ (f g : Real → Real) (A : Set Real), (LRA.Analysis.Continuity.IsUniformlyContinuous f A ∧ (LRA.Analysis.Continuity.IsUniformlyContinuous g A ∧ (LRA.Analysis.Continuity.BoundedOnSet f A ∧ LRA.Analysis.Continuity.BoundedOnSet g A))) → LRA.Analysis.Continuity.IsUniformlyContinuous (fun x => instHMul.hMul (f x) (g x)) A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    hfB : BoundedOnSet f A
    hgB : BoundedOnSet g A
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f y))) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g x) (g y))) ε))) ∧ ((Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) M))) ∧ (Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (g x)) M)))))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul (f x) (g x)) x) ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul (f x) (g x)) y))) ε))

Logical form (Lean):

```lean
theorem UcMulOfBounded (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hg : IsUniformlyContinuous g A)
    (hfB : BoundedOnSet f A) (hgB : BoundedOnSet g A) :
    IsUniformlyContinuous (fun x => f x * g x) A
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
theorem UcMulOfBounded (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hg : IsUniformlyContinuous g A)
    (hfB : BoundedOnSet f A) (hgB : BoundedOnSet g A) :
    IsUniformlyContinuous (fun x => f x * g x) A := by
  sorry
/--
`UcComp` TODO

Predicate logic:

  ∀ (f g : Real → Real) (A B : Set Real), (LRA.Analysis.Continuity.IsUniformlyContinuous f A ∧ ((∀ (x : Real), x ∈ A → f x ∈ B) ∧ LRA.Analysis.Continuity.IsUniformlyContinuous g B)) → LRA.Analysis.Continuity.IsUniformlyContinuous (fun x => g (f x)) A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A B : Set ℝ
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f y))) ε))) ∧ ((∀ (x : Real), x ∈ A → f x ∈ B) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ B → ∀ (y : Real), y ∈ B → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g x) (g y))) ε))))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => g (f x)) x) ((fun x => g (f x)) y))) ε))

Logical form (Lean):

```lean
theorem UcComp (f g : ℝ → ℝ) (A B : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hfA : ∀ x ∈ A, f x ∈ B)
    (hg : IsUniformlyContinuous g B) :
    IsUniformlyContinuous (fun x => g (f x)) A
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
theorem UcComp (f g : ℝ → ℝ) (A B : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hfA : ∀ x ∈ A, f x ∈ B)
    (hg : IsUniformlyContinuous g B) :
    IsUniformlyContinuous (fun x => g (f x)) A := by
  sorry
/--
`UcIffSequential` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real), LRA.Analysis.Continuity.IsUniformlyContinuous f A ↔ ∀ (xs ys : Nat → Real), (∀ (n : Nat), xs n ∈ A) → (∀ (n : Nat), ys n ∈ A) → (∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (xs n) (ys n))) ε) → ∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (f (xs n)) (f (ys n)))) ε

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
  Prove
    LRA.Analysis.Continuity.IsUniformlyContinuous f A ↔ ∀ (xs ys : Nat → Real), (∀ (n : Nat), xs n ∈ A) → (∀ (n : Nat), ys n ∈ A) → (∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (xs n) (ys n))) ε) → ∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (f (xs n)) (f (ys n)))) ε

Logical form (Lean):

```lean
theorem UcIffSequential (f : ℝ → ℝ) (A : Set ℝ) :
    IsUniformlyContinuous f A ↔
      ∀ xs ys : ℕ → ℝ, (∀ n, xs n ∈ A) → (∀ n, ys n ∈ A) →
        (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - ys n| < ε) →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - f (ys n)| < ε
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

-/
theorem UcIffSequential (f : ℝ → ℝ) (A : Set ℝ) :
    IsUniformlyContinuous f A ↔
      ∀ xs ys : ℕ → ℝ, (∀ n, xs n ∈ A) → (∀ n, ys n ∈ A) →
        (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - ys n| < ε) →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - f (ys n)| < ε := by
  sorry
/--
`UcMapsCauchyToCauchy` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real), LRA.Analysis.Continuity.IsUniformlyContinuous f A → ∀ (xs : Nat → Real), ((∀ (n : Nat), xs n ∈ A) ∧ (∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (m : Nat), GE.ge m N → ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (xs m) (xs n))) ε)) → ∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (m : Nat), GE.ge m N → ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (f (xs m)) (f (xs n)))) ε

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    xs : ℕ → ℝ
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f y))) ε))) → ∀ (xs : Nat → Real), ((∀ (n : Nat), xs n ∈ A) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (xs m) (xs n))) ε)) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f (xs m)) (f (xs n)))) ε

Logical form (Lean):

```lean
theorem UcMapsCauchyToCauchy (f : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (xs : ℕ → ℝ) (hxs : ∀ n, xs n ∈ A)
    (hCauchy : ∀ ε > 0, ∃ N : ℕ, ∀ m ≥ N, ∀ n ≥ N, |xs m - xs n| < ε) :
    ∀ ε > 0, ∃ N : ℕ, ∀ m ≥ N, ∀ n ≥ N, |f (xs m) - f (xs n)| < ε
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
theorem UcMapsCauchyToCauchy (f : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (xs : ℕ → ℝ) (hxs : ∀ n, xs n ∈ A)
    (hCauchy : ∀ ε > 0, ∃ N : ℕ, ∀ m ≥ N, ∀ n ≥ N, |xs m - xs n| < ε) :
    ∀ ε > 0, ∃ N : ℕ, ∀ m ≥ N, ∀ n ≥ N, |f (xs m) - f (xs n)| < ε := by
  sorry
/--
`IsLipschitzOn` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (K : Real), (GE.ge K 0 ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le (abs (instHSub.hSub (f x) (f y))) (instHMul.hMul K (abs (instHSub.hSub x y)))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Real.instLE.le 0 K ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f y))) ({ hMul := fun a b => Real.instMul.mul a b }.hMul K (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)))))

Logical form (Lean):

```lean
def IsLipschitzOn (f : ℝ → ℝ) (A : Set ℝ) (K : ℝ) : Prop :=
  K ≥ 0 ∧ ∀ x ∈ A, ∀ y ∈ A, |f x - f y| ≤ K * |x - y|
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
def IsLipschitzOn (f : ℝ → ℝ) (A : Set ℝ) (K : ℝ) : Prop :=
  K ≥ 0 ∧ ∀ x ∈ A, ∀ y ∈ A, |f x - f y| ≤ K * |x - y|

/--
`LipschitzImpliesUc` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (K : Real), LRA.Analysis.Continuity.IsLipschitzOn f A K → LRA.Analysis.Continuity.IsUniformlyContinuous f A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    K : ℝ
  Prove
    (Real.instLE.le 0 K ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f y))) ({ hMul := fun a b => Real.instMul.mul a b }.hMul K (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y))))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f y))) ε))

Logical form (Lean):

```lean
theorem LipschitzImpliesUc (f : ℝ → ℝ) (A : Set ℝ) (K : ℝ)
    (hf : IsLipschitzOn f A K) : IsUniformlyContinuous f A
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
theorem LipschitzImpliesUc (f : ℝ → ℝ) (A : Set ℝ) (K : ℝ)
    (hf : IsLipschitzOn f A K) : IsUniformlyContinuous f A := by
  sorry
/--
`IsBiLipschitzOn` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (α K : Real), (Real.instLT.lt 0 α ∧ (Real.instLE.le α K ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → (Real.instLE.le (instHMul.hMul α (abs (instHSub.hSub x y))) (abs (instHSub.hSub (f x) (f y))) ∧ Real.instLE.le (abs (instHSub.hSub (f x) (f y))) (instHMul.hMul K (abs (instHSub.hSub x y)))))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Real.instLT.lt 0 α ∧ (Real.instLE.le α K ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → (Real.instLE.le ({ hMul := fun a b => Real.instMul.mul a b }.hMul α (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y))) (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f y))) ∧ Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f y))) ({ hMul := fun a b => Real.instMul.mul a b }.hMul K (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)))))))

Logical form (Lean):

```lean
def IsBiLipschitzOn (f : ℝ → ℝ) (A : Set ℝ) (α K : ℝ) : Prop :=
  0 < α ∧ α ≤ K ∧ ∀ x ∈ A, ∀ y ∈ A,
    α * |x - y| ≤ |f x - f y| ∧ |f x - f y| ≤ K * |x - y|
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
def IsBiLipschitzOn (f : ℝ → ℝ) (A : Set ℝ) (α K : ℝ) : Prop :=
  0 < α ∧ α ≤ K ∧ ∀ x ∈ A, ∀ y ∈ A,
    α * |x - y| ≤ |f x - f y| ∧ |f x - f y| ≤ K * |x - y|

/--
`BiLipschitzInverseIsLipschitz` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (α K : Real), LRA.Analysis.Continuity.IsBiLipschitzOn f A α K → ∀ (finv : Real → Real), (∀ (x : Real), x ∈ A → finv (f x) = x) → LRA.Analysis.Continuity.IsLipschitzOn finv (Set.image f A) (instHDiv.hDiv 1 α)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    α K : ℝ
    finv : ℝ → ℝ
  Prove
    (Real.instLT.lt 0 α ∧ (Real.instLE.le α K ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → (Real.instLE.le ({ hMul := fun a b => Real.instMul.mul a b }.hMul α (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y))) (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f y))) ∧ Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f y))) ({ hMul := fun a b => Real.instMul.mul a b }.hMul K (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y))))))) → ∀ (finv : Real → Real), (∀ (x : Real), x ∈ A → finv (f x) = x) → (Real.instLE.le 0 ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 α) ∧ (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ f a = x) → ∀ (y : Real), y ∈ fun x => Exists fun a => (a ∈ A ∧ f a = x) → Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (finv x) (finv y))) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 α) (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)))))

Logical form (Lean):

```lean
theorem BiLipschitzInverseIsLipschitz (f : ℝ → ℝ) (A : Set ℝ) (α K : ℝ)
    (hf : IsBiLipschitzOn f A α K) (finv : ℝ → ℝ)
    (hfinv : ∀ x ∈ A, finv (f x) = x) :
    IsLipschitzOn finv (f '' A) (1 / α)
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
theorem BiLipschitzInverseIsLipschitz (f : ℝ → ℝ) (A : Set ℝ) (α K : ℝ)
    (hf : IsBiLipschitzOn f A α K) (finv : ℝ → ℝ)
    (hfinv : ∀ x ∈ A, finv (f x) = x) :
    IsLipschitzOn finv (f '' A) (1 / α) := by
  sorry
/--
`SqrtUcNotLipschitz` TODO

Predicate logic:

  (LRA.Analysis.Continuity.IsUniformlyContinuous Real.sqrt (Set.Icc 0 1) ∧ ¬ Exists fun K => LRA.Analysis.Continuity.IsLipschitzOn Real.sqrt (Set.Icc 0 1) K)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le 0 x ∧ Real.instPreorder.1.le x 1) → ∀ (y : Real), y ∈ fun x => (Real.instPreorder.1.le 0 x ∧ Real.instPreorder.1.le x 1) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x.sqrt y.sqrt)) ε))) ∧ ((Exists fun K => (Real.instLE.le 0 K ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le 0 x ∧ Real.instPreorder.1.le x 1) → ∀ (y : Real), y ∈ fun x => (Real.instPreorder.1.le 0 x ∧ Real.instPreorder.1.le x 1) → Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x.sqrt y.sqrt)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul K (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)))))) → False))

Logical form (Lean):

```lean
theorem SqrtUcNotLipschitz :
    IsUniformlyContinuous Real.sqrt (Set.Icc (0:ℝ) 1) ∧
    ¬ ∃ K, IsLipschitzOn Real.sqrt (Set.Icc (0:ℝ) 1) K
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
theorem SqrtUcNotLipschitz :
    IsUniformlyContinuous Real.sqrt (Set.Icc (0:ℝ) 1) ∧
    ¬ ∃ K, IsLipschitzOn Real.sqrt (Set.Icc (0:ℝ) 1) K := by
  sorry
end LRA.Analysis.Continuity
