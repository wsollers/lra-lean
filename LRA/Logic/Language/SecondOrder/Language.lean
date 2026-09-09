import LRA.Logic.Language.FirstOrder.Signature

namespace LRA.Logic.SecondOrder

/--
`SecondOrderLanguage` is the ordinary non-logical signature used by general second-order syntax. The second-order variable families are syntactic binders, not additional non-logical symbols in the base signature.

Predicate logic:

  abbrev SecondOrderLanguage := Signature

Predicate logic (unfolded):

  abbrev SecondOrderLanguage := Signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev SecondOrderLanguage := Signature
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
abbrev SecondOrderLanguage := Signature

end LRA.Logic.SecondOrder
