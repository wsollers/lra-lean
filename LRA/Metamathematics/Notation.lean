import LRA.Metamathematics.Notation.LogicalSymbols

namespace LRA.Metamathematics

/--
`notationWiringTest` TODO

Predicate logic:

  forall proposition : Prop, proposition -> proposition

Predicate logic (unfolded):

  ∀ (proposition : Prop), proposition → proposition

Logical form (Lean):

```lean
theorem notationWiringTest :
    forall proposition : Prop, proposition -> proposition
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
theorem notationWiringTest :
    forall proposition : Prop, proposition -> proposition := by
  intro proposition proof
  exact proof

end LRA.Metamathematics
