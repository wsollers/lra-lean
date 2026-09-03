import Mathlib.Data.Set.Defs
import LRA.ModelTheory.Model

open LRA.Logic

namespace LRA.ModelTheory.SecondOrderMonadic

/--
`HenkinModel` TODO

Predicate logic:

  structure HenkinModel (S : Signature) extends ModelTheory.FirstOrder.Model S where
  SecondOrderDomain : Set (Set Domain)

Predicate logic (unfolded):

  structure HenkinModel (S : Signature) extends ModelTheory.FirstOrder.Model S where
  SecondOrderDomain : Set (Set Domain) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure HenkinModel (S : Signature) extends ModelTheory.FirstOrder.Model S where
  SecondOrderDomain : Set (Set Domain)

/-- Compatibility projection for first-order interpretation data. -/
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

Related proof moves: TODO

-/
structure HenkinModel (S : Signature) extends ModelTheory.FirstOrder.Model S where
  SecondOrderDomain : Set (Set Domain)

/-- Compatibility projection for first-order interpretation data. -/
abbrev HenkinModel.toModel {S : Signature} (M : HenkinModel S) :=
  M.toInterpretation

/--
`HasFullSecondOrderSemantics` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} (M : LRA.ModelTheory.SecondOrderMonadic.HenkinModel S) (subset : Set M.Domain), Set.instMembership.mem M.SecondOrderDomain subset

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} (M : LRA.ModelTheory.SecondOrderMonadic.HenkinModel S) (subset : M.toModel.1 → Prop), Set.instMembership.1 M.2 subset

Logical form (Lean):

```lean
def HasFullSecondOrderSemantics {S : Signature} (M : HenkinModel S) : Prop :=
  ∀ subset : Set M.Domain, subset ∈ M.SecondOrderDomain
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def HasFullSecondOrderSemantics {S : Signature} (M : HenkinModel S) : Prop :=
  ∀ subset : Set M.Domain, subset ∈ M.SecondOrderDomain

end LRA.ModelTheory.SecondOrderMonadic
