import LRA.Logic.Language.Propositional

namespace LRA.Logic

/--
`ZOLLanguage` Thin compatibility spine for zero-order/propositional languages. This gives the public `LRA.Logic.Language` layer a uniform `ZOL`/`FOL`/`SOL` surface.

Predicate logic:

  abbrev ZOLLanguage := Propositional.PropositionalLanguage

Predicate logic (unfolded):

  abbrev ZOLLanguage := Propositional.PropositionalLanguage (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev ZOLLanguage := Propositional.PropositionalLanguage
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
abbrev ZOLLanguage := Propositional.PropositionalLanguage

end LRA.Logic
