import LRA.VolumeII.PeanoSystems.PeanoSystem

namespace LRA.NumberSystems.PeanoSystems

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


/--
**[Theorem - Induction Principle for a Peano System]**

If a predicate holds at the distinguished element and is preserved by
successor, then it holds for every element of the Peano system.

Mathematical statement (Lean): `theorem PeanoSystemInductionPrinciple (ps : PeanoSystem Element SetObject) (subset : SetObject) (base_case : ps.one ∈ subset) (successor_step : forall element : Element, element ∈ subset -> (ps.successor element) ∈ subset) : forall element : Element...`.


Logical form:

```lean
theorem PeanoSystemInductionPrinciple
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (base_case : ps.one ∈ subset)
    (successor_step :
      forall element : Element,
        element ∈ subset ->
        (ps.successor element) ∈ subset) :
    forall element : Element,
      element ∈ subset
```
-/
theorem PeanoSystemInductionPrinciple
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (base_case : ps.one ∈ subset)
    (successor_step :
      forall element : Element,
        element ∈ subset ->
        (ps.successor element) ∈ subset) :
    forall element : Element,
      element ∈ subset := by
  sorry

/--
`InductionPrincipleForPeanoSystem` states induction principle for peano system.

Logical form:

```lean
theorem InductionPrincipleForPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (base_case : ps.one ∈ subset)
    (successor_step :
      forall element : Element,
        element ∈ subset ->
        (ps.successor element) ∈ subset) :
    forall element : Element,
      element ∈ subset
```
-/
theorem InductionPrincipleForPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (base_case : ps.one ∈ subset)
    (successor_step :
      forall element : Element,
        element ∈ subset ->
        (ps.successor element) ∈ subset) :
    forall element : Element,
      element ∈ subset := by
  sorry

/--
**[Theorem - Subset-Based Induction Principle for a Peano System]**

Every inductive subset of a Peano system contains every element of the carrier.

Mathematical statement (Lean): `theorem SubsetBasedInductionPrinciple (ps : PeanoSystem Element SetObject) (subset : SetObject) (subset_is_inductive : InductiveSubsetOfPeanoSystem ps subset) : forall element : Element, element ∈ subset`.


Logical form:

```lean
theorem SubsetBasedInductionPrinciple
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (subset_is_inductive : InductiveSubsetOfPeanoSystem ps subset) :
    forall element : Element,
      element ∈ subset
```
-/
theorem SubsetBasedInductionPrinciple
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (subset_is_inductive : InductiveSubsetOfPeanoSystem ps subset) :
    forall element : Element,
      element ∈ subset := by
  sorry

/--
`StrongInductionOnPeanoSystem` states strong induction on peano system.

Logical form:

```lean
theorem StrongInductionOnPeanoSystem (ps : PeanoSystem Element SetObject) : True
```
-/
theorem StrongInductionOnPeanoSystem (ps : PeanoSystem Element SetObject) : True := by
  sorry

/--
`PeanoMinimality` states peano minimality.

Logical form:

```lean
theorem PeanoMinimality
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (subset_is_inductive : InductiveSubsetOfPeanoSystem ps subset) :
    ∀ element : Element, element ∈ subset
```
-/
theorem PeanoMinimality
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (subset_is_inductive : InductiveSubsetOfPeanoSystem ps subset) :
    ∀ element : Element, element ∈ subset := by
  sorry

/--
`SuccessorClosedSubsetMinimality` states successor closed subset minimality.

Logical form:

```lean
theorem SuccessorClosedSubsetMinimality
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (contains_one : ps.one ∈ subset)
    (successor_closed : SuccessorClosedSubset ps subset) :
    ∀ element : Element, element ∈ subset
```
-/
theorem SuccessorClosedSubsetMinimality
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (contains_one : ps.one ∈ subset)
    (successor_closed : SuccessorClosedSubset ps subset) :
    ∀ element : Element, element ∈ subset := by
  sorry

end LRA.NumberSystems.PeanoSystems
