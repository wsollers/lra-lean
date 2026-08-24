import LRA.Operation.Definition

namespace LRA.Operation.Laws.Absorption

open LRA.Operation

universe u

/--
`AbsorptionLaw` TODO

Predicate logic:

  ∀ {Carrier : Type u} (outer inner : LRA.Operation.BinaryEndoOperation Carrier) (left right : Carrier), outer left (inner left right) = left

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (outer inner : Carrier → Carrier → Carrier) (left right : Carrier), outer left (inner left right) = left

Logical form (Lean):

```lean
def AbsorptionLaw {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  ∀ left right, outer left (inner left right) = left
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
def AbsorptionLaw {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  ∀ left right, outer left (inner left right) = left

/--
`MutualAbsorptionLaw` TODO

Predicate logic:

  ∀ {Carrier : Type u} (first second : LRA.Operation.BinaryEndoOperation Carrier), (LRA.Operation.Laws.Absorption.AbsorptionLaw first second ∧ LRA.Operation.Laws.Absorption.AbsorptionLaw second first)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (first second : Carrier → Carrier → Carrier), (∀ (left right : Carrier), first left (second left right) = left ∧ ∀ (left right : Carrier), second left (first left right) = left)

Logical form (Lean):

```lean
def MutualAbsorptionLaw {Carrier : Type u}
    (first second : BinaryEndoOperation Carrier) : Prop :=
  AbsorptionLaw first second ∧ AbsorptionLaw second first
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
def MutualAbsorptionLaw {Carrier : Type u}
    (first second : BinaryEndoOperation Carrier) : Prop :=
  AbsorptionLaw first second ∧ AbsorptionLaw second first

end LRA.Operation.Laws.Absorption
