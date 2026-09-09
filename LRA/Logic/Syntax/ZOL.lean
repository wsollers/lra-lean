import LRA.Logic.Syntax.Propositional

namespace LRA.Logic

/--
`ZOLFormula` Thin compatibility spine for zero-order/propositional syntax. This preserves the existing propositional implementation path while exposing a standardized `ZOL` import surface.

Predicate logic:

  abbrev ZOLFormula := Propositional.Formula

Predicate logic (unfolded):

  abbrev ZOLFormula := Propositional.Formula (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev ZOLFormula := Propositional.Formula
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
abbrev ZOLFormula := Propositional.Formula

end LRA.Logic
