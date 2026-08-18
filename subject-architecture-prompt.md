# LRA Subject Architecture, Naming Conventions, and Coding Standards

Work in the `lra-lean` repository, on the `standardization` line. Treat this as
an implementation task, not an advisory review. Read the repository governance
entrypoint and run the canonical route resolver before editing.

This document supersedes `namespace-refactor-prompt.md` and the architecture
description in any generated `namespace-review.md`. Where a doc-comment inside
the repository contradicts this document, the doc-comment is stale and must be
corrected as part of the work.

**Do not preserve obsolete names with compatibility aliases, re-exports, or
forwarding abbreviations.** The previous migration was given this instruction and
left roughly 100 aliases anyway; §7.0 audits and removes them, and §7.0.1 states
the standing rule. Do not commit or push unless the user separately authorizes
that action. **Do not complete proofs.
Leave every proof as `sorry`. Proofs belong to the author.**

---

## 1. The subject architecture

### 1.1 Subjects are the unit of ownership

A **subject** is a durable mathematical domain that owns declarations. Subjects
live directly under `LRA`. Curricular volumes are *presentation order*, not
ownership, and appear only as file aggregators.

The subject list:

```text
LRA.Identity          identity and equality
LRA.Logic             propositional, first-order, second-order, proof systems
LRA.Set               set backends, the set interface, ZFC development
LRA.SetSystems        rings, algebras, and σ-algebras of sets
LRA.Relation          relations
LRA.Function          functions
LRA.Morphism          structure-preserving functions
LRA.Cardinality       equinumerosity, finiteness, countability, Cantor
LRA.Operation         operations and their laws
LRA.UniversalAlgebra  signatures, algebras, congruences, quotients
LRA.AlgebraicStructures   the named structures: group, ring, field, lattice, …
LRA.Order             order theory, bounds, lattices, order morphisms
LRA.NumberSystems     ℕ, ℤ, ℚ, ℝ, ℂ, Gaussian integers, Peano systems
LRA.Analysis          Bounds, MetricSpaces, MeasureTheory, FunctionalAnalysis
LRA.Topology          general topology
LRA.LinearAlgebra     vector spaces and linear maps
LRA.Internal          explicitly non-API orienting and scratch material
```

Create a subject only when it owns durable declarations. Do not create empty
roots.

### 1.2 Two presentations, deliberately kept apart

A function has two presentations in this repository, and conflating them is the
central design error to avoid.

**The foundational presentation — a set-theoretic triple.** A relation is a
triple of a left domain, a right domain, and a graph. A function is that same
shape with the function condition imposed. This is the object the repository
*studies*: the layer where you prove what a function is.

```text
SetTheoreticRelationTriple   →   raw domain / codomain / graph data
IsSetTheoreticRelation       →   the graph-typing condition
SetTheoreticRelation         →   triple bundled with that evidence

SetTheoreticFunctionTriple   →   the same raw data
IsSetTheoreticFunction       →   graph typing ∧ totality ∧ uniqueness
SetTheoreticFunction         →   triple bundled with that evidence
```

**The working presentation — the arrow.** To everything else in the repository, a
function *is* `Domain → Codomain`.

```lean
abbrev LRA.Function (Domain : Type u) (Codomain : Type v) := Domain → Codomain
```

This is the convenient representation used by analysis and by every later
subject. It is **not** definitionally a set-theoretic triple, is computable, and
composes with Lean core and Mathlib without conversion.

The two presentations meet at **exactly one** theorem,
`LRA.Function.SetTheoretic.TypedFunctionGraphRepresentation` (§1.5). There are no
coercions, no instances, and no second bridge.

### 1.2.1 Where the generalization chain lives

The chain is real, but it lives at both ends rather than in one column:

| Layer | Chain | Status |
|---|---|---|
| foundational | `SetTheoreticRelation` → `SetTheoreticFunction` | definitional: the function condition *is* graph typing plus totality plus uniqueness |
| working | arrow → `LRA.Morphism` | definitional: a morphism is an arrow plus preservation predicates |

So "a function is a total, single-valued relation" is a **theorem of the
foundational layer**, not a definitional identity of the arrow. That is the
intended design. Set theory says what a function *is*; the arrow is how a
function is *used*.

Binding consequences:

- Do **not** introduce a typed structure bundling an arrow with totality and
  single-valuedness proofs. It is neither presentation, it forces
  `noncomputable` evaluation through `Classical.choose`, and it requires a
  conversion at every Mathlib boundary. See §7.5.
- `LRA.Morphism` takes an **arrow**. It must not redefine function application,
  composition, or injectivity.
- `LRA.Relation` owns the generic relation calculus. Where a function concept is
  genuinely the relation concept applied to a function graph, define it through
  `Graph` rather than restating the quantifier.
- "Map" is a **synonym** for function, not a refinement of it. There is no
  `LRA.Map` subject and there must never be one.

### 1.3 `LRA.Morphism` is a top-level subject

Morphism primitives are owned centrally; bundled morphism notions stay with the
structure they preserve.

`LRA.Morphism` owns the primitives:

```text
LRA.Morphism.PreservesRelation
LRA.Morphism.ReflectsRelation
LRA.Morphism.RelationEmbedding
LRA.Morphism.PreservesNullaryOperation
LRA.Morphism.PreservesUnaryOperation
LRA.Morphism.PreservesBinaryOperation
LRA.Morphism.OperationEmbedding
LRA.Morphism.StructuralEmbedding
```

Each structural subject defines its own bundled morphism **in terms of those
primitives**:

| Bundled notion | Owner |
|---|---|
| `Homomorphism`, `Isomorphism`, `Embedding`, `Congruence` | `LRA.UniversalAlgebra` |
| `Monotone`, `Antitone`, `OrderEmbedding`, `OrderIsomorphism` | `LRA.Order.Morphisms` |
| `ModelEmbedding`, `ModelIsomorphism` | `LRA.Logic.FirstOrder` |
| `Continuous` | `LRA.Topology` |
| `Isometry` | `LRA.Analysis.MetricSpaces` |
| `LinearMap` | `LRA.LinearAlgebra` |

### 1.3.1 How a subject specializes a morphism

`LRA.Morphism` owns two layers:

- **`LRA/Morphism/Properties/`** — the Prop-valued preservation predicates above.
  These are the primitives. Everything else is defined from them.
- **There is no generic bundled `Morphism` structure.** "Structure" is polymorphic
  — a relation, an operation, or a family of both — so a single bundle would have
  to be parameterized by a signature, and a signature-parameterized morphism *is*
  the universal-algebra notion, which §1.3 says must not own the primitives.
  Bundling therefore happens per subject.

Theorem transfer does not need a shared bundle and never did. It happens at the
predicate level: a subject derives "a composite of my morphisms is my morphism"
from `PreservesRelation (outer ∘ inner)`, not from a parent structure.

One question decides how a subject specializes:

> **Does the specialization add data, or only add constraints?**

| Situation | Required form |
|---|---|
| adds only constraints | a `def`/`abbrev` **in terms of** the generic predicate |
| preserves several pieces of structure | a conjunction of generic predicates |
| adds data (an inverse, a second operation, a unit) | a `structure` bundling the arrow with the relevant generic predicates |

Correct — constraints only, so definitional:

```lean
def Monotone
    (source : LRA.Relation.Endorelation Alpha)
    (target : LRA.Relation.Endorelation Beta)
    (function : Alpha → Beta) : Prop :=
  LRA.Morphism.PreservesRelation function source target
```

Correct — several pieces of structure, still definitional:

```lean
def IsRingHomomorphism (function : R → S) : Prop :=
  LRA.Morphism.PreservesBinaryOperation function addR addS ∧
  LRA.Morphism.PreservesBinaryOperation function mulR mulS ∧
  LRA.Morphism.PreservesNullaryOperation function oneR oneS
```

Correct — adds an inverse, so a structure of its own, whose fields are stated
through the generic predicates:

```lean
structure OrderIsomorphism (source : Endorelation Alpha) (target : Endorelation Beta) where
  forward : LRA.Function Alpha Beta
  inverse : LRA.Function Beta Alpha
  forwardPreserves : LRA.Morphism.PreservesRelation forward source target
  inversePreserves : LRA.Morphism.PreservesRelation inverse target source
  leftInverse : …
  rightInverse : …
```

**Forbidden — restatement.** Writing the quantifier out by hand instead of
calling the generic predicate:

```lean
-- must not appear in any subject
def Monotone source target function : Prop :=
  ∀ left right, source left right → target (function left) (function right)
```

Specialization is by definition or by `extends`, never by copy. A parallel
structure that merely resembles a morphism severs theorem transfer and is the
exact failure the Relation → Function → Morphism chain exists to prevent.

### 1.3.2 Generic theory that must not be restated

Proved once in `LRA.Morphism`, at the level of the preservation predicates, and
derived by every subject rather than restated:

- the identity function preserves every relation and every operation;
- a composite of preserving functions preserves, and composition is associative;
- an injective preserving function is an embedding;
- a bijective preserving function whose inverse preserves is an isomorphism.

No subject may restate any of these. If `UniversalAlgebra`, `Order`, `Topology`,
and `LinearAlgebra` each prove "a composite of homomorphisms is a homomorphism",
the central subject has failed its purpose.

**Two results that are not generic.** "The image of a morphism is a substructure"
and "the kernel of a morphism induces a congruence" do not typecheck without a
notion of *structure* to be a sub-thing of, and a notion of *congruence*. Both are
`LRA.UniversalAlgebra`'s, and both results belong there. That is consistent with
§1.3: `UniversalAlgebra` must not own the morphism **primitives**, but it does own
theorems that require its own structure notion, stated through those primitives.

**Why not `LRA.UniversalAlgebra.Morphisms`.** Universal algebra studies carriers
with *operations only*; its signatures have no relation symbols. Three of the
eight primitives are relational, so filing them under `LRA.UniversalAlgebra`
asserts something false. It would also force `LRA.Order` to import
`LRA.UniversalAlgebra` to say "monotone" and `LRA.Topology` to import it to say
"continuous" — false dependencies that are the engineering symptom of the
mathematical error.

### 1.5 The set-theoretic layer and its single bridge

`main` already carries this layer, complete and building under `lake build`. Port
it rather than rewriting it. The source is:

```text
LRA/VolumeI/Function/SetTheoretic/Definition.lean      the two triples and their conditions
LRA/VolumeI/Function/SetTheoretic/Theorems.lean        evaluation existence/uniqueness, extensionality
LRA/VolumeI/Function/SetTheoretic/Relationships.lean   single-valuedness, the representation theorem
```

Read them with `git show origin/main:<path>`. They land at
`LRA/Function/SetTheoretic/` under the subject layout of §2.1, split into the
file roles of §2.3. Their namespace is already `LRA.Function.SetTheoretic`, so
only the module paths change.

`LRA.Function.SetTheoretic` owns, against the established LRA set backend:

| Declaration | Role |
|---|---|
| `SetTheoreticRelationTriple` | raw left-domain / right-domain / graph data |
| `IsSetTheoreticRelation` | every graph member is a pair with coordinates in the displayed domains |
| `SetTheoreticRelation` | the triple bundled with that evidence |
| `SetTheoreticFunctionTriple` | raw domain / codomain / graph data |
| `IsSetTheoreticFunction` | graph typing ∧ every domain element has a value ∧ that value is unique |
| `SetTheoreticFunction` | the triple bundled with that evidence, in field `isFunction` |
| `EvaluationExists`, `EvaluationUnique` | the evaluation theorems |
| `SetTheoreticFunctionExt` | extensionality for the triple convention |
| `SingleValuedOfIsSetTheoreticFunction`, `BundledSingleValued` | graph single-valuedness |

Raw triple data stays separate from the proposition that the triple is a
function. Use the repository's canonical membership, ordered pair, product, and
separation. Do not invent a second set backend; if the backend lacks a
construction the canonical statement needs, record the exact missing capability
and add only the smallest correct interface.

**The single bridge.** Exactly one theorem family relates the two presentations:

```text
LRA.Function.SetTheoretic.TypedFunctionGraphRepresentation
```

It takes a typed arrow plus explicit encodings of the domain and codomain into
the backend, and makes every set-existence, ordered-pair, and encoding
hypothesis explicit: pairing and separation operations and their laws,
membership instances, encoding injectivity and coverage, an ambient pair set,
and graph-pair existence. It concludes that the resulting graph triple is a
set-theoretic function and that its evaluation agrees with the arrow.

Binding: no coercions, no instances, no automatic conversion, and no second
bridge. It must never claim that an arbitrary Lean type is a backend set.

### 1.4 A required correction to the current dependency direction

`LRA/VolumeI/Map/Morphisms/PreservesRelation/Definition.lean` currently reads:

```lean
def PreservesRelation (map : Source -> Target)
    (sourceRelation : Endorelation Source)
    (targetRelation : Endorelation Target) : Prop :=
  LRA.Order.Monotone sourceRelation targetRelation map
```

The general notion is defined as the order-specific one. Invert this:
`LRA.Morphism.PreservesRelation` becomes the primitive, defined directly over
`LRA.Relation`, and `LRA.Order.Morphisms.Monotone` becomes its specialization.
"Monotone" is order vocabulary and is earned only when the relation is an order.

---

## 2. File and module structure

### 2.1 The canonical shape

```text
LRA/<Subject>.lean                                    subject router
LRA/<Subject>/Definition.lean                         the subject's core notion
LRA/<Subject>/<Group>.lean                            group router
LRA/<Subject>/<Group>/<Concept>/Definition.lean       one concept
LRA/<Subject>/<Group>/<Concept>/Theorems.lean         its theorems
LRA/VolumeN.lean                                      curricular aggregator only
```

A subject router imports its group routers and nothing else. A group router
imports its concept files and nothing else. Routers carry a `/-! … -/` module
comment explaining the group's role and carry **no declarations**.

### 2.2 Group vocabulary

Use these group names wherever they apply, so subjects read alike:

| Group | Contents |
|---|---|
| `Definition` | the subject's own core notion (a file, not a directory) |
| `Canonical` | distinguished instances: identity, empty, universal, diversity |
| `Properties` | predicates on the subject's objects |
| `Structures` | named bundles: equivalence, partial function, lattice |
| `Operations` | constructions producing new objects of the subject |
| `Calculus` | domain, range, image, preimage, fiber, restriction, evaluation |
| `Laws` | algebraic law classes and their certificates |
| `Interop` | adapters to Mathlib or to Lean core (see §2.6) |
| `Morphisms` | the subject's bundled structure-preserving maps |

Subject-specific groups are allowed when the mathematics demands one — `Order/Bounds`,
`Set/Interface`, `Identity/Axioms`, `Function/SetTheoretic`. Do not invent a
group where a listed one fits.

### 2.3 File roles

A concept directory uses these leaf filenames. Only `Definition.lean` is
mandatory; add the others when the concept has that kind of content. Do not
invent new role names.

| File | Contents |
|---|---|
| `Definition.lean` | definitions, abbreviations, structures, classes |
| `Theorems.lean` | theorems about this concept alone |
| `Characterizations.lean` | equivalent formulations (`iff` statements) |
| `Consequences.lean` | corollaries following directly from the theorems |
| `Relationships.lean` | theorems relating this concept to a *sibling* concept |
| `Examples.lean` | worked instances at concrete carriers |
| `FailureModes.lean` | counterexamples and negative results |
| `Instances.lean` | typeclass instances for a backend |

`Examples.lean` and `FailureModes.lean` are **quarantined leaves**: no core
`Definition.lean`, `Theorems.lean`, `Characterizations.lean`,
`Consequences.lean`, `Relationships.lean`, or router may import them. See §6.

**A role file may be present and empty.** The layout above is the canonical
shape of a concept, and a concept that will acquire theorems is allowed to carry
`Theorems.lean` before it has any. An empty role file holds a single import of
the concept's current chain tail, so the module is well-formed and the group
router can import it by name, plus its one-line doc header. That import is
scaffold, not a re-export, and §7.0.1's ban on forwarding files does not reach
it: the file is named for the role it will hold, it is imported by the router
rather than standing in for a moved name, and nothing is aliased through it.

Never delete a role file for being empty, and never route around it. An empty
`Theorems.lean` next to a heavy `Consequences.lean` is a signal that the
concept's theorems were filed one role too deep — the fix is to move the
declarations up into the empty file, not to remove the file. See §7.5.

Do not create `All.lean` or `AllWithExamples.lean` inside a concept directory.
Aggregation is the group router's job.

### 2.4 Interoperability lives with its subject

There is no top-level `LRA.Interop`. Each subject owns its own adapters under an
`Interop` group, following the shape already established by `LRA/Set/Interop`:

```text
LRA/<Subject>/Interop.lean
LRA/<Subject>/Interop/Mathlib.lean
LRA/<Subject>/Interop/Mathlib/<Backend>.lean
LRA/<Subject>/Interop/Mathlib/<Backend>/Instances.lean
LRA/<Subject>/Interop/Mathlib/<Backend>/Laws.lean
LRA/<Subject>/Interop/Lean.lean            adapters to Lean core
```

Namespaces follow the paths: `LRA.Set.Interop.Mathlib.PredicateSet`,
`LRA.Order.Interop.Mathlib`, `LRA.Identity.Interop.Lean`.

Siting adapters with their subject keeps the direction of dependency honest —
the adapter imports both the LRA notion and the Mathlib one, and nothing that
is not doing interoperability ever imports it. A central `LRA.Interop` would
force unrelated subjects to share an import surface.

Migrate `LRA/VolumeVII/WithMathlib/` and any `MathlibAdapters.lean` or
`MathlibBridge.lean` leaf into the owning subject's `Interop` group.

### 2.5 Notation

Notation that belongs to one subject is declared in that subject, in a
`Notation.lean` file inside the group that owns the symbols.

A symbol used across two or more subjects is declared once in a root
`LRA/Notation.lean`, which every subject may import and which imports nothing
but Lean core. Create that file only when a genuinely cross-subject symbol
exists; do not create it empty.

Scope notation with `scoped notation` unless the symbol is unambiguous
repository-wide. Never introduce a symbol that shadows a Lean core or Mathlib
notation that the same file also uses.

### 2.6 Volume aggregators

`LRA/VolumeN.lean` imports subject routers or leaf modules to reproduce
curricular order. It owns nothing. `LRA/VolumeN/` directories must not survive
as homes for durable declarations; migrate their contents into subjects and
delete the directory once empty.

### 2.7 Import discipline

- A subject router may import leaf modules of another subject.
- A leaf module must never import a volume aggregate.
- A leaf module must never import a router of its own subject.
- Imports must respect the chain: `Relation` must not import `Function`;
  `Function` must not import `Morphism`.
- Every module is reachable from at least one Lake target. A module compiled by
  no target is not "written", it is unverified.

---

## 3. Naming conventions

### 3.1 Declarations

| Kind | Convention | Example |
|---|---|---|
| Type, structure, class, abbreviation | `PascalCase` | `SetTheoreticFunctionTriple` |
| Proposition-valued definition | `PascalCase` | `Injective`, `IsSetTheoreticFunction` |
| Theorem | `PascalCase`, a readable claim | `EvaluationUnique`, `SupremumIsUpperBound` |
| Term-level value or constructor function | `camelCase` | `pureEqualityLanguage` |
| Structure field | `camelCase` | `graph`, `singleValued` |
| Typeclass instance | anonymous unless a name aids search | |

A `PascalCase` type paired with a `camelCase` value of that type is the intended
Lean convention and is the only permitted case-insensitive name collision. Two
declarations of the *same* kind must never differ only by case; if the pair is
generic-versus-instantiated, prefix the instantiation (`ActiveGaussianInteger`,
`ActiveGaussianArithmeticRingModel`).

Never encode the volume in a declaration name. Never abbreviate a subject name.

### 3.2 Binders

Use descriptive `PascalCase` binders for types and `camelCase` for values.
**Do not use Greek letters for type binders in new or migrated code.**

```lean
-- required
theorem ComposeApply {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (outer : LRA.Function Middle Codomain)
    (inner : LRA.Function Domain Middle)
    (input : Domain) : …

-- not acceptable in new code
theorem ComposeApply {α β γ : Type u} (g : … ) (f : … ) (x : α) : …
```

Standard binder names: `Domain`, `Codomain`, `Middle`, `Carrier`, `Element`,
`Source`, `Target`, `Index`, `SetObject`, `Pair`. When a type has no role beyond
being a carrier, use `Alpha`, `Beta`, `Gamma` — spelled out, not `α`.

The repository is currently split (14 files using `(α : Type u)`, 17 using
`(Domain : Type u)`). Converge on the descriptive form.

### 3.3 Notation

Use Unicode for logic and set notation. The repository is currently split; this
settles it.

| Use | Not |
|---|---|
| `∀` | `forall` |
| `∃` | `exists` |
| `→` | `->` |
| `∧` | `/\` |
| `∨` | `\/` |
| `¬` | `Not` (as a prefix in statements) |
| `↔` | `<->` |
| `∈`, `⊆`, `∪`, `∩` | ASCII spellings |

Current split to converge: `forall` 41 files vs `∀` 72; `->` 50 vs `→` 55;
`∧` is already universal.

### 3.4 Universes

Declare `universe` variables at the top of the namespace. Give a function's
domain and codomain **independent** universe levels wherever the mathematics
permits. Never collapse to a single universe for convenience.

```lean
universe u v

abbrev TypedFunction (Domain : Type u) (Codomain : Type v) := Domain → Codomain
```

---

## 4. Doc-comments

**Doc-comments are not required.** Do not write them as part of this migration,
and do not let a missing one block a move.

The architecture is still settling, and prose written against a declaration that
is about to move subjects is prose written twice. Comments will be added
mechanically once the subject layout is fixed, from the declaration name, kind,
and signature.

Rules while that is true:

- Never delete an existing doc-comment when moving a declaration. Carry it
  across unchanged.
- The `**[Kind — Name]**` display-name marker is **not** the standard. Six of
  311 promoted files use it; do not add it to new work. Whether it returns is a
  later decision for blueprint generation.
- Do not write a `Logical form:` block that restates the signature verbatim. It
  duplicates the declaration and drifts; several in the repository are already
  stale and one is corrupted past reading. Delete such a block when you touch
  the declaration for another reason.
- Module-level `/-! … -/` comments **are** required on every router, and state
  what the group owns and what it deliberately does not. These are the comments
  that carry architectural intent and cannot be generated.

`scripts/lint_doccomments.sh` has been changed to match: it reports coverage and
exits 0. `LRA_DOCLINT_STRICT=1` restores the failing behavior for the eventual
mechanical pass. Note that the linter previously aborted at the first file with a
finding because of `set -e`, so its historical counts were wrong — the true
figure is 990 declarations across 100 files, not 8.

## 5. Proof policy

Every theorem is stated and left `sorry`. Do not prove anything.

```lean
theorem ComposeValue … : … := by
  sorry
```

State the theorem with the hypotheses the mathematics actually requires — not
the hypotheses that would make a proof easy, and not fewer than the statement
needs to be true. A `sorry` under a false statement is worse than no statement.

Use `section` for shared `variable`, hypothesis, notation, and `set_option`
blocks. A `section` does **not** hide names: use `private` or an explicitly
internal namespace when a name must stay out of the public API.

---

## 6. Mathlib quarantine

Volume I and Volume II core mathematics is bare Lean. Mathlib is confined to:

- `Examples.lean` and `FailureModes.lean` leaves
- `MathlibAdapters.lean` and `MathlibBridge.lean`
- an `Interop/` group
- the deliberately Mathlib-backed set backends

`scripts/check-mathlib-imports.py` is the authority. `make check` must invoke it
rather than any inline grep. When a directory is renamed, update the allow list
in the same change — a stale allow-list path silently disables the gate.

No core `Definition.lean`, `Theorems.lean`, or router may import a quarantined
leaf. Quarantined leaves must still be compiled: import them from a test-library
module so they stay under a build gate without entering the production
aggregates.

Keep Mathlib adapters explicit and local. Do not install competing global
instances where a local `letI` or an explicit conversion theorem is the policy.

---

## 7. The migration work

### 7.0 First: audit the previous migration and delete its shims

**Do this before touching anything else, and report the result before
continuing.** An earlier migration was instructed not to leave compatibility
aliases and left a large layer of them anyway. Until it is removed, every
subsequent measurement of "one canonical owner" is wrong, because each aliased
name has two.

Verify each of the following on the current branch and record counts before and
after:

**A. The `LRA.Set.Enderton` alias surface.** `LRA/Set/ZFC/Compatibility.lean`
declares `namespace LRA.Set.Enderton` as a "temporary compatibility surface for
the pre-standardization Enderton namespace", and 24 files carry that namespace
with roughly 84 `abbrev` aliases pointing at `LRA.Set.ZFC.*`. Delete the whole
surface, including the per-theorem "Compatibility aliases for the historical
Enderton … names" sections in `LRA/Set/ZFC/**/Theorems.lean`. Repoint every
consumer at the canonical `LRA.Set.ZFC` name.

**B. The old `LRA/VolumeI/Map/` alias tree.** Of its 28 `Definition.lean` files,
18 are pure aliases of the form

```lean
/-- Historical typed-map spelling of canonical function injectivity. -/
abbrev Injective (map : TypedMap Domain Codomain) : Prop :=
  LRA.Function.Injective (LRA.Function.OfTypedFunction map)
```

Delete them. Delete `LRA/VolumeI/Map.lean`, which describes itself as a
"compatibility/curricular aggregate for historical `Map` paths". The only
content of that tree that survives is the morphism material, which moves to
`LRA.Morphism` per §7.1.

**C. `Historical` markers inside the canonical subjects.** `LRA/Function/SetTheoretic/`
carries "Historical terminology", "Historical accessor", "Historical theorem
names", and "Historical extensionality theorem name"; `LRA/Set/ZFC/Public.lean`
carries one more. These are aliases living *inside* the new canonical subject,
which is worse than a shim in a legacy directory because nothing marks them as
temporary from the outside. Delete each and repoint its consumers.

**D. "Compatibility aggregate" routers.** `LRA/Function/Calculus/Definition.lean`
and `LRA/Function/Calculus/Theorems.lean` exist only to re-export. A group
router aggregates; a file named `Definition.lean` that defines nothing is a
shim. Fold them into the group router or delete them.

**E. Confirm the migration's substantive claims.** For each subject already
promoted, check that the promotion actually happened rather than being mirrored:
no declaration exists at both the old and the new path; the old path is deleted
rather than re-exporting; and the subject's router reaches every one of its
concept files.

Report, before doing any further work: the count of aliases found, the count
deleted, and any alias you propose to keep with the mathematical reason. An
alias kept for convenience is not a reason.

### 7.0.1 Standing rule: never generate a compatibility layer

This applies to this migration and to every future one.

- **Do not create an alias, re-export, or forwarding `abbrev` for a name you
  moved or renamed.** Move the declaration and update every consumer in the same
  change. This repository is small enough that a rename is a mechanical
  find-and-replace, and it is one commit either way.
- **Do not keep a directory alive to preserve its import path.** Delete it and
  fix the imports.
- **Do not add a file whose only content is re-exporting another file**, unless
  it is a router as defined in §2.1, which aggregates a group and is named for
  the group rather than for a file role.
- **Do not mark anything "historical", "legacy", "deprecated", "temporary", or
  "awaiting migration" in place of finishing the move.** Those words are a
  request for someone else to finish your work, and the evidence above is what
  happens when nobody does.
- If a move genuinely cannot be completed in one change, **stop and report the
  blocker** rather than landing a shim. A blocked move that is reported is
  recoverable; a shim that is landed becomes permanent.

The only permitted synonym is a **mathematically intentional** one — a second
name that mathematics itself uses for the same object, such as
`LRA.Order.TotalOrder` for `LRA.Order.LinearOrder`. Each must be justified in
the review by the mathematics, not by migration history.

### 7.0.2 Replace the relational-function design with the arrow plus the triple

`standardization` currently models a function as a typed structure bundling an
arrow with totality and single-valuedness proofs:

```lean
structure RelationalFunction (Domain : Type u) (Codomain : Type v) where
  graph : FunctionRelation Domain Codomain
  total : Total graph
  singleValued : SingleValued graph
```

This is neither presentation of §1.2. It is a third thing, and it costs:

- `Value` is `noncomputable`, defined by `Classical.choose (function.total input)`,
  so nothing evaluates and every application rewrite goes through a
  choice-extracted witness rather than definitional unfolding;
- every boundary with Lean core or Mathlib needs a conversion;
- `OfTypedFunction`, the conversion everything depends on, currently has both
  `total` and `singleValued` left as `sorry`.

The set-theoretic triple already models what this structure was reaching for,
and does it at the foundational layer where the theorems belong.

Required:

1. Make `LRA.Function` the arrow abbreviation, per §1.2.
2. Port the `LRA.Function.SetTheoretic` family from `main` (§1.5) — both triples,
   both conditions, both bundles, the evaluation theorems, extensionality, and
   the single representation theorem.
3. Delete `RelationalFunction`, `TypedFunction`, `OfTypedFunction`, `Graph` as a
   `RelationalFunction` constructor, `Value`, and every declaration whose type
   mentions `RelationalFunction`.
4. Restate the `LRA/Function/Properties/` predicates over the arrow. Where a
   predicate is genuinely the relation notion applied to a function graph, define
   it through `Graph` rather than restating the quantifier.
5. Update every consumer. Do not leave a conversion shim — §7.0.1 applies.

Report which `LRA/Function/` declarations survived, which were replaced by the
ported set-theoretic family, and which were deleted outright.

### 7.0.3 Judge a deletion by declaration, never by file or directory

A directory is not an alias because its `Definition.lean` is. Classify every
**declaration** you propose to delete, not the file or the folder containing it.

This is not hypothetical. §7.0 B classified twelve concept directories as
pure-alias by reading only their `Definition.lean`. For eight of them that
judgment was wrong about the rest of the directory: those twelve held **43
declarations outside `Definition.lean`**, of which **31 had no canonical
counterpart** and were deleted outright. The worst case, `Composition`, had a
one-line alias definition and fourteen real theorems behind it — associativity,
the identity laws, the property-composition and composite-implies-factor
theorems, and the inverse-composition family.

The alias test was correct for the definition and wrong for the directory.

So before deleting anything as redundant:

- enumerate the declarations, not the files;
- for each, name the surviving canonical owner **by fully qualified name**;
- a declaration with no named survivor is a **loss**, not a redundancy, and
  either gets restated in its canonical location or gets reported as a
  deliberate removal with a reason;
- `Relationships.lean`, `Consequences.lean`, and `FailureModes.lean` carry real
  content and are the files most likely to be swept along by a judgment made
  about `Definition.lean`.

A **role file inside a canonical concept directory** is out of scope for this
audit when it holds zero declarations. The rule above asks whether each
declaration has a surviving owner; a file with no declarations answers that
vacuously, which would make every empty role file deletable on a technicality.
It is not. Empty role files are canonical scaffold under §2.3.

That exemption is about scaffold, not about emptiness. It does **not** reach a
module that holds zero declarations because its contents were moved out, or
because it never held any and exists only to preserve an import path. In
particular, a zero-declaration module under `LRA/VolumeN/` is a shim: §7.0.1
requires it to be deleted and its importers repointed, and being empty is the
reason it goes, not a reason it stays. The test is location and intent —
scaffold sits in a canonical concept directory awaiting content, a shim sits on
a retiring path awaiting nobody.

A concept directory whose definition is an alias is exactly the case where the
theorems are *not* aliases: they were stated once, against the alias, and never
restated anywhere else.

### 7.1 Gather into subjects

For each item below, move the declarations to the named owner, update every
consumer, delete the vacated module, and remove the old directory once empty.

| Move | From | To |
|---|---|---|
| morphism primitives (74 files) | `LRA/VolumeI/Map/Morphisms/` | `LRA/Morphism/` |
| function concepts (19 dirs × 7 files) | `LRA/VolumeI/Map/*/` | already superseded by `LRA/Function/` — delete |
| graph vocabulary | `LRA/VolumeI/Map/Graph/` | `LRA/Relation/Calculus/` and `LRA/Function/Definition.lean` |
| the triple layer only | `LRA/VolumeI/Map/SetTheoretic/` | `LRA/Function/SetTheoretic/` (§1.5 scope, nothing wider) |
| the set-backed image/preimage/fiber/inverse calculus | `LRA/VolumeI/Map/{Image,Preimage,Fiber,Inverse}/` | **audit against `LRA.Set.Interface.RelationSets` first — see §7.1.1** |
| remaining Volume I subjects | `LRA/VolumeI/{Logic,Set,Order,Operations,Relations,Identity,UniversalAlgebra,AlgebraicStructures}/` | the matching `LRA/<Subject>/` |
| Volume II number systems | `LRA/VolumeII/` | `LRA/NumberSystems/` |
| Volume III analysis | `LRA/VolumeIII/` | `LRA/Analysis/` |
| Volume IV spaces | `LRA/VolumeIV/` | `LRA/Analysis/*`, `LRA/Topology/`, `LRA/LinearAlgebra/` |
| Volume VI | `LRA/VolumeVI/` | `LRA/LinearAlgebra/`, `LRA.Internal.AbstractAlgebra` |
| Volume VII | `LRA/VolumeVII/` | the owning subject's `Interop/Mathlib/` group, `LRA.Internal` |

`LRA/VolumeI/Map/` must not exist when this is done. Delete
`LRA/VolumeI/Map.lean` rather than keeping it as a compatibility aggregate.

**Sequence the rows bottom-up in the dependency order of what is being moved.**
Before starting a row, compute which of the remaining rows it imports. Promote a
row only once everything it depends on is already promoted. Otherwise the
promoted subject lands importing an `LRA.VolumeN.*` path, which is a fresh
Volume dependency created *by* the migration and has to be unwound later.

For the three Volume I rows that remain, the arrows form a total order:

```
UniversalAlgebra     ->  Logic                (5 files)
AlgebraicStructures  ->  Logic                (6 files)
AlgebraicStructures  ->  UniversalAlgebra    (10 files)
```

so the order is **Logic, then UniversalAlgebra, then AlgebraicStructures**.
Do not sequence by how many import lines a row will repoint; repointing is the
same work in any order, while a wrong order manufactures dependencies.

**A subject router with no subject behind it is a shim.** §7.0.1 permits a
router because it aggregates a group; a file such as `LRA/Logic.lean`, whose
entire content is `import LRA.VolumeI.Logic`, aggregates nothing canonical and
is a forwarder wearing a router's name. Census a row by asking whether the
canonical *declarations* exist, not whether the canonical path resolves — an
absent `LRA/Logic/` directory beside a present `LRA/Logic.lean` is one row, not
two findings.

### 7.1.1 The set-backed function calculus is an audit, not a move

`LRA/VolumeI/Map/{Image,Preimage,Fiber,Inverse}/` holds roughly 100 theorems about
`HasSeparation`-built images, preimages, fibers, and inverses. Do **not** move them
wholesale, and do **not** create a new group to hold them.

`LRA/Set/Interface/RelationSets.lean` already owns that vocabulary at the relation
level, separation-built:

```text
DomainOf  RangeOf  ImageOf  PreimageOf  FiberOf  InverseOf
RestrictionOf  IsExtensionOf  GraphSetOf  IdentityOn  CompositionOf
IsSingleValued  IsFunctionalSet  IsTotalOn
```

So this is a duplicate-ownership question, not a placement question, and §1.2.1
already decides it: where a function concept is the relation concept applied to a
function graph, define it **through `Graph`** rather than restating it.

Sort every one of those declarations into exactly one bucket and report the
counts. Do not assume the proportions; the name overlap is suggestive, not proof.

| Bucket | Action |
|---|---|
| a restatement of an existing `RelationSets` or `RelationLaws` fact | delete; the relation-level fact already covers it |
| relation-general — the statement never mentions functionality | **relocate to `LRA/Set/Interface/RelationLaws.lean`, restated over a general relation**, not over `Graph f`. See §7.1.2 |
| genuinely functional — the statement needs single-valuedness or totality | state in `LRA/Function/Calculus/` **through `Graph`** |
| genuinely new mathematics with no relation-level analogue | keep, in `LRA/Function/Calculus/`, with a note saying why it has no analogue |

#### 7.1.2 Sort bucket 2 by generality before placing it

Most of the function-level algebra is relation-level mathematics wearing a
function costume. Image-of-union, preimage-of-complement, monotonicity, and the
image–preimage adjunction hold for **arbitrary relations**; functionality appears
nowhere in their statements. Only the injectivity-conditioned laws and the
kernel-quotient material genuinely need it.

So for each theorem ask the deciding question:

> Does the statement mention single-valuedness or totality, explicitly or through
> a hypothesis that implies it?

If not, it belongs at the relation level, stated over a general relation.
Restating it over `Graph f` produces a theorem that becomes a recognizable
restatement the moment the relation-level law is added — the duplication this
migration removes, deferred by one phase.

**This is relocation, not new surface.** `LRA/Set/Interface/RelationLaws.lean`
already owns `MemberOfImageOf`, `MemberOfPreimageOf`, and `MemberOfFiberOf` —
membership characterizations of precisely these constructions. A relation-general
image law is that file's next theorem, not an expansion of another subject's
API. Adding it there does not trigger the §7.1.1 stop condition and is not §7.2
work.

Leave every relocated statement `sorry`. Report the split: how many of bucket 2
were relation-general and how many genuinely functional.

If the audit shows `LRA.Set.Interface.RelationSets` and `LRA.Relation.Calculus`
themselves overlap, record it and stop — that is a separate duplicate-ownership
question between two promoted subjects, and it is not resolved by this phase.

Placement of the remainder follows §7.1 directly: `Graph` splits between
`LRA/Relation/Calculus/` and `LRA/Function/Definition.lean`; `PartialMap` becomes
a `LRA/Function/Structures/` concept, which §2.2 already names; `HasDomain` and
`HasCodomain` go to `LRA/Function/Calculus/Classes/`.

### 7.2 Resolve duplicate ownership

Before any bulk rename, produce an ownership table in which every declaration has
exactly one canonical owner and every recorded merge points at a surviving
declaration. Review every repeated authored short name. Merge only where the
mathematics is the same; keep distinct where the data differs, and record why.

Known families needing an explicit decision:

- `Sequence` in `Analysis.Sequences` versus the two real-number construction
  sequences — different index and carrier, keep distinct.
- `ConvergesTo` in Banach, Hilbert, and Sequences — different ambient space,
  keep distinct.
- `ModelIsomorphism` generic versus per-number-system — different data, keep
  distinct.
- The nine real-analysis bound predicates — exactly one owner each under
  `LRA.Analysis.Bounds`; `LRA.Order.Bounds` stays relation-generic.

### 7.3 Correct stale documentation

- `LRA/Relation.lean` says "Function and Map specialize this layer". Change to
  "Function and Morphism".
- `LRA.Order.Monotone` restates the preservation quantifier instead of calling
  `LRA.Morphism.PreservesRelation`. Make it definitional per §1.3.1.
- Any doc-comment naming `LRA.Map` as a durable subject is stale.
- Regenerate `namespace-inventory.tsv` and `namespace-review.md` from the
  generator. Do not hand-patch generated evidence; fix the generator's ownership
  rules and regenerate.

### 7.4 Close the build-coverage gap

Roughly 320 `Examples`, `AllWithExamples`, and `FailureModes` modules are
compiled by no Lake target. Either wire each into a test-library module or delete
it. Unverified Lean source is not an asset.

### 7.4.1 Never remove a declaration with a regular expression

Three declarations have been silently dropped in this migration by a
regex-driven bulk edit, most recently `BooleanOrAndMutualAbsorption`, whose
removal pattern carried an optional leading doc-comment whose non-greedy match
reached back to an earlier comment and took three neighbouring declarations with
it. In every case the diff looked plausible and the build stayed green, because
deleting a theorem nothing imports breaks nothing.

So:

- **Do not delete or relocate a declaration by pattern substitution over file
  text.** Select it by its declaration boundary — from its own doc-comment or
  keyword through to the start of the next top-level declaration or end of file
  — and act on that range.
- A removal that cannot be expressed as a whole number of declaration ranges is
  a signal the edit is wrong, not a reason to widen the pattern.
- **Compare the declaration-name set before and after every commit**, not once
  per row. Collect fully qualified names from both trees and diff the sets; any
  name present before and absent after must appear in the ledger with a reason.
  The per-row ledger is the audit; this is the tripwire, and it is what turns a
  silent drop into a stopped commit.
- Compare **fully qualified** names. Short names collide across namespaces and
  will mask a loss as a survivor.

A count is not a substitute. Two of the three drops were found only because
the check was per name; a total would have shown one short and read as rounding.

### 7.5 Refile declarations that sit in the wrong role

A declaration in the wrong role file is a content error, not a layout error. The
directory is already canonical; what is wrong is which file inside it holds the
result. The tell is an empty or thin `Theorems.lean` beside a heavy
`Consequences.lean` or `Relationships.lean` — the concept's central results were
filed downstream of themselves.

Refile by §2.3's definitions of the roles:

- `Theorems.lean` takes results **about the concept alone** — its structural
  laws, stated in the concept's own vocabulary.
- `Consequences.lean` takes what follows from those, and only that. A result
  that nothing in `Theorems.lean` implies does not belong here.
- `Relationships.lean` takes results whose statement **names a sibling concept**.
  The sibling is the test, not the difficulty of the proof.
- `Characterizations.lean` takes `iff` statements characterizing **this**
  concept. An `iff` characterizing a *different* concept, merely stated through
  this one, belongs to that other concept's directory.

Rules for the move:

1. A refile changes which file holds a declaration. It **must not** change the
   declaration's fully qualified name, statement, or proof. If a name has to
   change, that is a separate change with its own review.
2. Fix the concept's import chain in the same commit. Roles import in the order
   `Definition → Theorems → Characterizations → Consequences → Relationships`;
   moving a declaration up the chain may require the file it left to import the
   file it landed in.
3. Ledger the move per name under §C.1, the same as any other relocation. A
   refile is cheap to verify and just as easy to lose.
4. Report, do not act on, any declaration that belongs in a **different concept
   directory**. Crossing directories is a §7.2 ownership question, not a refile.

Known instance, carried over from §7.0.3's audit: `LRA.Relation.Operations.Composition`
holds its four central results in `Consequences.lean` behind an empty
`Theorems.lean` and an empty `Relationships.lean`. It is the worked example for
this section, not a special case.

---

## 8. Acceptance gates

The effort succeeds only when **all** of these hold.

### A. Architecture

- No durable public declaration is owned by an `LRA.VolumeI`–`LRA.VolumeVII`
  namespace, and no `LRA/VolumeN/` directory holds durable source.
- `LRA.Map` does not exist as a namespace, directory, or module.
- `LRA.Morphism` exists as a top-level subject owning the eight primitives.
- `LRA.Order.Morphisms.Monotone` is defined in terms of
  `LRA.Morphism.PreservesRelation`, not the reverse.
- `LRA.Function` is the arrow abbreviation `Domain → Codomain`, accepting
  independent universe levels, and a compile-time example demonstrates a
  function between two different types.
- No typed structure bundles an arrow with totality and single-valuedness
  proofs; `RelationalFunction`, `OfTypedFunction`, and `Value` do not exist.
- No evaluation of a function is `noncomputable` or routed through
  `Classical.choose`.
- The set-theoretic relation triple, the function triple, their conditions,
  their bundles, evaluation existence and uniqueness, and extensionality are all
  present against the canonical set backend.
- Exactly one representation theorem family relates the arrow to its
  set-theoretic graph, with every encoding and set-construction hypothesis
  explicit, and there are no coercions or automatic bridge instances.
- `LRA.Function` does not redefine any `LRA.Relation` calculus concept.
- No subject restates a morphism law that `LRA.Morphism` already owns, and every
  specialization is definitional or by `extends`.
- No top-level `LRA.Interop`; every adapter sits in its subject's `Interop` group.
- Every public declaration has exactly one canonical owner.
- No `_root_` declarations.
- **Zero compatibility aliases, re-exports, or forwarding abbreviations.**
  Specifically: `LRA.Set.Enderton` does not exist; no declaration is reachable at
  both an old and a new path; no file exists whose only content is re-exporting
  another; and no declaration or module comment contains "historical", "legacy",
  "deprecated", "temporary", or "awaiting migration".
- The only synonyms are mathematically intentional ones, each justified in the
  review by the mathematics rather than by migration history.
  `LRA.Order.TotalOrder` for `LRA.Order.LinearOrder` is the one currently
  approved.

### B. Structure and naming

- Every subject has a working router; every group has a working router; routers
  hold no declarations.
- Only the file roles in §2.3 appear as leaf filenames.
- No role file inside a canonical concept directory was deleted for holding zero
  declarations. Scaffold survives every audit; a zero-declaration module on a
  retiring `LRA/VolumeN/` path is a shim and still goes.
- No subject or group router forwards into an `LRA.VolumeN.*` namespace.
- No canonical subject imports an `LRA.VolumeN.*` path, except an `Interop/`
  leaf whose target row is not yet promoted.
- No concept directory carries an empty `Theorems.lean` beside a
  `Consequences.lean` or `Relationships.lean` holding results the concept's own
  theorems do not imply. Where §7.5 found that shape, the refile landed and is
  ledgered per name under C.1.
- No Greek type binders in migrated code.
- No `forall`, `exists`, `->`, `/\`, `\/`, or `<->` in migrated code.
- Every router carries a module-level `/-! … -/` comment stating what the group
  owns; declaration doc-comments are not required and are not a gate.
- No `Logical form:` block restates a signature verbatim.
- No case-insensitive collisions except intentional type/value pairs, each
  documented in the review.

### C. Previous-migration cleanup

- The §7.0 audit was run and its before/after counts reported.
- Every alias found was deleted or explicitly justified mathematically.
- `LRA/VolumeI/Map/` and `LRA/VolumeI/Map.lean` no longer exist.
- `LRA/Set/ZFC/Compatibility.lean` no longer exists.
- Grepping the tree for `Historical`, `Compatibility alias`, `deprecated`, and
  `awaiting migration` returns zero hits in `*.lean`.

### C.1 Reconcile per name, never by total

Every phase that moves declarations must reconcile **name by name**, not by
count. Totals hide compensating errors: a phase that drops four `def`s and one
theorem while gaining an unrelated theorem elsewhere produces a total that
matches exactly, and nothing in the count reveals it.

For each declaration in scope, record which of these happened, and check the
list against the source rather than against a tally:

```text
deleted   — with the surviving owner named
relocated — with old and new fully qualified names
restated  — with the form it now takes
kept      — unchanged
```

Two counting traps seen in practice, both of which produced correct-looking
totals over wrong sets:

- **A count of `theorem` declarations misses `def`s.** A bucket of 72 was
  reported as 64 because eight of its members were definitions, not theorems.
- **A `sorry`-line diff is not a declaration ledger.** It counts lines removed
  and re-added inside modified files, so a wholesale directory deletion followed
  by relocation nets a number that matches nothing. Use a per-file ledger of
  where each `sorry` went.

A phase whose reconciliation is a subtraction rather than a list has not been
verified.

### D. Verification

- `lake build` succeeds.
- `lake build` of every volume library and the test library succeeds.
- `scripts/check-mathlib-imports.py`, `scripts/check-volume-vii-wiring.py`, and
  `scripts/check-proof-readiness.py` all pass.
- `make lint` passes (informational; `LRA_DOCLINT_STRICT=1` is not required to
  pass during this migration).
- Every module is reachable from a Lake target.
- Focused smoke modules exist for `LRA.Relation`, `LRA.Function`,
  `LRA.Morphism`, `LRA.Order`, and the analysis subjects, and one module imports
  all subject routers together.
- Searching for every removed prefix returns zero hits outside historical
  artifacts that clearly describe the old state.
- `git diff --check` is clean.
- Regenerating the inventory twice produces byte-identical output; the review
  records its SHA-256.
- Every theorem body is `sorry` and no proof was completed.

---

## 9. Required handoff

Report:

1. the §7.0 audit: aliases found, aliases deleted, and any kept with its
   mathematical justification;
2. the final subject architecture and the group layout of each subject;
3. every declaration moved, merged, internalized, deleted, or deliberately kept,
   with the reason;
4. the `Relation → Function → Morphism` specialization points, naming each
   concept that `Function` and `Morphism` inherit rather than restate;
5. naming and notation conversions applied, with counts;
6. router module comments added, and confirmation that no declaration
   doc-comment was deleted while relocating a declaration;
7. subjects, groups, and routers added or removed;
8. modules brought under a build gate, and any deleted instead;
9. inventory counts and checksum;
10. every verification command and its result;
11. any remaining blocker or deliberately deferred decision.

Do not describe the effort as complete unless every acceptance gate passes.
