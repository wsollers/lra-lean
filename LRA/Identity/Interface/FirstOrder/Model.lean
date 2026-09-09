import LRA.Identity.Interface.FirstOrder.LStructure
import LRA.Logic.Semantics.Interpretation

namespace LRA.Identity.Interface.FirstOrder

/--
`Model` TODO

Predicate logic:

  structure Model (L : LStructure) where
    interpretation : LRA.Logic.FirstOrder.Interpretation L.signature
    Identity : interpretation.Domain -> interpretation.Domain -> Prop

Predicate logic (unfolded):

  structure Model (L : LStructure) where
    interpretation : LRA.Logic.FirstOrder.Interpretation L.signature
    Identity : interpretation.Domain -> interpretation.Domain -> Prop

Logical form (Lean):

```lean
structure Model (L : LStructure) where
  interpretation : LRA.Logic.FirstOrder.Interpretation L.signature
  Identity : interpretation.Domain -> interpretation.Domain -> Prop
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
structure Model (L : LStructure) where
  interpretation : LRA.Logic.FirstOrder.Interpretation L.signature
  Identity : interpretation.Domain -> interpretation.Domain -> Prop

end LRA.Identity.Interface.FirstOrder
