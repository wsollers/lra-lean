import LRA.Operation.Addition.Definition

namespace LRA.Operation.Addition

open LRA.Operation

universe u

/--
`Realization` A realized addition package exposing an actual `Add` instance.

Predicate logic:

  structure Realization (Carrier : Type u) where
    spec : Specification Carrier
    instAdd : Add Carrier

Predicate logic (unfolded):

  structure Realization (Carrier : Type u) where
    spec : Specification Carrier
    instAdd : Add Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Realization (Carrier : Type u) where
  spec : Specification Carrier
  instAdd : Add Carrier
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
structure Realization (Carrier : Type u) where
  spec : Specification Carrier
  instAdd : Add Carrier

instance {Carrier : Type u} : CoeFun (Specification Carrier) (fun _ => Carrier → Carrier → Carrier) where
  coe spec := spec.add

end LRA.Operation.Addition
