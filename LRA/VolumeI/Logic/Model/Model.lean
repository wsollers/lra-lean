import LRA.VolumeI.Logic.Language.FirstOrder.Signature

namespace LRA.VolumeI.Logic.FirstOrder

universe u

/-!
Models (L-structures) for Volume I.

Declared in the `LRA.VolumeI.Logic.FirstOrder` namespace, matching
`FirstOrder.Formula` -- `Model` is first-order-specific content (built on
`Signature`, which is shared, cross-logic vocabulary and stays in the bare
`LRA.VolumeI.Logic` namespace), not something every object logic shares
the same way `Signature` itself is shared.

A model of a signature `S` interprets `S`'s vocabulary over an actual
domain: a type of elements, together with an actual function on that type
for every function symbol of `S`, an actual relation on that type for every
relation symbol of `S`, and an actual distinguished element of that type for
every constant symbol of `S`. This is the standard model-theoretic notion
of an "L-structure" -- domain plus interpretation -- specialized to Lean's
type theory rather than to ZFC's naive set framing.

The domain is represented as `Domain : Type`, not `Domain : Set Universe`
for some ambient `Universe`. In the usual set-theoretic treatment "the
domain is a set A" carries hidden bookkeeping a human reader tracks for
free: every element mentioned from then on is trusted, by context, to
already be a member of `A`. Lean cannot track that silently -- a `Set`
forces every element to carry its membership proof explicitly, forever,
which reproduces that bookkeeping as visible ceremony rather than actual
mathematical content. Using `Domain : Type` gets the same guarantee
("every element I write down is already in the domain") for free, via
Lean's own typing judgment, with nothing lost and nothing hidden.

`Model` is built directly on `Signature`, not on any particular object
logic's `Formula` -- interpreting a vocabulary is prior to and independent
of whatever connectives or binders are eventually layered on top of it.
-/

/-- A model (L-structure) of the signature `S`: a domain, together with an
interpretation of every function symbol as an actual function on the
domain, every relation symbol as an actual relation on the domain, and
every constant symbol as an actual element of the domain.

The domain is required to be nonempty, matching the standard model-theoretic
convention (a model with an empty domain would make universal instantiation
unsound: `∀x. φ(x)` would hold vacuously with no witness to instantiate).
This is a proof obligation, discharged once per concrete model -- for any
domain built from an inhabited type, it is typically immediate via
`inferInstance` or a one-element witness. -/
structure Model (S : Signature) where
  Domain : Type u
  domainNonempty : Nonempty Domain
  interpretFunction :
    (f : S.FunctionSymbol) -> (Fin (S.functionArity f) -> Domain) -> Domain
  interpretRelation :
    (r : S.RelationSymbol) -> (Fin (S.relationArity r) -> Domain) -> Prop
  interpretConstant :
    S.Constants -> Domain

/-- Every model automatically registers as a `Nonempty` instance of its own
domain, so proofs generic over an arbitrary `Model S` can call on
`inferInstance`/`Classical.arbitrary` to obtain a witness without re-deriving
nonemptiness by hand each time. -/
instance {S : Signature} (M : Model S) : Nonempty M.Domain :=
  M.domainNonempty

end LRA.VolumeI.Logic.FirstOrder
