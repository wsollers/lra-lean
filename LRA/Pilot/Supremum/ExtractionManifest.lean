import LRA.Pilot.Supremum.SupremumCounterexamples
import LRA.Pilot.Supremum.SupremumCompleteness
import LRA.Pilot.Supremum.SupremumExamples
import Lean

/-!
# Supremum extraction manifest

This is the explicit, versioned selection contract for the Supremum
calibration.  The primary mathematical artifact is one definition,
`LeastUpperBound`, but faithfully populating its downstream LaTeX and explorer
views requires a family of checked declarations.  Each entry records why it is
harvested and how it relates to the primary declaration.

The extractor fails when any required declaration is absent from the compiled
environment.  Dependency closure is computed after these seeds are selected.
-/

namespace LRA.Pilot.Supremum.ExtractionManifest

/-- One required declaration in the Supremum calibration scope. -/
structure Entry where
  declaration : Lean.Name
  role : String
  relationshipToPrimary : String

/-- Machine-readable manifest identifier retained in every extraction run. -/
def version : String := "lra.pilot.supremum-harvest/1.1"

/-- The single concept declaration whose one-to-many projection is calibrated. -/
def primaryDeclaration : Lean.Name :=
  ``LRA.Pilot.OrderBounds.LeastUpperBound

/-- Required, relationship-bearing seeds for the Supremum evidence package. -/
def entries : Array Entry := #[
  ⟨``LRA.Pilot.OrderBounds.LeastUpperBound,
    "primary_definition", "primary"⟩,
  ⟨``LRA.Pilot.OrderBounds.Supremum,
    "surface_alias", "definitionally_equal_alias"⟩,
  ⟨``LRA.Pilot.OrderBounds.LUB,
    "abbreviated_alias", "definitionally_equal_alias"⟩,
  ⟨``LRA.Pilot.OrderBounds.FromPartialOrder.LeastUpperBound,
    "adapter", "specialized_interface"⟩,

  ⟨``LRA.Pilot.OrderBounds.UpperBoundFailure,
    "failure_predicate", "negation_clause"⟩,
  ⟨``LRA.Pilot.OrderBounds.SharpnessFailure,
    "failure_predicate", "negation_clause"⟩,
  ⟨``LRA.Pilot.OrderBounds.NotUpperBoundIffUpperBoundFailure,
    "checked_logical_form", "validates_failure_clause"⟩,
  ⟨``LRA.Pilot.OrderBounds.NotLeastUpperBoundIffFailure,
    "checked_logical_form", "validates_general_negation"⟩,
  ⟨``LRA.Pilot.OrderBounds.NotUpperBoundIffStrictWitnessOfTotal,
    "checked_specialization", "total_order_strict_rewrite"⟩,
  ⟨``LRA.Pilot.OrderBounds.NotLeastUpperBoundIffStrictFailureOfTotal,
    "checked_specialization", "total_order_strict_negation"⟩,

  ⟨``LRA.Pilot.OrderBounds.LeastUpperBoundIsUpperBound,
    "consequence_theorem", "projection"⟩,
  ⟨``LRA.Pilot.OrderBounds.LeastUpperBoundIsBelowUpperBounds,
    "consequence_theorem", "projection"⟩,
  ⟨``LRA.Pilot.OrderBounds.LeastUpperBoundUnique,
    "consequence_theorem", "uniqueness"⟩,
  ⟨``LRA.Pilot.OrderBounds.GreatestElementIsLeastUpperBound,
    "relationship_theorem", "maximum_implies_supremum"⟩,
  ⟨``LRA.Pilot.OrderBounds.LeastUpperBoundMemberIsGreatestElement,
    "relationship_theorem", "attained_supremum_implies_maximum"⟩,
  ⟨``LRA.Pilot.OrderBounds.SubsetLeastUpperBoundsOrdered,
    "consequence_theorem", "monotonicity"⟩,
  ⟨``LRA.Pilot.OrderBounds.EmptySetUpperBound,
    "boundary_theorem", "empty_set_vacuity"⟩,
  ⟨``LRA.Pilot.OrderBounds.EmptySetLeastUpperBoundIffBottom,
    "boundary_theorem", "empty_set_characterization"⟩,
  ⟨``LRA.Pilot.OrderBounds.ExistsLeastUpperBoundOfOrderComplete,
    "existence_theorem", "order_complete_existence"⟩,
  ⟨``LRA.Pilot.OrderBounds.ExistsLeastUpperBoundOfCompleteOrderedField,
    "checked_specialization", "complete_ordered_field_existence"⟩,
  ⟨``LRA.Pilot.OrderBounds.NonemptyBoundedAboveRealSetHasLeastUpperBound,
    "checked_specialization", "real_existence"⟩,
  ⟨``LRA.Pilot.OrderBounds.OrderedFieldCarrierIsNonempty,
    "boundary_theorem", "carrier_nonempty_is_structural"⟩,

  ⟨``LRA.Pilot.OrderBounds.Examples.EmptySetHasLeastUpperBoundInNat,
    "example", "empty_set_supremum_in_poset_with_bottom"⟩,
  ⟨``LRA.Pilot.OrderBounds.Examples.IicLeastUpperBound,
    "example", "attained_supremum"⟩,
  ⟨``LRA.Pilot.OrderBounds.Examples.IicGreatestElement,
    "example", "attained_maximum"⟩,
  ⟨``LRA.Pilot.OrderBounds.Examples.IioLeastUpperBound,
    "example", "nonattained_supremum"⟩,
  ⟨``LRA.Pilot.OrderBounds.Examples.IioLeastUpperBoundNotMember,
    "example", "nonattainment_witness"⟩,
  ⟨``LRA.Pilot.OrderBounds.Examples.IioHasNoGreatestElement,
    "example", "supremum_without_maximum"⟩,
  ⟨``LRA.Pilot.OrderBounds.Examples.ZeroWitnessesUpperBoundFailureForIicOne,
    "example", "upper_bound_failure_witness"⟩,
  ⟨``LRA.Pilot.OrderBounds.Examples.TwoWitnessesSharpnessFailureForIicOne,
    "example", "sharpness_failure_witness"⟩,
  ⟨``LRA.Pilot.OrderBounds.Examples.TwoIsNotLeastUpperBoundOfIicOne,
    "example", "checked_failed_candidate"⟩,

  ⟨``LRA.Pilot.OrderBounds.Counterexamples.DiscretePairPoset,
    "counterexample_structure", "non_total_boundary"⟩,
  ⟨``LRA.Pilot.OrderBounds.Counterexamples.DiscretePairPosetNotTotal,
    "counterexample", "non_total_boundary"⟩,
  ⟨``LRA.Pilot.OrderBounds.Counterexamples.DiscreteFailedComparisonWithoutStrictWitness,
    "counterexample", "strict_rewrite_failure"⟩,
  ⟨``LRA.Pilot.OrderBounds.Counterexamples.StrictRewriteFailsWithoutTotality,
    "counterexample", "totality_is_required"⟩,
  ⟨``LRA.Pilot.OrderBounds.Counterexamples.EmptySetHasNoLeastUpperBoundInReal,
    "counterexample", "nonemptiness_is_required_for_real_existence"⟩
]

def entryFor? (name : Lean.Name) : Option Entry :=
  entries.find? fun entry => entry.declaration == name

end LRA.Pilot.Supremum.ExtractionManifest
