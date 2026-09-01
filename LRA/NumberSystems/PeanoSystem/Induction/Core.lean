import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.PeanoSystem.Induction

open LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`PeanoSystemInductionPrinciple` TODO

Predicate logic:

  (∀ A ∈ U), (ps.base ∈ A ∧ forall element : Element, element ∈ A -> (ps.successor element) ∈ A) → forall element : Element, element ∈ A

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (subset : SetObject), (inst.1 subset ps.1 ∧ ∀ (element : Element), inst.1 subset element → inst.1 subset (ps.2 element)) → ∀ (element : Element), inst.1 subset element

Logical form (Lean):

```lean
theorem PeanoSystemInductionPrinciple
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (base_case : ps.base ∈ subset)
    (successor_step :
      forall element : Element,
        element ∈ subset ->
        (ps.successor element) ∈ subset) :
    forall element : Element,
      element ∈ subset
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
theorem PeanoSystemInductionPrinciple
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (base_case : ps.base ∈ subset)
    (successor_step :
      forall element : Element,
        element ∈ subset ->
        (ps.successor element) ∈ subset) :
    forall element : Element,
      element ∈ subset := by
  sorry

/--
`InductionPrincipleForPeanoSystem` TODO

Predicate logic:

  (∀ A ∈ U), (ps.base ∈ A ∧ forall element : Element, element ∈ A -> (ps.successor element) ∈ A) → forall element : Element, element ∈ A

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (subset : SetObject), (inst.1 subset ps.1 ∧ ∀ (element : Element), inst.1 subset element → inst.1 subset (ps.2 element)) → ∀ (element : Element), inst.1 subset element

Logical form (Lean):

```lean
theorem InductionPrincipleForPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (base_case : ps.base ∈ subset)
    (successor_step :
      forall element : Element,
        element ∈ subset ->
        (ps.successor element) ∈ subset) :
    forall element : Element,
      element ∈ subset
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
theorem InductionPrincipleForPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (base_case : ps.base ∈ subset)
    (successor_step :
      forall element : Element,
        element ∈ subset ->
        (ps.successor element) ∈ subset) :
    forall element : Element,
      element ∈ subset := by
  sorry

/--
`SubsetBasedInductionPrinciple` TODO

Predicate logic:

  (∀ A ∈ U), forall element : Element, element ∈ A

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (subset : SetObject), (inst.1 subset ps.1 ∧ ∀ (element : Element), inst.1 subset element → inst.1 subset (ps.2 element)) → ∀ (element : Element), inst.1 subset element

Logical form (Lean):

```lean
theorem SubsetBasedInductionPrinciple
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (subset_is_inductive : InductiveSubsetOfPeanoSystem ps subset) :
    forall element : Element,
      element ∈ subset
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
theorem SubsetBasedInductionPrinciple
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (subset_is_inductive : InductiveSubsetOfPeanoSystem ps subset) :
    forall element : Element,
      element ∈ subset := by
  sorry

/--
`StrongInductionOnPeanoSystem` TODO

Predicate logic:

  (∀ A ∈ U), (forall element : Element, forall predecessor ∈ Element, predecessor ∈ A -> ps.successor predecessor = element -> predecessor ∈ A -> element ∈ A) → forall element : Element, element ∈ A

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (subset : SetObject), (∀ (element : Element), (∀ (predecessor : Element), inst.1 subset predecessor → ps.2 predecessor = element → inst.1 subset predecessor) → inst.1 subset element) → ∀ (element : Element), inst.1 subset element

Logical form (Lean):

```lean
theorem StrongInductionOnPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (strong_step :
      forall element : Element,
        (forall predecessor : Element,
          predecessor ∈ subset ->
          ps.successor predecessor = element ->
          predecessor ∈ subset) ->
        element ∈ subset) :
    forall element : Element,
      element ∈ subset
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
theorem StrongInductionOnPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (strong_step :
      forall element : Element,
        (forall predecessor : Element,
          predecessor ∈ subset ->
          ps.successor predecessor = element ->
          predecessor ∈ subset) ->
        element ∈ subset) :
    forall element : Element,
      element ∈ subset := by
  sorry

/--
`PeanoMinimality` TODO

Predicate logic:

  (∀ A ∈ U), ∀ element : Element, element ∈ A

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (subset : SetObject), (inst.1 subset ps.1 ∧ ∀ (element : Element), inst.1 subset element → inst.1 subset (ps.2 element)) → ∀ (element : Element), inst.1 subset element

Logical form (Lean):

```lean
theorem PeanoMinimality
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (subset_is_inductive : InductiveSubsetOfPeanoSystem ps subset) :
    ∀ element : Element, element ∈ subset
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
theorem PeanoMinimality
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (subset_is_inductive : InductiveSubsetOfPeanoSystem ps subset) :
    ∀ element : Element, element ∈ subset := by
  sorry

/--
`SuccessorClosedSubsetMinimality` TODO

Predicate logic:

  (∀ A ∈ U), (ps.base ∈ A) → ∀ element : Element, element ∈ A

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (subset : SetObject), (inst.1 subset ps.1 ∧ ∀ (element : Element), inst.1 subset element → inst.1 subset (ps.2 element)) → ∀ (element : Element), inst.1 subset element

Logical form (Lean):

```lean
theorem SuccessorClosedSubsetMinimality
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (contains_base : ps.base ∈ subset)
    (successor_closed : SuccessorClosedSubset ps subset) :
    ∀ element : Element, element ∈ subset
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
theorem SuccessorClosedSubsetMinimality
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (contains_base : ps.base ∈ subset)
    (successor_closed : SuccessorClosedSubset ps subset) :
    ∀ element : Element, element ∈ subset := by
  sorry

end LRA.NumberSystems.PeanoSystem.Induction
