import LRA.EuclideanSpace.Tarski.Primitives
import LRA.EuclideanSpace.Tarski.Axioms
import LRA.EuclideanSpace.Tarski.Laws

/-!
Aggregate import for the `Tarski` concept: the in-house axiomatic
realization of Tarski's `{Between, Congruent}` axiomatization of
`n`-dimensional Euclidean geometry (`E_n`), mirroring `LRA.Set.ZFC`'s own
`Primitives`/`Axioms`/`Laws` split. The generic vocabulary and model
registration (`TarskiFirstOrderSignature`, `BuildTarskiModel`) are not
part of this concept -- they are shared, backend-agnostic infrastructure
and live in `LRA.EuclideanSpace.Interface`.

* `TarskiPoint`, `TarskiBetween`, `TarskiCongruent` -- the primitive,
  opaque carrier and relations of the in-house axiomatic universe --
  live in `Tarski/Primitives.lean`.
* Tarski's eleven axioms about that carrier live in `Tarski/Axioms.lean`.
* `Tarski/Laws.lean` proves the in-house realization satisfies the
  generic, backend-agnostic law-classes in `LRA.EuclideanSpace.Interface`
  -- the same role `LRA.Set.ZFCSet.Laws` plays for `ZFCSet` against
  `LRA.Set.Interface`.
-/
