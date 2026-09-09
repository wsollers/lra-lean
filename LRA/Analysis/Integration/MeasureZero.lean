
import Mathlib.Data.Real.Basic
import LRA.Analysis.Integration.RiemannIntegral
import LRA.Analysis.Integration.DarbouxIntegral
import LRA.Analysis.Continuity.PointContinuity
import LRA.Analysis.StructureOfRealLine.OpenClosedSets

namespace LRA.Analysis.Integration

/--
`IsMeasureZero` TODO

Predicate logic:

  ∀ (E : Set Real) (ε : Real), GT.gt ε 0 → Exists fun p => Exists fun q => ((∀ (k : Nat), Real.instLT.lt (p k) (q k)) ∧ (Set.instLE.le E (Set.iUnion fun k => Set.Ioo (p k) (q k)) ∧ (Exists fun L => (Real.instLE.le L ε ∧ HasSum (fun k => instHSub.hSub (q k) (p k)) L))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun p => Exists fun q => ((∀ (k : Nat), Real.instLT.lt (p k) (q k)) ∧ (({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le E (Set.instSupSet.1 fun x => Exists fun y => (fun k => setOf fun x => (Real.instPreorder.lt (p k) x ∧ Real.instPreorder.lt x (q k))) y = x)) ∧ (Exists fun L => (Real.instLE.le L ε ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .filter.sets ∈ SummationFilter.unconditional Nat (Set.preimage (fun s => s.sum fun b => (fun k => instHSub.hSub (q k) (p k)) b) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L)))))

Logical form (Lean):

```lean
def IsMeasureZero (E : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ p q : ℕ → ℝ, (∀ k, p k < q k) ∧ E ⊆ ⋃ k, Set.Ioo (p k) (q k) ∧
    ∃ L ≤ ε, HasSum (fun k => q k - p k) L
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
def IsMeasureZero (E : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ p q : ℕ → ℝ, (∀ k, p k < q k) ∧ E ⊆ ⋃ k, Set.Ioo (p k) (q k) ∧
    ∃ L ≤ ε, HasSum (fun k => q k - p k) L

/--
`PointOscillation` TODO

Predicate logic:

  ∀ (f : Real → Real) (a b x ω : Real), (x ∈ Set.Icc a b ∧ LRA.Analysis.Continuity.OscillationAtPoint f (Set.Icc a b) x ω)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b)) ∧ (Real.instLE.le 0 ω ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (Exists fun Ω => ((Real.instLE.le 0 Ω ∧ ((∀ (x_1 : Real), x_1 ∈ fun x_2 => (x_2 ∈ Set.Icc a b ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_2 x)) δ) → ∀ (y : Real), y ∈ fun x_2 => (x_2 ∈ Set.Icc a b ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_2 x)) δ) → Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f y))) Ω) ∧ (∀ (b_1 : Real), Real.instLE.le 0 b_1 → Real.instLT.lt b_1 Ω → Exists fun x_1 => ((x_1 ∈ fun x_2 => (x_2 ∈ Set.Icc a b ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_2 x)) δ)) ∧ (Exists fun y => ((y ∈ fun x_2 => (x_2 ∈ Set.Icc a b ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_2 x)) δ)) ∧ Real.instLT.lt b_1 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f y))))))))) ∧ Real.instLT.lt Ω ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ω ε))))) ∧ (∀ (b_1 : Real), Real.instLE.le 0 b_1 → Real.instLT.lt b_1 ω → ∀ (δ : Real), Real.instLT.lt 0 δ → Exists fun Ω => ((Real.instLE.le 0 Ω ∧ ((∀ (x_1 : Real), x_1 ∈ fun x_2 => (x_2 ∈ Set.Icc a b ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_2 x)) δ) → ∀ (y : Real), y ∈ fun x_2 => (x_2 ∈ Set.Icc a b ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_2 x)) δ) → Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f y))) Ω) ∧ (∀ (b_2 : Real), Real.instLE.le 0 b_2 → Real.instLT.lt b_2 Ω → Exists fun x_1 => ((x_1 ∈ fun x_2 => (x_2 ∈ Set.Icc a b ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_2 x)) δ)) ∧ (Exists fun y => ((y ∈ fun x_2 => (x_2 ∈ Set.Icc a b ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_2 x)) δ)) ∧ Real.instLT.lt b_2 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f y))))))))) ∧ Real.instLT.lt b_1 Ω)))))

Logical form (Lean):

```lean
def PointOscillation (f : ℝ → ℝ) (a b x ω : ℝ) : Prop :=
  x ∈ Set.Icc a b ∧ LRA.Analysis.Continuity.OscillationAtPoint f (Set.Icc a b) x ω
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
def PointOscillation (f : ℝ → ℝ) (a b x ω : ℝ) : Prop :=
  x ∈ Set.Icc a b ∧ LRA.Analysis.Continuity.OscillationAtPoint f (Set.Icc a b) x ω

/--
`lebesgue_criterion_riemann_integrability` TODO

Predicate logic:

  ∀ (f : Real → Real) (a b : Real), (Real.instLE.le a b ∧ LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) → LRA.Analysis.Integration.IsRiemannIntegrable f a b ↔ LRA.Analysis.Integration.IsMeasureZero (setOf fun x => (x ∈ Set.Icc a b ∧ (Exists fun ω => (Real.instLT.lt 0 ω ∧ LRA.Analysis.Integration.PointOscillation f a b x ω))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    a b : ℝ
    hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)
  Prove
    (Real.instLE.le a b ∧ LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) → LRA.Analysis.Integration.IsRiemannIntegrable f a b ↔ LRA.Analysis.Integration.IsMeasureZero (setOf fun x => (x ∈ Set.Icc a b ∧ (Exists fun ω => (Real.instLT.lt 0 ω ∧ LRA.Analysis.Integration.PointOscillation f a b x ω))))

Logical form (Lean):

```lean
theorem lebesgue_criterion_riemann_integrability (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsRiemannIntegrable f a b ↔
      IsMeasureZero {x ∈ Set.Icc a b | ∃ ω : ℝ, 0 < ω ∧ PointOscillation f a b x ω}
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
theorem lebesgue_criterion_riemann_integrability (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsRiemannIntegrable f a b ↔
      IsMeasureZero {x ∈ Set.Icc a b | ∃ ω : ℝ, 0 < ω ∧ PointOscillation f a b x ω} := by
  sorry
end LRA.Analysis.Integration
