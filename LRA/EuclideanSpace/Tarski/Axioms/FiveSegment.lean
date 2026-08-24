import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

/--
`FiveSegment` TODO

Predicate logic:

  (∀ x y z x' y' z' u u' ∈ TarskiPoint), TarskiCongruent z u z' u' end LRA.EuclideanSpace

Predicate logic (unfolded):

  ∀ (x y z x' y' z' u u' : LRA.EuclideanSpace.TarskiPoint), (x = y → False ∧ (LRA.EuclideanSpace.TarskiBetween x y z ∧ (LRA.EuclideanSpace.TarskiBetween x' y' z' ∧ (LRA.EuclideanSpace.TarskiCongruent x y x' y' ∧ (LRA.EuclideanSpace.TarskiCongruent y z y' z' ∧ (LRA.EuclideanSpace.TarskiCongruent x u x' u' ∧ LRA.EuclideanSpace.TarskiCongruent y u y' u')))))) → LRA.EuclideanSpace.TarskiCongruent z u z' u'

Logical form (Lean):

```lean
axiom FiveSegment (x y z x' y' z' u u' : TarskiPoint)
    (xNeY : x ≠ y)
    (bxyz : TarskiBetween x y z) (bxyz' : TarskiBetween x' y' z')
    (xyCongXy' : TarskiCongruent x y x' y')
    (yzCongYz' : TarskiCongruent y z y' z')
    (xuCongXu' : TarskiCongruent x u x' u')
    (yuCongYu' : TarskiCongruent y u y' u') :
    TarskiCongruent z u z' u'
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
axiom FiveSegment (x y z x' y' z' u u' : TarskiPoint)
    (xNeY : x ≠ y)
    (bxyz : TarskiBetween x y z) (bxyz' : TarskiBetween x' y' z')
    (xyCongXy' : TarskiCongruent x y x' y')
    (yzCongYz' : TarskiCongruent y z y' z')
    (xuCongXu' : TarskiCongruent x u x' u')
    (yuCongYu' : TarskiCongruent y u y' u') :
    TarskiCongruent z u z' u'

end LRA.EuclideanSpace
