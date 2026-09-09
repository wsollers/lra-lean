import LRA.Identity.Interface.ZeroOrder.LStructure

namespace LRA.Identity.Interface.ZeroOrder

/--
`Model` TODO

Predicate logic:

  structure Model (L : LStructure) where
    Holds : L.Formula -> Prop

Predicate logic (unfolded):

  structure Model (L : LStructure) where
    Holds : L.Formula -> Prop

Logical form (Lean):

```lean
structure Model (L : LStructure) where
  Holds : L.Formula -> Prop
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
  Holds : L.Formula -> Prop

end LRA.Identity.Interface.ZeroOrder
