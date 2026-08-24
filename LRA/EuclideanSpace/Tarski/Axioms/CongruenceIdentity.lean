import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

/--
`CongruenceIdentity` TODO

Predicate logic:

  (∀ x y z ∈ TarskiPoint), x = y end LRA.EuclideanSpace

Predicate logic (unfolded):

  ∀ (x y z : LRA.EuclideanSpace.TarskiPoint), LRA.EuclideanSpace.TarskiCongruent x y z z → x = y

Logical form (Lean):

```lean
axiom CongruenceIdentity (x y z : TarskiPoint)
    (xyCongZz : TarskiCongruent x y z z) : x = y
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
axiom CongruenceIdentity (x y z : TarskiPoint)
    (xyCongZz : TarskiCongruent x y z z) : x = y

end LRA.EuclideanSpace
