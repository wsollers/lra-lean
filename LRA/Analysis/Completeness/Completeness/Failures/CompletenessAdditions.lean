import Mathlib.Data.Real.Basic
import Mathlib.Order.Bounds.Basic
import LRA.Analysis.Completeness.Completeness.Definition

namespace LRA.Analysis.Completeness

section RationalLeastUpperBoundFailure

/--
`RationalsLackLubProperty` TODO

Predicate logic:

  (LRA.Analysis.Completeness.RationalCutLowerAtSqrtTwo.Nonempty ∧ ((Exists fun u => ∀ (x : Rat), x ∈ LRA.Analysis.Completeness.RationalCutLowerAtSqrtTwo → Rat.instLE.le x u) ∧ ¬ Exists fun s => IsLUB LRA.Analysis.Completeness.RationalCutLowerAtSqrtTwo s))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun x => x ∈ LRA.Analysis.Completeness.RationalCutLowerAtSqrtTwo ∧ ((Exists fun u => ∀ (x : Rat), x ∈ LRA.Analysis.Completeness.RationalCutLowerAtSqrtTwo → Rat.instLE.le x u) ∧ ((Exists fun s => ((s ∈ fun x => ∀ ⦃a : Rat⦄, a ∈ LRA.Analysis.Completeness.RationalCutLowerAtSqrtTwo → Rat.instLE.le a x) ∧ (s ∈ fun x => ∀ ⦃a : Rat⦄, a ∈ upperBounds LRA.Analysis.Completeness.RationalCutLowerAtSqrtTwo → Rat.instLE.le x a))) → False)))

Logical form (Lean):

```lean
theorem RationalsLackLubProperty :
    RationalCutLowerAtSqrtTwo.Nonempty ∧
      (∃ u : ℚ, ∀ x ∈ RationalCutLowerAtSqrtTwo, x ≤ u) ∧
      ¬ ∃ s : ℚ, IsLUB RationalCutLowerAtSqrtTwo s
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
theorem RationalsLackLubProperty :
    RationalCutLowerAtSqrtTwo.Nonempty ∧
      (∃ u : ℚ, ∀ x ∈ RationalCutLowerAtSqrtTwo, x ≤ u) ∧
      ¬ ∃ s : ℚ, IsLUB RationalCutLowerAtSqrtTwo s := by
  sorry
/--
`RationalsDoNotHaveLeastUpperBoundProperty` TODO

Predicate logic:

  LRA.Analysis.Completeness.HasLeastUpperBoundProperty Rat → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (A : Rat → Prop), (Exists fun x => x) ∈ A → (Exists fun u => ∀ (x : Rat), x ∈ A → Rat.instPreorder.1.le x u) → Exists fun s => ((∀ (x : Rat), x ∈ A → Rat.instPreorder.1.le x s) ∧ (∀ (u : Rat), (∀ (x : Rat), x ∈ A → Rat.instPreorder.1.le x u) → Rat.instPreorder.1.le s u))) → False

Logical form (Lean):

```lean
def RationalsDoNotHaveLeastUpperBoundProperty : Prop :=
  ¬ HasLeastUpperBoundProperty ℚ
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def RationalsDoNotHaveLeastUpperBoundProperty : Prop :=
  ¬ HasLeastUpperBoundProperty ℚ

/--
`RationalSqrtTwoCutProvesRationalsDoNotHaveLeastUpperBoundProperty` TODO

Predicate logic:

  LRA.Analysis.Completeness.RationalsDoNotHaveLeastUpperBoundProperty

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Analysis.Completeness.RationalsDoNotHaveLeastUpperBoundProperty

Logical form (Lean):

```lean
theorem RationalSqrtTwoCutProvesRationalsDoNotHaveLeastUpperBoundProperty :
    RationalsDoNotHaveLeastUpperBoundProperty
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
theorem RationalSqrtTwoCutProvesRationalsDoNotHaveLeastUpperBoundProperty :
    RationalsDoNotHaveLeastUpperBoundProperty := by
  sorry
/--
`RationalDedekindCutAtSqrtTwoHasAGap` TODO

Predicate logic:

  ((¬ Exists fun m => (m ∈ LRA.Analysis.Completeness.RationalCutLowerAtSqrtTwo ∧ (∀ (x : Rat), x ∈ LRA.Analysis.Completeness.RationalCutLowerAtSqrtTwo → Rat.instLE.le x m))) ∧ (¬ Exists fun m => (m ∈ LRA.Analysis.Completeness.RationalCutUpperAtSqrtTwo ∧ (∀ (x : Rat), x ∈ LRA.Analysis.Completeness.RationalCutUpperAtSqrtTwo → Rat.instLE.le m x))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((Exists fun m => (m ∈ LRA.Analysis.Completeness.RationalCutLowerAtSqrtTwo ∧ (∀ (x : Rat), x ∈ LRA.Analysis.Completeness.RationalCutLowerAtSqrtTwo → Rat.instLE.le x m))) → False) ∧ ((Exists fun m => (m ∈ LRA.Analysis.Completeness.RationalCutUpperAtSqrtTwo ∧ (∀ (x : Rat), x ∈ LRA.Analysis.Completeness.RationalCutUpperAtSqrtTwo → Rat.instLE.le m x))) → False))

Logical form (Lean):

```lean
theorem RationalDedekindCutAtSqrtTwoHasAGap :
    (¬ ∃ m ∈ RationalCutLowerAtSqrtTwo,
        ∀ x ∈ RationalCutLowerAtSqrtTwo, x ≤ m) ∧
    (¬ ∃ m ∈ RationalCutUpperAtSqrtTwo,
        ∀ x ∈ RationalCutUpperAtSqrtTwo, m ≤ x)
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
theorem RationalDedekindCutAtSqrtTwoHasAGap :
    (¬ ∃ m ∈ RationalCutLowerAtSqrtTwo,
        ∀ x ∈ RationalCutLowerAtSqrtTwo, x ≤ m) ∧
    (¬ ∃ m ∈ RationalCutUpperAtSqrtTwo,
        ∀ x ∈ RationalCutUpperAtSqrtTwo, m ≤ x) := by
  sorry
end RationalLeastUpperBoundFailure

end LRA.Analysis.Completeness
