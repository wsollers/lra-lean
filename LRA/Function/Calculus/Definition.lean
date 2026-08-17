import LRA.Function.Definition
import LRA.Relation.Calculus.Classes.Definition
import LRA.Relation.Calculus.Restriction.Definition

namespace LRA.Function

open LRA.Set
universe u v

/-- The declared source type of a relational function. -/
abbrev DomainType {Domain : Type u} {Codomain : Type v}
    (_function : RelationalFunction Domain Codomain) : Type u := Domain

/-- The declared target type of a relational function. -/
abbrev CodomainType {Domain : Type u} {Codomain : Type v}
    (_function : RelationalFunction Domain Codomain) : Type v := Codomain

/-- Domain class of a function, inherited from its graph relation. -/
abbrev DomainClass {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) : SetClass Domain :=
  LRA.Relation.DomainClass function.graph

/-- Range class of a function, inherited from its graph relation. -/
abbrev RangeClass {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) : SetClass Codomain :=
  LRA.Relation.RangeClass function.graph

/-- Point image of an input under a function. -/
abbrev PointImageClass {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) (input : Domain) : SetClass Codomain :=
  LRA.Relation.PointImageClass function.graph input

/-- Image of a source class under a function. -/
abbrev ImageClass {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) (source : SetClass Domain) : SetClass Codomain :=
  LRA.Relation.ImageClass function.graph source

/-- Preimage of a target class under a function. -/
abbrev PreimageClass {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) (target : SetClass Codomain) : SetClass Domain :=
  LRA.Relation.PreimageClass function.graph target

/-- Fiber over an output value. -/
abbrev FiberClass {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) (output : Codomain) : SetClass Domain :=
  LRA.Relation.FiberClass function.graph output

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

/-- The value of a relational function at an input, selected from totality. -/
noncomputable def Value {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) (input : Domain) : Codomain :=
  Classical.choose (function.total input)

end LRA.Function
