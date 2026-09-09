
import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Continuity.GlobalTheorems
import LRA.Analysis.Continuity.PointContinuity

namespace LRA.Analysis.Continuity

/--
`MonotoneHasOneSidedLimits` TODO

Predicate logic:

  ∀ (f : Real → Real) (I : Set Real), (I.OrdConnected ∧ MonotoneOn f I) → ∀ (c : Real), c ∈ I → ((Exists fun L => ∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt (instHSub.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs (instHSub.hSub (f x) L)) ε))) ∧ (Exists fun L => ∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt c x → Real.instLT.lt x (instHAdd.hAdd c δ) → Real.instLT.lt (abs (instHSub.hSub (f x) L)) ε))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    I : Set ℝ
    hI : I.OrdConnected
    hmono : MonotoneOn f I
    c : ℝ
  Prove
    (Set.OrdConnected I ∧ (∀ ⦃a : Real⦄, a ∈ I → ∀ ⦃b : Real⦄, b ∈ I → Real.instPreorder.1.le a b → Real.instPreorder.1.le (f a) (f b))) → ∀ (c : Real), c ∈ I → ((Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε))) ∧ (Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε))))

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

  ∀ (f : Real → Real) (I : Set Real), (I.OrdConnected ∧ MonotoneOn f I) → ∀ (c : Real), c ∈ I → LRA.Analysis.Continuity.ContinuousAtPoint f I c ↔ ((∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt (instHSub.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs (instHSub.hSub (f x) (f c))) ε))) ∧ (∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt c x → Real.instLT.lt x (instHAdd.hAdd c δ) → Real.instLT.lt (abs (instHSub.hSub (f x) (f c))) ε))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    I : Set ℝ
    hI : I.OrdConnected
    hmono : MonotoneOn f I
    c : ℝ
  Prove
    (I.OrdConnected ∧ MonotoneOn f I) → ∀ (c : Real), c ∈ I → LRA.Analysis.Continuity.ContinuousAtPoint f I c ↔ ((∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt (instHSub.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs (instHSub.hSub (f x) (f c))) ε))) ∧ (∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt c x → Real.instLT.lt x (instHAdd.hAdd c δ) → Real.instLT.lt (abs (instHSub.hSub (f x) (f c))) ε))))

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

  ∀ (f : Real → Real) (I : Set Real) (c J : Real), (Real.instLE.le 0 J ∧ (Exists fun L₁ => Exists fun L₂ => ((∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt (instHSub.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs (instHSub.hSub (f x) L₁)) ε))) ∧ ((∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt c x → Real.instLT.lt x (instHAdd.hAdd c δ) → Real.instLT.lt (abs (instHSub.hSub (f x) L₂)) ε))) ∧ J = instHSub.hSub L₂ L₁))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Real.instLE.le 0 J ∧ (Exists fun L₁ => Exists fun L₂ => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₁)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₂)) ε))) ∧ J = { hSub := fun a b => Real.instSub.sub a b }.hSub L₂ L₁))))

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

  ∀ (f : Real → Real) (I : Set Real), (I.OrdConnected ∧ MonotoneOn f I) → ∀ (c : Real), (c ∈ I ∧ LRA.Analysis.Continuity.PointOfDiscontinuity f I c) → Exists fun J => (GT.gt J 0 ∧ LRA.Analysis.Continuity.JumpOf f I c J)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    I : Set ℝ
    hI : I.OrdConnected
    hmono : MonotoneOn f I
    c : ℝ
    hdisc : PointOfDiscontinuity f I c
  Prove
    (Set.OrdConnected I ∧ (∀ ⦃a : Real⦄, a ∈ I → ∀ ⦃b : Real⦄, b ∈ I → Real.instPreorder.1.le a b → Real.instPreorder.1.le (f a) (f b))) → ∀ (c : Real), (c ∈ I ∧ (c ∈ I ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f c))) ε))) → False))) → Exists fun J => (Real.instLT.lt 0 J ∧ (Real.instLE.le 0 J ∧ (Exists fun L₁ => Exists fun L₂ => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₁)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₂)) ε))) ∧ J = { hSub := fun a b => Real.instSub.sub a b }.hSub L₂ L₁)))))

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

  ∀ (f : Real → Real) (I : Set Real), (I.OrdConnected ∧ MonotoneOn f I) → ∀ (c₁ c₂ : Real), (LRA.Analysis.Continuity.PointOfDiscontinuity f I c₁ ∧ (LRA.Analysis.Continuity.PointOfDiscontinuity f I c₂ ∧ Ne c₁ c₂)) → ∀ (J₁ J₂ : Real), (LRA.Analysis.Continuity.JumpOf f I c₁ J₁ ∧ LRA.Analysis.Continuity.JumpOf f I c₂ J₂) → Disjoint (Set.Ioc c₁ (instHAdd.hAdd c₁ J₁)) (Set.Ioc c₂ (instHAdd.hAdd c₂ J₂))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    I : Set ℝ
    hI : I.OrdConnected
    hmono : MonotoneOn f I
    c₁ c₂ : ℝ
    hc₁ : PointOfDiscontinuity f I c₁
    hc₂ : PointOfDiscontinuity f I c₂
    hne : c₁ ≠ c₂
    J₁ J₂ : ℝ
    hj₁ : JumpOf f I c₁ J₁
    hj₂ : JumpOf f I c₂ J₂
  Prove
    (Set.OrdConnected I ∧ (∀ ⦃a : Real⦄, a ∈ I → ∀ ⦃b : Real⦄, b ∈ I → Real.instPreorder.1.le a b → Real.instPreorder.1.le (f a) (f b))) → ∀ (c₁ c₂ : Real), ((c₁ ∈ I ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c₁)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f c₁))) ε))) → False)) ∧ ((c₂ ∈ I ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c₂)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f c₂))) ε))) → False)) ∧ (c₁ = c₂ → False))) → ∀ (J₁ J₂ : Real), ((Real.instLE.le 0 J₁ ∧ (Exists fun L₁ => Exists fun L₂ => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c₁ δ) x → Real.instLT.lt x c₁ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₁)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt c₁ x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c₁ δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₂)) ε))) ∧ J₁ = { hSub := fun a b => Real.instSub.sub a b }.hSub L₂ L₁)))) ∧ (Real.instLE.le 0 J₂ ∧ (Exists fun L₁ => Exists fun L₂ => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c₂ δ) x → Real.instLT.lt x c₂ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₁)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt c₂ x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c₂ δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₂)) ε))) ∧ J₂ = { hSub := fun a b => Real.instSub.sub a b }.hSub L₂ L₁))))) → ∀ ⦃x : Real → Prop⦄, ((ChainCompletePartialOrder.instOfCompleteLattice.toPreorder.1.le x fun x => (Real.instPreorder.2.lt c₁ x ∧ Real.instPreorder.1.le x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c₁ J₁))) ∧ (ChainCompletePartialOrder.instOfCompleteLattice.toPreorder.1.le x fun x => (Real.instPreorder.2.lt c₂ x ∧ Real.instPreorder.1.le x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c₂ J₂)))) → ChainCompletePartialOrder.instOfCompleteLattice.toPreorder.1.le x CompleteBooleanAlgebra.toCompleteDistribLattice.toHeytingAlgebra.toBot.1

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

  ∀ (f : Real → Real) (I : Set Real), (I.OrdConnected ∧ MonotoneOn f I) → (setOf fun c => (c ∈ I ∧ LRA.Analysis.Continuity.PointOfDiscontinuity f I c)).Countable

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    I : Set ℝ
    hI : I.OrdConnected
    hmono : MonotoneOn f I
  Prove
    (Set.OrdConnected I ∧ (∀ ⦃a : Real⦄, a ∈ I → ∀ ⦃b : Real⦄, b ∈ I → Real.instPreorder.1.le a b → Real.instPreorder.1.le (f a) (f b))) → Countable (Subtype fun x => x) ∈ fun c => (c ∈ I ∧ (c ∈ I ∧ (LRA.Analysis.Continuity.ContinuousAtPoint f I c → False)))

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

  ∀ (f : Real → Real) (I : Set Real), (I.OrdConnected ∧ LRA.Analysis.Continuity.ContinuousOn' f I) → Set.InjOn f I ↔ Or (StrictMonoOn f I) (StrictAntiOn f I)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    I : Set ℝ
    hI : I.OrdConnected
    hf : ContinuousOn' f I
  Prove
    (I.OrdConnected ∧ LRA.Analysis.Continuity.ContinuousOn' f I) → Set.InjOn f I ↔ Or (StrictMonoOn f I) (StrictAntiOn f I)

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

  ∀ (f : Real → Real) (I : Set Real), (I.OrdConnected ∧ (LRA.Analysis.Continuity.ContinuousOn' f I ∧ StrictMonoOn f I)) → ∀ (finv : Real → Real), (∀ (x : Real), x ∈ I → finv (f x) = x) → LRA.Analysis.Continuity.ContinuousOn' finv (Set.image f I)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    I : Set ℝ
    hI : I.OrdConnected
    hf : ContinuousOn' f I
    hmono : StrictMonoOn f I
    finv : ℝ → ℝ
  Prove
    (Set.OrdConnected I ∧ ((∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ I → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε))) ∧ (∀ ⦃a : Real⦄, a ∈ I → ∀ ⦃b : Real⦄, b ∈ I → Real.instPreorder.2.lt a b → Real.instPreorder.2.lt (f a) (f b)))) → ∀ (finv : Real → Real), (∀ (x : Real), x ∈ I → finv (f x) = x) → ∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ I ∧ f a = x) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => Exists fun a => (a ∈ I ∧ f a = x) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (finv x_1) (finv x))) ε))

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

  ∀ (f : Real → Real) (A : Set Real) (c L : Real), ((∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs (instHSub.hSub x c)) → Real.instLT.lt (abs (instHSub.hSub x c)) δ → Real.instLT.lt (f x) (instHAdd.hAdd L ε)))) ∧ (∀ (ε : Real), GT.gt ε 0 → ∀ (δ : Real), GT.gt δ 0 → Exists fun x => (x ∈ A ∧ (Real.instLT.lt 0 (abs (instHSub.hSub x c)) ∧ (Real.instLT.lt (abs (instHSub.hSub x c)) δ ∧ Real.instLT.lt (instHSub.hSub L ε) (f x))))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (f x) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd L ε)))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → ∀ (δ : Real), Real.instLT.lt 0 δ → Exists fun x => (x ∈ A ∧ (Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) ∧ (Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ ∧ Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub L ε) (f x))))))

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

  ∀ (f : Real → Real) (A : Set Real) (c L : Real), ((∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs (instHSub.hSub x c)) → Real.instLT.lt (abs (instHSub.hSub x c)) δ → Real.instLT.lt (instHSub.hSub L ε) (f x)))) ∧ (∀ (ε : Real), GT.gt ε 0 → ∀ (δ : Real), GT.gt δ 0 → Exists fun x => (x ∈ A ∧ (Real.instLT.lt 0 (abs (instHSub.hSub x c)) ∧ (Real.instLT.lt (abs (instHSub.hSub x c)) δ ∧ Real.instLT.lt (f x) (instHAdd.hAdd L ε))))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub L ε) (f x)))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → ∀ (δ : Real), Real.instLT.lt 0 δ → Exists fun x => (x ∈ A ∧ (Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) ∧ (Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ ∧ Real.instLT.lt (f x) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd L ε))))))

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

  ∀ (f : Real → Real) (A : Set Real) (c L : Real), ∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs (instHSub.hSub x c)) → Real.instLT.lt (abs (instHSub.hSub x c)) δ → Real.instLT.lt (abs (instHSub.hSub (f x) L)) ε)) ↔ (LRA.Analysis.Continuity.LimsupAt f A c L ∧ LRA.Analysis.Continuity.LiminfAt f A c L)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c L : ℝ
  Prove
    ∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs (instHSub.hSub x c)) → Real.instLT.lt (abs (instHSub.hSub x c)) δ → Real.instLT.lt (abs (instHSub.hSub (f x) L)) ε)) ↔ (LRA.Analysis.Continuity.LimsupAt f A c L ∧ LRA.Analysis.Continuity.LiminfAt f A c L)

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

  ∀ (f : Real → Real) (A : Set Real) (c L₁ L₂ : Real), (LRA.Analysis.Continuity.LiminfAt f A c L₁ ∧ LRA.Analysis.Continuity.LimsupAt f A c L₂) → Real.instLE.le L₁ L₂

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c L₁ L₂ : ℝ
    hInf : LiminfAt f A c L₁
    hSup : LimsupAt f A c L₂
  Prove
    (((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub L₁ ε) (f x)))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → ∀ (δ : Real), Real.instLT.lt 0 δ → Exists fun x => (x ∈ A ∧ (Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) ∧ (Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ ∧ Real.instLT.lt (f x) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd L₁ ε)))))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (f x) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd L₂ ε)))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → ∀ (δ : Real), Real.instLT.lt 0 δ → Exists fun x => (x ∈ A ∧ (Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) ∧ (Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ ∧ Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub L₂ ε) (f x))))))) → Real.instLE.le L₁ L₂

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
