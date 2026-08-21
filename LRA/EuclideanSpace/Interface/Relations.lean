namespace LRA.EuclideanSpace

universe u

/-!
The two capability typeclasses every concrete realization (`Tarski`, a
future Mathlib-backed one) registers an instance of, mirroring how
`LRA.Set.Interface`'s law-classes are parametrized over native `Union`/
`Inter`/`Membership` instances rather than any one backend's concrete
operations. `Between`/`Congruent` have no standard Lean notation class
to reuse (unlike `∪`/`∈`), so they are introduced here.
-/

/-- A `Point` type with a notion of betweenness. -/
class Between (Point : Type u) where
  between : Point → Point → Point → Prop

/-- A `Point` type with a notion of segment congruence. -/
class Congruent (Point : Type u) where
  congruent : Point → Point → Point → Point → Prop

export Between (between)
export Congruent (congruent)

end LRA.EuclideanSpace
