import LRA.Operation.Addition
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations.Builders

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- The Landau recursion-defined addition operation as a generic addition
specification on the underlying carrier. -/
noncomputable def LandauAdditionSpecification
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Addition.Specification Element where
  add := LandauAddition model

/-- The recursion-defined Landau addition gives an explicit witness that the
carrier supports a generic addition specification. -/
theorem LandauAdditionExistsOn
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Addition.ExistsOn Element := by
  exact ⟨LandauAdditionSpecification model⟩

/-- Landau's addition as a concrete realization of the generic addition layer. -/
noncomputable def LandauAdditionRealization
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Addition.Realization Element where
  spec := LandauAdditionSpecification model
  instAdd := LandauAddOn model

/-- The realized Landau addition exports the baseline unary laws required by
the generic addition layer. Identity and inverse witnesses are intentionally
absent here because this construction is the positive-natural, one-based
addition package. -/
noncomputable def LandauAdditionBaseLawExports
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Addition.BaseLawExports Element where
  realization := LandauAdditionRealization model
  associative := LandauAdditionIsAssociative model
  commutative := LandauAdditionIsCommutative model

/-- Phase 2 concrete pilot: Landau naturals discharge the baseline generic
addition law bundle. -/
noncomputable abbrev landauAdditionSatisfiesGeneric
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Addition.LawExports Element :=
  LandauAdditionBaseLawExports model

end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
