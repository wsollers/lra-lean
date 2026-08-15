import LRA.VolumeI.Set.Enderton.Theorems.Theorems
import LRA.VolumeI.Set.Interface.Operations

/-!
`Enderton.Set` registered against Lean's own notation classes (`Union`,
`Inter`, `HasSubset`, `EmptyCollection`, `SDiff`), the same treatment
`LRASet.Instances` already gave `LRASet Alpha`, plus this project's
`HasSymmDiff` (`Interface/Operations.lean`) for the derived symmetric
difference. The `Membership` instance is not here: it lives in
`Primitives.lean`, because `∈` is part of the primitive language, not a
derived operation.

No `Singleton`/`Insert` instance yet -- Enderton's pairing-based
`PairSet`/singleton constructors are not yet phrased as `insert`. No
`HasComplement`/`HasUniversal` instance, ever: Enderton structurally cannot
have an absolute complement or universal set (Russell's paradox), which is
exactly why the complement law family (`Interface/Complement.lean`) is
unavailable at `Set` -- its notation does not elaborate here, so nothing
needs to be faked or stubbed.

Every core-class instance below fully qualifies both the class (`_root_.X`)
and the backing operation (`LRA.Set.Enderton.X`), for the same
reason `LRASet.Instances` does: the class and the operation share a short
name and are different declarations. All operation-backed instances are
`noncomputable` because the operations are chosen witnesses
(`Classical.choose`) of existence theorems; `HasSubset` stays computable
because `Subset` is a plain `Prop`-valued relation.
-/

namespace LRA.Set.Enderton

noncomputable instance : _root_.Union Set where
  union := LRA.Set.Enderton.TheUnion

noncomputable instance : _root_.Inter Set where
  inter := LRA.Set.Enderton.TheIntersection

instance : _root_.HasSubset Set where
  Subset := LRA.Set.Enderton.Subset

noncomputable instance : _root_.EmptyCollection Set where
  emptyCollection := LRA.Set.Enderton.TheEmptySet

noncomputable instance : _root_.SDiff Set where
  sdiff := LRA.Set.Enderton.TheRelativeComplement

noncomputable instance : HasSymmDiff Set where
  symmDiff := LRA.Set.Enderton.TheSymmetricDifference

noncomputable instance : HasSeparation Set Set where
  separation := LRA.Set.Enderton.TheSeparatedSubset

noncomputable instance : HasPowerset Set Set where
  powerset := LRA.Set.Enderton.ThePowerSet

noncomputable instance : HasCollectionUnion Set Set where
  collectionUnion := LRA.Set.Enderton.TheUnionOver

noncomputable instance : HasCollectionIntersection Set Set where
  collectionIntersection := LRA.Set.Enderton.TheIntersectionOver

end LRA.Set.Enderton
