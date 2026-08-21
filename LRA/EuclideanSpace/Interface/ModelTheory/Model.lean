import LRA.EuclideanSpace.Interface.ModelTheory.Theory

namespace LRA.EuclideanSpace

/-!
A Euclidean model in the strict model-theoretic sense:

1. an `L_geom`-structure (`TarskiStructure`);
2. a Euclidean first-order theory (`TarskiTheory`);
3. a proof that the structure satisfies the theory (`TarskiModelOf`).

Earlier code in this repository used `BuildTarskiModel` for step (1),
because `LRA.Logic.FirstOrder.Model` is the repository's generic name for
an `L`-structure. That constructor still exists, but now via
`ModelTheory/Structure.lean` where its role is stated explicitly.
-/

end LRA.EuclideanSpace
