import LRA.EuclideanSpace.Interface.Relations

namespace LRA.EuclideanSpace

/--
`TarskiPoint` TODO

Predicate logic:

  Type

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
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

  fun (first middle last : TarskiPoint) => TarskiBetween first middle last

Predicate logic (unfolded):

  fun (first middle last : TarskiPoint) => TarskiBetween first middle last (opaque predicate axiom; no body to unfold)

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

  fun (firstStart firstEnd secondStart secondEnd : TarskiPoint) => TarskiCongruent firstStart firstEnd secondStart secondEnd

Predicate logic (unfolded):

  fun (firstStart firstEnd secondStart secondEnd : TarskiPoint) => TarskiCongruent firstStart firstEnd secondStart secondEnd (opaque predicate axiom; no body to unfold)

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
