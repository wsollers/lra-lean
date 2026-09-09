import LRA.Operation.Multiplication.Definition

namespace LRA.Operation.Multiplication

open LRA.Operation

universe u

/--
`Realization` A realized multiplication package exposing an actual `Mul` instance.

Predicate logic:

  structure Realization (Carrier : Type u) where
    spec : Specification Carrier
    instMul : Mul Carrier

Predicate logic (unfolded):

  structure Realization (Carrier : Type u) where
    spec : Specification Carrier
    instMul : Mul Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Realization (Carrier : Type u) where
  spec : Specification Carrier
  instMul : Mul Carrier
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
  instMul : Mul Carrier

instance {Carrier : Type u} : CoeFun (Specification Carrier) (fun _ => Carrier → Carrier → Carrier) where
  coe spec := spec.mul

end LRA.Operation.Multiplication
