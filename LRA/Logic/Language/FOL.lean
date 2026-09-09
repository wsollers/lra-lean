import LRA.Logic.Language.FirstOrder

namespace LRA.Logic

/--
`FOLLanguage` Thin compatibility spine for first-order languages. This is the canonical `LRA.Logic.Language` entrypoint for first-order syntax-level language imports.

Predicate logic:

  abbrev FOLLanguage := FirstOrderLanguage

Predicate logic (unfolded):

  abbrev FOLLanguage := FirstOrderLanguage (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev FOLLanguage := FirstOrderLanguage
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
abbrev FOLLanguage := FirstOrderLanguage

end LRA.Logic
