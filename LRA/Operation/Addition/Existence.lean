import LRA.Operation.Addition.Definition
import LRA.Operation.Laws.Closure.Definition

namespace LRA.Operation.Addition

open LRA.Operation

universe u

/--
`ExistsOn` Existence of a generic addition witness on a carrier.

Predicate logic:

  ∀ (Carrier : Type u), Nonempty (LRA.Operation.Addition.Specification Carrier)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Nonempty (LRA.Operation.Addition.Specification Carrier)

Logical form (Lean):

```lean
def ExistsOn (Carrier : Type u) : Prop :=
  Nonempty (Specification Carrier)
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
def ExistsOn (Carrier : Type u) : Prop :=
  Nonempty (Specification Carrier)

end LRA.Operation.Addition
