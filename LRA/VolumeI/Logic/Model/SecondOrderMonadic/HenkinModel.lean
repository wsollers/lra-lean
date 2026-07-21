import Mathlib.Data.Set.Defs
import LRA.VolumeI.Logic.Model.Model

namespace LRA.VolumeI.Logic.SecondOrderMonadic

/-!
Henkin models.

Full second-order semantics quantifies `∀X. φ(X)` over the *entire*
powerset of the domain. This is deliberately avoided here: full semantics
has no complete proof system (a real theorem, not a limitation of this
project), and both compactness and Löwenheim-Skolem fail for it -- the
standard caution for exactly this reason is to build on Henkin semantics
instead, which restores all of that model-theoretic tractability.

A Henkin model is a first-order model (`FirstOrder.Model`) plus a *chosen*
second-order domain: a family of subsets of the domain that `∀X`/`∃X` are
actually allowed to range over, rather than every subset whatsoever. Full
semantics is the special case where this family happens to be all of
`Set Domain`; Henkin semantics does not require it, and for most models
should not use it, precisely to keep the well-behaved model theory intact.

`HenkinModel` extends `FirstOrder.Model` rather than being built from
scratch, because a Henkin model genuinely *is* a first-order model (same
domain, same interpretation of the shared signature) plus one further
field -- not a differently-shaped notion. Every existing fact about
`FirstOrder.Model` (its `Nonempty` instance, reducts, expansions, model
embeddings) applies to the underlying `FirstOrder.Model S` of a
`HenkinModel S` unchanged.

`SecondOrderDomain` carries no closure condition here (e.g. no
comprehension schema requiring "every first-order-definable subset is
present"). This is a deliberate, lighter-weight starting point: closure
conditions are real, substantial content, needed specifically once a
concrete theorem (the Peano induction axiom, Dedekind completeness) is
being proved to hold in a *particular* model -- and are deferred to that
point, per the number-systems work these second-order tools are ultimately
being built to support, rather than paid for now with nothing yet to use
them on.
-/

/-- A Henkin model of the signature `S`: a first-order model, together
with a chosen family of subsets of the domain that second-order
quantification (`∀X`/`∃X`) ranges over. -/
structure HenkinModel (S : Signature) extends FirstOrder.Model S where
  SecondOrderDomain : Set (Set Domain)

end LRA.VolumeI.Logic.SecondOrderMonadic
