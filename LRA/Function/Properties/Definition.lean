import LRA.Function.Definition

namespace LRA.Function

universe u v

/-- Injectivity is left-uniqueness of the function graph. -/
abbrev Injective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  LRA.Relation.LeftUnique (Graph function)

/-- Surjectivity is right-totality of the function graph. -/
abbrev Surjective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  LRA.Relation.RightTotal (Graph function)

/-- A function is bijective exactly when it is injective and surjective. -/
def Bijective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  Injective function ∧ Surjective function

end LRA.Function
