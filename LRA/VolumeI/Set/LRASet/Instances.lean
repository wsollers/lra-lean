import LRA.VolumeI.Set.LRASet.Operations
import LRA.VolumeI.Set.Interface.Operations

/-!
`LRASet` registered against the shared operation classes: Lean's own
notation classes (`Union`, `Inter`, `HasSubset`, `EmptyCollection`,
`Singleton`, `Insert`, `SDiff`), plus this project's capability classes
(`HasComplement`, `HasUniversal`, `HasSymmDiff` from
`Interface/Operations.lean`) for the operations Lean core has no class
for.

The last three are exactly the capabilities Enderton cannot register:
a typed predicate set has an ambient carrier to complement against, so
`Aᶜ`, `𝒰`, and `A ∆ B` all resolve here, and the complement law family
(`Interface/Complement.lean`) becomes available for `LRASet` alone.

All this file does is make notation resolve for `LRASet Alpha`, backed by
the named operations in `Operations.lean` so there is exactly one
definition of each, not two.

Every core-class instance below fully qualifies both the class
(`_root_.X`) and the backing operation (`LRA.VolumeI.Set.LRASet.X`) to
avoid the name collision between this project's PascalCase operation
names and Lean's identically named notation classes -- `Union` the class
and `Union` the operation are different declarations that happen to share
a short name; fully-qualified references are unambiguous regardless of
which is locally in scope.
-/

namespace LRA.VolumeI.Set.LRASet

universe u

variable {Alpha : Type u}

instance : _root_.Union (LRASet Alpha) where
  union := LRA.VolumeI.Set.LRASet.Union

instance : _root_.Inter (LRASet Alpha) where
  inter := LRA.VolumeI.Set.LRASet.Intersection

instance : _root_.HasSubset (LRASet Alpha) where
  Subset := LRA.VolumeI.Set.LRASet.Subset

instance : _root_.EmptyCollection (LRASet Alpha) where
  emptyCollection := LRA.VolumeI.Set.LRASet.Empty Alpha

instance : _root_.Singleton Alpha (LRASet Alpha) where
  singleton := LRA.VolumeI.Set.LRASet.Singleton

instance : _root_.Insert Alpha (LRASet Alpha) where
  insert := LRA.VolumeI.Set.LRASet.Insert

instance : _root_.SDiff (LRASet Alpha) where
  sdiff := LRA.VolumeI.Set.LRASet.Difference

instance : HasComplement (LRASet Alpha) where
  complement := LRA.VolumeI.Set.LRASet.Complement

instance : HasUniversal (LRASet Alpha) where
  universal := LRA.VolumeI.Set.LRASet.Universal Alpha

instance : HasSymmDiff (LRASet Alpha) where
  symmDiff := LRA.VolumeI.Set.LRASet.SymmetricDifference

instance : HasSeparation Alpha (LRASet Alpha) where
  separation := LRA.VolumeI.Set.LRASet.Separation

instance : HasPowerset (LRASet Alpha) (LRASet (LRASet Alpha)) where
  powerset := LRA.VolumeI.Set.LRASet.PowerSet

instance : HasIndexedUnion (LRASet Alpha) where
  indexedUnion := fun family => LRA.VolumeI.Set.LRASet.IndexedUnion family

instance : HasIndexedIntersection (LRASet Alpha) where
  indexedIntersection := fun family =>
    LRA.VolumeI.Set.LRASet.IndexedIntersection family

instance : HasCountableUnion (LRASet Alpha) where
  countableUnion := fun family => LRA.VolumeI.Set.LRASet.IndexedUnion family

instance : HasCountableIntersection (LRASet Alpha) where
  countableIntersection := fun family =>
    LRA.VolumeI.Set.LRASet.IndexedIntersection family

instance : HasCollectionUnion (LRASet Alpha) (LRASet (LRASet Alpha)) where
  collectionUnion := LRA.VolumeI.Set.LRASet.CollectionUnion

instance : HasCollectionIntersection (LRASet Alpha) (LRASet (LRASet Alpha)) where
  collectionIntersection := LRA.VolumeI.Set.LRASet.CollectionIntersection

end LRA.VolumeI.Set.LRASet
