namespace LRA.ProofTheory.System

/--
`ProofSystem` TODO

Predicate logic:

  structure ProofSystem where
  Judgement : Type
  IsInitial : Judgement -> Prop
  Rule : List Judgement -> Judgement -> Prop

Predicate logic (unfolded):

  structure ProofSystem where
  Judgement : Type
  IsInitial : Judgement -> Prop
  Rule : List Judgement -> Judgement -> Prop (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure ProofSystem where
  Judgement : Type
  IsInitial : Judgement -> Prop
  Rule : List Judgement -> Judgement -> Prop
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
structure ProofSystem where
  Judgement : Type
  IsInitial : Judgement -> Prop
  Rule : List Judgement -> Judgement -> Prop

end LRA.ProofTheory.System
