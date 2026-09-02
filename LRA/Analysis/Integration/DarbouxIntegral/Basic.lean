
import Mathlib.Data.Real.Basic
import Mathlib.Algebra.Order.Archimedean.Real.Basic
import LRA.Analysis.Integration.Partitions
import LRA.Analysis.Integration.RiemannIntegral.Basic
import LRA.Analysis.Continuity.MonotoneFunctions

namespace LRA.Analysis.Integration

variable {f g : ℝ → ℝ} {a b : ℝ}

/--
`LowerDarbouxSum` TODO

Predicate logic:

  noncomputable def LowerDarbouxSum (f : ℝ → ℝ) {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  ∑ i : Fin P.n,
    SubintervalWidth P i *
      sInf (f '' Set.Icc (P.points i.castSucc) (P.points i.succ))

Predicate logic (unfolded):

  noncomputable def LowerDarbouxSum (f : ℝ → ℝ) {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  ∑ i : Fin P.n,
    SubintervalWidth P i *
      sInf (f '' Set.Icc (P.points i.castSucc) (P.points i.succ)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def LowerDarbouxSum (f : ℝ → ℝ) {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  ∑ i : Fin P.n,
    SubintervalWidth P i *
      sInf (f '' Set.Icc (P.points i.castSucc) (P.points i.succ))
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
noncomputable def LowerDarbouxSum (f : ℝ → ℝ) {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  ∑ i : Fin P.n,
    SubintervalWidth P i *
      sInf (f '' Set.Icc (P.points i.castSucc) (P.points i.succ))

/--
`UpperDarbouxSum` TODO

Predicate logic:

  noncomputable def UpperDarbouxSum (f : ℝ → ℝ) {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  ∑ i : Fin P.n,
    SubintervalWidth P i *
      sSup (f '' Set.Icc (P.points i.castSucc) (P.points i.succ))

Predicate logic (unfolded):

  noncomputable def UpperDarbouxSum (f : ℝ → ℝ) {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  ∑ i : Fin P.n,
    SubintervalWidth P i *
      sSup (f '' Set.Icc (P.points i.castSucc) (P.points i.succ)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def UpperDarbouxSum (f : ℝ → ℝ) {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  ∑ i : Fin P.n,
    SubintervalWidth P i *
      sSup (f '' Set.Icc (P.points i.castSucc) (P.points i.succ))
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
noncomputable def UpperDarbouxSum (f : ℝ → ℝ) {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  ∑ i : Fin P.n,
    SubintervalWidth P i *
      sSup (f '' Set.Icc (P.points i.castSucc) (P.points i.succ))

/--
`darboux_refinement_squeeze` TODO

Predicate logic:

  LowerDarbouxSum f P ≤ LowerDarbouxSum f P' ∧ LowerDarbouxSum f P' ≤ UpperDarbouxSum f P' ∧ UpperDarbouxSum f P' ≤ UpperDarbouxSum f P

Predicate logic (unfolded):

  ∀ {f : Real → Real} {a b : Real} (P P' : LRA.Analysis.Integration.IntegrationPartition a b), (∀ (i : Fin (instHAdd.1 P.1 (instOfNatNat 1).1)), Exists fun j => P'.2 j = P.2 i) → (Real.instLE.1 (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instInfSet.sInf (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val)) (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P' i) (Real.instInfSet.sInf (Set.image f (Set.Icc (P'.points i.castSucc) (P'.points i.succ))))) Finset.univ.val)) ∧ (Real.instLE.1 (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P' i) (Real.instInfSet.sInf (Set.image f (Set.Icc (P'.points i.castSucc) (P'.points i.succ))))) Finset.univ.val)) (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P' i) (Real.instSupSet.sSup (Set.image f (Set.Icc (P'.points i.castSucc) (P'.points i.succ))))) Finset.univ.val)) ∧ Real.instLE.1 (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P' i) (Real.instSupSet.sSup (Set.image f (Set.Icc (P'.points i.castSucc) (P'.points i.succ))))) Finset.univ.val)) (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instSupSet.sSup (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val))))

Logical form (Lean):

```lean
theorem darboux_refinement_squeeze (P P' : IntegrationPartition a b) (h : RefinesPartition P' P) :
    LowerDarbouxSum f P ≤ LowerDarbouxSum f P' ∧
    LowerDarbouxSum f P' ≤ UpperDarbouxSum f P' ∧
    UpperDarbouxSum f P' ≤ UpperDarbouxSum f P
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem darboux_refinement_squeeze (P P' : IntegrationPartition a b) (h : RefinesPartition P' P) :
    LowerDarbouxSum f P ≤ LowerDarbouxSum f P' ∧
    LowerDarbouxSum f P' ≤ UpperDarbouxSum f P' ∧
    UpperDarbouxSum f P' ≤ UpperDarbouxSum f P := by
  sorry
/--
`IsDarbouxIntegrable` TODO

Predicate logic:

  ∀ (f : Real → Real) (a b ε : Real), GT.gt ε 0 → Exists fun P => Real.instLT.lt (instHSub.hSub (LRA.Analysis.Integration.UpperDarbouxSum f P) (LRA.Analysis.Integration.LowerDarbouxSum f P)) ε

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun P => Real.instLT.1 (instHSub.1 (Quot.liftOn (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instSupSet.sSup (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) (Quot.liftOn (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instInfSet.sInf (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯)) ε

Logical form (Lean):

```lean
def IsDarbouxIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop :=
  ∀ ε > 0, ∃ P : IntegrationPartition a b, UpperDarbouxSum f P - LowerDarbouxSum f P < ε
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
def IsDarbouxIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop :=
  ∀ ε > 0, ∃ P : IntegrationPartition a b, UpperDarbouxSum f P - LowerDarbouxSum f P < ε

/--
`darboux_criterion` TODO

Predicate logic:

  IsDarbouxIntegrable f a b ↔ ∀ ε > 0, ∃ P ∈ IntegrationPartition a b, UpperDarbouxSum f P - LowerDarbouxSum f P < ε

Predicate logic (unfolded):

  ∀ {f : Real → Real} {a b : Real}, (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) M)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun P => Real.instLT.1 (instHSub.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instSupSet.sSup (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val)) (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instInfSet.sInf (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val))) ε ↔ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun P => Real.instLT.1 (instHSub.1 (Quot.liftOn (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instSupSet.sSup (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) (Quot.liftOn (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instInfSet.sInf (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯)) ε

Logical form (Lean):

```lean
theorem darboux_criterion (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsDarbouxIntegrable f a b ↔
      ∀ ε > 0, ∃ P : IntegrationPartition a b, UpperDarbouxSum f P - LowerDarbouxSum f P < ε
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
theorem darboux_criterion (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsDarbouxIntegrable f a b ↔
      ∀ ε > 0, ∃ P : IntegrationPartition a b, UpperDarbouxSum f P - LowerDarbouxSum f P < ε := by
  sorry
/--
`riemann_darboux_equivalence` TODO

Predicate logic:

  (a ≤ b) → IsRiemannIntegrable f a b ↔ IsDarbouxIntegrable f a b

Predicate logic (unfolded):

  ∀ {f : Real → Real} {a b : Real}, (Real.instLE.1 a b ∧ Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) M)) → Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.singleton 0) (setOf fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Integration.RiemannSum f P) L))) ε) ↔ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun P => Real.instLT.1 (instHSub.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instSupSet.sSup (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val)) (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instInfSet.sInf (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val))) ε

Logical form (Lean):

```lean
theorem riemann_darboux_equivalence (hab : a ≤ b)
    (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsRiemannIntegrable f a b ↔ IsDarbouxIntegrable f a b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem riemann_darboux_equivalence (hab : a ≤ b)
    (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsRiemannIntegrable f a b ↔ IsDarbouxIntegrable f a b := by
  sorry
/--
`continuous_darboux_integrable` TODO

Predicate logic:

  (a ≤ b) → IsDarbouxIntegrable f a b

Predicate logic (unfolded):

  ∀ {f : Real → Real} {a b : Real}, (Real.instLE.1 a b ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun P => Real.instLT.1 (instHSub.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instSupSet.sSup (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val)) (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instInfSet.sInf (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val))) ε

Logical form (Lean):

```lean
theorem continuous_darboux_integrable (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) :
    IsDarbouxIntegrable f a b
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
theorem continuous_darboux_integrable (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) :
    IsDarbouxIntegrable f a b := by
  sorry
/--
`monotone_darboux_integrable` TODO

Predicate logic:

  (a ≤ b) → IsDarbouxIntegrable f a b

Predicate logic (unfolded):

  ∀ {f : Real → Real} {a b : Real}, (Real.instLE.1 a b ∧ ∀ ⦃a_1 : Real⦄, Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) a_1 → ∀ ⦃b_1 : Real⦄, Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) b_1 → Real.instPreorder.toLE.1 a_1 b_1 → Real.instPreorder.toLE.1 (f a_1) (f b_1)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun P => Real.instLT.1 (instHSub.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instSupSet.sSup (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val)) (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instInfSet.sInf (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val))) ε

Logical form (Lean):

```lean
theorem monotone_darboux_integrable (hab : a ≤ b) (hmono : MonotoneOn f (Set.Icc a b)) :
    IsDarbouxIntegrable f a b
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
theorem monotone_darboux_integrable (hab : a ≤ b) (hmono : MonotoneOn f (Set.Icc a b)) :
    IsDarbouxIntegrable f a b := by
  sorry
/--
`finite_discontinuities_darboux_integrable` TODO

Predicate logic:

  (a ≤ b ∧ {x ∈ Set.Icc a b | LRA.Analysis.Continuity.PointOfDiscontinuity f (Set.Icc a b) x}.Finite) → IsDarbouxIntegrable f a b

Predicate logic (unfolded):

  ∀ {f : Real → Real} {a b : Real}, (Real.instLE.1 a b ∧ (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) M) ∧ Finite (Subtype fun x => Set.instMembership.1 (fun x => (Set.instMembership.1 (setOf fun x => (Real.instPreorder.le a x ∧ Real.instPreorder.le x b)) x ∧ (Set.instMembership.1 (Set.Icc a b) x ∧ LRA.Analysis.Continuity.ContinuousAtPoint f (Set.Icc a b) x → False))) x))) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun P => Real.instLT.1 (instHSub.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instSupSet.sSup (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val)) (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instInfSet.sInf (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val))) ε

Logical form (Lean):

```lean
theorem finite_discontinuities_darboux_integrable (hab : a ≤ b)
    (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b))
    (hfin : {x ∈ Set.Icc a b | LRA.Analysis.Continuity.PointOfDiscontinuity f (Set.Icc a b) x}.Finite) :
    IsDarbouxIntegrable f a b
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
theorem finite_discontinuities_darboux_integrable (hab : a ≤ b)
    (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b))
    (hfin : {x ∈ Set.Icc a b | LRA.Analysis.Continuity.PointOfDiscontinuity f (Set.Icc a b) x}.Finite) :
    IsDarbouxIntegrable f a b := by
  sorry
/--
`darboux_integrable_linear_combinations` TODO

Predicate logic:

  (IsDarbouxIntegrable f a b ∧ IsDarbouxIntegrable g a b) → IsDarbouxIntegrable (fun x => α * f x + β * g x) a b

Predicate logic (unfolded):

  ∀ {f g : Real → Real} {a b : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun P => Real.instLT.1 (instHSub.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instSupSet.sSup (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val)) (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instInfSet.sInf (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val))) ε ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun P => Real.instLT.1 (instHSub.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instSupSet.sSup (Set.image g (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val)) (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instInfSet.sInf (Set.image g (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val))) ε) → ∀ (α β ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun P => Real.instLT.1 (instHSub.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instSupSet.sSup (Set.image (fun x => instHAdd.hAdd (instHMul.hMul α (f x)) (instHMul.hMul β (g x))) (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val)) (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instInfSet.sInf (Set.image (fun x => instHAdd.hAdd (instHMul.hMul α (f x)) (instHMul.hMul β (g x))) (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val))) ε

Logical form (Lean):

```lean
theorem darboux_integrable_linear_combinations (hf : IsDarbouxIntegrable f a b)
    (hg : IsDarbouxIntegrable g a b) (α β : ℝ) :
    IsDarbouxIntegrable (fun x => α * f x + β * g x) a b
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
theorem darboux_integrable_linear_combinations (hf : IsDarbouxIntegrable f a b)
    (hg : IsDarbouxIntegrable g a b) (α β : ℝ) :
    IsDarbouxIntegrable (fun x => α * f x + β * g x) a b := by
  sorry
/--
`darboux_integrable_products` TODO

Predicate logic:

  (IsDarbouxIntegrable f a b ∧ IsDarbouxIntegrable g a b) → IsDarbouxIntegrable (fun x => f x * g x) a b

Predicate logic (unfolded):

  ∀ {f g : Real → Real} {a b : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun P => Real.instLT.1 (instHSub.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instSupSet.sSup (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val)) (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instInfSet.sInf (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val))) ε ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun P => Real.instLT.1 (instHSub.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instSupSet.sSup (Set.image g (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val)) (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instInfSet.sInf (Set.image g (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun P => Real.instLT.1 (instHSub.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instSupSet.sSup (Set.image (fun x => instHMul.hMul (f x) (g x)) (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val)) (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instInfSet.sInf (Set.image (fun x => instHMul.hMul (f x) (g x)) (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val))) ε

Logical form (Lean):

```lean
theorem darboux_integrable_products (hf : IsDarbouxIntegrable f a b) (hg : IsDarbouxIntegrable g a b) :
    IsDarbouxIntegrable (fun x => f x * g x) a b
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
theorem darboux_integrable_products (hf : IsDarbouxIntegrable f a b) (hg : IsDarbouxIntegrable g a b) :
    IsDarbouxIntegrable (fun x => f x * g x) a b := by
  sorry
/--
`darboux_integrable_absolute_value` TODO

Predicate logic:

  (IsDarbouxIntegrable f a b) → IsDarbouxIntegrable (fun x => |f x|) a b

Predicate logic (unfolded):

  ∀ {f : Real → Real} {a b : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun P => Real.instLT.1 (instHSub.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instSupSet.sSup (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val)) (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instInfSet.sInf (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun P => Real.instLT.1 (instHSub.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instSupSet.sSup (Set.image (fun x => abs (f x)) (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val)) (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instInfSet.sInf (Set.image (fun x => abs (f x)) (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val))) ε

Logical form (Lean):

```lean
theorem darboux_integrable_absolute_value (hf : IsDarbouxIntegrable f a b) :
    IsDarbouxIntegrable (fun x => |f x|) a b
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
theorem darboux_integrable_absolute_value (hf : IsDarbouxIntegrable f a b) :
    IsDarbouxIntegrable (fun x => |f x|) a b := by
  sorry
/--
`darboux_integrable_continuous_composition` TODO

Predicate logic:

  (IsDarbouxIntegrable f a b ∧ ℝ → ℝ) → IsDarbouxIntegrable (fun x => φ (f x)) a b

Predicate logic (unfolded):

  ∀ {f : Real → Real} {a b : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun P => Real.instLT.1 (instHSub.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instSupSet.sSup (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val)) (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instInfSet.sInf (Set.image f (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val))) ε ∧ Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) M)) → ∀ (J : Real → Prop), Set.instLE.1 (fun x => Exists fun a_2 => (Set.instMembership.1 (fun x => (Real.instPreorder.le a x ∧ Real.instPreorder.le x b)) a_2 ∧ f a_2 = x)) J → ∀ (φ : Real → Real), (∀ (x : Real), Set.instMembership.1 J x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 J x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (φ x_1) (φ x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (φ x_1) (φ x)))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun P => Real.instLT.1 (instHSub.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instSupSet.sSup (Set.image (fun x => φ (f x)) (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val)) (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instInfSet.sInf (Set.image (fun x => φ (f x)) (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val))) ε

Logical form (Lean):

```lean
theorem darboux_integrable_continuous_composition (hf : IsDarbouxIntegrable f a b)
    (hfbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b))
    (J : Set ℝ) (hJ : f '' Set.Icc a b ⊆ J) (φ : ℝ → ℝ)
    (hφ : LRA.Analysis.Continuity.ContinuousOn' φ J) :
    IsDarbouxIntegrable (fun x => φ (f x)) a b
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
theorem darboux_integrable_continuous_composition (hf : IsDarbouxIntegrable f a b)
    (hfbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b))
    (J : Set ℝ) (hJ : f '' Set.Icc a b ⊆ J) (φ : ℝ → ℝ)
    (hφ : LRA.Analysis.Continuity.ContinuousOn' φ J) :
    IsDarbouxIntegrable (fun x => φ (f x)) a b := by
  sorry
/--
`dirichlet_not_darboux_integrable` TODO

Predicate logic:

  ¬ IsDarbouxIntegrable (fun x => by classical exact if LRA.Analysis.Completeness.IsIrrational x then 0 ∈ ℝ else 1) 0 1

Predicate logic (unfolded):

  (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun P => Real.instLT.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instSupSet.sSup (Set.image (fun x => ite (LRA.Analysis.Completeness.IsIrrational x) 0 1) (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val).sum (Multiset.map (fun i => instHMul.hMul (LRA.Analysis.Integration.SubintervalWidth P i) (Real.instInfSet.sInf (Set.image (fun x => ite (LRA.Analysis.Completeness.IsIrrational x) 0 1) (Set.Icc (P.points i.castSucc) (P.points i.succ))))) Finset.univ.val).sum) ε) → False

Logical form (Lean):

```lean
theorem dirichlet_not_darboux_integrable :
    ¬ IsDarbouxIntegrable
      (fun x => by
        classical
        exact if LRA.Analysis.Completeness.IsIrrational x then (0 : ℝ) else 1) 0 1
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
theorem dirichlet_not_darboux_integrable :
    ¬ IsDarbouxIntegrable
      (fun x => by
        classical
        exact if LRA.Analysis.Completeness.IsIrrational x then (0 : ℝ) else 1) 0 1 := by
  sorry
end LRA.Analysis.Integration
