import LRA.VolumeI.Set.Algebra.Closure
import LRA.VolumeI.Set.Algebra.Ring
import LRA.VolumeI.Set.Algebra.BooleanAlgebra
import LRA.VolumeI.Set.Algebra.SigmaAlgebra
import LRA.VolumeI.Set.Algebra.DeltaAlgebra
import LRA.VolumeI.Set.Algebra.BorelAlgebra
import LRA.VolumeI.Set.Algebra.Instantiations

/-!
Aggregate import for algebras of collections of sets: closure predicates,
and the signature/laws/model bundles for rings, algebras, sigma-rings,
sigma-algebras, delta-rings, and Borel algebras of sets.

Reworked to the ambient-relative design: each structure bundles a
*collection* (`IsMember`) with its closure proofs, stated relative to an
explicit `ambient` set and over the backend's own operations via the
capability classes -- so membership and law certificates apply inside
closure arguments, and no operation is duplicated or untethered. A
collection algebra is a first-class mathematical object (measure theory
quantifies over sigma-algebras), which is why the collection stays
bundled while the backend does not. Relative complement keeps every
backend eligible: ZF-style backends host algebras of sets on any ambient
set they can form. Sigma-structures additionally require the
`HasCountableUnion` capability. `BorelAlgebra.lean` defines *generated*
sigma-algebras -- minimality is a theorem, not a recorded promise.
-/
