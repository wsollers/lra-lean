import Mathlib.Data.Set.Defs
import LRA.ModelTheory.Model

open LRA.Logic

namespace LRA.ModelTheory.SecondOrder

/--
`HenkinModel` General Henkin second-order models carry designated admissible domains for relation and function variables at each finite arity.

Predicate logic:

  structure HenkinModel (S : Signature) extends ModelTheory.FirstOrder.Model S where
    RelationDomain : (arity : Nat) → Set ((Fin arity → Domain) → Prop)
    FunctionDomain : (arity : Nat) → Set ((Fin arity → Domain) → Domain)

Predicate logic (unfolded):

  structure HenkinModel (S : Signature) extends ModelTheory.FirstOrder.Model S where
    RelationDomain : (arity : Nat) → Set ((Fin arity → Domain) → Prop)
    FunctionDomain : (arity : Nat) → Set ((Fin arity → Domain) → Domain) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure HenkinModel (S : Signature) extends ModelTheory.FirstOrder.Model S where
  RelationDomain : (arity : Nat) → Set ((Fin arity → Domain) → Prop)
  FunctionDomain : (arity : Nat) → Set ((Fin arity → Domain) → Domain)
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
structure HenkinModel (S : Signature) extends ModelTheory.FirstOrder.Model S where
  RelationDomain : (arity : Nat) → Set ((Fin arity → Domain) → Prop)
  FunctionDomain : (arity : Nat) → Set ((Fin arity → Domain) → Domain)

/--
`HenkinModel.toModel` Compatibility projection for first-order interpretation data.

Predicate logic:

  abbrev HenkinModel.toModel {S : Signature} (M : HenkinModel S) :=
    M.toInterpretation

Predicate logic (unfolded):

  abbrev HenkinModel.toModel {S : Signature} (M : HenkinModel S) :=
    M.toInterpretation (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev HenkinModel.toModel {S : Signature} (M : HenkinModel S) :=
  M.toInterpretation
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
abbrev HenkinModel.toModel {S : Signature} (M : HenkinModel S) :=
  M.toInterpretation

/--
`HasFullSecondOrderSemantics` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} (M : LRA.ModelTheory.SecondOrder.HenkinModel S), ((∀ (arity : Nat) (relation_ : (Fin arity → M.Domain) → Prop), relation_ ∈ M.RelationDomain arity) ∧ (∀ (arity : Nat) (function_ : (Fin arity → M.Domain) → M.Domain), function_ ∈ M.FunctionDomain arity))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (arity : Nat) (relation_ : (Fin arity → M.toInterpretation.1) → Prop), relation_ ∈ M.2 arity) ∧ (∀ (arity : Nat) (function_ : (Fin arity → M.toInterpretation.1) → M.toInterpretation.1), function_ ∈ M.3 arity))

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
def HasFullSecondOrderSemantics {S : Signature} (M : HenkinModel S) : Prop :=
  (∀ arity (relation_ : (Fin arity → M.Domain) → Prop),
      relation_ ∈ M.RelationDomain arity) ∧
    ∀ arity (function_ : (Fin arity → M.Domain) → M.Domain),
      function_ ∈ M.FunctionDomain arity

end LRA.ModelTheory.SecondOrder
