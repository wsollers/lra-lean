# Lean Extraction and Independent Authoring Contract

## Status and purpose

This document defines the maximal extraction contract to apply uniformly to
every harvested Lean axiom, definition, theorem, and proof. It is not an
inventory of the individual declarations in the Supremum pilot.

The contract has two goals:

1. obtain every useful fact that Lean can supply or derive deterministically;
2. populate the formal and logical parts of governed LaTeX and the knowledge
   explorer without pretending that Lean authored mathematical exposition,
   pedagogy, provenance, or correspondence judgments.

The Supremum pilot is the calibration case. Once the contract is accepted, the
same fields, transforms, availability rules, and validation rules apply to all
future extraction scopes.

This document distinguishes five sources of information:

| Code | Source | Meaning |
|---|---|---|
| `H` | Harvested | Read directly from Lean's compiled environment. |
| `T` | Transformed | Deterministically computed from harvested Lean expressions. |
| `W` | Witnessed | Supplied by a separate named, checked Lean declaration. |
| `A` | Authored | Independently written and reviewed mathematical or pedagogical information. |
| `J` | Joined | Deterministically resolved from Lean evidence, governance registries, semantic artifacts, volume sources, or the proof vault. |

No displayed value may lose this provenance classification.

## Governing principles

### Maximal but bounded extraction

The extractor offers the maximal useful Lean evidence package. “Maximal” does
not mean recursively unfolding Lean and Mathlib until only kernel primitives
remain. It means extracting all useful declaration, logical, dependency,
location, and trust evidence while stopping at a governed mathematical
boundary.

### One authority per claim, multiple witnesses

Each claim has one authoritative owner, but may have several witnesses and
projections.

- Lean owns facts about Lean declarations, compiled expressions, proofs,
  dependencies, and kernel trust.
- Governance owns shared concept, structure, relation, and notation vocabulary.
- A semantic artifact owns reviewed mathematical meaning and logical-form
  selections.
- Volume sources own published prose during calibration.
- The proof vault owns proof-attempt history.
- LaTeX and explorer output are generated projections and joins.

### Identities remain separate

The following are foreign keys to different entities and must never be
collapsed:

```text
mathematical concept ID != artifact label != Lean declaration ID
```

For example:

```text
pred:least-upper-bound
def:supremum
LRA.Pilot.OrderBounds.LeastUpperBound
```

The Lean declaration ID is always the fully qualified declaration name. A
canonical concept ID is a separate, authored foreign key. An artifact label is
joined through a reviewed formalization relationship.

### Absence is explicit

Every contracted field is emitted with either a value or an availability
status:

```text
available
unavailable
not_applicable
unresolved
not_requested
```

The extractor must not silently omit a field, silently substitute prose, or
silently fall back to a source-text heuristic.

### Raw evidence is retained

Every transformation retains:

- the input expression;
- the transformed expression;
- the transform name and version;
- declarations unfolded or used as witnesses;
- terminal declarations at which transformation stopped;
- additional logical or structural assumptions;
- validation status.

This makes all rendered logical forms reproducible and auditable.

## Extraction package

An extraction run produces one package containing a run envelope, declaration
records, formal dependency edges, diagnostics, and deterministic projections.

### Run envelope: always populated

| Field | Source | Rule |
|---|---|---|
| extraction schema/version | `H` | Version of this contract's machine representation. |
| extractor name/version | `H` | Exact exporter implementation. |
| extraction scope | `H` | Named scope plus seed and dependency-closure rules. |
| generated time | `T` | UTC generation time. |
| `lra-lean` commit and dirty state | `H` | Never infer cleanliness from a commit alone. |
| Lean version and Git hash | `H` | Exact compiler. |
| Mathlib commit and dirty state | `H` | Exact imported library state. |
| imported modules | `H` | Complete module import roots. |
| unfolding-policy version | `H` | Governs full predicate expansion. |
| rendering-registry commit | `J` | Required only for a rendered projection. |
| diagnostics | `T` | Every unresolved ID, stopped transform, or unavailable field. |

### Common declaration record: always populated

Every axiom, definition, theorem, and relevant structure declaration receives
the following record.

#### Identity and source

| Field | Source |
|---|---|
| fully qualified declaration ID | `H` |
| short Lean name | `H` |
| module | `H` |
| source path | `H` |
| complete declaration range | `H` |
| declaration-name selection range | `H` |
| declaration kind | `H` |
| scope role: seed or dependency | `T` |
| canonical concept foreign key, if annotated | `H/A` |
| harvest-role annotation, if present | `H/A` |

`title` derived from the short Lean name is only a display fallback. It is not
the canonical mathematical title.

#### Compiler classification

| Field | Source |
|---|---|
| universe parameters | `H` |
| safety: safe, partial, or unsafe | `H` |
| reducibility: regular, abbreviation, or opaque | `H` |
| mutual-declaration block | `H` |
| compiled docstring | `H/A` |

Docstrings are Lean-authored documentation evidence. They may seed a review
interface, but they do not become canonical volume prose automatically.

#### Signature and binders

The extractor opens the leading `forall` telescope and emits:

| Field | Source |
|---|---|
| complete pretty-printed elaborated type | `H` |
| lossless structural Lean-expression tree | `H` |
| binder order | `H` |
| binder name | `H` |
| binder type and type-expression tree | `H` |
| binder form: explicit, implicit, strict implicit, instance implicit | `H` |
| proposition-valued binder evidence | `T` |
| recognized typeclass and class name | `T` |
| candidate role: data parameter, proposition hypothesis, or typeclass instance | `T` |
| residual result type and expression tree | `T` |
| candidate logical shape | `T` |

Candidate roles do not decide which binder is the pedagogical ambient context,
which assumptions are standing assumptions, or which symbols should be used in
print. Those are reviewed semantic decisions.

#### Trust and availability

| Field | Source |
|---|---|
| kernel axiom closure | `H` via `Lean.collectAxioms` |
| `usesSorry` | `T` from presence of `sorryAx` |
| body/proof availability | `H` |
| source-range availability | `H` |
| transformation availability | `T` |

`kernelAxioms` never means mathematical assumptions, foundational stance, or
learner prerequisites.

## Artifact-kind contracts

### Axiom

For every Lean axiom declaration, populate:

1. the complete common declaration record;
2. the elaborated proposition type;
3. the opened binder/context candidate record;
4. the raw structural predicate logic;
5. the controlled fully unfolded predicate logic;
6. the standard quantified candidate;
7. the literal negation candidate;
8. the pushed-negation candidate when supported;
9. statement dependency edges;
10. kernel trust status identifying the declaration itself as assumed rather
    than proved.

An axiom has no definition body and no proof record. Those fields are emitted
as `not_applicable`.

The extractor may recognize that an axiom's result is an implication, but the
LaTeX projection does not create a contrapositive block for axioms. A
contrapositive is not part of the axiom's authored content.

Authored axiom information includes its mathematical title, prose, provenance,
foundational interpretation, intended model/class of structures, and why it is
being adopted.

### Definition

For every Lean definition, populate:

1. the complete common declaration record;
2. signature and binder evidence;
3. compiled definition body;
4. lossless body expression tree;
5. reducibility and abbreviation status;
6. immediate predicate body after lambda opening;
7. controlled fully unfolded predicate logic;
8. standard quantified candidate;
9. predicate-reading candidate after governed concept folding;
10. literal body negation;
11. pushed-negation candidate;
12. definition and statement dependency edges;
13. abbreviation/alias candidates;
14. definitional-equivalence validation between each transformed form and the
    original definition.

For a proposition-valued definition such as least upper bound, the target
fully unfolded form is mathematically bounded. For example:

```text
LeastUpperBound(P, A, s)

⇒ UpperBound(P, A, s) ∧
   ∀u, UpperBound(P, A, u) → s ≤ u

⇒ (∀x, x ∈ A → x ≤ s) ∧
   ∀u, ((∀x, x ∈ A → x ≤ u) → s ≤ u)
```

The extractor stops at logical connectives, equality, membership, the ambient
order relation, approved primitive structures, and unresolved opaque
predicates. It does not unfold these into typeclass projections or kernel
inductives.

Definitions do not receive proof records or contrapositive boxes. Checked
theorems establishing useful equivalent definitions are separate theorem
records linked to the definition.

Authored definition information includes the mathematical title, canonical
prose, approved symbols, interpretation, scope conventions, applicability
discussion, learner prerequisites, and selection of useful equivalent forms.

### Theorem, lemma, proposition, or corollary

Lean's compiled kind normally distinguishes theorem-like declarations from
definitions, but it does not recover the volume's editorial distinction among
theorem, lemma, proposition, and corollary. The artifact kind remains authored.

For every theorem-like declaration, populate:

1. the complete common declaration record;
2. the elaborated theorem type;
3. binder, typeclass, and proposition-hypothesis evidence;
4. the residual conclusion;
5. raw and controlled-unfolded predicate logic;
6. standard quantified candidate;
7. literal whole-declaration negation;
8. pushed-negation candidate;
9. a contrapositive candidate when the theorem has a supported implication
   shape;
10. equivalence-direction projections when the conclusion is an `iff`;
11. statement dependency edges;
12. the complete proof evidence record below;
13. checked links to definitions, examples, counterexamples, and logical-form
    witnesses when those links are explicitly declared or resolved by a
    governed manifest.

#### Contrapositive transform

For a theorem normalized as

```text
∀Γ, H₁ → ⋯ → Hₙ → C,
```

the mechanical contrapositive candidate is represented canonically as

```text
∀Γ, ¬C → ¬(H₁ ∧ ⋯ ∧ Hₙ).
```

Here `Γ` contains data, structure, and typeclass parameters; only
proposition-valued hypotheses enter the antecedent conjunction. The transform
is intuitionistically valid, but its usefulness and display form remain
reviewed choices.

The extractor must not generate a converse, inverse, or biconditional from an
implication. Those require separate checked declarations.

The LaTeX renderer includes a contrapositive block only when the semantic
artifact approves the candidate or links a named checked theorem as the
published form.

### Proof evidence

Every checked theorem-like declaration receives a proof evidence record. This
record is detailed formal evidence; it is not a human mathematical proof.

#### Always populated from compiled Lean

| Field | Source | Meaning |
|---|---|---|
| proof availability | `H` | Whether the compiled theorem/opaque value is available. |
| proof-term structural form or external sidecar reference | `H` | Lossless kernel-term evidence; large terms may live in a content-addressed sidecar. |
| proof-term digest | `T` | Stable digest under the declared serialization/version. |
| direct constants used by the proof value | `H` | Immediate formal dependencies. |
| local-LRA proof dependencies | `T` | Direct constants classified as LRA declarations. |
| external-library proof dependencies | `T` | Direct constants classified by package/module. |
| kernel/platform proof dependencies | `T` | Primitive and compiler-level constants. |
| transitive dependency closure | `T` | Reachability closure with direct/transitive flags. |
| selected-scope proof edges | `T` | Edges whose endpoints are both harvested records. |
| kernel axiom closure | `H` | `Lean.collectAxioms` result. |
| `usesSorry` | `T` | Whether the closure contains `sorryAx`. |
| proof source range | `H` | Declaration range; finer tactic ranges require source syntax evidence. |
| build/toolchain evidence | `H/J` | Run envelope and build result. |

Proof bodies must be requested with opaque/theorem values enabled. In Lean 4's
API this means using the equivalent of:

```lean
info.value? (allowOpaque := true)
```

Calling `value?` with its default setting incorrectly reports theorem proof
bodies as unavailable.

#### What compiled proof terms do not provide

After elaboration, a proof term generally does not retain:

- the original tactic script as a semantic sequence;
- the author's mathematical plan;
- why a lemma was chosen;
- which steps are pedagogically important;
- prose explanations;
- diagrams or calculations omitted from Lean;
- a learner-appropriate dependency route.

Source text may be attached as source evidence, but parsing tactic syntax does
not reconstruct a canonical detailed mathematical proof.

Therefore the detailed LaTeX proof remains authored. Lean supplies a formal
verification attachment, formal dependency graph, trust report, and optional
machine-oriented proof-term view. A reviewed proof correspondence states
whether the Lean proof verifies the same claim; it does not assert that the
Lean term is the published proof's prose source.

## Exact Lean transforms

Transforms run in the following order. Each output records its inputs,
policy/version, validation result, and unresolved boundaries.

### T0. Import and select

- Import the compiled modules with environment extensions enabled.
- Select declarations through an explicit versioned harvest manifest.
- Compute the dependency-closed scope requested by the manifest.
- Mark each declaration as `seed` or `dependency`.
- Fail if a required manifest declaration does not resolve.

Namespace string matching may assist discovery, but it is not the normative
scope authority.

### T1. Open the declaration telescope

- Open leading `forall` binders.
- Preserve order, dependency, names, binder annotations, and types.
- Recognize typeclasses using Lean's class environment.
- Identify proposition-valued binders as assumption candidates.
- Retain data and structural binders separately from proposition hypotheses.

### T2. Extract values

- Definitions: read the compiled value.
- Theorems/opaque declarations: read the value with opaque access enabled.
- Axioms: report that no value is applicable.
- Preserve the raw expression before reduction.

### T3. Controlled predicate unfolding

Apply:

- delta reduction only to definitions authorized by the unfolding policy;
- beta reduction;
- iota reduction;
- zeta reduction;
- structure-projection reduction;
- abbreviation expansion.

Stop at:

- `∀`, `∃`, `∃!`, `¬`, `∧`, `∨`, `→`, `↔`, and equality;
- membership;
- governed primitive relations such as the ambient order;
- approved primitive structures and constructors;
- opaque or external declarations not authorized by policy;
- a recursion/depth/size limit.

Emit both `unfoldedDeclarations` and `stoppedAtDeclarations`. Hitting an
unexpected opaque declaration or limit produces `unresolved`, never a silently
partial “fully unfolded” claim.

### T4. Normalize to the extraction logic AST

Convert the reduced Lean expression into a lossless extraction AST containing
at least:

```text
variable, constant, application, forall, exists, exists_unique,
not, and, or, implies, iff, equals, membership, relation,
lambda, let, projection, sort
```

The extraction AST retains fully qualified Lean constants and binder indices.
It is not automatically the approved governance semantic AST.

### T5. Produce the standard quantified candidate

- Reconstruct explicit mathematical quantification from the telescope and
  unfolded proposition.
- Preserve structural and data parameters in context.
- Preserve proposition hypotheses as antecedents.
- Do not infer nonemptiness, completeness, totality, or other assumptions that
  are absent from the declaration.

### T6. Produce negation candidates

For proposition-valued definitions:

- negate the fully unfolded predicate body under its binders.

For axioms and theorem-like declarations:

- negate the universally closed statement literally;
- push negation inward to a candidate negation normal form when the transform
  is supported;
- record every use of classical principles or decidability.

The extractor retains both literal and normalized candidates. It never labels
either one “approved.”

Order-specific rewrites such as

```text
¬(x ≤ y) ⇔ y < x
```

are not generic logical normalization. They require an attached checked
theorem and its structural hypotheses, such as totality.

### T7. Produce implication and equivalence candidates

- Generate the canonical contrapositive candidate for supported theorem
  implications.
- Split checked equivalences into forward and reverse implication projections.
- Detect definitional abbreviations as alias candidates.
- Never infer converse, inverse, duality, specialization, or generalization
  merely from syntax or names.

### T8. Resolve checked witnesses

Using explicit annotations or a governed relationship manifest, attach named
Lean declarations that prove:

- approved equivalent forms;
- nontrivial negation normalizations;
- strict-order specializations;
- converses or inverses;
- dual forms;
- examples and counterexamples;
- existence and uniqueness claims.

Names and docstrings may propose candidates but are not relationship authority.

### T9. Extract dependencies and trust

- Statement dependencies come from the declaration type.
- Definition dependencies come from the compiled definition value.
- Proof dependencies come from the compiled theorem/opaque value.
- Direct dependencies remain distinct from transitive closure.
- Internal LRA, external library, and kernel/platform dependencies are
  classified separately.
- Kernel axioms and `sorryAx` are computed for every declaration.

### T10. Render with governed vocabulary

Rendering joins the extraction AST to governance registries:

- concept and structure IDs;
- predicate argument roles;
- notation;
- surface forms;
- binder-display roles;
- approved relationship vocabulary.

Missing vocabulary produces an unresolved registry need. A folder-local
notation dictionary may be used for experimentation, but it is never canonical
and cannot silently enter production output.

### T11. Reconcile and validate

Before projection:

- preserve declaration, concept, and artifact identities separately;
- validate all foreign keys;
- verify definitional equality for unfolded forms;
- verify named logical-form witnesses;
- record the reviewed Lean-to-artifact correspondence class;
- fail visibly on an unresolved required join.

## Dependency contract

The extraction package maintains several graphs because they answer different
questions.

| Graph | Owner | Meaning |
|---|---|---|
| statement dependencies | Lean | Constants required to state the declaration. |
| definition dependencies | Lean | Constants used by the compiled definition body. |
| direct proof dependencies | Lean | Constants used directly by the compiled proof term. |
| transitive formal closure | Generated | Reachability through formal dependency edges. |
| kernel trust closure | Lean | Axioms on which checking ultimately depends. |
| mathematical/ontology relationships | Semantic artifact + governance | Dual, specializes, derives from, alias, equivalence, and related concepts. |
| learner prerequisites | Volume/semantic artifact | What a learner should know first. |
| prose-proof dependencies | Authored proof source | Theorems explicitly invoked in the published proof route. |
| proof-vault relationships | Proof vault + reviewed join | Attempts and evidence associated with an artifact. |

These graphs must not be merged under a generic `depends_on` label.

## Projection into governed LaTeX

The extractor supplies candidates and evidence. The semantic artifact and
governance rules determine which blocks appear.

| LaTeX material | Population source |
|---|---|
| environment kind | `A`, validated against Lean kind where applicable |
| label | `A` artifact identity |
| title | `A`; Lean short name is only a fallback suggestion |
| canonical prose statement | `A` |
| canonical mathematical display | approved extraction AST/render or `A`, then validated |
| ambient/context line | reviewed binder roles `A`, checked against `H/T` |
| parameters and assumptions | reviewed `A`, checked against telescope evidence |
| Standard quantified statement | `T`, rendered through governance, then approved |
| Predicate reading | `J/T` from approved concept folding and predicate signatures, then approved |
| Negated quantified statement | `T`, then approved |
| Negation predicate reading | `T/W/J`, then approved |
| Contrapositive | `T` candidate or `W` named theorem, included only after approval |
| Equivalent forms | `W/A`; never inferred solely from prose |
| Failure modes | formal clauses from `W`; mode names, explanation, and selection from `A` |
| Interpretation | `A` |
| Exposition | `A` |
| Examples/counterexamples | prose and selection `A`; formal verification `W` |
| Dependencies block | learner/prose dependencies `A`; formal graph shown separately if desired |
| Lean formalization marker | `J` plus reviewed correspondence |
| Detailed proof | `A`; Lean proof evidence and trust report are attachments |

### Definition boxes

A definition box may be populated from Lean with the approved rendered
predicate, context, parameters, assumptions, and standard quantified form. Its
title, prose formulation, interpretation, and pedagogical organization remain
authored.

### Nonemptiness and completeness remain separate

Supremum extraction must distinguish three different claims:

1. `Nonempty R`: the ambient carrier has an element;
2. `A.Nonempty`: the particular subset has an element;
3. order completeness: every nonempty bounded-above represented subset has a
   supremum.

The generic `LeastUpperBound` definition contains none of these as an added
assumption. A completeness/existence theorem carries subset nonemptiness and
boundedness as explicit hypotheses and ambient order completeness as separate
structure evidence. An ordered field is already inhabited by `0`, so an extra
`[Nonempty R]` binder is redundant in that specialization.

The extractor reports these as distinct semantic binder roles:

```text
ambient_carrier_nonempty
subset_nonempty
subset_bounded_above
ambient_order_completeness
ambient_ordered_field
```

It reports an existential least-upper-bound conclusion separately as
`supremum_existence`. A real-analysis renderer may therefore show “complete
ordered field: `Real`” and “assumptions: `A.Nonempty` and bounded above” without
changing the raw predicate logic of `LeastUpperBound`.

### Theorem boxes

A theorem box may be populated from the elaborated theorem type and reviewed
rendering. Logical variants are attached only with provenance as transforms or
checked witnesses. Editorial theorem/lemma/proposition/corollary classification
remains authored.

### Failure boxes

Lean may supply a checked failure characterization and named counterexamples.
It does not decide:

- which failures are applicability failures;
- which are failures of the statement;
- the learner-facing names of failure modes;
- their explanatory prose;
- which counterexample should be featured.

Those decisions remain authored, while each formal assertion may link to a
checked witness.

### Proof boxes

The detailed proof box remains authored mathematical prose. It may display a
generated verification attachment containing:

- Lean declaration and source link;
- build and correspondence status;
- `usesSorry`;
- kernel axioms;
- direct formal dependencies;
- optional machine proof-term view.

Formal proof constants do not replace learner-oriented proof steps.

## Projection into the knowledge explorer

The explorer node remains centered on the artifact label. Lean evidence is a
formalization attachment, not the node's replacement identity.

| Explorer field/group | Population source |
|---|---|
| artifact ID, kind, title | semantic artifact/volume `A` |
| statement display and TeX | approved semantic statement `A/J` |
| logical blocks | approved transformed/witnessed forms `T/W/A` |
| support blocks | authored semantic blocks `A` |
| failure modes | authored selection with checked witnesses `A/W` |
| examples | authored examples plus formal witness links `A/W` |
| learner dependencies | authored learner graph `A` |
| formal statement/definition/proof graph | Lean extraction `H/T` |
| formalizations | declaration join plus reviewed correspondence `J/A` |
| trust panel | build, kernel axioms, and `usesSorry` from Lean `H/T` |
| source navigation | generated routes and pinned source locations `J` |
| proof source | authored volume proof `A` |
| proof-vault attempts | proof-vault join `J` |

The explorer must label learner dependencies, formal dependencies, and proof
dependencies distinctly.

## Independently authored and maintained overlay

Even with maximal Lean extraction, the following remain independently authored
or reviewed:

### Shared governance vocabulary

- canonical concept and structure IDs;
- predicate argument roles and ambient argument;
- notation and surface forms;
- relationship kinds;
- historical identity aliases;
- concept-level Mathlib correspondence and semantic role.

### Per-artifact mathematical content

- artifact label, kind, title, status, and atomicity;
- canonical prose and canonical LaTeX selection;
- reviewed context, parameters, and assumption roles;
- approved semantic AST;
- approved negation and its normalization requirements;
- selected contrapositive and equivalent forms;
- interpretation and failure analysis;
- formalization correspondence class;
- mathematical provenance, citations, and source variants;
- ontology, duality, specialization, and generalization claims.

### Pedagogical content

- learner prerequisites and teaching order;
- motivation and exposition;
- featured examples and counterexamples;
- misconception explanations;
- difficulty and learner level;
- detailed proof narrative and proof strategy.

### Proof-vault content

- attempts, scans, photographs, and OCR;
- transcription and review state;
- attempt notes and featured attempts;
- historical route snapshots.

Lean can validate many authored mathematical claims. Validation does not move
authorship or authority into Lean.

## Required validation gates

Every extraction run must verify:

1. every manifest seed resolves;
2. declaration IDs are unique and remain distinct from concept IDs;
3. all emitted source paths and ranges resolve;
4. every edge endpoint resolves or is represented as an explicit external
   reference;
5. direct and transitive dependencies are labeled distinctly;
6. theorem proof availability is reported accurately;
7. kernel axiom closure and `usesSorry` are populated;
8. fully unfolded forms are definitionally equal to their source expressions;
9. every nontrivial normalization names a checked witness and required
   assumptions;
10. no generated candidate is labeled approved without semantic review;
11. all governance foreign keys resolve;
12. required joins fail visibly rather than producing empty placeholders;
13. the Lean project build gate passes;
14. LaTeX and explorer projections preserve the approved semantic record.

## Supremum calibration status

The current Supremum v4 extraction demonstrates:

- separate declaration, concept, and manifest identities;
- source paths and compiled declaration ranges;
- binders, typeclasses, and proposition-hypothesis evidence;
- raw statement, definition-body, and proof-term expression trees;
- folded predicate bodies with leading lambdas opened;
- policy-bounded recursive predicate unfolding with definitional-equality
  verification;
- raw extraction-logic ASTs and readable fully unfolded predicate text;
- literal negation and pushed-negation candidates with classical-principle
  accounting;
- contrapositive candidates where applicable;
- named checked general-poset and total-order logical-form witnesses;
- proof-term digests and dependency ownership partitions;
- separate typed statement, definition, proof, and transitive edges;
- kernel axiom closure and `sorryAx` detection;
- an explicit versioned harvest manifest and dependency-closed scope;
- separate carrier-nonempty, subset-nonempty, subset-boundedness,
  order-completeness, ordered-field, and supremum-existence evidence;
- reproducibility metadata and a slot-complete comparison projection.

The visible remaining extractor and integration gaps are:

- complete T4 normalization of proposition-valued dependent binders: the raw
  AST currently retains some membership guards as anonymous `forall`/`exists`
  proof binders instead of classifying their surface implication/conjunction
  role;
- governed T10 rendering through the shared predicate, structure, relation,
  and notation registries;
- governed witness, artifact-label, and formalization reconciliation;
- production LaTeX and explorer projections backed by an approved semantic
  artifact rather than the pilot-local renderer;
- optional content-addressed sidecars for large lossless proof terms and raw
  expression trees.

Those are extractor and integration tasks. Canonical prose, mathematical
meaning, applicability conventions, pedagogy, detailed proof narrative,
provenance, and correspondence review remain authored by design.
