import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

/--
`CongruenceTransitivity` TODO

Predicate logic:

  ∀ (x y z w u v : LRA.EuclideanSpace.TarskiPoint), (LRA.EuclideanSpace.TarskiCongruent x y z w ∧ LRA.EuclideanSpace.TarskiCongruent x y u v) → LRA.EuclideanSpace.TarskiCongruent z w u v

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x y z w u v : TarskiPoint
    xyCongZw : TarskiCongruent x y z w
    xyCongUv : TarskiCongruent x y u v
  Prove
    (LRA.EuclideanSpace.TarskiCongruent x y z w ∧ LRA.EuclideanSpace.TarskiCongruent x y u v) → LRA.EuclideanSpace.TarskiCongruent z w u v

Logical form (Lean):

```lean
axiom CongruenceTransitivity (x y z w u v : TarskiPoint)
    (xyCongZw : TarskiCongruent x y z w) (xyCongUv : TarskiCongruent x y u v) :
    TarskiCongruent z w u v
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
axiom CongruenceTransitivity (x y z w u v : TarskiPoint)
    (xyCongZw : TarskiCongruent x y z w) (xyCongUv : TarskiCongruent x y u v) :
    TarskiCongruent z w u v

end LRA.EuclideanSpace
