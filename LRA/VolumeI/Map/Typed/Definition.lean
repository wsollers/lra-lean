import LRA.Function.Definition

namespace LRA.Map.Typed

universe u v

/-- Historical spelling for an ordinary typed function. -/
abbrev TypedMap (Domain : Type u) (Codomain : Type v) :=
  LRA.Function.TypedFunction Domain Codomain

/-- Historical spelling for an ordinary typed endofunction. -/
abbrev Endomap (Carrier : Type u) :=
  LRA.Function.TypedFunction Carrier Carrier

end LRA.Map.Typed
