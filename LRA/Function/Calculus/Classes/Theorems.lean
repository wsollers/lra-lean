import LRA.Function.Calculus.Classes.Definition
import LRA.Function.Properties.Definition
import LRA.Relation.Structures.Definition
import LRA.Relation.Canonical.IdentityRelation.Definition

namespace LRA.Function

universe u v

/-- Every input belongs to the domain class of a function. -/
theorem EveryInputInDomainClass {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) (input : Domain) :
    DomainClass function input := by
  sorry

/-- The kernel relation induced by every function is an equivalence relation. -/
theorem KernelRelationIsEquivalenceRelation
    {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) :
    LRA.Relation.EquivalenceRelation (KernelRelation function) := by
  sorry

/-- A function is injective exactly when its kernel is the identity relation. -/
theorem InjectiveIffKernelIsIdentityRelation
    {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) :
    Injective function ↔
      KernelRelation function = LRA.Relation.IdentityRelation Domain := by
  sorry

end LRA.Function
