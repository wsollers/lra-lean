import LRA.Operation.Addition.Definition

namespace LRA.Operation.Addition

universe u

/--
`UniqueOn` Uniqueness predicate for later refinement of a generic addition witness.

Predicate logic:

  ∀ (Carrier : Type u) (first second : LRA.Operation.Addition.Specification Carrier), first = second

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    first = second

Logical form (Lean):

```lean
def UniqueOn (Carrier : Type u) : Prop :=
  ∀ first second : Specification Carrier, first = second
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
def UniqueOn (Carrier : Type u) : Prop :=
  ∀ first second : Specification Carrier, first = second

end LRA.Operation.Addition

