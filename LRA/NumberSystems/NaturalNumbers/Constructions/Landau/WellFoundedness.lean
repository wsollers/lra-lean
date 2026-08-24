import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Carrier
import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.Set

/--
`LandauBaseNotSuccessor` TODO

Predicate logic:

  ∀ element : LandauElement, LandauSuccessor element ≠ LandauOne

Predicate logic (unfolded):

  ∀ (element : LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement), LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauSuccessor element = LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauOne → False

Logical form (Lean):

```lean
axiom LandauBaseNotSuccessor :
    ∀ element : LandauElement, LandauSuccessor element ≠ LandauOne
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
axiom LandauBaseNotSuccessor :
    ∀ element : LandauElement, LandauSuccessor element ≠ LandauOne

/--
`LandauSuccessorInjective` TODO

Predicate logic:

  ∀ first second : LandauElement, LandauSuccessor first = LandauSuccessor second → first = second

Predicate logic (unfolded):

  ∀ (first second : LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement), LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauSuccessor first = LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauSuccessor second → first = second

Logical form (Lean):

```lean
axiom LandauSuccessorInjective :
    ∀ first second : LandauElement,
      LandauSuccessor first = LandauSuccessor second → first = second
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
axiom LandauSuccessorInjective :
    ∀ first second : LandauElement,
      LandauSuccessor first = LandauSuccessor second → first = second

/--
`LandauInduction` TODO

Predicate logic:

  ∀ subset : PredicateSet LandauElement, LandauOne ∈ subset → ∀ element ∈ LandauElement, element ∈ subset → LandauSuccessor element ∈ subset → ∀ element : LandauElement, element ∈ subset noncomputable def LandauPeanoSystem : LRA.NumberSystems.PeanoSystem.PeanoSystem LandauElement (PredicateSet LandauElement) where one

Predicate logic (unfolded):

  ∀ (subset : LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement → Prop), (LRA.Set.instMembershipPredicateSet.1 subset LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauOne ∧ ∀ (element : LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement), LRA.Set.instMembershipPredicateSet.1 subset element → LRA.Set.instMembershipPredicateSet.1 subset (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauSuccessor element)) → ∀ (element : LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement), LRA.Set.instMembershipPredicateSet.1 subset element

Logical form (Lean):

```lean
axiom LandauInduction :
    ∀ subset : PredicateSet LandauElement,
      LandauOne ∈ subset →
      (∀ element : LandauElement, element ∈ subset → LandauSuccessor element ∈ subset) →
      ∀ element : LandauElement, element ∈ subset
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
axiom LandauInduction :
    ∀ subset : PredicateSet LandauElement,
      LandauOne ∈ subset →
      (∀ element : LandauElement, element ∈ subset → LandauSuccessor element ∈ subset) →
      ∀ element : LandauElement, element ∈ subset

/--
`LandauPeanoSystem` TODO

Predicate logic:

  noncomputable def LandauPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem
      LandauElement (PredicateSet LandauElement) where
  one := LandauOne
  successor := LandauSuccessor
  one_not_successor := LandauBaseNotSuccessor
  successor_injective := LandauSuccessorInjective
  induction := LandauInduction

Predicate logic (unfolded):

  noncomputable def LandauPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem
      LandauElement (PredicateSet LandauElement) where
  one := LandauOne
  successor := LandauSuccessor
  one_not_successor := LandauBaseNotSuccessor
  successor_injective := LandauSuccessorInjective
  induction := LandauInduction (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def LandauPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem
      LandauElement (PredicateSet LandauElement) where
  one := LandauOne
  successor := LandauSuccessor
  one_not_successor := LandauBaseNotSuccessor
  successor_injective := LandauSuccessorInjective
  induction := LandauInduction
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
noncomputable def LandauPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem
      LandauElement (PredicateSet LandauElement) where
  one := LandauOne
  successor := LandauSuccessor
  one_not_successor := LandauBaseNotSuccessor
  successor_injective := LandauSuccessorInjective
  induction := LandauInduction

end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
