import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

/--
`CongruenceReflexivity` TODO

Predicate logic:

  ∀ (x y : LRA.EuclideanSpace.TarskiPoint), LRA.EuclideanSpace.TarskiCongruent x y y x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x y : TarskiPoint
  Prove
    LRA.EuclideanSpace.TarskiCongruent x y y x

Logical form (Lean):

```lean
axiom CongruenceReflexivity (x y : TarskiPoint) :
    TarskiCongruent x y y x
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
axiom CongruenceReflexivity (x y : TarskiPoint) :
    TarskiCongruent x y y x

end LRA.EuclideanSpace
