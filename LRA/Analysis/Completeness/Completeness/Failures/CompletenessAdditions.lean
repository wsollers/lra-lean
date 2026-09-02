import Mathlib.Data.Real.Basic
import Mathlib.Order.Bounds.Basic
import LRA.Analysis.Completeness.Completeness.Definition

namespace LRA.Analysis.Completeness

section RationalLeastUpperBoundFailure

/--
`RationalsLackLubProperty` TODO

Predicate logic:

  RationalCutLowerAtSqrtTwo.Nonempty ∧ ∃ u ∈ ℚ, ∀ x ∈ RationalCutLowerAtSqrtTwo, x ≤ u ∧ ¬ ∃ s ∈ ℚ, IsLUB RationalCutLowerAtSqrtTwo s

Predicate logic (unfolded):

  (Exists fun x => Set.instMembership.1 LRA.Analysis.Completeness.RationalCutLowerAtSqrtTwo x ∧ (Exists fun u => ∀ (x : Rat), Set.instMembership.1 LRA.Analysis.Completeness.RationalCutLowerAtSqrtTwo x → Rat.instLE.1 x u ∧ (Exists fun s => (Set.instMembership.1 (fun x => ∀ ⦃a : Rat⦄, Set.instMembership.mem LRA.Analysis.Completeness.RationalCutLowerAtSqrtTwo a → Rat.instLE.le a x) s ∧ Set.instMembership.1 (fun x => ∀ ⦃a : Rat⦄, Set.instMembership.mem (upperBounds LRA.Analysis.Completeness.RationalCutLowerAtSqrtTwo) a → Rat.instLE.le x a) s)) → False))

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

  (∀ (A : Rat → Prop), (Exists fun x => Set.instMembership.1 A x) → (Exists fun u => ∀ (x : Rat), Set.instMembership.1 A x → Rat.instPreorder.toLE.1 x u) → Exists fun s => (∀ (x : Rat), Set.instMembership.1 A x → Rat.instPreorder.toLE.1 x s ∧ ∀ (u : Rat), (∀ (x : Rat), Set.instMembership.1 A x → Rat.instPreorder.toLE.1 x u) → Rat.instPreorder.toLE.1 s u)) → False

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

  RationalsDoNotHaveLeastUpperBoundProperty

Predicate logic (unfolded):

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

  (¬ ∃ m ∈ RationalCutLowerAtSqrtTwo, ∀ x ∈ RationalCutLowerAtSqrtTwo, x ≤ m) ∧ (¬ ∃ m ∈ RationalCutUpperAtSqrtTwo, ∀ x ∈ RationalCutUpperAtSqrtTwo, m ≤ x)

Predicate logic (unfolded):

  ((Exists fun m => (Set.instMembership.1 LRA.Analysis.Completeness.RationalCutLowerAtSqrtTwo m ∧ ∀ (x : Rat), Set.instMembership.1 LRA.Analysis.Completeness.RationalCutLowerAtSqrtTwo x → Rat.instLE.1 x m)) → False ∧ (Exists fun m => (Set.instMembership.1 LRA.Analysis.Completeness.RationalCutUpperAtSqrtTwo m ∧ ∀ (x : Rat), Set.instMembership.1 LRA.Analysis.Completeness.RationalCutUpperAtSqrtTwo x → Rat.instLE.1 m x)) → False)

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
