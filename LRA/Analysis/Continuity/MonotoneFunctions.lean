
import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Continuity.GlobalTheorems
import LRA.Analysis.Continuity.PointContinuity

namespace LRA.Analysis.Continuity

/--
`MonotoneHasOneSidedLimits` TODO

Predicate logic:

  (∀ hI ∈ I.OrdConnected), (ℝ → ℝ ∧ c ∈ I) → (∃ L, ∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c → |f x - L| < ε) ∧ (∃ L, ∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ → |f x - L| < ε)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (I : Real → Prop), (Set.OrdConnected I ∧ ∀ ⦃a : Real⦄, Set.instMembership.1 I a → ∀ ⦃b : Real⦄, Set.instMembership.1 I b → Real.instPreorder.toLE.1 a b → Real.instPreorder.toLE.1 (f a) (f b)) → ∀ (c : Real), Set.instMembership.1 I c → (Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 I x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε) ∧ Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 I x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε))

Logical form (Lean):

```lean
theorem MonotoneHasOneSidedLimits (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c : ℝ) (hc : c ∈ I) :
    (∃ L, ∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c → |f x - L| < ε) ∧
    (∃ L, ∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ → |f x - L| < ε)
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
theorem MonotoneHasOneSidedLimits (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c : ℝ) (hc : c ∈ I) :
    (∃ L, ∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c → |f x - L| < ε) ∧
    (∃ L, ∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ → |f x - L| < ε) := by
  sorry

/--
`MonotoneContinuousIffOneSidedLimitsAgree` TODO

Predicate logic:

  (∀ hI ∈ I.OrdConnected), (ℝ → ℝ ∧ c ∈ I) → ContinuousAtPoint f I c ↔ (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c → |f x - f c| < ε) ∧ (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ → |f x - f c| < ε)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (I : Real → Prop), (Set.OrdConnected I ∧ ∀ ⦃a : Real⦄, Set.instMembership.1 I a → ∀ ⦃b : Real⦄, Set.instMembership.1 I b → Real.instPreorder.toLE.1 a b → Real.instPreorder.toLE.1 (f a) (f b)) → ∀ (c : Real), Set.instMembership.1 I c → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 I x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f c)))) ε) ↔ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 I x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f c)))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 I x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f c)))) ε))

Logical form (Lean):

```lean
theorem MonotoneContinuousIffOneSidedLimitsAgree (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c : ℝ) (hc : c ∈ I) :
    ContinuousAtPoint f I c ↔
      (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c → |f x - f c| < ε) ∧
      (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ → |f x - f c| < ε)
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
theorem MonotoneContinuousIffOneSidedLimitsAgree (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c : ℝ) (hc : c ∈ I) :
    ContinuousAtPoint f I c ↔
      (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c → |f x - f c| < ε) ∧
      (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ → |f x - f c| < ε) := by
  sorry

/--
`JumpOf` TODO

Predicate logic:

  ∀ (f : Real → Real) (I : Set Real) (c J : Real), (Real.instLE.le 0 J ∧ Exists fun L₁ => Exists fun L₂ => (∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Set.instMembership.mem I x → Real.instLT.lt (instHSub.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs (instHSub.hSub (f x) L₁)) ε) ∧ (∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Set.instMembership.mem I x → Real.instLT.lt c x → Real.instLT.lt x (instHAdd.hAdd c δ) → Real.instLT.lt (abs (instHSub.hSub (f x) L₂)) ε) ∧ J = instHSub.hSub L₂ L₁)))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (I : Real → Prop) (c J : Real), (Real.instLE.1 Zero.toOfNat0.1 J ∧ Exists fun L₁ => Exists fun L₂ => (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 I x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₁) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L₁))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 I x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L₂))) ε) ∧ J = instHSub.1 L₂ L₁)))

Logical form (Lean):

```lean
def JumpOf (f : ℝ → ℝ) (I : Set ℝ) (c J : ℝ) : Prop :=
  0 ≤ J ∧ ∃ L₁ L₂ : ℝ,
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c -> |f x - L₁| < ε) ∧
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ -> |f x - L₂| < ε) ∧
    J = L₂ - L₁
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
def JumpOf (f : ℝ → ℝ) (I : Set ℝ) (c J : ℝ) : Prop :=
  0 ≤ J ∧ ∃ L₁ L₂ : ℝ,
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c -> |f x - L₁| < ε) ∧
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ -> |f x - L₂| < ε) ∧
    J = L₂ - L₁

/--
`MonotoneDiscontinuitiesAreJumps` TODO

Predicate logic:

  (∀ hI ∈ I.OrdConnected), (ℝ → ℝ ∧ c ∈ I) → ∃ J > 0, JumpOf f I c J

Predicate logic (unfolded):

  ∀ (f : Real → Real) (I : Real → Prop), (Set.OrdConnected I ∧ ∀ ⦃a : Real⦄, Set.instMembership.1 I a → ∀ ⦃b : Real⦄, Set.instMembership.1 I b → Real.instPreorder.toLE.1 a b → Real.instPreorder.toLE.1 (f a) (f b)) → ∀ (c : Real), (Set.instMembership.1 I c ∧ (Set.instMembership.1 I c ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 I x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (f x) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (f x) (f c)))) ε)) → False)) → Exists fun J => (Real.instLT.1 Zero.toOfNat0.1 J ∧ (Real.instLE.1 Zero.toOfNat0.1 J ∧ Exists fun L₁ => Exists fun L₂ => (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 I x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₁) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L₁))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 I x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L₂))) ε) ∧ J = instHSub.1 L₂ L₁))))

Logical form (Lean):

```lean
theorem MonotoneDiscontinuitiesAreJumps (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c : ℝ) (hc : c ∈ I)
    (hdisc : PointOfDiscontinuity f I c) :
    ∃ J > 0, JumpOf f I c J
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
theorem MonotoneDiscontinuitiesAreJumps (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c : ℝ) (hc : c ∈ I)
    (hdisc : PointOfDiscontinuity f I c) :
    ∃ J > 0, JumpOf f I c J := by
  sorry

/--
`JumpIntervalsDisjoint` TODO

Predicate logic:

  (∀ hI ∈ I.OrdConnected), (ℝ → ℝ) → Disjoint (Set.Ioc c₁ (c₁ + J₁)) (Set.Ioc c₂ (c₂ + J₂))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (I : Real → Prop), (Set.OrdConnected I ∧ ∀ ⦃a : Real⦄, Set.instMembership.1 I a → ∀ ⦃b : Real⦄, Set.instMembership.1 I b → Real.instPreorder.toLE.1 a b → Real.instPreorder.toLE.1 (f a) (f b)) → ∀ (c₁ c₂ : Real), ((Set.instMembership.1 I c₁ ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 I x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x c₁) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c₁))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (f x) (f c₁)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (f x) (f c₁)))) ε)) → False) ∧ ((Set.instMembership.1 I c₂ ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 I x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x c₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c₂))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (f x) (f c₂)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (f x) (f c₂)))) ε)) → False) ∧ c₁ = c₂ → False)) → ∀ (J₁ J₂ : Real), ((Real.instLE.1 Zero.toOfNat0.1 J₁ ∧ Exists fun L₁ => Exists fun L₂ => (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 I x → Real.instLT.1 (instHSub.1 c₁ δ) x → Real.instLT.1 x c₁ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₁) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L₁))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 I x → Real.instLT.1 c₁ x → Real.instLT.1 x (instHAdd.1 c₁ δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L₂))) ε) ∧ J₁ = instHSub.1 L₂ L₁))) ∧ (Real.instLE.1 Zero.toOfNat0.1 J₂ ∧ Exists fun L₁ => Exists fun L₂ => (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 I x → Real.instLT.1 (instHSub.1 c₂ δ) x → Real.instLT.1 x c₂ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₁) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L₁))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 I x → Real.instLT.1 c₂ x → Real.instLT.1 x (instHAdd.1 c₂ δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L₂))) ε) ∧ J₂ = instHSub.1 L₂ L₁)))) → ∀ ⦃x : Real → Prop⦄, (ChainCompletePartialOrder.instOfCompleteLattice.toLE.1 x fun x => (Real.instPreorder.toLT.1 c₁ x ∧ Real.instPreorder.toLE.1 x (instHAdd.1 c₁ J₁)) ∧ ChainCompletePartialOrder.instOfCompleteLattice.toLE.1 x fun x => (Real.instPreorder.toLT.1 c₂ x ∧ Real.instPreorder.toLE.1 x (instHAdd.1 c₂ J₂))) → ChainCompletePartialOrder.instOfCompleteLattice.toLE.1 x CompleteBooleanAlgebra.toCompleteDistribLattice.toHeytingAlgebra.toBot.1

Logical form (Lean):

```lean
theorem JumpIntervalsDisjoint (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c₁ c₂ : ℝ)
    (hc₁ : PointOfDiscontinuity f I c₁) (hc₂ : PointOfDiscontinuity f I c₂)
    (hne : c₁ ≠ c₂) (J₁ J₂ : ℝ)
    (hj₁ : JumpOf f I c₁ J₁) (hj₂ : JumpOf f I c₂ J₂) :
    Disjoint
      (Set.Ioc c₁ (c₁ + J₁))
      (Set.Ioc c₂ (c₂ + J₂))
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
theorem JumpIntervalsDisjoint (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c₁ c₂ : ℝ)
    (hc₁ : PointOfDiscontinuity f I c₁) (hc₂ : PointOfDiscontinuity f I c₂)
    (hne : c₁ ≠ c₂) (J₁ J₂ : ℝ)
    (hj₁ : JumpOf f I c₁ J₁) (hj₂ : JumpOf f I c₂ J₂) :
    Disjoint
      (Set.Ioc c₁ (c₁ + J₁))
      (Set.Ioc c₂ (c₂ + J₂)) := by
  sorry

/--
`MonotoneDiscontinuitiesCountable` TODO

Predicate logic:

  (∀ hI ∈ I.OrdConnected), (ℝ → ℝ) → Set.Countable {c : ℝ | c ∈ I ∧ PointOfDiscontinuity f I c}

Predicate logic (unfolded):

  ∀ (f : Real → Real) (I : Real → Prop), (Set.OrdConnected I ∧ ∀ ⦃a : Real⦄, Set.instMembership.1 I a → ∀ ⦃b : Real⦄, Set.instMembership.1 I b → Real.instPreorder.toLE.1 a b → Real.instPreorder.toLE.1 (f a) (f b)) → Countable (Subtype fun x => Set.instMembership.1 (fun c => (Set.instMembership.1 I c ∧ (Set.instMembership.1 I c ∧ LRA.Analysis.Continuity.ContinuousAtPoint f I c → False))) x)

Logical form (Lean):

```lean
theorem MonotoneDiscontinuitiesCountable (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) :
    Set.Countable {c : ℝ | c ∈ I ∧ PointOfDiscontinuity f I c}
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
theorem MonotoneDiscontinuitiesCountable (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) :
    Set.Countable {c : ℝ | c ∈ I ∧ PointOfDiscontinuity f I c} := by
  sorry

/--
`ContinuousInjectiveIffStrictMono` TODO

Predicate logic:

  (∀ hI ∈ I.OrdConnected), (ℝ → ℝ) → Set.InjOn f I ↔ StrictMonoOn f I ∨ StrictAntiOn f I

Predicate logic (unfolded):

  ∀ (f : Real → Real) (I : Real → Prop), (Set.OrdConnected I ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 I x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε)) → ∀ ⦃x₁ : Real⦄, Set.instMembership.1 I x₁ → ∀ ⦃x₂ : Real⦄, Set.instMembership.1 I x₂ → f x₁ = f x₂ → x₁ = x₂ ↔ Or (∀ ⦃a : Real⦄, Set.instMembership.1 I a → ∀ ⦃b : Real⦄, Set.instMembership.1 I b → Real.instPreorder.toLT.1 a b → Real.instPreorder.toLT.1 (f a) (f b)) (∀ ⦃a : Real⦄, Set.instMembership.1 I a → ∀ ⦃b : Real⦄, Set.instMembership.1 I b → Real.instPreorder.toLT.1 a b → Real.instPreorder.toLT.1 (f b) (f a))

Logical form (Lean):

```lean
theorem ContinuousInjectiveIffStrictMono (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hf : ContinuousOn' f I) :
    Set.InjOn f I ↔ StrictMonoOn f I ∨ StrictAntiOn f I
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, Or.inl, Or.inr, cases, rcases

-/
theorem ContinuousInjectiveIffStrictMono (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hf : ContinuousOn' f I) :
    Set.InjOn f I ↔ StrictMonoOn f I ∨ StrictAntiOn f I := by
  sorry

/--
`ContinuousInverseTheorem` TODO

Predicate logic:

  (∀ hI ∈ I.OrdConnected), (ℝ → ℝ ∧ ℝ → ℝ ∧ ∀ x ∈ I, finv (f x) = x) → ContinuousOn' finv (f '' I)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (I : Real → Prop), (Set.OrdConnected I ∧ (∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 I x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε) ∧ ∀ ⦃a : Real⦄, Set.instMembership.1 I a → ∀ ⦃b : Real⦄, Set.instMembership.1 I b → Real.instPreorder.toLT.1 a b → Real.instPreorder.toLT.1 (f a) (f b))) → ∀ (finv : Real → Real), (∀ (x : Real), Set.instMembership.1 I x → finv (f x) = x) → ∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 I a ∧ f a = x)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 I a ∧ f a = x)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (finv x_1) (finv x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (finv x_1) (finv x)))) ε)

Logical form (Lean):

```lean
theorem ContinuousInverseTheorem (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hf : ContinuousOn' f I) (hmono : StrictMonoOn f I)
    (finv : ℝ → ℝ) (hfinv : ∀ x ∈ I, finv (f x) = x) :
    ContinuousOn' finv (f '' I)
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
theorem ContinuousInverseTheorem (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hf : ContinuousOn' f I) (hmono : StrictMonoOn f I)
    (finv : ℝ → ℝ) (hfinv : ∀ x ∈ I, finv (f x) = x) :
    ContinuousOn' finv (f '' I) := by
  sorry

/--
`LimsupAt` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c L : Real), (∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLT.lt 0 (abs (instHSub.hSub x c)) → Real.instLT.lt (abs (instHSub.hSub x c)) δ → Real.instLT.lt (f x) (instHAdd.hAdd L ε)) ∧ ∀ (ε : Real), GT.gt ε 0 → ∀ (δ : Real), GT.gt δ 0 → Exists fun x => (Set.instMembership.mem A x ∧ (Real.instLT.lt 0 (abs (instHSub.hSub x c)) ∧ (Real.instLT.lt (abs (instHSub.hSub x c)) δ ∧ Real.instLT.lt (instHSub.hSub L ε) (f x)))))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c L : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (f x) (instHAdd.1 L ε)) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → ∀ (δ : Real), Real.instLT.1 Zero.toOfNat0.1 δ → Exists fun x => (Set.instMembership.1 A x ∧ (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) ∧ (Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ ∧ Real.instLT.1 (instHSub.1 L ε) (f x)))))

Logical form (Lean):

```lean
def LimsupAt (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  (∀ ε > 0, ∃ δ > 0,
    ∀ x ∈ A, 0 < |x - c| → |x - c| < δ -> f x < L + ε) ∧
  (∀ ε > 0, ∀ δ > 0, ∃ x ∈ A,
    0 < |x - c| ∧ |x - c| < δ ∧ L - ε < f x)
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
def LimsupAt (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  (∀ ε > 0, ∃ δ > 0,
    ∀ x ∈ A, 0 < |x - c| → |x - c| < δ -> f x < L + ε) ∧
  (∀ ε > 0, ∀ δ > 0, ∃ x ∈ A,
    0 < |x - c| ∧ |x - c| < δ ∧ L - ε < f x)

/--
`LiminfAt` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c L : Real), (∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLT.lt 0 (abs (instHSub.hSub x c)) → Real.instLT.lt (abs (instHSub.hSub x c)) δ → Real.instLT.lt (instHSub.hSub L ε) (f x)) ∧ ∀ (ε : Real), GT.gt ε 0 → ∀ (δ : Real), GT.gt δ 0 → Exists fun x => (Set.instMembership.mem A x ∧ (Real.instLT.lt 0 (abs (instHSub.hSub x c)) ∧ (Real.instLT.lt (abs (instHSub.hSub x c)) δ ∧ Real.instLT.lt (f x) (instHAdd.hAdd L ε)))))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c L : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (instHSub.1 L ε) (f x)) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → ∀ (δ : Real), Real.instLT.1 Zero.toOfNat0.1 δ → Exists fun x => (Set.instMembership.1 A x ∧ (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) ∧ (Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ ∧ Real.instLT.1 (f x) (instHAdd.1 L ε)))))

Logical form (Lean):

```lean
def LiminfAt (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  (∀ ε > 0, ∃ δ > 0,
    ∀ x ∈ A, 0 < |x - c| → |x - c| < δ -> L - ε < f x) ∧
  (∀ ε > 0, ∀ δ > 0, ∃ x ∈ A,
    0 < |x - c| ∧ |x - c| < δ ∧ f x < L + ε)
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
def LiminfAt (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  (∀ ε > 0, ∃ δ > 0,
    ∀ x ∈ A, 0 < |x - c| → |x - c| < δ -> L - ε < f x) ∧
  (∀ ε > 0, ∀ δ > 0, ∃ x ∈ A,
    0 < |x - c| ∧ |x - c| < δ ∧ f x < L + ε)

/--
`TendstoIffLimsupAndLiminf` TODO

Predicate logic:

  (ℝ → ℝ) → (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |f x - L| < ε) ↔ LimsupAt f A c L ∧ LiminfAt f A c L

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c L : Real), ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε) ↔ ((∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (f x) (instHAdd.1 L ε)) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → ∀ (δ : Real), Real.instLT.1 Zero.toOfNat0.1 δ → Exists fun x => (Set.instMembership.1 A x ∧ (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) ∧ (Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ ∧ Real.instLT.1 (instHSub.1 L ε) (f x))))) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (instHSub.1 L ε) (f x)) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → ∀ (δ : Real), Real.instLT.1 Zero.toOfNat0.1 δ → Exists fun x => (Set.instMembership.1 A x ∧ (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) ∧ (Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ ∧ Real.instLT.1 (f x) (instHAdd.1 L ε))))))

Logical form (Lean):

```lean
theorem TendstoIffLimsupAndLiminf (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |f x - L| < ε) ↔
      LimsupAt f A c L ∧ LiminfAt f A c L
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
theorem TendstoIffLimsupAndLiminf (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |f x - L| < ε) ↔
      LimsupAt f A c L ∧ LiminfAt f A c L := by
  sorry

/--
`LiminfLeLimsup` TODO

Predicate logic:

  (ℝ → ℝ) → L₁ ≤ L₂

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c L₁ L₂ : Real), ((∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (instHSub.1 L₁ ε) (f x)) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → ∀ (δ : Real), Real.instLT.1 Zero.toOfNat0.1 δ → Exists fun x => (Set.instMembership.1 A x ∧ (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) ∧ (Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ ∧ Real.instLT.1 (f x) (instHAdd.1 L₁ ε))))) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (f x) (instHAdd.1 L₂ ε)) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → ∀ (δ : Real), Real.instLT.1 Zero.toOfNat0.1 δ → Exists fun x => (Set.instMembership.1 A x ∧ (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) ∧ (Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ ∧ Real.instLT.1 (instHSub.1 L₂ ε) (f x)))))) → Real.instLE.1 L₁ L₂

Logical form (Lean):

```lean
theorem LiminfLeLimsup (f : ℝ → ℝ) (A : Set ℝ) (c L₁ L₂ : ℝ)
    (hInf : LiminfAt f A c L₁) (hSup : LimsupAt f A c L₂) :
    L₁ ≤ L₂
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
theorem LiminfLeLimsup (f : ℝ → ℝ) (A : Set ℝ) (c L₁ L₂ : ℝ)
    (hInf : LiminfAt f A c L₁) (hSup : LimsupAt f A c L₂) :
    L₁ ≤ L₂ := by
  sorry

end LRA.Analysis.Continuity
