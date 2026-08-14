import LRA.Pilot.Supremum.SupremumCounterexamples
import LRA.Pilot.Supremum.SupremumCompleteness
import LRA.Pilot.Supremum.SupremumExamples
import LRA.Pilot.Metadata
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

open LRA.Pilot.Metadata

/-- Machine-readable manifest identifier retained in every extraction run. -/
def id : String := "lra.pilot.supremum-harvest"

/-- Version of the typed Supremum extraction-unit contract. -/
def version : String := "lra.pilot.supremum-harvest/2.0"

/-- The single concept declaration whose one-to-many projection is calibrated. -/
def primaryDeclaration : Lean.Name :=
  ``LRA.Pilot.OrderBounds.LeastUpperBound

/-- Required, typed relationship-bearing seeds for the Supremum evidence
package.  A named checked declaration verifies its own compiled statement; it
does not by itself approve learner-facing publication correspondence. -/
def entries : Array FamilyEntry := #[
  ⟨``LRA.Pilot.OrderBounds.LeastUpperBound,
    .primaryDefinition, .primary, .primaryDeclaration⟩,
  ⟨``LRA.Pilot.OrderBounds.Supremum,
    .surfaceAlias, .definitionallyEqualAlias, .definitionalEquality⟩,
  ⟨``LRA.Pilot.OrderBounds.LUB,
    .abbreviatedAlias, .definitionallyEqualAlias, .definitionalEquality⟩,
  ⟨``LRA.Pilot.OrderBounds.FromPartialOrder.LeastUpperBound,
    .adapter, .specializedInterface, .authorSelected⟩,

  ⟨``LRA.Pilot.OrderBounds.UpperBoundFailure,
    .failurePredicate, .negationClause, .authorSelected⟩,
  ⟨``LRA.Pilot.OrderBounds.SharpnessFailure,
    .failurePredicate, .negationClause, .authorSelected⟩,
  ⟨``LRA.Pilot.OrderBounds.NotUpperBoundIffUpperBoundFailure,
    .logicalForm, .validatesFailureClause,
    .namedCheckedDeclaration
      ``LRA.Pilot.OrderBounds.NotUpperBoundIffUpperBoundFailure⟩,
  ⟨``LRA.Pilot.OrderBounds.NotLeastUpperBoundIffFailure,
    .logicalForm, .validatesGeneralNegation,
    .namedCheckedDeclaration
      ``LRA.Pilot.OrderBounds.NotLeastUpperBoundIffFailure⟩,
  ⟨``LRA.Pilot.OrderBounds.NotUpperBoundIffStrictWitnessOfTotal,
    .specialization, .totalOrderStrictRewrite,
    .namedCheckedDeclaration
      ``LRA.Pilot.OrderBounds.NotUpperBoundIffStrictWitnessOfTotal⟩,
  ⟨``LRA.Pilot.OrderBounds.NotLeastUpperBoundIffStrictFailureOfTotal,
    .specialization, .totalOrderStrictNegation,
    .namedCheckedDeclaration
      ``LRA.Pilot.OrderBounds.NotLeastUpperBoundIffStrictFailureOfTotal⟩,

  ⟨``LRA.Pilot.OrderBounds.LeastUpperBoundIsUpperBound,
    .consequence, .projection,
    .namedCheckedDeclaration ``LRA.Pilot.OrderBounds.LeastUpperBoundIsUpperBound⟩,
  ⟨``LRA.Pilot.OrderBounds.LeastUpperBoundIsBelowUpperBounds,
    .consequence, .projection,
    .namedCheckedDeclaration
      ``LRA.Pilot.OrderBounds.LeastUpperBoundIsBelowUpperBounds⟩,
  ⟨``LRA.Pilot.OrderBounds.LeastUpperBoundUnique,
    .consequence, .uniqueness,
    .namedCheckedDeclaration ``LRA.Pilot.OrderBounds.LeastUpperBoundUnique⟩,
  ⟨``LRA.Pilot.OrderBounds.GreatestElementIsLeastUpperBound,
    .relationship, .maximumImpliesSupremum,
    .namedCheckedDeclaration
      ``LRA.Pilot.OrderBounds.GreatestElementIsLeastUpperBound⟩,
  ⟨``LRA.Pilot.OrderBounds.LeastUpperBoundMemberIsGreatestElement,
    .relationship, .attainedSupremumImpliesMaximum,
    .namedCheckedDeclaration
      ``LRA.Pilot.OrderBounds.LeastUpperBoundMemberIsGreatestElement⟩,
  ⟨``LRA.Pilot.OrderBounds.SubsetLeastUpperBoundsOrdered,
    .consequence, .monotonicity,
    .namedCheckedDeclaration ``LRA.Pilot.OrderBounds.SubsetLeastUpperBoundsOrdered⟩,
  ⟨``LRA.Pilot.OrderBounds.EmptySetUpperBound,
    .boundary, .emptySetVacuity,
    .namedCheckedDeclaration ``LRA.Pilot.OrderBounds.EmptySetUpperBound⟩,
  ⟨``LRA.Pilot.OrderBounds.EmptySetLeastUpperBoundIffBottom,
    .boundary, .emptySetCharacterization,
    .namedCheckedDeclaration ``LRA.Pilot.OrderBounds.EmptySetLeastUpperBoundIffBottom⟩,
  ⟨``LRA.Pilot.OrderBounds.ExistsLeastUpperBoundOfOrderComplete,
    .existence, .orderCompleteExistence,
    .namedCheckedDeclaration ``LRA.Pilot.OrderBounds.ExistsLeastUpperBoundOfOrderComplete⟩,
  ⟨``LRA.Pilot.OrderBounds.ExistsLeastUpperBoundOfCompleteOrderedField,
    .specialization, .completeOrderedFieldExistence,
    .namedCheckedDeclaration
      ``LRA.Pilot.OrderBounds.ExistsLeastUpperBoundOfCompleteOrderedField⟩,
  ⟨``LRA.Pilot.OrderBounds.NonemptyBoundedAboveRealSetHasLeastUpperBound,
    .specialization, .realExistence,
    .namedCheckedDeclaration
      ``LRA.Pilot.OrderBounds.NonemptyBoundedAboveRealSetHasLeastUpperBound⟩,
  ⟨``LRA.Pilot.OrderBounds.OrderedFieldCarrierIsNonempty,
    .boundary, .carrierNonemptyIsStructural,
    .namedCheckedDeclaration ``LRA.Pilot.OrderBounds.OrderedFieldCarrierIsNonempty⟩,

  ⟨``LRA.Pilot.OrderBounds.Examples.EmptySetHasLeastUpperBoundInNat,
    .example, .emptySetSupremumWithBottom,
    .namedCheckedDeclaration
      ``LRA.Pilot.OrderBounds.Examples.EmptySetHasLeastUpperBoundInNat⟩,
  ⟨``LRA.Pilot.OrderBounds.Examples.IicLeastUpperBound,
    .example, .attainedSupremum,
    .namedCheckedDeclaration ``LRA.Pilot.OrderBounds.Examples.IicLeastUpperBound⟩,
  ⟨``LRA.Pilot.OrderBounds.Examples.IicGreatestElement,
    .example, .attainedMaximum,
    .namedCheckedDeclaration ``LRA.Pilot.OrderBounds.Examples.IicGreatestElement⟩,
  ⟨``LRA.Pilot.OrderBounds.Examples.IioLeastUpperBound,
    .example, .nonattainedSupremum,
    .namedCheckedDeclaration ``LRA.Pilot.OrderBounds.Examples.IioLeastUpperBound⟩,
  ⟨``LRA.Pilot.OrderBounds.Examples.IioLeastUpperBoundNotMember,
    .example, .nonattainmentWitness,
    .namedCheckedDeclaration
      ``LRA.Pilot.OrderBounds.Examples.IioLeastUpperBoundNotMember⟩,
  ⟨``LRA.Pilot.OrderBounds.Examples.IioHasNoGreatestElement,
    .example, .supremumWithoutMaximum,
    .namedCheckedDeclaration ``LRA.Pilot.OrderBounds.Examples.IioHasNoGreatestElement⟩,
  ⟨``LRA.Pilot.OrderBounds.Examples.ZeroWitnessesUpperBoundFailureForIicOne,
    .example, .upperBoundFailureWitness,
    .namedCheckedDeclaration
      ``LRA.Pilot.OrderBounds.Examples.ZeroWitnessesUpperBoundFailureForIicOne⟩,
  ⟨``LRA.Pilot.OrderBounds.Examples.TwoWitnessesSharpnessFailureForIicOne,
    .example, .sharpnessFailureWitness,
    .namedCheckedDeclaration
      ``LRA.Pilot.OrderBounds.Examples.TwoWitnessesSharpnessFailureForIicOne⟩,
  ⟨``LRA.Pilot.OrderBounds.Examples.TwoIsNotLeastUpperBoundOfIicOne,
    .example, .checkedFailedCandidate,
    .namedCheckedDeclaration
      ``LRA.Pilot.OrderBounds.Examples.TwoIsNotLeastUpperBoundOfIicOne⟩,

  ⟨``LRA.Pilot.OrderBounds.Counterexamples.DiscretePairPoset,
    .counterexampleStructure, .nonTotalBoundary, .authorSelected⟩,
  ⟨``LRA.Pilot.OrderBounds.Counterexamples.DiscretePairPosetNotTotal,
    .counterexample, .nonTotalBoundary,
    .namedCheckedDeclaration
      ``LRA.Pilot.OrderBounds.Counterexamples.DiscretePairPosetNotTotal⟩,
  ⟨``LRA.Pilot.OrderBounds.Counterexamples.DiscreteFailedComparisonWithoutStrictWitness,
    .counterexample, .strictRewriteFailure,
    .namedCheckedDeclaration
      ``LRA.Pilot.OrderBounds.Counterexamples.DiscreteFailedComparisonWithoutStrictWitness⟩,
  ⟨``LRA.Pilot.OrderBounds.Counterexamples.StrictRewriteFailsWithoutTotality,
    .counterexample, .totalityRequired,
    .namedCheckedDeclaration
      ``LRA.Pilot.OrderBounds.Counterexamples.StrictRewriteFailsWithoutTotality⟩,
  ⟨``LRA.Pilot.OrderBounds.Counterexamples.EmptySetHasNoLeastUpperBoundInReal,
    .counterexample, .realEmptySetHasNoSupremum,
    .namedCheckedDeclaration
      ``LRA.Pilot.OrderBounds.Counterexamples.EmptySetHasNoLeastUpperBoundInReal⟩
]

def entryFor? (name : Lean.Name) : Option FamilyEntry :=
  entries.find? fun entry => entry.declaration == name

/-- Exact compiled-name rules for the narrow binder semantics that are not
recoverable merely from explicit/implicit/proposition binder form. -/
def binderRoleRules : Array SemanticRoleRule := #[
  ⟨.ambientCarrierNonempty, .classDeclaration, #[``Nonempty]⟩,
  ⟨.ambientOrderCompleteness, .classDeclaration,
    #[``LRA.VolumeI.AlgebraicStructures.OrderCompletenessLaws]⟩,
  ⟨.ambientOrderedField, .classDeclaration,
    #[``LRA.VolumeI.AlgebraicStructures.OrderedFieldLaws]⟩,
  ⟨.ambientOrderStructure, .classDeclaration, #[``PartialOrder]⟩,
  ⟨.setMembershipInterface, .classDeclaration, #[``Membership]⟩,
  ⟨.subsetNonempty, .containsAnyDeclaration, #[``Set.Nonempty]⟩,
  ⟨.subsetNonempty, .containsAllDeclarations, #[``Exists, ``Membership.mem]⟩,
  ⟨.subsetBoundedAbove, .containsAnyDeclaration,
    #[``LRA.Pilot.OrderBounds.BoundedAbove,
      ``LRA.Pilot.OrderBounds.FromPartialOrder.BoundedAbove,
      ``BddAbove]⟩
]

/-- Structure-sensitive family members and the exact declarations required by
their checked statements. -/
def applicabilityRequirements : Array ApplicabilityRequirement := #[
  ⟨``LRA.Pilot.OrderBounds.NotUpperBoundIffStrictWitnessOfTotal,
    #[``LRA.VolumeI.Relations.Total]⟩,
  ⟨``LRA.Pilot.OrderBounds.NotLeastUpperBoundIffStrictFailureOfTotal,
    #[``LRA.VolumeI.Relations.Total]⟩,
  ⟨``LRA.Pilot.OrderBounds.ExistsLeastUpperBoundOfCompleteOrderedField,
    #[``LRA.VolumeI.AlgebraicStructures.OrderedFieldLaws,
      ``LRA.VolumeI.AlgebraicStructures.OrderCompletenessLaws]⟩,
  ⟨``LRA.Pilot.OrderBounds.OrderedFieldCarrierIsNonempty,
    #[``LRA.VolumeI.AlgebraicStructures.OrderedFieldLaws]⟩
]

/-- Exact result-type rules for formally relevant concept-family outcomes. -/
def resultRoleRules : Array SemanticRoleRule := #[
  ⟨.ambientCarrierNonempty, .containsAnyDeclaration, #[``Nonempty]⟩,
  ⟨.supremumExistence, .containsAllDeclarations,
    #[``Exists, ``LRA.Pilot.OrderBounds.LeastUpperBound]⟩,
  ⟨.supremumExistence, .containsAllDeclarations,
    #[``Exists, ``LRA.Pilot.OrderBounds.FromPartialOrder.LeastUpperBound]⟩
]

/-- Versioned and bounded unfolding policy used by the calibration. -/
def unfoldingPolicy : UnfoldingPolicy := {
  version := "lra.pilot.logical-unfolding/2.0"
  declarations := #[
    ``LRA.Pilot.OrderBounds.Supremum,
    ``LRA.Pilot.OrderBounds.LUB,
    ``LRA.Pilot.OrderBounds.LeastUpperBound,
    ``LRA.Pilot.OrderBounds.UpperBound,
    ``LRA.Pilot.OrderBounds.BoundedAbove,
    ``LRA.Pilot.OrderBounds.UpperBoundFailure,
    ``LRA.Pilot.OrderBounds.SharpnessFailure,
    ``LRA.Pilot.OrderBounds.FromPartialOrder.LeastUpperBound,
    ``LRA.Pilot.OrderBounds.FromPartialOrder.UpperBound,
    ``LRA.Pilot.OrderBounds.FromPartialOrder.BoundedAbove,
    ``Set.Nonempty
  ]
  primitiveBoundaries := #[
    ``Not, ``And, ``Or, ``Iff, ``Eq, ``Exists, ``Membership.mem
  ]
  maxPasses := 8
  maxSteps := 128
  maxExpressionNodes := 20000
}

/-- The complete typed extraction-unit manifest consumed by the generic
extractor foundation. -/
def manifest : ExtractionManifest := {
  id
  version
  title := "LRA Supremum Lean Evidence"
  primaryDeclaration
  entries
  dependencyNamespaceRoots := #[`LRA.Pilot.OrderBounds,
    `LRA.VolumeI.Relations.Order.Poset]
  binderRoleRules
  resultRoleRules
  applicabilityRequirements
  unfoldingPolicy
}

end LRA.Pilot.Supremum.ExtractionManifest
