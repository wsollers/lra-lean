import Mathlib.SetTheory.ZFC.Basic
import LRA.VolumeI.Set.Interface.Operations

/-!
Mathlib's `ZFSet` -- the ZFC universe -- registered as an LRA set backend.

The proven counterpart of the `Enderton` chapter: single-sorted, every
element is itself a set, all three levels of the membership tower are
`ZFSet`. Mathlib registers `ZFSet` against `Union`, `Inter`, `SDiff`,
`EmptyCollection`, `HasSubset`, `Membership`, `Insert`, `Singleton`; this
file adds the project capabilities it can have: separation
(`ZFSet.sep`), power set (`ZFSet.powerset`), and a derived symmetric
difference -- the same `(A \ B) ∪ (B \ A)` construction Enderton uses.

Deliberately absent, exactly as for Enderton: `HasComplement` and
`HasUniversal`. ZFC has no universal set (Russell), so the complement law
family does not elaborate at `ZFSet` -- the same capability boundary,
now enforced against Mathlib's own ZFC model.
-/

namespace LRA.VolumeI.Set.MathlibZFSet

/-- Symmetric difference of ZF sets, derived as the union of the two
relative complements -- `ZFSet` has no built-in symmetric difference.

Logical form:

```lean
def SymmetricDifference (A B : ZFSet) : ZFSet := (A \ B) ∪ (B \ A)
```
-/
def SymmetricDifference (A B : ZFSet) : ZFSet := (A \ B) ∪ (B \ A)

/-- Same core-`HasSubset` bridge as `MathlibPredicateSet/Instances.lean`:
Mathlib's `ZFSet` subset notation is `LE.le` under the hood
(`PartialOrder.ofSetLike`), and the interface needs core `HasSubset`. -/
instance : _root_.HasSubset ZFSet where
  Subset := fun A B => A ≤ B

instance : HasSeparation ZFSet ZFSet where
  separation := fun ambient property => ZFSet.sep property ambient

instance : HasPowerset ZFSet ZFSet where
  powerset := ZFSet.powerset

instance : HasSymmDiff ZFSet where
  symmDiff := SymmetricDifference

/-- Countable union, via Replacement: the union over the range of the
`Nat`-indexed family.

Logical form:

```lean
noncomputable def CountableUnion (family : Nat → ZFSet) : ZFSet :=
  ZFSet.sUnion (ZFSet.range family)
```
-/
noncomputable def CountableUnion (family : Nat → ZFSet) : ZFSet :=
  ZFSet.sUnion (ZFSet.range family)

/-- Countable intersection: the intersection over the (always nonempty)
range of the family.

Logical form:

```lean
noncomputable def CountableIntersection (family : Nat → ZFSet) : ZFSet :=
  ZFSet.sInter (ZFSet.range family)
```
-/
noncomputable def CountableIntersection (family : Nat → ZFSet) : ZFSet :=
  ZFSet.sInter (ZFSet.range family)

instance : HasCollectionUnion ZFSet ZFSet where
  collectionUnion := ZFSet.sUnion

instance : HasCollectionIntersection ZFSet ZFSet where
  collectionIntersection := ZFSet.sInter

noncomputable instance : HasCountableUnion ZFSet where
  countableUnion := CountableUnion

noncomputable instance : HasCountableIntersection ZFSet where
  countableIntersection := CountableIntersection

end LRA.VolumeI.Set.MathlibZFSet
