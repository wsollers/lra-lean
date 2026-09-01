import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Carrier
import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Presburger

open LRA.Set
open LRA.Set.Constructions

/--
`PresburgerPeanoSystem` TODO

Predicate logic:

  def PresburgerPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem
      PresburgerElement (TypeSet PresburgerElement) where
  base := PresburgerElement.zero
  successor := PresburgerElement.succ
  one_not_successor := PresburgerZeroIsNotSuccessor
  successor_injective := PresburgerSuccessorInjective
  induction := PresburgerInductionPrinciple

Predicate logic (unfolded):

  def PresburgerPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem
      PresburgerElement (TypeSet PresburgerElement) where
  base := PresburgerElement.zero
  successor := PresburgerElement.succ
  one_not_successor := PresburgerZeroIsNotSuccessor
  successor_injective := PresburgerSuccessorInjective
  induction := PresburgerInductionPrinciple (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PresburgerPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem
      PresburgerElement (TypeSet PresburgerElement) where
  base := PresburgerElement.zero
  successor := PresburgerElement.succ
  one_not_successor := PresburgerZeroIsNotSuccessor
  successor_injective := PresburgerSuccessorInjective
  induction := PresburgerInductionPrinciple
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
def PresburgerPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem
      PresburgerElement (TypeSet PresburgerElement) where
  base := PresburgerElement.zero
  successor := PresburgerElement.succ
  one_not_successor := PresburgerZeroIsNotSuccessor
  successor_injective := PresburgerSuccessorInjective
  induction := PresburgerInductionPrinciple

universe u v
variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`PresburgerArithmetic` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel Element SetObject), (∀ (element : Element), Ne (model.successor element) model.zero ∧ (∀ (first_element second_element : Element), model.successor first_element = model.successor second_element → first_element = second_element ∧ ∀ (subset : SetObject), model.zero ∈ subset → (∀ (element : Element), element ∈ subset → model.successor element ∈ subset) → ∀ (element : Element), element ∈ subset))

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel Element SetObject), (∀ (element : Element), model.2 element = model.1 → False ∧ (∀ (first_element second_element : Element), model.2 first_element = model.2 second_element → first_element = second_element ∧ ∀ (subset : SetObject), inst.1 subset model.1 → (∀ (element : Element), inst.1 subset element → inst.1 subset (model.2 element)) → ∀ (element : Element), inst.1 subset element))

Logical form (Lean):

```lean
def PresburgerArithmetic
    (model : PresburgerModel Element SetObject) : Prop :=
  (forall element : Element,
    model.successor element ≠ model.zero) /\
  (forall first_element second_element : Element,
    model.successor first_element = model.successor second_element ->
      first_element = second_element) /\
  (forall subset : SetObject,
    model.zero ∈ subset ->
    (forall element : Element,
      element ∈ subset ->
      model.successor element ∈ subset) ->
    forall element : Element,
      element ∈ subset)
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
def PresburgerArithmetic
    (model : PresburgerModel Element SetObject) : Prop :=
  (forall element : Element,
    model.successor element ≠ model.zero) /\
  (forall first_element second_element : Element,
    model.successor first_element = model.successor second_element ->
      first_element = second_element) /\
  (forall subset : SetObject,
    model.zero ∈ subset ->
    (forall element : Element,
      element ∈ subset ->
      model.successor element ∈ subset) ->
    forall element : Element,
      element ∈ subset)

end LRA.NumberSystems.NaturalNumbers.Constructions.Presburger
