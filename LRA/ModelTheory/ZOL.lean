import LRA.ModelTheory.Propositional

namespace LRA.ModelTheory

/--
`ZOLModel` Thin compatibility spine for zero-order/propositional model theory. The public `ZOL` surface re-exports the established propositional implementation path.

Predicate logic:

  abbrev ZOLModel := Propositional.PropositionalModel

Predicate logic (unfolded):

  abbrev ZOLModel := Propositional.PropositionalModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev ZOLModel := Propositional.PropositionalModel
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
abbrev ZOLModel := Propositional.PropositionalModel

end LRA.ModelTheory
