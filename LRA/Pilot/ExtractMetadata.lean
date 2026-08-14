import LRA.Pilot
import LRA.Pilot.Supremum.ExtractionManifest
import Lean.DeclarationRange
import Lean.Elab.DocString
import Lean.Meta.Basic
import Lean.Meta.Tactic.Unfold
import Lean.Util.CollectAxioms
import Lean.Util.FoldConsts
import Lean.Util.Path
import Std.Time

/-!
# Ordering and Bounds metadata extractor

This executable imports the compiled pilot environment, extracts canonical
concept identifiers, elaborated declaration types, documentation, dependencies,
and axioms, then writes both JSON and a self-contained local HTML explorer.
-/

namespace LRA.Pilot.ExtractMetadata

open Lean
open LRA.Pilot.Metadata

/-- A source range retained in the compiled declaration-range extension. -/
structure ExtractedSourceRange where
  startLine : Nat
  startColumn : Nat
  endLine : Nat
  endColumn : Nat
  selectionStartLine : Nat
  selectionStartColumn : Nat
  selectionEndLine : Nat
  selectionEndColumn : Nat
  deriving ToJson

/-- One leading binder from an elaborated declaration type. -/
structure ExtractedBinder where
  index : Nat
  name : String
  binderInfo : String
  type : String
  typeExpression : Json
  typeIsProposition : Bool
  className : Option String
  roleEvidence : String
  semanticRoleEvidence : String
  deriving ToJson

/-- Reproducibility and toolchain evidence for one extraction run. -/
structure ExtractionEnvironment where
  extractor : String := "LRA.Pilot.ExtractMetadata"
  extractorVersion : String := "5.0"
  generatedAt : String
  leanVersion : String
  leanGitHash : String
  sourceRepository : String := "lra-lean"
  sourceCommit : String
  sourceDirty : Bool
  mathlibCommit : String
  mathlibDirty : Bool
  governanceCommit : String
  governanceDirty : Bool
  deriving ToJson

/-- Direct dependency constants partitioned by ownership/trust boundary. -/
structure ExtractedDependencyPartition where
  internalLra : Array String
  externalLibrary : Array String
  kernelPlatform : Array String
  deriving ToJson

/-- Orthogonal provenance, verification, and publication state for one field
or evidence block. -/
structure ExtractedEvidenceState where
  availability : String
  origin : String
  verification : String
  publication : String
  reason : Option String := none
  deriving ToJson

/-- A named declaration-record block and its explicit evidence state. -/
structure NamedEvidenceState where
  field : String
  state : ExtractedEvidenceState
  deriving ToJson

/-- One successful delta-reduction step in a bounded unfolding trace. -/
structure ExtractedTransformStep where
  pass : Nat
  declaration : String
  inputDigest : String
  outputDigest : String
  outputNodeCount : Nat
  definitionallyEqual : Bool
  deriving ToJson

/-- First-class provenance for one mechanical or witnessed transform. -/
structure ExtractedTransform where
  name : String
  version : String
  inputField : String
  outputField : String
  state : ExtractedEvidenceState
  applicabilityRequirements : Array String
  principles : Array String
  witnessDeclaration : Option String
  steps : Array ExtractedTransformStep
  unfoldedDeclarations : Array String
  terminalDeclarations : Array String
  definitionallyEqual : Option Bool
  deriving ToJson

/-- Formal proof evidence attached to a theorem declaration.  It is not an
independently authored learner proof. -/
structure ExtractedProofEvidence where
  state : ExtractedEvidenceState
  expression : Option Json
  digest : Option String
  digestAlgorithm : String
  directDependencies : Array String
  dependencyPartition : ExtractedDependencyPartition
  kernelAxioms : Array String
  usesSorry : Bool
  deriving ToJson

/-- One typed relation from a family member to the primary declaration. -/
structure ExtractedFamilyMember where
  declaration : String
  memberRole : String
  relation : String
  relationEvidence : String
  witnessDeclaration : Option String
  applicabilityRequirements : Array String
  evidenceState : ExtractedEvidenceState
  correspondenceState : ExtractedEvidenceState
  definitionalEqualityVerified : Option Bool
  witnessAvailable : Bool
  witnessUsesSorry : Bool
  deriving ToJson

/-- Complete one-to-many declaration family for one primary mathematical
concept. -/
structure ExtractedFamily where
  id : String
  manifestVersion : String
  primaryDeclaration : String
  canonicalConceptId : Option String
  defaultPublicationStatus : String
  members : Array ExtractedFamilyMember
  deriving ToJson

/-- Machine-readable diagnostic; severity and status are never inferred from
human prose. -/
structure ExtractionDiagnostic where
  code : String
  severity : String
  declaration : Option String
  field : Option String
  message : String
  deriving ToJson

/-- One declaration harvested from Lean's compiled environment. -/
structure ExtractedNode where
  id : String
  title : String
  declaration : String
  moduleName : String
  sourcePath : String
  sourceRange : Option ExtractedSourceRange
  sourceRangeStatus : String
  scopeRole : String
  manifestRole : Option String
  relationshipToPrimary : Option String
  kind : String
  category : String
  canonicalConceptId : Option String
  universeParameters : Array String
  safety : String
  reducibility : String
  mutualDeclarations : Array String
  statement : String
  statementExpression : Json
  statementLogicExpression : Json
  binders : Array ExtractedBinder
  semanticBinderRoles : Array String
  resultType : String
  resultExpression : Json
  resultIsProposition : Bool
  resultLogicalShape : String
  resultSemanticRoleEvidence : String
  definitionBody : Option String
  definitionBodyExpression : Option Json
  definitionBodyLogicalShape : Option String
  definitionBodyStatus : String
  foldedPredicateLogic : Option String
  foldedPredicateLogicStatus : String
  extractionInput : Option String
  extractionInputExpression : Option Json
  extractionInputStatus : String
  controlledUnfolding : Option String
  controlledUnfoldingExpression : Option Json
  controlledUnfoldingLogicExpression : Option Json
  controlledUnfoldingStatus : String
  unfoldedPredicateLogic : Option String
  unfoldedPredicateLogicStatus : String
  unfoldingPolicyVersion : String
  unfoldedDeclarations : Array String
  stoppedAtDeclarations : Array String
  unfoldingDefinitionalEqualityVerified : Bool
  standardQuantifiedCandidate : Option String
  standardQuantifiedCandidateStatus : String
  mechanicalDefinitionNegation : Option String
  mechanicalDefinitionNegationExpression : Option Json
  mechanicalDefinitionNegationStatus : String
  literalDeclarationNegation : Option String
  literalDeclarationNegationExpression : Option Json
  literalDeclarationNegationStatus : String
  pushedNegationExpression : Option Json
  pushedNegationStatus : String
  pushedNegationPrinciples : Array String
  contrapositiveCandidateExpression : Option Json
  contrapositiveCandidateStatus : String
  documentation : String
  statementDependencies : Array String
  definitionDependencies : Array String
  proofDependencies : Array String
  proofDependenciesStatus : String
  statementDependencyPartition : ExtractedDependencyPartition
  definitionDependencyPartition : ExtractedDependencyPartition
  proofDependencyPartition : ExtractedDependencyPartition
  proofTermExpression : Option Json
  proofTermDigest : Option String
  proofTermStatus : String
  kernelAxioms : Array String
  usesSorry : Bool
  artifactUnit : String
  rawExpressionEncodingVersion : String
  normalizedLogicAstVersion : String
  evidenceStates : Array NamedEvidenceState
  transforms : Array ExtractedTransform
  proofEvidence : ExtractedProofEvidence
  deriving ToJson

/-- One dependency edge between two harvested declarations. -/
structure ExtractedEdge where
  source : String
  target : String
  kind : String
  deriving ToJson

/-- Reachability edge over the union of direct formal dependency graphs. -/
structure ExtractedTransitiveEdge where
  source : String
  target : String
  minimumPathLength : Nat
  alsoDirect : Bool
  deriving ToJson

/-- Complete graph payload consumed by the local explorer. -/
structure ExtractedGraph where
  schemaVersion : Nat := 5
  schemaId : String := "lra.lean-extraction-contract"
  rawExpressionEncodingVersion : String := "lean.expr-tree/1"
  normalizedLogicAstVersion : String := "lra.normalized-proposition-tree/1"
  title : String
  scope : String
  manifestId : Option String
  manifestVersion : Option String
  primaryDeclaration : Option String
  harvestManifest : Array Json
  importModules : Array String
  unfoldingPolicyVersion : String
  unfoldingPolicyDeclarations : Array String
  extractionEnvironment : ExtractionEnvironment
  evidenceNotes : Array String
  nodes : Array ExtractedNode
  edges : Array ExtractedEdge
  transitiveEdges : Array ExtractedTransitiveEdge
  families : Array ExtractedFamily
  diagnostics : Array ExtractionDiagnostic
  deriving ToJson

private def evidenceOriginName : EvidenceOrigin → String
  | .directLean => "direct_lean"
  | .mechanicalTransform => "mechanical_transform"
  | .namedCheckedDeclaration => "named_checked_declaration"
  | .leanValidatedAuthorSelection => "lean_validated_author_selection"
  | .independentlyAuthored => "independently_authored"

private def verificationStatusName : VerificationStatus → String
  | .compiled => "compiled"
  | .definitionallyEqual => "definitionally_equal"
  | .checkedProof => "checked_proof"
  | .leanValidatedSelection => "lean_validated_selection"
  | .reviewedCorrespondence => "reviewed_correspondence"
  | .unresolved => "unresolved"
  | .notApplicable => "not_applicable"

private def publicationStatusName : PublicationStatus → String
  | .notApplicable => "not_applicable"
  | .candidate => "candidate"
  | .unreviewed => "unreviewed"
  | .approved => "approved"
  | .rejected => "rejected"

private def semanticRoleName : SemanticRole → String
  | .ambientCarrierNonempty => "ambient_carrier_nonempty"
  | .subsetNonempty => "subset_nonempty"
  | .subsetBoundedAbove => "subset_bounded_above"
  | .ambientOrderCompleteness => "ambient_order_completeness"
  | .ambientOrderedField => "ambient_ordered_field"
  | .ambientOrderStructure => "ambient_order_structure"
  | .setMembershipInterface => "set_membership_interface"
  | .supremumExistence => "supremum_existence"

private def familyMemberRoleName : FamilyMemberRole → String
  | .primaryDefinition => "primary_definition"
  | .surfaceAlias => "surface_alias"
  | .abbreviatedAlias => "abbreviated_alias"
  | .adapter => "adapter"
  | .failurePredicate => "failure_predicate"
  | .logicalForm => "logical_form"
  | .specialization => "specialization"
  | .consequence => "consequence"
  | .relationship => "relationship"
  | .boundary => "boundary"
  | .existence => "existence"
  | .example => "example"
  | .counterexample => "counterexample"
  | .counterexampleStructure => "counterexample_structure"

/-- Compatibility labels retained for the v4 comparison renderer. -/
private def legacyManifestRoleName : FamilyMemberRole → String
  | .primaryDefinition => "primary_definition"
  | .surfaceAlias => "surface_alias"
  | .abbreviatedAlias => "abbreviated_alias"
  | .adapter => "adapter"
  | .failurePredicate => "failure_predicate"
  | .logicalForm => "checked_logical_form"
  | .specialization => "checked_specialization"
  | .consequence => "consequence_theorem"
  | .relationship => "relationship_theorem"
  | .boundary => "boundary_theorem"
  | .existence => "existence_theorem"
  | .example => "example"
  | .counterexample => "counterexample"
  | .counterexampleStructure => "counterexample_structure"

private def familyRelationName : FamilyRelation → String
  | .primary => "primary"
  | .definitionallyEqualAlias => "definitionally_equal_alias"
  | .specializedInterface => "specialized_interface"
  | .negationClause => "negation_clause"
  | .validatesFailureClause => "validates_failure_clause"
  | .validatesGeneralNegation => "validates_general_negation"
  | .totalOrderStrictRewrite => "total_order_strict_rewrite"
  | .totalOrderStrictNegation => "total_order_strict_negation"
  | .projection => "projection"
  | .uniqueness => "uniqueness"
  | .maximumImpliesSupremum => "maximum_implies_supremum"
  | .attainedSupremumImpliesMaximum => "attained_supremum_implies_maximum"
  | .monotonicity => "monotonicity"
  | .emptySetVacuity => "empty_set_vacuity"
  | .emptySetCharacterization => "empty_set_characterization"
  | .orderCompleteExistence => "order_complete_existence"
  | .completeOrderedFieldExistence => "complete_ordered_field_existence"
  | .realExistence => "real_existence"
  | .carrierNonemptyIsStructural => "carrier_nonempty_is_structural"
  | .emptySetSupremumWithBottom => "empty_set_supremum_in_poset_with_bottom"
  | .attainedSupremum => "attained_supremum"
  | .attainedMaximum => "attained_maximum"
  | .nonattainedSupremum => "nonattained_supremum"
  | .nonattainmentWitness => "nonattainment_witness"
  | .supremumWithoutMaximum => "supremum_without_maximum"
  | .upperBoundFailureWitness => "upper_bound_failure_witness"
  | .sharpnessFailureWitness => "sharpness_failure_witness"
  | .checkedFailedCandidate => "checked_failed_candidate"
  | .nonTotalBoundary => "non_total_boundary"
  | .strictRewriteFailure => "strict_rewrite_failure"
  | .totalityRequired => "totality_is_required"
  | .realEmptySetHasNoSupremum => "real_empty_set_has_no_supremum"

private def relationEvidenceName : RelationEvidence → String
  | .primaryDeclaration => "primary_declaration"
  | .definitionalEquality => "definitional_equality"
  | .namedCheckedDeclaration _ => "named_checked_declaration"
  | .authorSelected => "author_selected"

private def evidenceState
    (availability : String) (origin : EvidenceOrigin)
    (verification : VerificationStatus) (publication : PublicationStatus)
    (reason : Option String := none) : ExtractedEvidenceState := {
  availability
  origin := evidenceOriginName origin
  verification := verificationStatusName verification
  publication := publicationStatusName publication
  reason
}

private def declarationKind : ConstantInfo → String
  | .axiomInfo _ => "axiom"
  | .defnInfo _ => "definition"
  | .thmInfo _ => "theorem"
  | .opaqueInfo _ => "opaque"
  | .quotInfo _ => "quotient"
  | .inductInfo _ => "inductive"
  | .ctorInfo _ => "constructor"
  | .recInfo _ => "recursor"

private def shortName (name : Name) : String :=
  (name.toString.splitOn ".").getLast!

private def binderInfoName : BinderInfo → String
  | .default => "explicit"
  | .implicit => "implicit"
  | .strictImplicit => "strict_implicit"
  | .instImplicit => "instance_implicit"

private def reducibilityName : ConstantInfo → String
  | .defnInfo { hints := .opaque, .. } => "opaque"
  | .defnInfo { hints := .abbrev, .. } => "abbreviation"
  | .defnInfo { hints := .regular _, .. } => "regular"
  | .thmInfo _ => "theorem_opaque"
  | .opaqueInfo _ => "opaque"
  | _ => "not_applicable"

private def safetyName (info : ConstantInfo) : String :=
  if info.isUnsafe then "unsafe"
  else if info.isPartial then "partial"
  else "safe"

private def mutualDeclarations : ConstantInfo → Array String
  | .defnInfo value => value.all.toArray.map Name.toString
  | .thmInfo value => value.all.toArray.map Name.toString
  | .opaqueInfo value => value.all.toArray.map Name.toString
  | _ => #[]

private partial def expressionJson : Expr → Json
  | .bvar index => Json.mkObj [
      ("kind", Json.str "bound_variable"),
      ("index", toJson index)]
  | .fvar id => Json.mkObj [
      ("kind", Json.str "free_variable"),
      ("id", Json.str (reprStr id))]
  | .mvar id => Json.mkObj [
      ("kind", Json.str "metavariable"),
      ("id", Json.str (reprStr id))]
  | .sort level => Json.mkObj [
      ("kind", Json.str "sort"),
      ("level", Json.str (reprStr level))]
  | .const name levels => Json.mkObj [
      ("kind", Json.str "constant"),
      ("name", Json.str name.toString),
      ("levels", Json.arr <| levels.toArray.map fun level => Json.str (reprStr level))]
  | .app function argument => Json.mkObj [
      ("kind", Json.str "application"),
      ("function", expressionJson function),
      ("argument", expressionJson argument)]
  | .lam name domain body binderInfo => Json.mkObj [
      ("kind", Json.str "lambda"),
      ("name", Json.str name.toString),
      ("binderInfo", Json.str (binderInfoName binderInfo)),
      ("domain", expressionJson domain),
      ("body", expressionJson body)]
  | .forallE name domain body binderInfo => Json.mkObj [
      ("kind", Json.str "forall"),
      ("name", Json.str name.toString),
      ("binderInfo", Json.str (binderInfoName binderInfo)),
      ("domain", expressionJson domain),
      ("body", expressionJson body)]
  | .letE name type value body nondep => Json.mkObj [
      ("kind", Json.str "let"),
      ("name", Json.str name.toString),
      ("type", expressionJson type),
      ("value", expressionJson value),
      ("body", expressionJson body),
      ("nondependent", toJson nondep)]
  | .lit literal => Json.mkObj [
      ("kind", Json.str "literal"),
      ("value", Json.str (reprStr literal))]
  | .mdata _ body => Json.mkObj [
      ("kind", Json.str "metadata"),
      ("body", expressionJson body)]
  | .proj typeName index structureValue => Json.mkObj [
      ("kind", Json.str "projection"),
      ("typeName", Json.str typeName.toString),
      ("index", toJson index),
      ("structure", expressionJson structureValue)]

private def applicationOf? (expression : Expr) (name : Name) : Option (Array Expr) :=
  let expression := expression.consumeMData
  if expression.getAppFn.isConstOf name then some expression.getAppArgs else none

/-- A governed-logic-shaped view of an elaborated Lean expression.  Atomic
applications retain the lossless raw expression rather than guessing a
semantic predicate identity. -/
private partial def logicExpressionJson (expression : Expr) : Json :=
  let expression := expression.consumeMData
  match expression with
  | .forallE name domain body binderInfo =>
      if domain.isProp && !body.hasLooseBVar 0 then
        Json.mkObj [
          ("kind", Json.str "implies"),
          ("guardSource", Json.str "proposition_binder"),
          ("antecedent", logicExpressionJson domain),
          ("consequent", logicExpressionJson body)]
      else
        Json.mkObj [
          ("kind", Json.str "forall"),
          ("name", Json.str name.toString),
          ("binderInfo", Json.str (binderInfoName binderInfo)),
          ("binderRole", Json.str <| if domain.isProp then
            "dependent_proposition_proof" else "data_parameter"),
          ("domain", expressionJson domain),
          ("body", logicExpressionJson body)]
  | _ =>
      if let some args := applicationOf? expression ``Not then
        Json.mkObj [
          ("kind", Json.str "not"),
          ("body", logicExpressionJson args[0]!)]
      else if let some args := applicationOf? expression ``And then
        Json.mkObj [
          ("kind", Json.str "and"),
          ("left", logicExpressionJson args[0]!),
          ("right", logicExpressionJson args[1]!)]
      else if let some args := applicationOf? expression ``Or then
        Json.mkObj [
          ("kind", Json.str "or"),
          ("left", logicExpressionJson args[0]!),
          ("right", logicExpressionJson args[1]!)]
      else if let some args := applicationOf? expression ``Iff then
        Json.mkObj [
          ("kind", Json.str "iff"),
          ("left", logicExpressionJson args[0]!),
          ("right", logicExpressionJson args[1]!)]
      else if let some args := applicationOf? expression ``Eq then
        Json.mkObj [
          ("kind", Json.str "equals"),
          ("left", expressionJson args[1]!),
          ("right", expressionJson args[2]!)]
      else if let some args := applicationOf? expression ``Exists then
        match args[0]!.consumeMData with
        | .lam name domain body binderInfo =>
            Json.mkObj [
              ("kind", Json.str "exists"),
              ("name", Json.str name.toString),
              ("binderInfo", Json.str (binderInfoName binderInfo)),
              ("binderRole", Json.str "data_parameter"),
              ("domain", expressionJson domain),
              ("body", logicExpressionJson body)]
        | _ => Json.mkObj [
            ("kind", Json.str "exists"),
            ("predicate", expressionJson args[0]!)]
      else if let some args := applicationOf? expression ``Membership.mem then
        Json.mkObj [
          ("kind", Json.str "membership"),
          ("element", expressionJson args[args.size - 2]!),
          ("container", expressionJson args[args.size - 1]!),
          ("raw", expressionJson expression)]
      else if let some args := applicationOf? expression ``LE.le then
        Json.mkObj [
          ("kind", Json.str "relation"),
          ("relation", Json.str "LE.le"),
          ("left", expressionJson args[args.size - 2]!),
          ("right", expressionJson args[args.size - 1]!),
          ("raw", expressionJson expression)]
      else if let some args := applicationOf? expression ``LT.lt then
        Json.mkObj [
          ("kind", Json.str "relation"),
          ("relation", Json.str "LT.lt"),
          ("left", expressionJson args[args.size - 2]!),
          ("right", expressionJson args[args.size - 1]!),
          ("raw", expressionJson expression)]
      else
        Json.mkObj [
          ("kind", Json.str "atomic"),
          ("raw", expressionJson expression)]

/-- Negate a proposition while pushing polarity through the intuitionistically
safe logical fragment used by the extraction pilot.  The result is an
extraction candidate, not a new Lean theorem. -/
private partial def logicExpressionJsonWithPolarity
    (expression : Expr) (positive : Bool) : Json :=
  let expression := expression.consumeMData
  if positive then logicExpressionJson expression
  else
    match expression with
    | .forallE name domain body binderInfo =>
        if domain.isProp && !body.hasLooseBVar 0 then
          Json.mkObj [
            ("kind", Json.str "and"),
            ("left", logicExpressionJson domain),
            ("right", logicExpressionJsonWithPolarity body false)]
        else
          Json.mkObj [
            ("kind", Json.str "exists"),
            ("name", Json.str name.toString),
            ("binderInfo", Json.str (binderInfoName binderInfo)),
            ("domain", expressionJson domain),
            ("body", logicExpressionJsonWithPolarity body false)]
    | _ =>
        if let some args := applicationOf? expression ``Not then
          logicExpressionJsonWithPolarity args[0]! true
        else if let some args := applicationOf? expression ``And then
          Json.mkObj [
            ("kind", Json.str "or"),
            ("left", logicExpressionJsonWithPolarity args[0]! false),
            ("right", logicExpressionJsonWithPolarity args[1]! false)]
        else if let some args := applicationOf? expression ``Or then
          Json.mkObj [
            ("kind", Json.str "and"),
            ("left", logicExpressionJsonWithPolarity args[0]! false),
            ("right", logicExpressionJsonWithPolarity args[1]! false)]
        else if let some args := applicationOf? expression ``Exists then
          match args[0]!.consumeMData with
          | .lam name domain body binderInfo =>
              Json.mkObj [
                ("kind", Json.str "forall"),
                ("name", Json.str name.toString),
                ("binderInfo", Json.str (binderInfoName binderInfo)),
                ("domain", expressionJson domain),
                ("body", logicExpressionJsonWithPolarity body false)]
          | _ => Json.mkObj [
              ("kind", Json.str "not"),
              ("body", logicExpressionJson expression)]
        else
          Json.mkObj [
            ("kind", Json.str "not"),
            ("body", logicExpressionJson expression)]

private def pushUnique (items : Array String) (item : String) : Array String :=
  if items.contains item then items else items.push item

/-- Record only the logical principles actually traversed by pushed negation. -/
private partial def negationPrinciples
    (expression : Expr) (principles : Array String := #[]) : MetaM (Array String) := do
  let expression := expression.consumeMData
  match expression with
  | .lam name domain body binderInfo =>
      Lean.Meta.withLocalDecl name binderInfo domain fun freeVariable =>
        negationPrinciples (body.instantiate1 freeVariable) principles
  | .forallE name domain body binderInfo =>
      let domainIsProposition ← Lean.Meta.isProp domain
      Lean.Meta.withLocalDecl name binderInfo domain fun freeVariable =>
        if domainIsProposition && !body.hasLooseBVar 0 then
          negationPrinciples (body.instantiate1 freeVariable) <|
            pushUnique principles "classical:not_implies_to_and_not"
        else
          negationPrinciples (body.instantiate1 freeVariable) <|
            pushUnique principles "classical:not_forall_to_exists_not"
  | _ =>
      if let some args := applicationOf? expression ``Not then
        negationPrinciples args[0]! <| pushUnique principles "double_negation"
      else if let some args := applicationOf? expression ``And then
        let principles := pushUnique principles "de_morgan_not_and"
        let principles ← negationPrinciples args[0]! principles
        negationPrinciples args[1]! principles
      else if let some args := applicationOf? expression ``Or then
        let principles := pushUnique principles "de_morgan_not_or"
        let principles ← negationPrinciples args[0]! principles
        negationPrinciples args[1]! principles
      else if let some args := applicationOf? expression ``Exists then
        match args[0]!.consumeMData with
        | .lam name domain body binderInfo =>
            Lean.Meta.withLocalDecl name binderInfo domain fun freeVariable =>
              negationPrinciples (body.instantiate1 freeVariable) <|
                pushUnique principles "not_exists_to_forall_not"
        | _ => pure principles
      else pure principles

/-- Metatype-checked proposition normalization.  Unlike the raw structural
projection above, this asks Lean whether each binder domain has type `Prop`, so
membership proof binders become implication guards without relying on binder
names. -/
private partial def normalizedLogicExpressionJson (expression : Expr) : MetaM Json := do
  let expression := expression.consumeMData
  match expression with
  | .forallE name domain body binderInfo =>
      let domainIsProposition ← Lean.Meta.isProp domain
      Lean.Meta.withLocalDecl name binderInfo domain fun freeVariable => do
        let instantiatedBody := body.instantiate1 freeVariable
        if domainIsProposition && !body.hasLooseBVar 0 then
          pure <| Json.mkObj [
            ("kind", Json.str "implies"),
            ("guardSource", Json.str "proposition_binder"),
            ("antecedent", ← normalizedLogicExpressionJson domain),
            ("consequent", ← normalizedLogicExpressionJson instantiatedBody)]
        else
          pure <| Json.mkObj [
            ("kind", Json.str "forall"),
            ("name", Json.str name.toString),
            ("binderId", Json.str (reprStr freeVariable.fvarId!)),
            ("binderInfo", Json.str (binderInfoName binderInfo)),
            ("binderRole", Json.str <| if domainIsProposition then
              "dependent_proposition_proof" else "data_parameter"),
            ("domain", expressionJson domain),
            ("body", ← normalizedLogicExpressionJson instantiatedBody)]
  | _ =>
      if let some args := applicationOf? expression ``Not then
        pure <| Json.mkObj [
          ("kind", Json.str "not"),
          ("body", ← normalizedLogicExpressionJson args[0]!)]
      else if let some args := applicationOf? expression ``And then
        pure <| Json.mkObj [
          ("kind", Json.str "and"),
          ("left", ← normalizedLogicExpressionJson args[0]!),
          ("right", ← normalizedLogicExpressionJson args[1]!)]
      else if let some args := applicationOf? expression ``Or then
        pure <| Json.mkObj [
          ("kind", Json.str "or"),
          ("left", ← normalizedLogicExpressionJson args[0]!),
          ("right", ← normalizedLogicExpressionJson args[1]!)]
      else if let some args := applicationOf? expression ``Iff then
        pure <| Json.mkObj [
          ("kind", Json.str "iff"),
          ("left", ← normalizedLogicExpressionJson args[0]!),
          ("right", ← normalizedLogicExpressionJson args[1]!)]
      else if let some args := applicationOf? expression ``Eq then
        pure <| Json.mkObj [
          ("kind", Json.str "equals"),
          ("left", expressionJson args[1]!),
          ("right", expressionJson args[2]!)]
      else if let some args := applicationOf? expression ``Exists then
        match args[0]!.consumeMData with
        | .lam name domain body binderInfo =>
            Lean.Meta.withLocalDecl name binderInfo domain fun freeVariable => do
              pure <| Json.mkObj [
                ("kind", Json.str "exists"),
                ("name", Json.str name.toString),
                ("binderId", Json.str (reprStr freeVariable.fvarId!)),
                ("binderInfo", Json.str (binderInfoName binderInfo)),
                ("binderRole", Json.str "data_parameter"),
                ("domain", expressionJson domain),
                ("body", ← normalizedLogicExpressionJson (body.instantiate1 freeVariable))]
        | _ => pure <| Json.mkObj [
            ("kind", Json.str "exists"),
            ("predicate", expressionJson args[0]!)]
      else
        pure <| logicExpressionJson expression

private partial def normalizedLogicExpressionJsonWithPolarity
    (expression : Expr) (positive : Bool) : MetaM Json := do
  let expression := expression.consumeMData
  if positive then normalizedLogicExpressionJson expression
  else
    match expression with
    | .forallE name domain body binderInfo =>
        let domainIsProposition ← Lean.Meta.isProp domain
        Lean.Meta.withLocalDecl name binderInfo domain fun freeVariable => do
          let instantiatedBody := body.instantiate1 freeVariable
          if domainIsProposition && !body.hasLooseBVar 0 then
            pure <| Json.mkObj [
              ("kind", Json.str "and"),
              ("left", ← normalizedLogicExpressionJson domain),
              ("right", ← normalizedLogicExpressionJsonWithPolarity instantiatedBody false)]
          else
            pure <| Json.mkObj [
              ("kind", Json.str "exists"),
              ("name", Json.str name.toString),
              ("binderId", Json.str (reprStr freeVariable.fvarId!)),
              ("binderInfo", Json.str (binderInfoName binderInfo)),
              ("binderRole", Json.str <| if domainIsProposition then
                "dependent_proposition_proof" else "data_parameter"),
              ("domain", expressionJson domain),
              ("body", ← normalizedLogicExpressionJsonWithPolarity instantiatedBody false)]
    | _ =>
        if let some args := applicationOf? expression ``Not then
          normalizedLogicExpressionJsonWithPolarity args[0]! true
        else if let some args := applicationOf? expression ``And then
          pure <| Json.mkObj [
            ("kind", Json.str "or"),
            ("left", ← normalizedLogicExpressionJsonWithPolarity args[0]! false),
            ("right", ← normalizedLogicExpressionJsonWithPolarity args[1]! false)]
        else if let some args := applicationOf? expression ``Or then
          pure <| Json.mkObj [
            ("kind", Json.str "and"),
            ("left", ← normalizedLogicExpressionJsonWithPolarity args[0]! false),
            ("right", ← normalizedLogicExpressionJsonWithPolarity args[1]! false)]
        else if let some args := applicationOf? expression ``Exists then
          match args[0]!.consumeMData with
          | .lam name domain body binderInfo =>
              Lean.Meta.withLocalDecl name binderInfo domain fun freeVariable => do
                pure <| Json.mkObj [
                  ("kind", Json.str "forall"),
                  ("name", Json.str name.toString),
                  ("binderId", Json.str (reprStr freeVariable.fvarId!)),
                  ("binderInfo", Json.str (binderInfoName binderInfo)),
                  ("binderRole", Json.str "data_parameter"),
                  ("domain", expressionJson domain),
                  ("body", ← normalizedLogicExpressionJsonWithPolarity
                    (body.instantiate1 freeVariable) false)]
          | _ => pure <| Json.mkObj [
              ("kind", Json.str "not"),
              ("body", ← normalizedLogicExpressionJson expression)]
        else
          pure <| Json.mkObj [
            ("kind", Json.str "not"),
            ("body", ← normalizedLogicExpressionJson expression)]

private def activeManifest : ExtractionManifest :=
  LRA.Pilot.Supremum.ExtractionManifest.manifest

private def unfoldingPolicyVersion : String :=
  activeManifest.unfoldingPolicy.version

private def unfoldingPolicy : Array Name :=
  activeManifest.unfoldingPolicy.declarations

private structure ControlledUnfolding where
  expression : Expr
  unfoldedDeclarations : Array Name
  terminalDeclarations : Array Name
  steps : Array ExtractedTransformStep
  converged : Bool
  limitStatus : Option String
  definitionallyEqual : Bool

private def isLogicalOrPrimitiveConstant (name : Name) : Bool :=
  activeManifest.unfoldingPolicy.primitiveBoundaries.contains name

private partial def expressionNodeCount : Expr → Nat
  | .app function argument =>
      1 + expressionNodeCount function + expressionNodeCount argument
  | .lam _ domain body _ | .forallE _ domain body _ =>
      1 + expressionNodeCount domain + expressionNodeCount body
  | .letE _ type value body _ =>
      1 + expressionNodeCount type + expressionNodeCount value +
        expressionNodeCount body
  | .mdata _ body => 1 + expressionNodeCount body
  | .proj _ _ structureValue => 1 + expressionNodeCount structureValue
  | _ => 1

private def controlledUnfold (input : Expr) : MetaM ControlledUnfolding := do
  let policy := activeManifest.unfoldingPolicy
  let mut expression := input
  let mut unfolded : Array Name := #[]
  let mut steps : Array ExtractedTransformStep := #[]
  let mut converged := false
  let mut limitStatus : Option String := none
  if expressionNodeCount expression > policy.maxExpressionNodes then
    limitStatus := some "input_expression_node_limit"
  for pass in [0:policy.maxPasses] do
    if limitStatus.isNone && !converged then
      let mut changed := false
      for declaration in policy.declarations do
        if limitStatus.isNone then
          if steps.size >= policy.maxSteps then
            limitStatus := some "unfolding_step_limit"
          else
            let before := expression
            let result ← Lean.Meta.unfold expression declaration
            if result.expr != expression then
              expression := result.expr
              changed := true
              if !unfolded.contains declaration then
                unfolded := unfolded.push declaration
              let nodeCount := expressionNodeCount expression
              let stepDefinitionallyEqual ← Lean.Meta.isDefEq before expression
              steps := steps.push {
                pass
                declaration := declaration.toString
                inputDigest := toString before.hash
                outputDigest := toString expression.hash
                outputNodeCount := nodeCount
                definitionallyEqual := stepDefinitionallyEqual
              }
              if nodeCount > policy.maxExpressionNodes then
                limitStatus := some "unfolded_expression_node_limit"
      if !changed then converged := true
  if limitStatus.isNone && !converged then
    limitStatus := some "unfolding_pass_limit"
  let definitionallyEqual ← Lean.Meta.isDefEq input expression
  let remaining := expression.getUsedConstants.filter fun name =>
    !unfoldingPolicy.contains name && !isLogicalOrPrimitiveConstant name
  pure {
    expression
    unfoldedDeclarations := unfolded
    terminalDeclarations := remaining
    steps
    converged
    limitStatus
    definitionallyEqual
  }

private partial def stripLambdas : Expr → Expr
  | .lam _ _ body _ => stripLambdas body
  | .mdata _ body => stripLambdas body
  | expression => expression

private partial def negateLambdaResult : Expr → Expr
  | .lam name domain body binderInfo =>
      .lam name domain (negateLambdaResult body) binderInfo
  | .mdata _ body => negateLambdaResult body
  | expression => mkNot expression

private def isPropositionSort (expression : Expr) : Bool :=
  match expression.consumeMData with
  | .sort .zero => true
  | _ => false

private def logicalShape (expression : Expr) : String :=
  match expression.consumeMData with
  | .forallE name domain body _ =>
      if name.isAnonymous && domain.isProp && !body.hasLooseBVar 0 then "implication"
      else "universal"
  | .app (.const ``Not _) _ => "negation"
  | .app (.app (.const ``Iff _) _) _ => "equivalence"
  | .app (.app (.const ``And _) _) _ => "conjunction"
  | .app (.app (.const ``Or _) _) _ => "disjunction"
  | .app (.app (.const ``Eq _) _) _ => "equality"
  | .app (.const ``Exists _) _ => "existential"
  | .sort _ => "sort"
  | _ => "atomic_or_application"

private def nameInNamespaceRoot (name root : Name) : Bool :=
  name == root || name.toString.startsWith (root.toString ++ ".")

/-- Scope discovery is governed by typed namespace roots in the manifest.
String fragments are used only to exclude compiler-generated helper names,
never to infer mathematical meaning. -/
private def isHarvestCandidate (name : Name) : Bool :=
  let text := name.toString
  activeManifest.dependencyNamespaceRoots.any (nameInNamespaceRoot name) &&
    !text.contains "._example" && !text.contains ".match_" &&
    !text.contains "._proof_"

private def declarationCategory
    (kind : String) (canonicalId : Option String)
    (manifestEntry : Option FamilyEntry) : String :=
  if canonicalId.isSome then "canonical"
  else match manifestEntry.map (·.memberRole) with
    | some FamilyMemberRole.example => "example"
    | some FamilyMemberRole.counterexample |
      some FamilyMemberRole.counterexampleStructure => "counterexample"
    | some FamilyMemberRole.adapter => "adapter"
    | some role => familyMemberRoleName role
    | none => kind

private def sortedNames (names : Array Name) : Array String :=
  names.map Name.toString |>.qsort (fun left right => left < right)

private def isKernelPlatformName (name : Name) : Bool :=
  let text := name.toString
  text == "propext" || text == "sorryAx" ||
    text.startsWith "Classical." || text.startsWith "Quot." ||
    text.startsWith "Eq." || text.startsWith "And." ||
    text.startsWith "Or." || text.startsWith "Exists." ||
    text == "Not" || text == "Iff" || text == "Eq" ||
    text == "And" || text == "Or" || text == "Exists"

private def partitionDependencies (names : Array Name) : ExtractedDependencyPartition :=
  let internal := names.filter fun name => name.toString.startsWith "LRA."
  let kernel := names.filter isKernelPlatformName
  let external := names.filter fun name =>
    !name.toString.startsWith "LRA." && !isKernelPlatformName name
  {
    internalLra := sortedNames internal
    externalLibrary := sortedNames external
    kernelPlatform := sortedNames kernel
  }

private def prettyExpressionMeta (expression : Expr) : MetaM String := do
  let format ← Lean.Meta.ppExpr expression
  pure <| format.pretty 100

private def prettyExpression (expression : Expr) : CoreM String :=
  Lean.Meta.MetaM.run' <| prettyExpressionMeta expression

private def prettyLambdaBody (expression : Expr) : CoreM String :=
  Lean.Meta.MetaM.run' <| Lean.Meta.lambdaTelescope expression fun _ body =>
    prettyExpressionMeta body

private def semanticRuleMatches
    (expression : Expr) (className : Option Name)
    (rule : SemanticRoleRule) : Bool :=
  let constants := expression.getUsedConstants
  match rule.matchMode with
  | .classDeclaration =>
      className.isSome && rule.declarations.contains className.get!
  | .containsAnyDeclaration =>
      rule.declarations.any constants.contains
  | .containsAllDeclarations =>
      rule.declarations.all constants.contains

private def semanticRoleFromRules
    (expression : Expr) (className : Option Name)
    (rules : Array SemanticRoleRule) : Option SemanticRole :=
  (rules.find? fun rule => semanticRuleMatches expression className rule).map (·.role)

private def binderRoleOverride?
    (declaration : Name) (binderIndex : Nat) : Option SemanticRole :=
  (activeManifest.binderRoleOverrides.find? fun override =>
    override.declaration == declaration && override.binderIndex == binderIndex).map (·.role)

private def semanticBinderRoleEvidence
    (declaration : Name) (binderIndex : Nat)
    (binderType : Expr) (className : Option Name) : String :=
  let role := match binderRoleOverride? declaration binderIndex with
    | some role => some role
    | none => semanticRoleFromRules binderType className activeManifest.binderRoleRules
  role.map semanticRoleName |>.getD "unclassified"

private def semanticResultRoleEvidence (result : Expr) : String :=
  semanticRoleFromRules result none activeManifest.resultRoleRules |>.map semanticRoleName
    |>.getD "unclassified"

private structure ExtractedSignature where
  binders : Array ExtractedBinder
  rawResult : Expr
  resultType : String
  resultExpression : Json
  resultIsProposition : Bool
  resultLogicalShape : String

private def extractSignature (declarationName : Name) (type : Expr) : CoreM ExtractedSignature :=
  Lean.Meta.MetaM.run' <| Lean.Meta.forallTelescope type fun freeVariables result => do
    let mut binders : Array ExtractedBinder := #[]
    for index in [0:freeVariables.size] do
      let declaration ← freeVariables[index]!.fvarId!.getDecl
      let typeIsProposition ← Lean.Meta.isProp declaration.type
      let className ← Lean.Meta.isClass? declaration.type
      let roleEvidence :=
        if className.isSome then "typeclass_instance"
        else if typeIsProposition then "proposition_hypothesis"
        else if declaration.binderInfo.isExplicit then "explicit_parameter"
        else "implicit_parameter"
      binders := binders.push {
        index
        name := declaration.userName.toString
        binderInfo := binderInfoName declaration.binderInfo
        type := ← prettyExpressionMeta declaration.type
        typeExpression := expressionJson declaration.type
        typeIsProposition
        className := className.map Name.toString
        roleEvidence
        semanticRoleEvidence :=
          semanticBinderRoleEvidence declarationName index declaration.type className
      }
    let resultIsProposition := (← Lean.Meta.isProp result) || isPropositionSort result
    pure {
      binders
      rawResult := result
      resultType := ← prettyExpressionMeta result
      resultExpression := expressionJson result
      resultIsProposition
      resultLogicalShape := logicalShape result
    }

private def andManyJsonList : List Json → Json
  | [] => Json.mkObj [("kind", Json.str "true")]
  | [item] => item
  | item :: rest => Json.mkObj [
      ("kind", Json.str "and"),
      ("left", item),
      ("right", andManyJsonList rest)]

private def andManyJson (items : Array Json) : Json :=
  andManyJsonList items.toList

private structure ContrapositiveExtraction where
  expression : Option Json
  status : String

private def extractContrapositive (type : Expr) : MetaM ContrapositiveExtraction :=
  Lean.Meta.forallTelescope type fun freeVariables result => do
    let mut contexts : Array Json := #[]
    let mut hypotheses : Array Json := #[]
    let mut unsupportedDependentHypothesis := false
    for freeVariable in freeVariables do
      let declaration ← freeVariable.fvarId!.getDecl
      if ← Lean.Meta.isProp declaration.type then
        if result.containsFVar freeVariable.fvarId! then
          unsupportedDependentHypothesis := true
        hypotheses := hypotheses.push (logicExpressionJson declaration.type)
      else
        contexts := contexts.push <| Json.mkObj [
          ("name", Json.str declaration.userName.toString),
          ("binderInfo", Json.str (binderInfoName declaration.binderInfo)),
          ("type", expressionJson declaration.type)]
    if unsupportedDependentHypothesis then
      pure { expression := none, status := "unsupported_dependent_hypothesis" }
    else if hypotheses.isEmpty then
      pure { expression := none, status := "not_applicable_no_proposition_hypotheses" }
    else
      let body := Json.mkObj [
        ("kind", Json.str "implies"),
        ("antecedent", logicExpressionJsonWithPolarity result false),
        ("consequent", Json.mkObj [
          ("kind", Json.str "not"),
          ("body", andManyJson hypotheses)])]
      pure {
        expression := some <| Json.mkObj [
          ("kind", Json.str "contrapositive_candidate"),
          ("contextBinders", Json.arr contexts),
          ("body", body)],
        status := "mechanically_derived_candidate_unapproved"
      }

private def extractedSourceRange (ranges : DeclarationRanges) : ExtractedSourceRange := {
  startLine := ranges.range.pos.line
  startColumn := ranges.range.pos.column
  endLine := ranges.range.endPos.line
  endColumn := ranges.range.endPos.column
  selectionStartLine := ranges.selectionRange.pos.line
  selectionStartColumn := ranges.selectionRange.pos.column
  selectionEndLine := ranges.selectionRange.endPos.line
  selectionEndColumn := ranges.selectionRange.endPos.column
}

private structure PendingNode where
  node : ExtractedNode
  statementNames : Array Name
  definitionNames : Array Name
  proofNames : Array Name

private def addDependencyEdges
    (edges : Array ExtractedEdge)
    (edgeKeys : Std.HashSet String)
    (declarationToId : Std.HashMap String String)
    (source : ExtractedNode)
    (targets : Array Name)
    (kind : String) : Array ExtractedEdge × Std.HashSet String :=
  targets.foldl (init := (edges, edgeKeys)) fun (edges, edgeKeys) targetName =>
    match declarationToId.get? targetName.toString with
    | none => (edges, edgeKeys)
    | some targetId =>
        if targetId == source.id then (edges, edgeKeys)
        else
          let key := source.id ++ "|" ++ targetId ++ "|" ++ kind
          if edgeKeys.contains key then (edges, edgeKeys)
          else
            (edges.push { source := source.id, target := targetId, kind },
              edgeKeys.insert key)

private def computeTransitiveEdges
    (nodes : Array ExtractedNode)
    (edges : Array ExtractedEdge) : Array ExtractedTransitiveEdge := Id.run do
  let mut result : Array ExtractedTransitiveEdge := #[]
  for sourceNode in nodes do
    let mut distances : Std.HashMap String Nat := {}
    distances := distances.insert sourceNode.id 0
    let mut changed := true
    while changed do
      changed := false
      for edge in edges do
        if let some sourceDistance := distances.get? edge.source then
          let candidateDistance := sourceDistance + 1
          match distances.get? edge.target with
          | some existingDistance =>
              if candidateDistance < existingDistance then
                distances := distances.insert edge.target candidateDistance
                changed := true
          | none =>
              distances := distances.insert edge.target candidateDistance
              changed := true
    for targetNode in nodes do
      if targetNode.id != sourceNode.id then
        if let some distance := distances.get? targetNode.id then
          let alsoDirect := edges.any fun edge =>
            edge.source == sourceNode.id && edge.target == targetNode.id
          result := result.push {
            source := sourceNode.id
            target := targetNode.id
            minimumPathLength := distance
            alsoDirect
          }
  return result.qsort fun left right =>
    let leftKey := left.source ++ "|" ++ left.target
    let rightKey := right.source ++ "|" ++ right.target
    leftKey < rightKey

private def extractPendingNode
    (name : Name) (info : ConstantInfo) (documentation : String)
    (canonicalId : Option String) : CoreM PendingNode := do
  let kind := declarationKind info
  let manifestEntry := LRA.Pilot.Supremum.ExtractionManifest.entryFor? name
  let statementNames := info.type.getUsedConstants
  let body := info.value? (allowOpaque := true)
  let bodyNames := body.map Expr.getUsedConstants |>.getD #[]
  let definitionNames := if kind == "definition" then bodyNames else #[]
  let proofNames := if kind == "theorem" || kind == "opaque" then bodyNames else #[]
  let kernelAxioms ← collectAxioms name
  let module ← findModuleOf? name
  let moduleName := module.map Name.toString |>.getD ""
  let sourcePath := module.map (fun moduleName =>
    moduleName.toString.replace "." "/" ++ ".lean") |>.getD ""
  let sourceRange := (← findDeclarationRanges? name).map extractedSourceRange
  let signature ← extractSignature name info.type
  let definitionBody := if kind == "definition" then body else none
  let definitionBodyText ← definitionBody.mapM prettyExpression
  let definitionBodyExpression := definitionBody.map expressionJson
  let foldedPredicateLogic ← definitionBody.mapM prettyLambdaBody
  let definitionBodyLogicalShape := definitionBody.map fun expression =>
    logicalShape (stripLambdas expression)
  let extractionInput :=
    if kind == "definition" then definitionBody else some info.type
  let controlledUnfolding ← extractionInput.mapM fun expression =>
    Lean.Meta.MetaM.run' <| controlledUnfold expression
  let controlledUnfoldingText ← controlledUnfolding.mapM fun result =>
    prettyExpression result.expression
  let unfoldedPredicateLogic ← controlledUnfolding.mapM fun result =>
    prettyLambdaBody result.expression
  let controlledUnfoldingLogicExpression ← controlledUnfolding.mapM fun result =>
    Lean.Meta.MetaM.run' <| Lean.Meta.lambdaTelescope result.expression fun _ body =>
      normalizedLogicExpressionJson body
  let standardQuantifiedCandidate := controlledUnfoldingText
  let mechanicalDefinitionNegation :=
    if kind == "definition" && signature.resultIsProposition then
      controlledUnfolding.map fun result => negateLambdaResult result.expression
    else none
  let mechanicalDefinitionNegationText ←
    mechanicalDefinitionNegation.mapM prettyExpression
  let statementIsProposition ← Lean.Meta.MetaM.run' <| Lean.Meta.isProp info.type
  let literalNegation := if statementIsProposition then some (mkNot info.type) else none
  let literalNegationText ← literalNegation.mapM prettyExpression
  let pushedNegationExpression ←
    if kind == "definition" && signature.resultIsProposition then
      controlledUnfolding.mapM fun result =>
        Lean.Meta.MetaM.run' <| Lean.Meta.lambdaTelescope result.expression fun _ body =>
          normalizedLogicExpressionJsonWithPolarity body false
    else if statementIsProposition then
      controlledUnfolding.mapM fun result =>
        Lean.Meta.MetaM.run' <|
          normalizedLogicExpressionJsonWithPolarity result.expression false
    else pure none
  let pushedNegationPrinciples ← if pushedNegationExpression.isSome then
    match controlledUnfolding with
    | some result => Lean.Meta.MetaM.run' <|
        negationPrinciples result.expression
    | none => pure #[]
    else pure #[]
  let contrapositive ←
    if kind == "theorem" || kind == "opaque" then
      Lean.Meta.MetaM.run' <| extractContrapositive info.type
    else pure { expression := none, status := "not_applicable" }
  let proofTerm :=
    if kind == "theorem" || kind == "opaque" then body else none
  let statementLogicExpression ← Lean.Meta.MetaM.run' <|
    normalizedLogicExpressionJson info.type
  let semanticBinderRoles := signature.binders.foldl
    (init := #[]) fun roles binder =>
      if binder.semanticRoleEvidence == "unclassified" ||
          roles.contains binder.semanticRoleEvidence then
        roles
      else
        roles.push binder.semanticRoleEvidence
  let directState := evidenceState "available" .directLean .compiled .notApplicable
  let definitionState :=
    if kind == "definition" then
      if definitionBody.isSome then directState
      else evidenceState "unavailable" .directLean .unresolved .notApplicable
        (some "compiled definition body is unavailable")
    else evidenceState "not_applicable" .directLean .notApplicable .notApplicable
  let proofState :=
    if kind == "theorem" || kind == "opaque" then
      if proofTerm.isSome then directState
      else evidenceState "unavailable" .directLean .unresolved .notApplicable
        (some "compiled proof value is unavailable")
    else evidenceState "not_applicable" .directLean .notApplicable .notApplicable
  let unfoldingState := match controlledUnfolding with
    | some result =>
        if result.definitionallyEqual && result.limitStatus.isNone then
          evidenceState "available" .mechanicalTransform .definitionallyEqual .candidate
        else
          evidenceState "unresolved" .mechanicalTransform .unresolved .candidate
            result.limitStatus
    | none =>
        evidenceState "unavailable" .mechanicalTransform .unresolved .candidate
  let candidateState :=
    evidenceState "available" .mechanicalTransform .leanValidatedSelection .candidate
  let mut transforms : Array ExtractedTransform := #[]
  if let some result := controlledUnfolding then
    transforms := transforms.push {
      name := "controlled_unfolding"
      version := unfoldingPolicyVersion
      inputField := "extractionInputExpression"
      outputField := "controlledUnfoldingExpression"
      state := unfoldingState
      applicabilityRequirements := #[]
      principles := #["beta", "iota", "zeta", "projection",
        "authorized_delta_reduction"]
      witnessDeclaration := none
      steps := result.steps
      unfoldedDeclarations := sortedNames result.unfoldedDeclarations
      terminalDeclarations := sortedNames result.terminalDeclarations
      definitionallyEqual := some result.definitionallyEqual
    }
  if standardQuantifiedCandidate.isSome then
    transforms := transforms.push {
      name := "standard_quantified_candidate"
      version := "lra.standard-quantified/1"
      inputField := "controlledUnfoldingLogicExpression"
      outputField := "standardQuantifiedCandidate"
      state := candidateState
      applicabilityRequirements := #[]
      principles := #["telescope_opening", "proposition_hypotheses_as_antecedents"]
      witnessDeclaration := none
      steps := #[]
      unfoldedDeclarations := #[]
      terminalDeclarations := #[]
      definitionallyEqual := none
    }
  if mechanicalDefinitionNegation.isSome then
    transforms := transforms.push {
      name := "literal_definition_negation"
      version := "lra.literal-negation/1"
      inputField := "controlledUnfoldingExpression"
      outputField := "mechanicalDefinitionNegationExpression"
      state := candidateState
      applicabilityRequirements := #[]
      principles := #["literal_not"]
      witnessDeclaration := none
      steps := #[]
      unfoldedDeclarations := #[]
      terminalDeclarations := #[]
      definitionallyEqual := none
    }
  if literalNegation.isSome then
    transforms := transforms.push {
      name := "literal_declaration_negation"
      version := "lra.literal-negation/1"
      inputField := "statementExpression"
      outputField := "literalDeclarationNegationExpression"
      state := candidateState
      applicabilityRequirements := #[]
      principles := #["literal_not"]
      witnessDeclaration := none
      steps := #[]
      unfoldedDeclarations := #[]
      terminalDeclarations := #[]
      definitionallyEqual := none
    }
  if pushedNegationExpression.isSome then
    transforms := transforms.push {
      name := "pushed_negation_candidate"
      version := "lra.proposition-negation/1"
      inputField := "controlledUnfoldingLogicExpression"
      outputField := "pushedNegationExpression"
      state := evidenceState "available" .mechanicalTransform .unresolved .candidate
        (some "publication requires a named checked equivalence witness")
      applicabilityRequirements := #[]
      principles := pushedNegationPrinciples
      witnessDeclaration := none
      steps := #[]
      unfoldedDeclarations := #[]
      terminalDeclarations := #[]
      definitionallyEqual := none
    }
  if contrapositive.expression.isSome then
    transforms := transforms.push {
      name := "contrapositive_candidate"
      version := "lra.contrapositive/1"
      inputField := "statementLogicExpression"
      outputField := "contrapositiveCandidateExpression"
      state := evidenceState "available" .mechanicalTransform .unresolved .candidate
        (some "publication requires a checked generic construction or named witness")
      applicabilityRequirements := #[]
      principles := #["intuitionistic_contrapositive"]
      witnessDeclaration := none
      steps := #[]
      unfoldedDeclarations := #[]
      terminalDeclarations := #[]
      definitionallyEqual := none
    }
  let evidenceStates : Array NamedEvidenceState := #[
    ⟨"statement", directState⟩,
    ⟨"definitionBody", definitionState⟩,
    ⟨"controlledUnfolding", unfoldingState⟩,
    ⟨"proof", proofState⟩,
    ⟨"publicationCorrespondence",
      evidenceState "unavailable" .independentlyAuthored .unresolved .unreviewed
        (some "reviewed Lean-to-publication correspondence is external to Lean")⟩
  ]
  let proofEvidence : ExtractedProofEvidence := {
    state := proofState
    expression := proofTerm.map expressionJson
    digest := proofTerm.map fun expression => toString expression.hash
    digestAlgorithm := "lean-expr-hash/1"
    directDependencies := sortedNames proofNames
    dependencyPartition := partitionDependencies proofNames
    kernelAxioms := sortedNames kernelAxioms
    usesSorry := kernelAxioms.contains ``sorryAx
  }
  let node : ExtractedNode := {
    id := name.toString
    title := shortName name
    declaration := name.toString
    moduleName
    sourcePath
    sourceRange
    sourceRangeStatus := if sourceRange.isSome then "available" else "unavailable"
    scopeRole := "included"
    manifestRole := manifestEntry.map fun entry => legacyManifestRoleName entry.memberRole
    relationshipToPrimary := manifestEntry.map fun entry => familyRelationName entry.relation
    kind
    category := declarationCategory kind canonicalId manifestEntry
    canonicalConceptId := canonicalId
    universeParameters := info.levelParams.toArray.map Name.toString
    safety := safetyName info
    reducibility := reducibilityName info
    mutualDeclarations := mutualDeclarations info
    statement := ← prettyExpression info.type
    statementExpression := expressionJson info.type
    statementLogicExpression
    binders := signature.binders
    semanticBinderRoles
    resultType := signature.resultType
    resultExpression := signature.resultExpression
    resultIsProposition := signature.resultIsProposition
    resultLogicalShape := signature.resultLogicalShape
    resultSemanticRoleEvidence := semanticResultRoleEvidence signature.rawResult
    definitionBody := definitionBodyText
    definitionBodyExpression
    definitionBodyLogicalShape
    definitionBodyStatus :=
      if kind == "definition" then
        if definitionBody.isSome then "available" else "unavailable"
      else "not_applicable"
    foldedPredicateLogic
    foldedPredicateLogicStatus :=
      if foldedPredicateLogic.isSome then "available_from_compiled_definition_body"
      else "not_applicable"
    extractionInput := ← extractionInput.mapM prettyExpression
    extractionInputExpression := extractionInput.map expressionJson
    extractionInputStatus :=
      if extractionInput.isSome then "available" else "unavailable"
    controlledUnfolding := controlledUnfoldingText
    controlledUnfoldingExpression :=
      controlledUnfolding.map fun result => expressionJson result.expression
    controlledUnfoldingLogicExpression
    controlledUnfoldingStatus := match controlledUnfolding with
      | some result => if result.limitStatus.isNone then
          "available_bounded_by_policy" else "unresolved_policy_limit"
      | none => "unavailable"
    unfoldedPredicateLogic
    unfoldedPredicateLogicStatus :=
      match controlledUnfolding with
      | some result => if result.limitStatus.isNone then
          "available_raw_logic_before_governed_rendering" else "unresolved_policy_limit"
      | none => "unavailable"
    unfoldingPolicyVersion
    unfoldedDeclarations := controlledUnfolding.map
      (fun result => sortedNames result.unfoldedDeclarations) |>.getD #[]
    stoppedAtDeclarations := controlledUnfolding.map
      (fun result => sortedNames result.terminalDeclarations) |>.getD #[]
    unfoldingDefinitionalEqualityVerified := controlledUnfolding.map
      (·.definitionallyEqual) |>.getD false
    standardQuantifiedCandidate
    standardQuantifiedCandidateStatus :=
      if standardQuantifiedCandidate.isSome then
        "mechanically_derived_candidate_unapproved"
      else "unavailable"
    mechanicalDefinitionNegation := mechanicalDefinitionNegationText
    mechanicalDefinitionNegationExpression :=
      mechanicalDefinitionNegation.map expressionJson
    mechanicalDefinitionNegationStatus :=
      if mechanicalDefinitionNegation.isSome then
        "mechanically_derived_from_definition_body"
      else "not_applicable"
    literalDeclarationNegation := literalNegationText
    literalDeclarationNegationExpression := literalNegation.map expressionJson
    literalDeclarationNegationStatus :=
      if literalNegation.isSome then "mechanically_derived_literal" else "not_applicable"
    pushedNegationExpression
    pushedNegationStatus :=
      if pushedNegationExpression.isSome then
        "mechanically_derived_candidate_unapproved_requires_classical_quantifier_and_implication_negation"
      else "not_applicable"
    pushedNegationPrinciples
    contrapositiveCandidateExpression := contrapositive.expression
    contrapositiveCandidateStatus := contrapositive.status
    documentation
    statementDependencies := sortedNames statementNames
    definitionDependencies := sortedNames definitionNames
    proofDependencies := sortedNames proofNames
    proofDependenciesStatus :=
      if kind == "theorem" || kind == "opaque" then
        if body.isSome then "available" else "unavailable"
      else "not_applicable"
    statementDependencyPartition := partitionDependencies statementNames
    definitionDependencyPartition := partitionDependencies definitionNames
    proofDependencyPartition := partitionDependencies proofNames
    proofTermExpression := proofTerm.map expressionJson
    proofTermDigest := proofTerm.map fun expression => toString expression.hash
    proofTermStatus :=
      if kind == "theorem" || kind == "opaque" then
        if proofTerm.isSome then "available_allowOpaque_true" else "unavailable"
      else "not_applicable"
    kernelAxioms := sortedNames kernelAxioms
    usesSorry := kernelAxioms.contains ``sorryAx
    artifactUnit := if kind == "axiom" then "axiom_or_structure_law"
      else if kind == "definition" then "definition"
      else if kind == "theorem" || kind == "opaque" then "theorem_with_proof_evidence"
      else "declaration"
    rawExpressionEncodingVersion := "lean.expr-tree/1"
    normalizedLogicAstVersion := "lra.normalized-proposition-tree/1"
    evidenceStates
    transforms
    proofEvidence
  }
  pure { node, statementNames, definitionNames, proofNames }

private def scopePendingNodes
    (pending : Array PendingNode) (scope : String) : Array PendingNode := Id.run do
  if scope != "supremum" then
    return pending
  let declarationNames : Std.HashSet String :=
    pending.foldl (init := {}) fun names item => names.insert item.node.declaration
  let seedNames : Std.HashSet String :=
    LRA.Pilot.Supremum.ExtractionManifest.entries.foldl (init := {}) fun names entry =>
      names.insert entry.declaration.toString
  let mut selected := seedNames
  let mut changed := true
  while changed do
    changed := false
    for item in pending do
      if selected.contains item.node.declaration then
        let dependencies := item.statementNames ++ item.definitionNames ++ item.proofNames
        for dependency in dependencies do
          let dependencyName := dependency.toString
          if declarationNames.contains dependencyName && !selected.contains dependencyName then
            selected := selected.insert dependencyName
            changed := true
  return pending.filterMap fun item =>
    if selected.contains item.node.declaration then
      let scopeRole :=
        if seedNames.contains item.node.declaration then "seed" else "dependency"
      some { item with node := { item.node with scopeRole } }
    else none

private def applicabilityFor (declaration : Name) : Array Name :=
  (activeManifest.applicabilityRequirements.find? fun requirement =>
    requirement.declaration == declaration).map (·.requiredDeclarations) |>.getD #[]

private def declarationDefinitionalEquality
    (primary member : ConstantInfo) : CoreM Bool :=
  Lean.Meta.MetaM.run' do
    let typesEqual ← Lean.Meta.isDefEq primary.type member.type
    if !typesEqual then return false
    match primary.value? (allowOpaque := true), member.value? (allowOpaque := true) with
    | some primaryValue, some memberValue => Lean.Meta.isDefEq primaryValue memberValue
    | none, none => pure true
    | _, _ => pure false

private def extractFamilyMember
    (environment : Environment) (entry : FamilyEntry) : CoreM ExtractedFamilyMember := do
  let memberInfo := environment.find? entry.declaration
  let requirements := applicabilityFor entry.declaration
  let requirementsPresent := match memberInfo with
    | some info => requirements.all info.type.getUsedConstants.contains
    | none => false
  let publication := activeManifest.defaultPublicationStatus
  let correspondenceState :=
    evidenceState "unavailable" .independentlyAuthored .unresolved publication
      (some "Lean checks the named declaration; publication correspondence requires review")
  let mut witnessDeclaration : Option Name := none
  let mut witnessAvailable := false
  let mut witnessUsesSorry := false
  let mut defeqVerified : Option Bool := none
  let relationState ← match entry.relationEvidence with
    | .primaryDeclaration =>
        witnessAvailable := memberInfo.isSome
        pure <| if memberInfo.isSome then
          evidenceState "available" .directLean .compiled publication
        else evidenceState "unresolved" .directLean .unresolved publication
          (some "primary declaration is missing")
    | .definitionalEquality =>
        let primaryInfo := environment.find? activeManifest.primaryDeclaration
        let verified ← match primaryInfo, memberInfo with
          | some primary, some member => declarationDefinitionalEquality primary member
          | _, _ => pure false
        defeqVerified := some verified
        witnessAvailable := primaryInfo.isSome && memberInfo.isSome
        pure <| if verified then
          evidenceState "available" .mechanicalTransform .definitionallyEqual publication
        else evidenceState "unresolved" .mechanicalTransform .unresolved publication
          (some "declared alias did not pass definitional-equality verification")
    | .namedCheckedDeclaration witness =>
        witnessDeclaration := some witness
        let witnessInfo := environment.find? witness
        witnessAvailable := witnessInfo.isSome
        if witnessAvailable then
          let axioms ← collectAxioms witness
          witnessUsesSorry := axioms.contains ``sorryAx
        pure <| if witnessAvailable && !witnessUsesSorry && requirementsPresent then
          evidenceState "available" .namedCheckedDeclaration .checkedProof publication
        else
          let reason := if !witnessAvailable then "named witness declaration is missing"
            else if witnessUsesSorry then "named witness depends on sorryAx"
            else "an applicability requirement is absent from the checked statement"
          evidenceState "unresolved" .namedCheckedDeclaration .unresolved publication
            (some reason)
    | .authorSelected =>
        witnessAvailable := memberInfo.isSome
        pure <| if memberInfo.isSome then
          evidenceState "available" .leanValidatedAuthorSelection
            .leanValidatedSelection publication
            (some "declaration exists; family relation remains an authored selection")
        else evidenceState "unresolved" .leanValidatedAuthorSelection .unresolved publication
          (some "author-selected declaration is missing")
  pure {
    declaration := entry.declaration.toString
    memberRole := familyMemberRoleName entry.memberRole
    relation := familyRelationName entry.relation
    relationEvidence := relationEvidenceName entry.relationEvidence
    witnessDeclaration := witnessDeclaration.map Name.toString
    applicabilityRequirements := sortedNames requirements
    evidenceState := relationState
    correspondenceState
    definitionalEqualityVerified := defeqVerified
    witnessAvailable
    witnessUsesSorry
  }

private def extractFamily
    (environment : Environment) (nodes : Array ExtractedNode) : CoreM ExtractedFamily := do
  let mut members : Array ExtractedFamilyMember := #[]
  for entry in activeManifest.entries do
    members := members.push (← extractFamilyMember environment entry)
  let primaryConceptId := (nodes.find? fun node =>
    node.declaration == activeManifest.primaryDeclaration.toString).bind (·.canonicalConceptId)
  pure {
    id := activeManifest.id
    manifestVersion := activeManifest.version
    primaryDeclaration := activeManifest.primaryDeclaration.toString
    canonicalConceptId := primaryConceptId
    defaultPublicationStatus := publicationStatusName activeManifest.defaultPublicationStatus
    members
  }

private def collectDiagnostics
    (nodes : Array ExtractedNode) (families : Array ExtractedFamily) : Array ExtractionDiagnostic :=
  let nodeDiagnostics := nodes.foldl (init := #[]) fun diagnostics node =>
    let diagnostics := if node.sourceRange.isNone then diagnostics.push {
      code := "source_range_unavailable"
      severity := "warning"
      declaration := some node.declaration
      field := some "sourceRange"
      message := "compiled declaration range is unavailable"
    } else diagnostics
    let diagnostics := node.transforms.foldl (init := diagnostics) fun diagnostics transform =>
      if transform.state.verification == "unresolved" &&
          transform.name == "controlled_unfolding" then
        diagnostics.push {
          code := "controlled_unfolding_unresolved"
          severity := "error"
          declaration := some node.declaration
          field := some "controlledUnfolding"
          message := transform.state.reason.getD "controlled unfolding is unresolved"
        }
      else diagnostics
    if node.usesSorry then diagnostics.push {
      code := "sorry_axiom_in_closure"
      severity := "error"
      declaration := some node.declaration
      field := some "kernelAxioms"
      message := "kernel axiom closure contains sorryAx"
    } else diagnostics
  families.foldl (init := nodeDiagnostics) fun diagnostics family =>
    family.members.foldl (init := diagnostics) fun diagnostics member =>
      if member.evidenceState.verification == "unresolved" then diagnostics.push {
        code := "family_relation_unresolved"
        severity := "error"
        declaration := some member.declaration
        field := some "families.members"
        message := member.evidenceState.reason.getD "family relation evidence is unresolved"
      } else diagnostics

private def extractGraph
    (scope : String) (extractionEnvironment : ExtractionEnvironment) : CoreM ExtractedGraph := do
  let environment ← getEnv
  let mut pending : Array PendingNode := #[]
  for (name, info) in environment.constants.toList do
    if isHarvestCandidate name then
      let canonicalId := CanonicalConceptId? environment name
      let documentation :=
        (← Lean.Core.liftIOCore <| findDocString? environment name).getD ""
      pending := pending.push (← extractPendingNode name info documentation canonicalId)
  pending := pending.qsort fun left right =>
    left.node.declaration < right.node.declaration
  if scope == "supremum" then
    let available : Std.HashSet String := pending.foldl (init := {}) fun names item =>
      names.insert item.node.declaration
    let missing := LRA.Pilot.Supremum.ExtractionManifest.entries.filter fun entry =>
      !available.contains entry.declaration.toString
    unless missing.isEmpty do
      throwError "Supremum extraction manifest declarations are missing: {missing.map (·.declaration)}"
  pending := scopePendingNodes pending scope
  let declarationToId : Std.HashMap String String :=
    pending.foldl (init := {}) fun index item =>
      index.insert item.node.declaration item.node.id
  let mut edges : Array ExtractedEdge := #[]
  let mut edgeKeys : Std.HashSet String := {}
  for item in pending do
    (edges, edgeKeys) := addDependencyEdges
      edges edgeKeys declarationToId item.node item.statementNames "statement"
    (edges, edgeKeys) := addDependencyEdges
      edges edgeKeys declarationToId item.node item.definitionNames "definition"
    (edges, edgeKeys) := addDependencyEdges
      edges edgeKeys declarationToId item.node item.proofNames "proof"
  edges := edges.qsort fun left right =>
    let leftKey := left.source ++ "|" ++ left.target ++ "|" ++ left.kind
    let rightKey := right.source ++ "|" ++ right.target ++ "|" ++ right.kind
    leftKey < rightKey
  let nodes := pending.map (·.node)
  let transitiveEdges := computeTransitiveEdges nodes edges
  let families ← if scope == "supremum" then
    pure #[← extractFamily environment nodes]
  else pure #[]
  let diagnostics := collectDiagnostics nodes families
  let title :=
    if scope == "supremum" then activeManifest.title
    else "LRA Ordering and Bounds Pilot"
  let evidenceNotes := #[
    "Node id is the fully qualified Lean declaration; canonicalConceptId is a separate authored foreign key.",
    "Expression fields are structural Lean expression trees, not reviewed governance semantic ASTs.",
    "Binder roleEvidence is mechanical evidence from binder form, proposition type, and typeclass recognition.",
    "Binder semanticRoleEvidence is resolved from compiled type structure and exact Lean.Name registry rules, with an explicit typed override table for irreducible ambiguities.",
    "The normalized proposition tree uses Lean metatype checks so proposition proof binders become implication guards while data binders remain quantifiers.",
    "Family relation verification and publication correspondence are independent states; a checked theorem never silently approves a publication relationship.",
    "mechanicalDefinitionNegation negates the compiled proposition-valued definition body under its lambda binders.",
    "literalDeclarationNegation is the literal negation of the universally closed declaration type; it is not an approved semantic normal form.",
    "Proof dependencies are direct constants in the compiled theorem or opaque value, recovered with allowOpaque enabled.",
    "kernelAxioms comes from Lean.collectAxioms and does not represent mathematical assumptions or learner prerequisites."
  ]
  let harvestManifest :=
    if scope == "supremum" then
      LRA.Pilot.Supremum.ExtractionManifest.entries.map fun entry =>
      Json.mkObj [
        ("declaration", Json.str entry.declaration.toString),
        ("role", Json.str (legacyManifestRoleName entry.memberRole)),
        ("relationshipToPrimary", Json.str (familyRelationName entry.relation))]
    else #[]
  pure {
    title, scope,
    manifestId := if scope == "supremum" then
      some LRA.Pilot.Supremum.ExtractionManifest.id else none
    manifestVersion := if scope == "supremum" then
      some LRA.Pilot.Supremum.ExtractionManifest.version else none
    primaryDeclaration := if scope == "supremum" then
      some LRA.Pilot.Supremum.ExtractionManifest.primaryDeclaration.toString else none
    harvestManifest
    importModules := #["LRA.Pilot", "LRA.Pilot.Supremum.ExtractionManifest"]
    unfoldingPolicyVersion
    unfoldingPolicyDeclarations := sortedNames unfoldingPolicy
    extractionEnvironment, evidenceNotes,
    nodes, edges, transitiveEdges, families, diagnostics
  }

private def ensureParentDirectory (path : System.FilePath) : IO Unit := do
  if let some parent := path.parent then
    IO.FS.createDirAll parent

private def workspaceSearchPath : IO Lean.SearchPath := do
  let workspace ← IO.currentDir
  let mut paths : Lean.SearchPath :=
    [workspace / ".lake" / "build" / "lib" / "lean"]
  let packages := workspace / ".lake" / "packages"
  if ← packages.isDir then
    for entry in ← packages.readDir do
      let libraryPath := entry.path / ".lake" / "build" / "lib" / "lean"
      if ← libraryPath.isDir then
        paths := paths ++ [libraryPath]
  pure paths

private def processOutput (command : String) (arguments : Array String) : IO String := do
  try
    let output ← IO.Process.output { cmd := command, args := arguments }
    if output.exitCode == 0 then pure output.stdout.trimAscii.toString else pure ""
  catch _ => pure ""

private def extractionEnvironment : IO ExtractionEnvironment := do
  let sourceCommit ← processOutput "git" #["rev-parse", "HEAD"]
  let sourceStatus ← processOutput "git" #["status", "--porcelain=v1"]
  let mathlibCommit ← processOutput "git" #["-C", ".lake/packages/mathlib", "rev-parse", "HEAD"]
  let mathlibStatus ← processOutput "git" #["-C", ".lake/packages/mathlib", "status", "--porcelain=v1"]
  let governanceCommit ← processOutput "git" #["-C", "../lra-governance", "rev-parse", "HEAD"]
  let governanceStatus ← processOutput "git" #["-C", "../lra-governance", "status", "--porcelain=v1"]
  let generatedAtOverride ← IO.getEnv "LRA_EXTRACTION_GENERATED_AT"
  let generatedAt ← match generatedAtOverride with
    | some value => pure value
    | none => processOutput "powershell" #["-NoProfile", "-Command",
        "[DateTime]::UtcNow.ToString('o')"]
  pure {
    generatedAt
    leanVersion := Lean.versionString
    leanGitHash := Lean.githash
    sourceCommit
    sourceDirty := !sourceStatus.isEmpty
    mathlibCommit
    mathlibDirty := !mathlibStatus.isEmpty
    governanceCommit
    governanceDirty := !governanceStatus.isEmpty
  }

private def writeOutputs
    (graph : ExtractedGraph)
    (jsonPath templatePath htmlPath : System.FilePath) : IO Unit := do
  let json := (toJson graph).pretty
  ensureParentDirectory jsonPath
  ensureParentDirectory htmlPath
  IO.FS.writeFile jsonPath json
  let template ← IO.FS.readFile templatePath
  let safeEmbeddedJson := json.replace "</" "<\\/"
  let html := template.replace "__LRA_GRAPH_DATA__" safeEmbeddedJson
  if html == template then
    throw <| IO.userError s!"template {templatePath} has no __LRA_GRAPH_DATA__ marker"
  IO.FS.writeFile htmlPath html
  IO.println s!"Extracted {graph.nodes.size} declarations and {graph.edges.size} edges."
  IO.println s!"JSON: {jsonPath}"
  IO.println s!"HTML: {htmlPath}"

/-- Extract the pilot graph and generate JSON plus a self-contained HTML page.

Arguments, all optional, are JSON output, HTML output, HTML template path, and
scope. The supported scopes are `all` and `supremum`; the latter is selected by
the compiled, typed Supremum manifest and closed over declarations admitted by
that manifest's dependency namespace roots.
-/
unsafe def main (argumentList : List String) : IO Unit := do
  let arguments := argumentList.toArray
  let jsonPath : System.FilePath :=
    System.FilePath.mk <| arguments[0]?.getD "build/pilot/order-bounds-metadata.json"
  let htmlPath : System.FilePath :=
    System.FilePath.mk <| arguments[1]?.getD "build/pilot/order-bounds-explorer.html"
  let templatePath : System.FilePath :=
    System.FilePath.mk <|
      arguments[2]?.getD "LRA/Pilot/Explorer/OrderBoundsExplorer.template.html"
  let scope := arguments[3]?.getD "all"
  unless scope == "all" || scope == "supremum" do
    throw <| IO.userError s!"unsupported extraction scope: {scope}"
  Lean.initSearchPath (← Lean.findSysroot) (← workspaceSearchPath)
  unsafe Lean.enableInitializersExecution
  let environment ← importModules
    (loadExts := true)
    #[{ module := `LRA.Pilot },
      { module := `LRA.Pilot.Supremum.ExtractionManifest }]
    {}
  let context : Core.Context := {
    fileName := "LRA/Pilot/ExtractMetadata.lean"
    fileMap := default
  }
  let state : Core.State := { env := environment }
  let runEnvironment ← extractionEnvironment
  let (graph, _) ← Lean.Core.CoreM.toIO
    (extractGraph scope runEnvironment) context state
  writeOutputs graph jsonPath templatePath htmlPath

end LRA.Pilot.ExtractMetadata

/-- Command-line entry point for the pilot metadata extractor. -/
unsafe def main (arguments : List String) : IO Unit :=
  LRA.Pilot.ExtractMetadata.main arguments
