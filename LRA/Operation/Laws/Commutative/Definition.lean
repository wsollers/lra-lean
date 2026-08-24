import LRA.Operation.Definition

namespace LRA.Operation.Laws.Commutative

open LRA.Operation

universe u

/--
`Commutative` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (first second : Carrier), operation first second = operation second first

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (first second : Carrier), operation first second = operation second first

Logical form (Lean):

```lean
def Commutative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall first second, operation first second = operation second first
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
def Commutative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall first second, operation first second = operation second first

end LRA.Operation.Laws.Commutative
