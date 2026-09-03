import LRA.ProofTheory.System.Basic

namespace LRA.ProofTheory.System

/--
`Derivable` TODO

Predicate logic:

  inductive Derivable (P : ProofSystem) : P.Judgement -> Prop
  | initial {J : P.Judgement} :
      P.IsInitial J ->
      Derivable P J
  | infer {uppers : List P.Judgement} {lower : P.Judgement} :
      P.Rule uppers lower ->
      (forall J, J ∈ uppers -> Derivable P J) ->
      Derivable P lower

Predicate logic (unfolded):

  inductive Derivable (P : ProofSystem) : P.Judgement -> Prop
  | initial {J : P.Judgement} :
      P.IsInitial J ->
      Derivable P J
  | infer {uppers : List P.Judgement} {lower : P.Judgement} :
      P.Rule uppers lower ->
      (forall J, J ∈ uppers -> Derivable P J) ->
      Derivable P lower (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive Derivable (P : ProofSystem) : P.Judgement -> Prop
  | initial {J : P.Judgement} :
      P.IsInitial J ->
      Derivable P J
  | infer {uppers : List P.Judgement} {lower : P.Judgement} :
      P.Rule uppers lower ->
      (forall J, J ∈ uppers -> Derivable P J) ->
      Derivable P lower
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
inductive Derivable (P : ProofSystem) : P.Judgement -> Prop
  | initial {J : P.Judgement} :
      P.IsInitial J ->
      Derivable P J
  | infer {uppers : List P.Judgement} {lower : P.Judgement} :
      P.Rule uppers lower ->
      (forall J, J ∈ uppers -> Derivable P J) ->
      Derivable P lower

end LRA.ProofTheory.System
