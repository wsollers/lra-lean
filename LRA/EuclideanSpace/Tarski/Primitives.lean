import LRA.EuclideanSpace.Interface.Relations

namespace LRA.EuclideanSpace

/--
`TarskiPoint` TODO

Predicate logic:

  Type

Predicate logic (unfolded):

  Type

Logical form (Lean):

```lean
axiom TarskiPoint : Type
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
axiom TarskiPoint : Type

/--
`TarskiBetween` TODO

Predicate logic:

  TarskiPoint → TarskiPoint → TarskiPoint → Prop

Predicate logic (unfolded):

  LRA.EuclideanSpace.TarskiPoint → LRA.EuclideanSpace.TarskiPoint → LRA.EuclideanSpace.TarskiPoint → Prop (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
axiom TarskiBetween : TarskiPoint → TarskiPoint → TarskiPoint → Prop
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
axiom TarskiBetween : TarskiPoint → TarskiPoint → TarskiPoint → Prop

/--
`TarskiCongruent` TODO

Predicate logic:

  TarskiPoint → TarskiPoint → TarskiPoint → TarskiPoint → Prop instance : Between TarskiPoint

Predicate logic (unfolded):

  LRA.EuclideanSpace.TarskiPoint → LRA.EuclideanSpace.TarskiPoint → LRA.EuclideanSpace.TarskiPoint → LRA.EuclideanSpace.TarskiPoint → Prop (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
axiom TarskiCongruent : TarskiPoint → TarskiPoint → TarskiPoint → TarskiPoint → Prop
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
axiom TarskiCongruent : TarskiPoint → TarskiPoint → TarskiPoint → TarskiPoint → Prop

instance : Between TarskiPoint := ⟨TarskiBetween⟩
instance : Congruent TarskiPoint := ⟨TarskiCongruent⟩

end LRA.EuclideanSpace
