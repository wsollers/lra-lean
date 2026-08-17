import LRA.Function.Definition
import LRA.Relation.Calculus.Restriction.Definition
import LRA.Set.SetClass.Definition

namespace LRA.Function

open LRA.Set
universe u v w

/-- A typed function is a restriction of another along an inclusion-like map. -/
def RestrictsToTyped
    {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
    (restricted : TypedFunction Subdomain Codomain)
    (original : TypedFunction Domain Codomain)
    (inclusion : TypedFunction Subdomain Domain) : Prop :=
  ∀ input, restricted input = original (inclusion input)

/-- Restrict a typed function along an inclusion-like map. -/
def RestrictionTyped
    {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
    (original : TypedFunction Domain Codomain)
    (inclusion : TypedFunction Subdomain Domain) :
    TypedFunction Subdomain Codomain :=
  fun input => original (inclusion input)

/-- A typed function extends another along an inclusion-like map. -/
def ExtendsTyped
    {SmallDomain : Type u} {LargeDomain : Type v} {Codomain : Type w}
    (extension : TypedFunction LargeDomain Codomain)
    (original : TypedFunction SmallDomain Codomain)
    (inclusion : TypedFunction SmallDomain LargeDomain) : Prop :=
  ∀ input, extension (inclusion input) = original input

/-- Restrict the graph of a function to a source class. -/
abbrev RestrictDomainGraph {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) (source : SetClass Domain) :
    FunctionRelation Domain Codomain :=
  LRA.Relation.RestrictDomain function.graph source

/-- Restrict the graph of a function to a target class. -/
abbrev RestrictCodomainGraph {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) (target : SetClass Codomain) :
    FunctionRelation Domain Codomain :=
  LRA.Relation.RestrictCodomain function.graph target

/-- Restrict the graph of a function to source and target classes. -/
abbrev RestrictGraph {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain)
    (source : SetClass Domain) (target : SetClass Codomain) :
    FunctionRelation Domain Codomain :=
  LRA.Relation.Restrict function.graph source target

end LRA.Function
