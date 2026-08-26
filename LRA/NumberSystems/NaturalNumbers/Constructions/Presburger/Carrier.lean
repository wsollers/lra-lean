import LRA.Set.Constructions.TypeSet.Definition
import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Presburger

open LRA.Set
open LRA.Set.Constructions

/--
`PresburgerElement` TODO

Predicate logic:

  inductive PresburgerElement where
  | zero
  | succ (n : PresburgerElement)

Predicate logic (unfolded):

  inductive PresburgerElement where
  | zero
  | succ (n : PresburgerElement) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive PresburgerElement where
  | zero
  | succ (n : PresburgerElement)
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
inductive PresburgerElement where
  | zero
  | succ (n : PresburgerElement)

/--
`PresburgerLessThan` TODO

Predicate logic:

  ∀ (a a_1 : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement), (LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement.brecOn.go (motive := fun x => LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement → Prop) a LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerLessThan._f).1 a_1

Predicate logic (unfolded):

  ∀ (a a_1 : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement), (LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement.brecOn.go (motive := fun x => LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement → Prop) a LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerLessThan._f).1 a_1

Logical form (Lean):

```lean
def PresburgerLessThan : PresburgerElement → PresburgerElement → Prop
  | _, .zero => False
  | .zero, .succ _ => True
  | .succ m, .succ n => PresburgerLessThan m n
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
def PresburgerLessThan : PresburgerElement → PresburgerElement → Prop
  | _, .zero => False
  | .zero, .succ _ => True
  | .succ m, .succ n => PresburgerLessThan m n

/--
`PresburgerZeroIsNotSuccessor` TODO

Predicate logic:

  ∀ n : PresburgerElement, PresburgerElement.succ n ≠ PresburgerElement.zero

Predicate logic (unfolded):

  ∀ (n : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement), n.succ = LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement.zero → False

Logical form (Lean):

```lean
theorem PresburgerZeroIsNotSuccessor :
    ∀ n : PresburgerElement, PresburgerElement.succ n ≠ PresburgerElement.zero
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
theorem PresburgerZeroIsNotSuccessor :
    ∀ n : PresburgerElement, PresburgerElement.succ n ≠ PresburgerElement.zero := by
  sorry

/--
`PresburgerSuccessorInjective` TODO

Predicate logic:

  ∀ m n : PresburgerElement, PresburgerElement.succ m = PresburgerElement.succ n → m = n

Predicate logic (unfolded):

  ∀ (m n : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement), m.succ = n.succ → m = n

Logical form (Lean):

```lean
theorem PresburgerSuccessorInjective :
    ∀ m n : PresburgerElement,
      PresburgerElement.succ m = PresburgerElement.succ n → m = n
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
theorem PresburgerSuccessorInjective :
    ∀ m n : PresburgerElement,
      PresburgerElement.succ m = PresburgerElement.succ n → m = n := by
  sorry

/--
`PresburgerInductionPrinciple` TODO

Predicate logic:

  ∀ subset : TypeSet PresburgerElement, PresburgerElement.zero ∈ subset → ∀ n ∈ PresburgerElement, n ∈ subset → PresburgerElement.succ n ∈ subset → ∀ n : PresburgerElement, n ∈ subset

Predicate logic (unfolded):

  ∀ (subset : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement → Prop), (LRA.Set.instMembershipPredicateSet.1 subset LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement.zero ∧ ∀ (n : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement), LRA.Set.instMembershipPredicateSet.1 subset n → LRA.Set.instMembershipPredicateSet.1 subset n.succ) → ∀ (n : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement), LRA.Set.instMembershipPredicateSet.1 subset n

Logical form (Lean):

```lean
theorem PresburgerInductionPrinciple :
    ∀ subset : TypeSet PresburgerElement,
      PresburgerElement.zero ∈ subset →
      (∀ n : PresburgerElement, n ∈ subset → PresburgerElement.succ n ∈ subset) →
      ∀ n : PresburgerElement, n ∈ subset
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
theorem PresburgerInductionPrinciple :
    ∀ subset : TypeSet PresburgerElement,
      PresburgerElement.zero ∈ subset →
      (∀ n : PresburgerElement, n ∈ subset → PresburgerElement.succ n ∈ subset) →
      ∀ n : PresburgerElement, n ∈ subset := by

  sorry

/--
`PresburgerModel` TODO

Predicate logic:

  structure PresburgerModel (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  zero : Element
  successor : Element -> Element
  zero_not_successor :
    forall element : Element,
      successor element ≠ zero
  successor_injective :
    forall first_element second_element : Element,
      successor first_element = successor second_element ->
      first_element = second_element
  induction :
    forall subset : SetObject,
      zero ∈ subset ->
      (forall element : Element,
        element ∈ subset ->
        successor element ∈ subset) ->
      forall element : Element,
        element ∈ subset
  lessThan : Element -> Element -> Prop

Predicate logic (unfolded):

  structure PresburgerModel (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  zero : Element
  successor : Element -> Element
  zero_not_successor :
    forall element : Element,
      successor element ≠ zero
  successor_injective :
    forall first_element second_element : Element,
      successor first_element = successor second_element ->
      first_element = second_element
  induction :
    forall subset : SetObject,
      zero ∈ subset ->
      (forall element : Element,
        element ∈ subset ->
        successor element ∈ subset) ->
      forall element : Element,
        element ∈ subset
  lessThan : Element -> Element -> Prop (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure PresburgerModel (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  zero : Element
  successor : Element -> Element
  zero_not_successor :
    forall element : Element,
      successor element ≠ zero
  successor_injective :
    forall first_element second_element : Element,
      successor first_element = successor second_element ->
      first_element = second_element
  induction :
    forall subset : SetObject,
      zero ∈ subset ->
      (forall element : Element,
        element ∈ subset ->
        successor element ∈ subset) ->
      forall element : Element,
        element ∈ subset
  lessThan : Element -> Element -> Prop
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
structure PresburgerModel (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  zero : Element
  successor : Element -> Element
  zero_not_successor :
    forall element : Element,
      successor element ≠ zero
  successor_injective :
    forall first_element second_element : Element,
      successor first_element = successor second_element ->
      first_element = second_element
  induction :
    forall subset : SetObject,
      zero ∈ subset ->
      (forall element : Element,
        element ∈ subset ->
        successor element ∈ subset) ->
      forall element : Element,
        element ∈ subset
  lessThan : Element -> Element -> Prop

/--
`PresburgerModel.toPeanoSystem` TODO

Predicate logic:

  def PresburgerModel.toPeanoSystem
    {Element : Type u} {SetObject : Type v} [Membership Element SetObject]
    (model : PresburgerModel Element SetObject) :
    LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject where
  one := model.zero
  successor := model.successor
  one_not_successor := model.zero_not_successor
  successor_injective := model.successor_injective
  induction := model.induction

Predicate logic (unfolded):

  def PresburgerModel.toPeanoSystem
    {Element : Type u} {SetObject : Type v} [Membership Element SetObject]
    (model : PresburgerModel Element SetObject) :
    LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject where
  one := model.zero
  successor := model.successor
  one_not_successor := model.zero_not_successor
  successor_injective := model.successor_injective
  induction := model.induction (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PresburgerModel.toPeanoSystem
    {Element : Type u} {SetObject : Type v} [Membership Element SetObject]
    (model : PresburgerModel Element SetObject) :
    LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject where
  one := model.zero
  successor := model.successor
  one_not_successor := model.zero_not_successor
  successor_injective := model.successor_injective
  induction := model.induction
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
def PresburgerModel.toPeanoSystem
    {Element : Type u} {SetObject : Type v} [Membership Element SetObject]
    (model : PresburgerModel Element SetObject) :
    LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject where
  one := model.zero
  successor := model.successor
  one_not_successor := model.zero_not_successor
  successor_injective := model.successor_injective
  induction := model.induction

end LRA.NumberSystems.NaturalNumbers.Constructions.Presburger
