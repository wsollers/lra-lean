import LRA.Function.Definition

namespace LRA.Function

universe u v

/-- The value of a relational function at an input, selected from totality. -/
noncomputable def Value {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) (input : Domain) : Codomain :=
  Classical.choose (function.total input)

end LRA.Function
