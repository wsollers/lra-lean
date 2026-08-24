import LRA.Operation.Definition

namespace LRA.Operation.Laws.Idempotent

open LRA.Operation

universe u

/--
`Idempotent` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (element : Carrier), operation element element = element

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (element : Carrier), operation element element = element

Logical form (Lean):

```lean
def Idempotent {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall element, operation element element = element
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
def Idempotent {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall element, operation element element = element

end LRA.Operation.Laws.Idempotent
