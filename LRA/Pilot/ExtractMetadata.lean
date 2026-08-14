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
  extractorVersion : String := "4.0"
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
  deriving ToJson

/-- One dependency edge between two harvested declarations. -/
structure ExtractedEdge where
  source : String
  target : String
  kind : String
  deriving ToJson

/-- Complete graph payload consumed by the local explorer. -/
structure ExtractedGraph where
  schemaVersion : Nat := 4
  schemaId : String := "lra.lean-extraction-contract"
  title : String
  scope : String
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
  deriving ToJson

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
          ("antecedent", logicExpressionJson domain),
          ("consequent", logicExpressionJson body)]
      else
        Json.mkObj [
          ("kind", Json.str "forall"),
          ("name", Json.str name.toString),
          ("binderInfo", Json.str (binderInfoName binderInfo)),
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
              ("domain", expressionJson domain),
              ("body", logicExpressionJson body)]
        | _ => Json.mkObj [
            ("kind", Json.str "exists"),
            ("predicate", expressionJson args[0]!)]
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

private def unfoldingPolicyVersion : String :=
  "lra.pilot.logical-unfolding/1.1"

private def unfoldingPolicy : Array Name := #[
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

private structure ControlledUnfolding where
  expression : Expr
  unfoldedDeclarations : Array Name
  stoppedAtDeclarations : Array Name
  definitionallyEqual : Bool

private def isLogicalOrPrimitiveConstant (name : Name) : Bool :=
  name == ``Not || name == ``And || name == ``Or || name == ``Iff ||
    name == ``Eq || name == ``Exists || name == ``Membership.mem ||
    name.toString.endsWith ".NonStrictOrder" ||
    name.toString.endsWith ".Carrier"

private def controlledUnfold (input : Expr) : MetaM ControlledUnfolding := do
  let mut expression := input
  let mut unfolded : Array Name := #[]
  for declaration in unfoldingPolicy do
    let result ← Lean.Meta.unfold expression declaration
    if result.expr != expression then
      expression := result.expr
      unfolded := unfolded.push declaration
  let definitionallyEqual ← Lean.Meta.isDefEq input expression
  let remaining := expression.getUsedConstants.filter fun name =>
    !unfoldingPolicy.contains name && !isLogicalOrPrimitiveConstant name
  pure {
    expression
    unfoldedDeclarations := unfolded
    stoppedAtDeclarations := remaining
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

private def isStructuralPosetDeclaration (name : Name) : Bool :=
  let text := name.toString
  text == "LRA.VolumeI.Relations.Order.Poset" ||
    text == "LRA.VolumeI.Relations.Order.Poset.Carrier" ||
    text == "LRA.VolumeI.Relations.Order.Poset.NonStrictOrder" ||
    text == "LRA.VolumeI.Relations.Order.Poset.NonStrictOrderIsPartialOrder"

private def isPilotDeclaration (name : Name) : Bool :=
  let text := name.toString
  (text.startsWith "LRA.Pilot.OrderBounds" &&
      !text.contains "._example" &&
      !text.contains ".match_" &&
      !text.contains ".proof_") ||
    isStructuralPosetDeclaration name

private def declarationCategory
    (name : Name) (kind : String) (canonicalId : Option String) : String :=
  let text := name.toString
  if canonicalId.isSome then "canonical"
  else if text.contains ".Counterexamples." then "counterexample"
  else if text.contains ".Examples." then "example"
  else if text.contains ".FromPartialOrder." then "adapter"
  else if isStructuralPosetDeclaration name then "structure"
  else kind

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

private def semanticBinderRoleEvidence
    (binderType : Expr) (className : Option Name) : String :=
  let constants := binderType.getUsedConstants.map Name.toString
  let classText := className.map Name.toString
  if classText == some "Nonempty" || constants.contains "Nonempty" then
    "ambient_carrier_nonempty"
  else if classText == some
      "LRA.VolumeI.AlgebraicStructures.OrderCompletenessLaws" then
    "ambient_order_completeness"
  else if classText == some
      "LRA.VolumeI.AlgebraicStructures.OrderedFieldLaws" then
    "ambient_ordered_field"
  else if classText == some "PartialOrder" then
    "ambient_order_structure"
  else if classText == some "Membership" then
    "set_membership_interface"
  else if constants.contains "Set.Nonempty" ||
      (constants.contains "Exists" && constants.contains "Membership.mem") then
    "subset_nonempty"
  else if constants.contains "LRA.Pilot.OrderBounds.BoundedAbove" ||
      constants.contains "LRA.Pilot.OrderBounds.FromPartialOrder.BoundedAbove" ||
      constants.contains "LRA.VolumeI.Relations.Order.BoundedAbove" ||
      constants.contains "BddAbove" then
    "subset_bounded_above"
  else
    "unclassified"

private def semanticResultRoleEvidence (result : Expr) : String :=
  let constants := result.getUsedConstants.map Name.toString
  if constants.contains "Nonempty" then
    "ambient_carrier_nonempty"
  else if constants.contains "Exists" &&
      (constants.contains "LRA.Pilot.OrderBounds.LeastUpperBound" ||
       constants.contains
         "LRA.Pilot.OrderBounds.FromPartialOrder.LeastUpperBound") then
    "supremum_existence"
  else
    "unclassified"

private structure ExtractedSignature where
  binders : Array ExtractedBinder
  rawResult : Expr
  resultType : String
  resultExpression : Json
  resultIsProposition : Bool
  resultLogicalShape : String

private def extractSignature (type : Expr) : CoreM ExtractedSignature :=
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
          semanticBinderRoleEvidence declaration.type className
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
  let signature ← extractSignature info.type
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
      pure <| logicExpressionJson body
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
          pure <| logicExpressionJsonWithPolarity body false
    else if statementIsProposition then
      pure <| controlledUnfolding.map fun result =>
        logicExpressionJsonWithPolarity result.expression false
    else pure none
  let contrapositive ←
    if kind == "theorem" || kind == "opaque" then
      Lean.Meta.MetaM.run' <| extractContrapositive info.type
    else pure { expression := none, status := "not_applicable" }
  let proofTerm :=
    if kind == "theorem" || kind == "opaque" then body else none
  let semanticBinderRoles := signature.binders.foldl
    (init := #[]) fun roles binder =>
      if binder.semanticRoleEvidence == "unclassified" ||
          roles.contains binder.semanticRoleEvidence then
        roles
      else
        roles.push binder.semanticRoleEvidence
  let node : ExtractedNode := {
    id := name.toString
    title := shortName name
    declaration := name.toString
    moduleName
    sourcePath
    sourceRange
    sourceRangeStatus := if sourceRange.isSome then "available" else "unavailable"
    scopeRole := "included"
    manifestRole := manifestEntry.map (·.role)
    relationshipToPrimary := manifestEntry.map (·.relationshipToPrimary)
    kind
    category := declarationCategory name kind canonicalId
    canonicalConceptId := canonicalId
    universeParameters := info.levelParams.toArray.map Name.toString
    safety := safetyName info
    reducibility := reducibilityName info
    mutualDeclarations := mutualDeclarations info
    statement := ← prettyExpression info.type
    statementExpression := expressionJson info.type
    statementLogicExpression := logicExpressionJson info.type
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
    controlledUnfoldingStatus :=
      if controlledUnfolding.isSome then "available_bounded_by_policy"
      else "unavailable"
    unfoldedPredicateLogic
    unfoldedPredicateLogicStatus :=
      if unfoldedPredicateLogic.isSome then
        "available_raw_logic_before_governed_rendering"
      else "unavailable"
    unfoldingPolicyVersion
    unfoldedDeclarations := controlledUnfolding.map
      (fun result => sortedNames result.unfoldedDeclarations) |>.getD #[]
    stoppedAtDeclarations := controlledUnfolding.map
      (fun result => sortedNames result.stoppedAtDeclarations) |>.getD #[]
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
    pushedNegationPrinciples :=
      if pushedNegationExpression.isSome then
        #["classical: not_forall_to_exists_not", "classical: not_implies_to_and_not"]
      else #[]
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

private def extractGraph
    (scope : String) (extractionEnvironment : ExtractionEnvironment) : CoreM ExtractedGraph := do
  let environment ← getEnv
  let mut pending : Array PendingNode := #[]
  for (name, info) in environment.constants.toList do
    if isPilotDeclaration name then
      let canonicalId := CanonicalConceptId? environment name
      let documentation :=
        (← Lean.Core.liftIOCore <| findDocString? environment name).getD ""
      if canonicalId.isSome || !documentation.isEmpty || isStructuralPosetDeclaration name then
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
  let title :=
    if scope == "supremum" then "LRA Supremum Lean Evidence"
    else "LRA Ordering and Bounds Pilot"
  let evidenceNotes := #[
    "Node id is the fully qualified Lean declaration; canonicalConceptId is a separate authored foreign key.",
    "Expression fields are structural Lean expression trees, not reviewed governance semantic ASTs.",
    "Binder roleEvidence is mechanical evidence from binder form, proposition type, and typeclass recognition.",
    "Binder semanticRoleEvidence keeps ambient carrier nonemptiness, subset nonemptiness, subset boundedness, order completeness, and ordered-field structure distinct.",
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
        ("role", Json.str entry.role),
        ("relationshipToPrimary", Json.str entry.relationshipToPrimary)]
    else #[]
  pure {
    title, scope,
    manifestVersion := if scope == "supremum" then
      some LRA.Pilot.Supremum.ExtractionManifest.version else none
    primaryDeclaration := if scope == "supremum" then
      some LRA.Pilot.Supremum.ExtractionManifest.primaryDeclaration.toString else none
    harvestManifest
    importModules := #["LRA.Pilot", "LRA.Pilot.Supremum.ExtractionManifest"]
    unfoldingPolicyVersion
    unfoldingPolicyDeclarations := sortedNames unfoldingPolicy
    extractionEnvironment, evidenceNotes,
    nodes := pending.map (·.node), edges
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
  let generatedAt ← processOutput "powershell" #["-NoProfile", "-Command", "[DateTime]::UtcNow.ToString('o')"]
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
scope. The supported scopes are `all` and `supremum`; `supremum` includes every
declaration defined in a `LRA.Pilot.Supremum.*` module plus its transitive
dependencies within the harvested pilot.
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
