import LRA.EuclideanSpace.Tarski.Signature
import LRA.EuclideanSpace.Tarski.Model
import LRA.EuclideanSpace.Tarski.Primitives
import LRA.EuclideanSpace.Tarski.Axioms
import LRA.EuclideanSpace.Tarski.Laws

/-!
Aggregate import for the `Tarski` concept: the in-house axiomatic
realization of Tarski's `{Between, Congruent}` axiomatization of
`n`-dimensional Euclidean geometry (`E_n`), mirroring `LRA.Set.ZFC`'s own
`Signature`/`Primitives`/`Axioms`/`Laws` split.

* `TarskiRelationSymbol` and `TarskiFirstOrderSignature` live in
  `Tarski/Signature.lean`; `BuildTarskiModel` (a generic model builder,
  not tied to this concrete realization) lives in `Tarski/Model.lean`.
* `TarskiPoint`, `TarskiBetween`, `TarskiCongruent` -- the primitive,
  opaque carrier and relations of the in-house axiomatic universe --
  live in `Tarski/Primitives.lean`.
* Tarski's eleven axioms about that carrier live in `Tarski/Axioms.lean`.
* `Tarski/Laws.lean` proves the in-house realization satisfies the
  generic, backend-agnostic law-classes in `LRA.EuclideanSpace.Interface`
  -- the same role `LRA.Set.ZFCSet.Laws` plays for `ZFCSet` against
  `LRA.Set.Interface`.
-/
