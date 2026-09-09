import LRA.Identity.Interface.ModelTheory.SOL.Henkin
import LRA.ModelTheory.SecondOrder.FullModel

namespace LRA.Identity.ModelTheory.SOL

open LRA.Logic

/--
`IsFull` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} (M : LRA.ModelTheory.SecondOrder.HenkinModel S), ((∀ (arity : Nat) (relation_ : (Fin arity → M.Domain) → Prop), relation_ ∈ M.RelationDomain arity) ∧ (∀ (arity : Nat) (function_ : (Fin arity → M.Domain) → M.Domain), function_ ∈ M.FunctionDomain arity))

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} (M : LRA.ModelTheory.SecondOrder.HenkinModel S), ((∀ (arity : Nat) (relation_ : (Fin arity → M.Domain) → Prop), relation_ ∈ M.RelationDomain arity) ∧ (∀ (arity : Nat) (function_ : (Fin arity → M.Domain) → M.Domain), function_ ∈ M.FunctionDomain arity))

Logical form (Lean):

```lean
def HasFullSecondOrderSemantics {S : Signature} (M : HenkinModel S) : Prop :=
  (∀ arity (relation_ : (Fin arity → M.Domain) → Prop),
      relation_ ∈ M.RelationDomain arity) ∧
    ∀ arity (function_ : (Fin arity → M.Domain) → M.Domain),
      function_ ∈ M.FunctionDomain arity
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
abbrev IsFull {S : Signature}
    (M : LRA.ModelTheory.SecondOrder.HenkinModel S) : Prop :=
  LRA.ModelTheory.SecondOrder.HasFullSecondOrderSemantics M

end LRA.Identity.ModelTheory.SOL
