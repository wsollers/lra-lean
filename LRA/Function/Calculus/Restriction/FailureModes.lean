import LRA.Function.Calculus.Restriction.Definition

/-!
Extension along an inclusion need not be unique: a function defined on a
subdomain can have many extensions to a larger one.
-/

namespace LRA.Function

universe u v w

/-- A function has two distinct extensions along an inclusion. -/
def MultipleExtensions {SmallDomain : Type u} {LargeDomain : Type v} {Codomain : Type w}
    (original : LRA.Function SmallDomain Codomain)
    (inclusion : LRA.Function SmallDomain LargeDomain) : Prop :=
  ∃ first second : LRA.Function LargeDomain Codomain,
    first ≠ second ∧ Extends first original inclusion ∧ Extends second original inclusion

end LRA.Function
