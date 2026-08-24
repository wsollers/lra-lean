import Mathlib.SetTheory.ZFC.Basic
import LRA.Set.Interface.Operations

namespace LRA.Set.MathlibZFSet

/--
`SymmetricDifference` TODO

Predicate logic:

  def SymmetricDifference (A B : ZFSet) : ZFSet := (A \ B) ∪ (B \ A)

Predicate logic (unfolded):

  def SymmetricDifference (A B : ZFSet) : ZFSet := (A \ B) ∪ (B \ A) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SymmetricDifference (A B : ZFSet) : ZFSet := (A \ B) ∪ (B \ A)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def SymmetricDifference (A B : ZFSet) : ZFSet := (A \ B) ∪ (B \ A)

instance : _root_.HasSubset ZFSet where
  Subset := fun A B => A ≤ B

instance : HasSeparation ZFSet ZFSet where
  separation := fun ambient property => ZFSet.sep property ambient

instance : HasPowerset ZFSet ZFSet where
  powerset := ZFSet.powerset

instance : HasSymmDiff ZFSet where
  symmDiff := SymmetricDifference

/--
`CountableUnion` TODO

Predicate logic:

  noncomputable def CountableUnion (family : Nat → ZFSet) : ZFSet :=
  ZFSet.sUnion (ZFSet.range family)

Predicate logic (unfolded):

  noncomputable def CountableUnion (family : Nat → ZFSet) : ZFSet :=
  ZFSet.sUnion (ZFSet.range family) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def CountableUnion (family : Nat → ZFSet) : ZFSet :=
  ZFSet.sUnion (ZFSet.range family)
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
noncomputable def CountableUnion (family : Nat → ZFSet) : ZFSet :=
  ZFSet.sUnion (ZFSet.range family)

/--
`CountableIntersection` TODO

Predicate logic:

  noncomputable def CountableIntersection (family : Nat → ZFSet) : ZFSet :=
  ZFSet.sInter (ZFSet.range family)

Predicate logic (unfolded):

  noncomputable def CountableIntersection (family : Nat → ZFSet) : ZFSet :=
  ZFSet.sInter (ZFSet.range family) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def CountableIntersection (family : Nat → ZFSet) : ZFSet :=
  ZFSet.sInter (ZFSet.range family)
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

end LRA.Set.MathlibZFSet
