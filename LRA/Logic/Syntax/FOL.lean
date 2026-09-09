import LRA.Logic.Syntax.Term
import LRA.Logic.Syntax.FirstOrder

namespace LRA.Logic

/--
`FOLTerm` Thin compatibility spine for first-order syntax. This keeps the generic term and formula layer available under a stable `FOL`-named import.

Predicate logic:

  abbrev FOLTerm := FirstOrder.Term

Predicate logic (unfolded):

  abbrev FOLTerm := FirstOrder.Term (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev FOLTerm := FirstOrder.Term
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
abbrev FOLTerm := FirstOrder.Term
/--
`FOLFormula` TODO

Predicate logic:

  abbrev FOLFormula := FirstOrder.Formula

Predicate logic (unfolded):

  abbrev FOLFormula := FirstOrder.Formula (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev FOLFormula := FirstOrder.Formula
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
abbrev FOLFormula := FirstOrder.Formula
/--
`FOLSentence` TODO

Predicate logic:

  abbrev FOLSentence := FirstOrder.Sentence

Predicate logic (unfolded):

  abbrev FOLSentence := FirstOrder.Sentence (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev FOLSentence := FirstOrder.Sentence
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
abbrev FOLSentence := FirstOrder.Sentence

end LRA.Logic
