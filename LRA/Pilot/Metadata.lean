import Batteries.Lean.NameMapAttribute

/-!
# Pilot semantic metadata

Small Lean-native metadata annotations used to test extracting stable concept
identifiers from compiled declarations.  The string is intentional authored
metadata; declaration signatures and dependencies remain extractable from
Lean itself.
-/

namespace LRA.Pilot.Metadata

open Lean

/-! ## Typed extraction vocabulary

These types deliberately carry only narrow formal metadata.  They do not
contain learner-facing prose, titles, notation, or publication choices.  The
extractor serializes their constructor names through a versioned schema.
-/

/-- How an extracted value entered an evidence package. -/
inductive EvidenceOrigin where
  | directLean
  | mechanicalTransform
  | namedCheckedDeclaration
  | leanValidatedAuthorSelection
  | independentlyAuthored
  deriving Repr, BEq, Inhabited

/-- Strongest verification established for an evidence value. -/
inductive VerificationStatus where
  | compiled
  | definitionallyEqual
  | checkedProof
  | leanValidatedSelection
  | reviewedCorrespondence
  | unresolved
  | notApplicable
  deriving Repr, BEq, Inhabited

/-- Publication state is intentionally independent of formal verification. -/
inductive PublicationStatus where
  | notApplicable
  | candidate
  | unreviewed
  | approved
  | rejected
  deriving Repr, BEq, Inhabited

/-- Narrow semantic roles that cannot be recovered from binder form alone. -/
inductive SemanticRole where
  | ambientCarrierNonempty
  | subsetNonempty
  | subsetBoundedAbove
  | ambientOrderCompleteness
  | ambientOrderedField
  | ambientOrderStructure
  | setMembershipInterface
  | supremumExistence
  deriving Repr, BEq, Inhabited

/-- How a compiled type is matched by a semantic-role registry rule. -/
inductive SemanticRoleMatch where
  | classDeclaration
  | containsAnyDeclaration
  | containsAllDeclarations
  deriving Repr, BEq, Inhabited

/-- One typed rule for assigning a narrow semantic role from compiled types. -/
structure SemanticRoleRule where
  role : SemanticRole
  matchMode : SemanticRoleMatch
  declarations : Array Lean.Name

/-- A rare declaration-local correction when compiled type structure alone is
insufficient to distinguish a binder's semantic role. -/
structure BinderRoleOverride where
  declaration : Lean.Name
  binderIndex : Nat
  role : SemanticRole

/-- Function of one declaration inside a concept-family package. -/
inductive FamilyMemberRole where
  | primaryDefinition
  | surfaceAlias
  | abbreviatedAlias
  | adapter
  | failurePredicate
  | logicalForm
  | specialization
  | consequence
  | relationship
  | boundary
  | existence
  | example
  | counterexample
  | counterexampleStructure
  deriving Repr, BEq, Inhabited

/-- Mathematical relation asserted between a family member and its primary. -/
inductive FamilyRelation where
  | primary
  | definitionallyEqualAlias
  | specializedInterface
  | negationClause
  | validatesFailureClause
  | validatesGeneralNegation
  | totalOrderStrictRewrite
  | totalOrderStrictNegation
  | projection
  | uniqueness
  | maximumImpliesSupremum
  | attainedSupremumImpliesMaximum
  | monotonicity
  | emptySetVacuity
  | emptySetCharacterization
  | orderCompleteExistence
  | completeOrderedFieldExistence
  | realExistence
  | carrierNonemptyIsStructural
  | emptySetSupremumWithBottom
  | attainedSupremum
  | attainedMaximum
  | nonattainedSupremum
  | nonattainmentWitness
  | supremumWithoutMaximum
  | upperBoundFailureWitness
  | sharpnessFailureWitness
  | checkedFailedCandidate
  | nonTotalBoundary
  | strictRewriteFailure
  | totalityRequired
  | realEmptySetHasNoSupremum
  deriving Repr, BEq, Inhabited

/-- Formal evidence available for a family relation.  `authorSelected` makes
the absence of a checked correspondence witness explicit. -/
inductive RelationEvidence where
  | primaryDeclaration
  | definitionalEquality
  | namedCheckedDeclaration (declaration : Lean.Name)
  | authorSelected
  deriving Repr, BEq, Inhabited

/-- One checked declaration selected into an extraction concept family. -/
structure FamilyEntry where
  declaration : Lean.Name
  memberRole : FamilyMemberRole
  relation : FamilyRelation
  relationEvidence : RelationEvidence

/-- Explicit structural requirements under which one family member or
transform applies. -/
structure ApplicabilityRequirement where
  declaration : Lean.Name
  requiredDeclarations : Array Lean.Name

/-- Bounded, auditable policy for controlled delta reduction.  Declarations
not in `declarations` are explicit terminal policy boundaries. -/
structure UnfoldingPolicy where
  version : String
  declarations : Array Lean.Name
  primitiveBoundaries : Array Lean.Name
  maxPasses : Nat
  maxSteps : Nat
  maxExpressionNodes : Nat

/-- Generic compiled extraction-unit manifest. -/
structure ExtractionManifest where
  id : String
  version : String
  title : String
  primaryDeclaration : Lean.Name
  entries : Array FamilyEntry
  dependencyNamespaceRoots : Array Lean.Name
  binderRoleRules : Array SemanticRoleRule
  resultRoleRules : Array SemanticRoleRule
  binderRoleOverrides : Array BinderRoleOverride := #[]
  applicabilityRequirements : Array ApplicabilityRequirement := #[]
  defaultPublicationStatus : PublicationStatus := .unreviewed
  unfoldingPolicy : UnfoldingPolicy

/-- Attribute syntax associating a canonical Lean declaration with a stable
LRA concept identifier. -/
syntax (name := lraCanonicalAttr) "lraCanonical" str : attr

/-- Compiled mapping from canonical declaration names to stable LRA concept
identifiers. -/
initialize lraCanonicalExtension : NameMapExtension String ←
  registerNameMapAttribute {
    name := `lraCanonicalAttr
    descr := "associate a canonical LRA declaration with its stable concept identifier"
    add := fun _ declarationSyntax => do
      match declarationSyntax with
      | `(attr| lraCanonical $conceptId:str) => pure conceptId.getString
      | _ => throwError "unsupported lraCanonical attribute syntax"
  }

/-- Return the canonical LRA concept identifier attached to a declaration, if
one was registered.

Logical form:

```lean
lraCanonicalExtension.find? environment declarationName
```
-/
def CanonicalConceptId? (environment : Environment) (declarationName : Name) :
    Option String :=
  lraCanonicalExtension.find? environment declarationName

end LRA.Pilot.Metadata
