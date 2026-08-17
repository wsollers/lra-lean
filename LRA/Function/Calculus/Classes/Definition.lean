import LRA.Function.Definition
import LRA.Relation.Calculus.Classes.Definition

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

/-- The kernel relation identifies inputs having a common function output. -/
def KernelRelation {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) :
    LRA.Relation.Endorelation Domain :=
  fun left right =>
    ∃ output, function.graph left output ∧ function.graph right output

/-- A source class is saturated when it contains every kernel-equivalent input. -/
def SaturatedBy {Domain : Type u} {Codomain : Type v}
    (subset : SetClass Domain)
    (function : RelationalFunction Domain Codomain) : Prop :=
  ∀ input fiberMate,
    subset input → KernelRelation function input fiberMate → subset fiberMate

/-- A function maps a source class into a target class. -/
def MapsIntoClass {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain)
    (source : SetClass Domain) (target : SetClass Codomain) : Prop :=
  ∀ input output,
    source input → function.graph input output → target output

/-- A target class is exactly the image of a source class under a function. -/
def IsImageClassOf {Domain : Type u} {Codomain : Type v}
    (image : SetClass Codomain)
    (function : RelationalFunction Domain Codomain)
    (source : SetClass Domain) : Prop :=
  ∀ output, image output ↔ ImageClass function source output

/-- A source class is exactly the preimage of a target class under a function. -/
def IsPreimageClassOf {Domain : Type u} {Codomain : Type v}
    (preimage : SetClass Domain)
    (function : RelationalFunction Domain Codomain)
    (target : SetClass Codomain) : Prop :=
  ∀ input, preimage input ↔ PreimageClass function target input

/-- A source class is exactly the fiber over one output value. -/
def IsFiberClassOf {Domain : Type u} {Codomain : Type v}
    (fiber : SetClass Domain)
    (function : RelationalFunction Domain Codomain)
    (output : Codomain) : Prop :=
  ∀ input, fiber input ↔ FiberClass function output input

end LRA.Function
