import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

/--
`BetweennessIdentity` TODO

Predicate logic:

  (∀ x y ∈ TarskiPoint), x = y end LRA.EuclideanSpace

Predicate logic (unfolded):

  ∀ (x y : LRA.EuclideanSpace.TarskiPoint), LRA.EuclideanSpace.TarskiBetween x y x → x = y

Logical form (Lean):

```lean
axiom BetweennessIdentity (x y : TarskiPoint)
    (bxyx : TarskiBetween x y x) : x = y
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
axiom BetweennessIdentity (x y : TarskiPoint)
    (bxyx : TarskiBetween x y x) : x = y

end LRA.EuclideanSpace
