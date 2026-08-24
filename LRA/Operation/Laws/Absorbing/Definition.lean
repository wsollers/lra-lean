import LRA.Operation.Definition

namespace LRA.Operation.Laws.Absorbing

open LRA.Operation

universe u

/--
`LeftAbsorbing` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (absorber element : Carrier), operation absorber element = absorber

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (absorber element : Carrier), operation absorber element = absorber

Logical form (Lean):

```lean
def LeftAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (absorber : Carrier) : Prop :=
  forall element, operation absorber element = absorber
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
def LeftAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (absorber : Carrier) : Prop :=
  forall element, operation absorber element = absorber

/--
`RightAbsorbing` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (absorber element : Carrier), operation element absorber = absorber

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (absorber element : Carrier), operation element absorber = absorber

Logical form (Lean):

```lean
def RightAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (absorber : Carrier) : Prop :=
  forall element, operation element absorber = absorber
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
def RightAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (absorber : Carrier) : Prop :=
  forall element, operation element absorber = absorber

/--
`TwoSidedAbsorbing` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (absorber : Carrier), (LRA.Operation.Laws.Absorbing.LeftAbsorbing operation absorber ∧ LRA.Operation.Laws.Absorbing.RightAbsorbing operation absorber)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (absorber : Carrier), (∀ (element : Carrier), operation absorber element = absorber ∧ ∀ (element : Carrier), operation element absorber = absorber)

Logical form (Lean):

```lean
def TwoSidedAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (absorber : Carrier) : Prop :=
  LeftAbsorbing operation absorber /\ RightAbsorbing operation absorber
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def TwoSidedAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (absorber : Carrier) : Prop :=
  LeftAbsorbing operation absorber /\ RightAbsorbing operation absorber

end LRA.Operation.Laws.Absorbing
