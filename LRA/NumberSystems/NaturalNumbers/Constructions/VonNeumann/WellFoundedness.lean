import LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.Carrier
import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann

open LRA.Set.Constructions.ZFCSet.Axioms

/--
`NaturalZeroIsNotSuccessor` TODO

Predicate logic:

  ∀ element : NaturalElement, NaturalSuccessor element ≠ NaturalZero

Predicate logic (unfolded):

  ∀ (element : LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement), ⟨Classical.choose ⋯, ⋯⟩ = LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalZero → False

Logical form (Lean):

```lean
theorem NaturalZeroIsNotSuccessor :
    ∀ element : NaturalElement, NaturalSuccessor element ≠ NaturalZero
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
theorem NaturalZeroIsNotSuccessor :
    ∀ element : NaturalElement, NaturalSuccessor element ≠ NaturalZero := by
  sorry

/--
`NaturalSuccessorInjective` TODO

Predicate logic:

  ∀ first second : NaturalElement, NaturalSuccessor first = NaturalSuccessor second → first = second

Predicate logic (unfolded):

  ∀ (first second : LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement), ⟨(Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsUnionOf (LRA.Set.Constructions.ZFCSet.Axioms.PairSet first.val (LRA.Set.Constructions.ZFCSet.Axioms.TheSingleton first.val))) ⋯).1, ⋯⟩ = ⟨(Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsUnionOf (LRA.Set.Constructions.ZFCSet.Axioms.PairSet second.val (LRA.Set.Constructions.ZFCSet.Axioms.TheSingleton second.val))) ⋯).1, ⋯⟩ → first = second

Logical form (Lean):

```lean
theorem NaturalSuccessorInjective :
    ∀ first second : NaturalElement,
      NaturalSuccessor first = NaturalSuccessor second → first = second
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
theorem NaturalSuccessorInjective :
    ∀ first second : NaturalElement,
      NaturalSuccessor first = NaturalSuccessor second → first = second := by
  sorry

/--
`NaturalInductionPrinciple` TODO

Predicate logic:

  ∀ subset : LRA.Set.Constructions.ZFCSet, NaturalZero ∈ subset → ∀ element ∈ NaturalElement, element ∈ subset → NaturalSuccessor element ∈ subset → ∀ element : NaturalElement, element ∈ subset

Predicate logic (unfolded):

  ∀ (subset : LRA.Set.Constructions.ZFCSet), (LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.instMembershipNaturalElementZFCSet.1 subset LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalZero ∧ ∀ (element : LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement), LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.instMembershipNaturalElementZFCSet.1 subset element → LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.instMembershipNaturalElementZFCSet.1 subset ⟨(Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsUnionOf (LRA.Set.Constructions.ZFCSet.Axioms.PairSet element.val (LRA.Set.Constructions.ZFCSet.Axioms.TheSingleton element.val))) ⋯).val, ⋯⟩) → ∀ (element : LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement), LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.instMembershipNaturalElementZFCSet.1 subset element

Logical form (Lean):

```lean
theorem NaturalInductionPrinciple :
    ∀ subset : LRA.Set.Constructions.ZFCSet,
      NaturalZero ∈ subset →
      (∀ element : NaturalElement, element ∈ subset → NaturalSuccessor element ∈ subset) →
      ∀ element : NaturalElement, element ∈ subset
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
theorem NaturalInductionPrinciple :
    ∀ subset : LRA.Set.Constructions.ZFCSet,
      NaturalZero ∈ subset →
      (∀ element : NaturalElement, element ∈ subset → NaturalSuccessor element ∈ subset) →
      ∀ element : NaturalElement, element ∈ subset := by
  sorry

/--
`VonNeumannPeanoSystem` TODO

Predicate logic:

  noncomputable def VonNeumannPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem NaturalElement LRA.Set.Constructions.ZFCSet where
  one := NaturalZero
  successor := NaturalSuccessor
  one_not_successor := NaturalZeroIsNotSuccessor
  successor_injective := NaturalSuccessorInjective
  induction := NaturalInductionPrinciple

Predicate logic (unfolded):

  noncomputable def VonNeumannPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem NaturalElement LRA.Set.Constructions.ZFCSet where
  one := NaturalZero
  successor := NaturalSuccessor
  one_not_successor := NaturalZeroIsNotSuccessor
  successor_injective := NaturalSuccessorInjective
  induction := NaturalInductionPrinciple (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def VonNeumannPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem NaturalElement LRA.Set.Constructions.ZFCSet where
  one := NaturalZero
  successor := NaturalSuccessor
  one_not_successor := NaturalZeroIsNotSuccessor
  successor_injective := NaturalSuccessorInjective
  induction := NaturalInductionPrinciple
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
noncomputable def VonNeumannPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem NaturalElement LRA.Set.Constructions.ZFCSet where
  one := NaturalZero
  successor := NaturalSuccessor
  one_not_successor := NaturalZeroIsNotSuccessor
  successor_injective := NaturalSuccessorInjective
  induction := NaturalInductionPrinciple

end LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann
