import LRA.Function.Calculus.Definition
import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Restriction

open LRA.Map.Typed
universe u v w

/-- Historical typed-map spelling of the restriction relationship. -/
abbrev RestrictsTo {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
    (restricted : TypedMap Subdomain Codomain)
    (original : TypedMap Domain Codomain)
    (inclusion : TypedMap Subdomain Domain) : Prop :=
  LRA.Function.RestrictsToTyped restricted original inclusion

/-- Historical typed-map spelling of restriction along an inclusion-like map. -/
abbrev Restriction {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
    (original : TypedMap Domain Codomain)
    (inclusion : TypedMap Subdomain Domain) :
    TypedMap Subdomain Codomain :=
  LRA.Function.RestrictionTyped original inclusion

end LRA.Map.Restriction
