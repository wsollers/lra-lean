namespace LRA.EuclideanSpace

universe u

/--
`Between` TODO

Predicate logic:

  class Between (Point : Type u) where
  between : Point → Point → Point → Prop

Predicate logic (unfolded):

  class Between (Point : Type u) where
  between : Point → Point → Point → Prop (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class Between (Point : Type u) where
  between : Point → Point → Point → Prop
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
class Between (Point : Type u) where
  between : Point → Point → Point → Prop

/--
`Congruent` TODO

Predicate logic:

  class Congruent (Point : Type u) where
  congruent : Point → Point → Point → Point → Prop

Predicate logic (unfolded):

  class Congruent (Point : Type u) where
  congruent : Point → Point → Point → Point → Prop (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class Congruent (Point : Type u) where
  congruent : Point → Point → Point → Point → Prop
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
class Congruent (Point : Type u) where
  congruent : Point → Point → Point → Point → Prop

export Between (between)
export Congruent (congruent)

end LRA.EuclideanSpace
