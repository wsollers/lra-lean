
import Mathlib.Data.Real.Basic
import Mathlib.Algebra.BigOperators.Ring.Finset
import LRA.Analysis.Differentiation.DerivativeDefinition

namespace LRA.Analysis.Differentiation

/--
`CaratheodoryCharacterization` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c D : Real), LRA.Analysis.Differentiation.Derivative D f A c ↔ Exists fun φ => (φ c = D ∧ (LRA.Analysis.Continuity.ContinuousAtPoint φ A c ∧ (∀ (x : Real), x ∈ A → instHSub.hSub (f x) (f c) = instHMul.hMul (instHSub.hSub x c) (φ x))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c D : ℝ
  Prove
    LRA.Analysis.Differentiation.Derivative D f A c ↔ Exists fun φ => (φ c = D ∧ (LRA.Analysis.Continuity.ContinuousAtPoint φ A c ∧ (∀ (x : Real), x ∈ A → instHSub.hSub (f x) (f c) = instHMul.hMul (instHSub.hSub x c) (φ x))))

Logical form (Lean):

```lean
theorem CaratheodoryCharacterization (f : ℝ → ℝ) (A : Set ℝ) (c D : ℝ) :
    Derivative D f A c ↔
      ∃ φ : ℝ → ℝ, φ c = D ∧
        LRA.Analysis.Continuity.ContinuousAtPoint φ A c ∧
        ∀ x ∈ A, f x - f c = (x - c) * φ x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
theorem CaratheodoryCharacterization (f : ℝ → ℝ) (A : Set ℝ) (c D : ℝ) :
    Derivative D f A c ↔
      ∃ φ : ℝ → ℝ, φ c = D ∧
        LRA.Analysis.Continuity.ContinuousAtPoint φ A c ∧
        ∀ x ∈ A, f x - f c = (x - c) * φ x := by
  sorry
/--
`ChainRule` TODO

Predicate logic:

  ∀ (f g : Real → Real) (A B : Set Real) (c Df Dg : Real), (LRA.Analysis.Differentiation.Derivative Df f A c ∧ ((∀ (x : Real), x ∈ A → f x ∈ B) ∧ LRA.Analysis.Differentiation.Derivative Dg g B (f c))) → LRA.Analysis.Differentiation.Derivative (instHMul.hMul Dg Df) (fun x => g (f x)) A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A B : Set ℝ
    c Df Dg : ℝ
    hf : Derivative Df f A c
    hg : Derivative Dg g B (f c)
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (f c)) h) Df)) ε))) ∧ ((∀ (x : Real), x ∈ A → f x ∈ B) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f c) h ∈ B → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (f c) h)) (g (f c))) h) Dg)) ε))))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => g (f x)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) ((fun x => g (f x)) c)) h) ({ hMul := fun a b => Real.instMul.mul a b }.hMul Dg Df))) ε))

Logical form (Lean):

```lean
theorem ChainRule (f g : ℝ → ℝ) (A B : Set ℝ) (c Df Dg : ℝ)
    (hf : Derivative Df f A c) (hfAB : ∀ x ∈ A, f x ∈ B)
    (hg : Derivative Dg g B (f c)) :
    Derivative (Dg * Df) (fun x => g (f x)) A c
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
theorem ChainRule (f g : ℝ → ℝ) (A B : Set ℝ) (c Df Dg : ℝ)
    (hf : Derivative Df f A c) (hfAB : ∀ x ∈ A, f x ∈ B)
    (hg : Derivative Dg g B (f c)) :
    Derivative (Dg * Df) (fun x => g (f x)) A c := by
  sorry
/--
`NthDerivativeAt` TODO

Predicate logic:

  ∀ (f : Real → Real) (fD : Nat → Real → Real) (A : Set Real) (n : Nat) (c : Real), (fD 0 = f ∧ (∀ (k : Nat), instLTNat.lt k n → LRA.Analysis.Differentiation.Derivative (fD (instHAdd.hAdd k 1) c) (fD k) A c))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (fD 0 = f ∧ (∀ (k : Nat), instLTNat.lt k n → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD k ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (fD k c)) h) (fD ({ hAdd := fun a b => instAddNat.add a b }.hAdd k 1) c))) ε))))

Logical form (Lean):

```lean
def NthDerivativeAt (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (A : Set ℝ) (n : ℕ) (c : ℝ) : Prop :=
  fD 0 = f ∧ ∀ k < n, Derivative (fD (k + 1) c) (fD k) A c
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
def NthDerivativeAt (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (A : Set ℝ) (n : ℕ) (c : ℝ) : Prop :=
  fD 0 = f ∧ ∀ k < n, Derivative (fD (k + 1) c) (fD k) A c

/--
`LeibnizRule` TODO

Predicate logic:

  ∀ (f g : Real → Real) (fD gD hD : Nat → Real → Real) (A : Set Real) (n : Nat) (c : Real), (LRA.Analysis.Differentiation.NthDerivativeAt f fD A n c ∧ (LRA.Analysis.Differentiation.NthDerivativeAt g gD A n c ∧ LRA.Analysis.Differentiation.NthDerivativeAt (fun x => instHMul.hMul (f x) (g x)) hD A n c)) → hD n c = (Finset.range (instHAdd.hAdd n 1)).sum fun k => instHMul.hMul (instHMul.hMul (n.choose k).cast (fD k c)) (gD (instHSub.hSub n k) c)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    fD gD hD : ℕ → ℝ → ℝ
    A : Set ℝ
    n : ℕ
    c : ℝ
    hf : NthDerivativeAt f fD A n c
    hg : NthDerivativeAt g gD A n c
    hh : NthDerivativeAt (fun x => f x * g x) hD A n c
  Prove
    ((fD 0 = f ∧ (∀ (k : Nat), instLTNat.lt k n → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD k ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (fD k c)) h) (fD ({ hAdd := fun a b => instAddNat.add a b }.hAdd k 1) c))) ε)))) ∧ ((gD 0 = g ∧ (∀ (k : Nat), instLTNat.lt k n → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (gD k ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (gD k c)) h) (gD ({ hAdd := fun a b => instAddNat.add a b }.hAdd k 1) c))) ε)))) ∧ (hD 0 = funx => { hMul := fun a b => Real.instMul.mul a b }.hMul (f x) (g x) ∧ (∀ (k : Nat), instLTNat.lt k n → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (hD k ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (hD k c)) h) (hD ({ hAdd := fun a b => instAddNat.add a b }.hAdd k 1) c))) ε)))))) → hD n c = Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.toAddZero.2.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.lift (fun l => Multiset.ofList (List.map (fun k => instHMul.hMul (instHMul.hMul (n.choose k).cast (fD k c)) (gD (instHSub.hSub n k) c)) l)) ⋯ (Finset.range (instHAdd.hAdd n 1)).val)

Logical form (Lean):

```lean
theorem LeibnizRule (f g : ℝ → ℝ) (fD gD hD : ℕ → ℝ → ℝ) (A : Set ℝ) (n : ℕ) (c : ℝ)
    (hf : NthDerivativeAt f fD A n c) (hg : NthDerivativeAt g gD A n c)
    (hh : NthDerivativeAt (fun x => f x * g x) hD A n c) :
    hD n c = ∑ k ∈ Finset.range (n + 1), (n.choose k : ℝ) * fD k c * gD (n - k) c
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
theorem LeibnizRule (f g : ℝ → ℝ) (fD gD hD : ℕ → ℝ → ℝ) (A : Set ℝ) (n : ℕ) (c : ℝ)
    (hf : NthDerivativeAt f fD A n c) (hg : NthDerivativeAt g gD A n c)
    (hh : NthDerivativeAt (fun x => f x * g x) hD A n c) :
    hD n c = ∑ k ∈ Finset.range (n + 1), (n.choose k : ℝ) * fD k c * gD (n - k) c := by
  sorry
/--
`FaaDiBrunoSecondOrder` TODO

Predicate logic:

  ∀ (f g : Real → Real) (fD gD hD : Nat → Real → Real) (A B : Set Real) (c : Real), (LRA.Analysis.Differentiation.NthDerivativeAt f fD A 2 c ∧ ((∀ (x : Real), x ∈ A → f x ∈ B) ∧ (LRA.Analysis.Differentiation.NthDerivativeAt g gD B 2 (f c) ∧ LRA.Analysis.Differentiation.NthDerivativeAt (fun x => g (f x)) hD A 2 c))) → hD 2 c = instHAdd.hAdd (instHMul.hMul (gD 2 (f c)) (instHPow.hPow (fD 1 c) 2)) (instHMul.hMul (gD 1 (f c)) (fD 2 c))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    fD gD hD : ℕ → ℝ → ℝ
    A B : Set ℝ
    c : ℝ
    hf : NthDerivativeAt f fD A 2 c
    hg : NthDerivativeAt g gD B 2 (f c)
    hh : NthDerivativeAt (fun x => g (f x)) hD A 2 c
  Prove
    ((fD 0 = f ∧ (∀ (k : Nat), instLTNat.lt k 2 → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD k ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (fD k c)) h) (fD ({ hAdd := fun a b => instAddNat.add a b }.hAdd k 1) c))) ε)))) ∧ ((∀ (x : Real), x ∈ A → f x ∈ B) ∧ ((gD 0 = g ∧ (∀ (k : Nat), instLTNat.lt k 2 → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f c) h ∈ B → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (gD k ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (f c) h)) (gD k (f c))) h) (gD ({ hAdd := fun a b => instAddNat.add a b }.hAdd k 1) (f c)))) ε)))) ∧ (hD 0 = funx => g (f x) ∧ (∀ (k : Nat), instLTNat.lt k 2 → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (hD k ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (hD k c)) h) (hD ({ hAdd := fun a b => instAddNat.add a b }.hAdd k 1) c))) ε))))))) → hD 2 c = { hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul (gD 2 (f c)) (instHPow.1 (fD 1 c) 2)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul (gD 1 (f c)) (fD 2 c))

Logical form (Lean):

```lean
theorem FaaDiBrunoSecondOrder (f g : ℝ → ℝ) (fD gD hD : ℕ → ℝ → ℝ) (A B : Set ℝ) (c : ℝ)
    (hf : NthDerivativeAt f fD A 2 c) (hfAB : ∀ x ∈ A, f x ∈ B)
    (hg : NthDerivativeAt g gD B 2 (f c))
    (hh : NthDerivativeAt (fun x => g (f x)) hD A 2 c) :
    hD 2 c = gD 2 (f c) * (fD 1 c) ^ 2 + gD 1 (f c) * fD 2 c
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
theorem FaaDiBrunoSecondOrder (f g : ℝ → ℝ) (fD gD hD : ℕ → ℝ → ℝ) (A B : Set ℝ) (c : ℝ)
    (hf : NthDerivativeAt f fD A 2 c) (hfAB : ∀ x ∈ A, f x ∈ B)
    (hg : NthDerivativeAt g gD B 2 (f c))
    (hh : NthDerivativeAt (fun x => g (f x)) hD A 2 c) :
    hD 2 c = gD 2 (f c) * (fD 1 c) ^ 2 + gD 1 (f c) * fD 2 c := by
  sorry
end LRA.Analysis.Differentiation
