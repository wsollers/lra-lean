# LRA Namespace Simplification and Function Foundations

Work in the `lra-lean` repository. Treat this as an implementation task, not
as another advisory review. Read the repository governance entrypoint and run
the canonical route resolver before editing.

The existing inputs are:

- `namespace-review.md`
- `namespace-inventory.tsv`
- `review-namespaces.md`

They are evidence and planning aids, not unquestionable specifications. The
generated TSV has known semantic mapping errors described below. Inspect the
current source and compiled Lean environment before relying on it.

Do not preserve obsolete names with compatibility aliases. This repository is
small enough to move definitions and update every consumer directly. Preserve
unrelated worktree changes and generated build artifacts. Do not commit or push
unless the user separately authorizes that action.

## Objective

Simplify the public `LRA` namespace into a stable, fluent mathematical API while
keeping source modules organized by their curricular volumes. Repair duplicate
ownership, define the typed and set-theoretic notions of function at the correct
levels of generality, and leave the repository with complete, reproducible
namespace evidence and a passing Lean build.

Module paths may remain under `LRA/VolumeI`, `LRA/VolumeII`, and so on when that
is pedagogically useful. Public declaration names must not depend on the volume
in which the material happens to be taught.

## Binding architectural decisions

### Fundamental roots

Use these semantic owners where applicable:

```text
LRA.UniversalAlgebra
LRA.Analysis
LRA.Function
LRA.Identity
LRA.Interop.Mathlib
LRA.LinearAlgebra
LRA.Logic
LRA.Measure (only if material remains outside Analysis.MeasureTheory)
LRA.NumberSystems
LRA.Order
LRA.Relation
LRA.Set
LRA.Topology
LRA.Pilot (temporary only)
```

The list is a starting architecture, not a command to create empty roots.
Create a public namespace only when it owns durable declarations.

`LRA.Identity` stays directly under `LRA`. Identity and equality are fundamental
and must not be nested under `LRA.Logic`.

Use `LRA.NumberSystems`, not `LRA.Number`. Organize its durable subdomains with
clear names such as `NaturalNumbers`, `Integers`, `RationalNumbers`,
`RealNumbers`, `ComplexNumbers`, and `GaussianIntegers`.

Use these analysis subdomains:

```text
LRA.Analysis.Bounds
LRA.Analysis.MetricSpaces
LRA.Analysis.MeasureTheory
LRA.Analysis.FunctionalAnalysis
```

Keep general topology at `LRA.Topology`.

### Two distinct bounds theories

Do not conflate the two levels:

- `LRA.Order.Bounds` is the general relation/order theory over arbitrary
  carriers, relations, and set backends.
- `LRA.Analysis.Bounds` is the specialization used for real analysis. It may
  use `Real`, Mathlib `Set`, Mathlib order classes, and nonempty-set hypotheses
  when those hypotheses are mathematically required.

The current TSV incorrectly marks nine `ExtremalBounds.Is*` declarations as
merging into `LRA.Analysis.Bounds.Is*` while moving the supposed canonical
`Bounding.Bounds.Is*` declarations to `LRA.Analysis.Bounding.Bounds.Is*`. This
creates merge targets with no surviving owner. Resolve each duplicate family
deliberately. Choose exactly one canonical real-analysis declaration under
`LRA.Analysis.Bounds`, update all theorems and consumers to it, and delete the
duplicate definition.

Before deleting pilot bounds material, inspect it for any mathematical cases,
failure modes, or theorem statements that belong in the durable
`LRA.Order.Bounds` or `LRA.Analysis.Bounds` theory. Move only genuinely useful,
canonical content. Do not preserve pilot scaffolding merely because it exists.

### Remove `LRA.Carrier`

Delete the `LRA.Carrier.Carrier` abbreviation and the obsolete carrier module
or router if nothing durable remains there. Replace uses with explicit
universe-polymorphic types:

```lean
universe u v

variable (Domain : Type u)
variable (Codomain : Type v)
```

Do not add a compatibility alias.

The deletion must not reduce expressiveness. Audit every former consumer and
ensure independent domains, codomains, spaces, and universes remain possible.

### Typed functions

Keep an LRA typed-function concept because this volume will study and prove
theorems about functions. It must allow different domain and codomain types and
different universe levels:

```lean
universe u v

abbrev LRA.Function (Domain : Type u) (Codomain : Type v) :=
  Domain → Codomain
```

`LRA.Function` may also own the durable namespace for function concepts and
theorems. Confirm that Lean accepts the declaration/namespace arrangement and
that usage remains unambiguous.

Generalize the surrounding function API to independent universes wherever the
mathematics permits it, including graphs, images, preimages, fibers,
composition, inverses, injectivity, surjectivity, and bijectivity.

Do not retain duplicate Polish-local definitions of generic injectivity,
surjectivity, or bijectivity. Use one canonical LRA definition or deliberately
reuse Lean's `Function.Injective`, `Function.Surjective`, and
`Function.Bijective`. Whichever representation is selected, provide concise
theorems showing the intended equivalence when useful for study and Mathlib
interoperation. Do not create a permanent compatibility layer.

The typed function representation is the convenient representation used by
later analysis. It is not definitionally a set-theoretic ordered triple.

### Set-theoretic functions

Define a distinct foundational set-theoretic function using the established
LRA set backend. The mathematical convention is that a function is a triple
consisting of:

1. its domain;
2. its codomain; and
3. its graph.

Separate raw triple data from the proposition or bundled evidence that the
triple is a function. The function condition must express at least:

- every graph pair has first component in the domain and second component in
  the codomain;
- every domain element has an associated codomain value; and
- that value is unique.

Use the repository's canonical notions of membership, ordered pair, product,
separation, and related set construction. Do not invent a second set backend.
If the backend lacks a construction needed for the canonical statement, record
the exact missing capability and add only the smallest mathematically correct
interface required by this task.

Develop the foundational function results against `SetTheoreticFunction`.
Include the useful basic statements expected immediately after the definition,
such as evaluation existence and uniqueness and an extensionality theorem
appropriate to the chosen triple convention.

The typed `LRA.Function` exists for ease of use in later mathematics.

### One isolated representation/morphism theorem

Do not build a broad bridge framework. Do not add coercions, automatic
instances, global conversions, or parallel wrapper APIs.

Provide one isolated, clearly named representation/morphism theorem relating a
typed function to its set-theoretic graph when the necessary encodings of the
domain and codomain into the set backend are supplied. Its statement must make
all set-existence, ordered-pair, and encoding hypotheses explicit. It should
assert that the resulting graph triple is a set-theoretic function and that its
evaluation agrees with the typed function.

Do not assert that every arbitrary Lean type is automatically a set in the LRA
backend.

### Scratch and experimental declarations

Pilot material is temporary. After the durable `Order.Bounds` and
`Analysis.Bounds` content is squared away, delete obsolete Lean source under
`LRA/Pilot` rather than renaming it into the production API. Do not delete
unrelated generated artifacts or user files outside the resolved pilot source
scope.

Scratch metric declarations currently under `VolumeVII.WithMathlib` must not
be promoted to stable `LRA.Interop.Mathlib` names merely because they compile.
Keep scratch work isolated or make it private; retain only durable Mathlib
interoperability declarations publicly.

Use Lean `section`s more consistently for local variables, hypotheses,
notation, and options. A `section` alone does **not** hide declaration names.
Use `private` declarations or an explicitly internal namespace when scratch
names must not enter the public API.

### Duplicate and orienting structures

Review every repeated authored short-name family before accepting the migration
map. At minimum resolve:

- the duplicate Volume IV and Volume VI `VectorSpaceDefinition` families;
- generic versus Polish-local injective/surjective/bijective definitions;
- repeated sequence and convergence definitions;
- repeated least-upper-bound and extremum statements;
- generic versus construction-specific model-isomorphism declarations.

Do not merge declarations solely because their short names match. Do merge
definitions that express the same concept with the same mathematical data.

`MathematicalSpaceDefinition` is documented as orienting-only. Do not create a
permanent `LRA.Space` root solely for it. Either internalize it, retain it under
an explicitly pedagogical local owner, or remove it if it has no durable role.

Likewise, prefer Mathlib structures for later proofs when repository
documentation already says an LRA structure is only orienting. Keep an LRA
definition only when it has a clear pedagogical or foundational purpose.

### Imports and module organization

Create canonical semantic import routers for every durable public domain. A
user must be able to write imports such as:

```lean
import LRA.Function
import LRA.Identity
import LRA.Order
import LRA.Analysis.Bounds
import LRA.Analysis.MetricSpaces
import LRA.Analysis.MeasureTheory
import LRA.NumberSystems
```

These routers may import implementation files stored in curricular volume
directories. Avoid import cycles: semantic routers may import leaf modules;
leaf modules must not import a volume aggregate that imports the semantic
router.

Keep volume aggregates buildable as curricular entrypoints. Remove stale
routers such as `LRA.VolumeIV.Topology` if their referenced modules do not
exist, or repair them only if the corresponding source modules genuinely
belong in the project.

Keep Mathlib adapters explicit and local. Do not install competing global
instances when a local `letI` or an explicit conversion theorem is the intended
policy.

## Work sequence

1. Record the current branch, revision, worktree state, and baseline build
   failures. Do not overwrite unrelated untracked files.
2. Reconcile `namespace-inventory.tsv` with both source declarations and the
   compiled environment. Treat the current 90 source-only rows as unresolved,
   not as an accepted final population.
3. Produce a corrected ownership table before performing bulk renames. Every
   `MERGE` target must have exactly one surviving canonical owner.
4. Resolve `Order.Bounds` versus `Analysis.Bounds`, then harvest and delete
   obsolete pilot source.
5. Remove `LRA.Carrier` and generalize the typed-function theory.
6. Add the set-theoretic function definition, its foundational theorems, and
   the single isolated representation/morphism theorem.
7. Apply the namespace migration domain by domain. Update declarations,
   references, imports, documentation, examples, and tests in the same change.
8. Add semantic import routers and retain working curricular volume routers.
9. Regenerate the namespace inventory and review report from the final source
   and compiled environment. Do not manually patch generated evidence if a
   generator is available; fix its ownership rules and regenerate.
10. Run all acceptance gates below. Continue correcting in-scope failures until
    they pass. If a gate cannot pass without changing mathematics or scope not
    authorized here, stop and report the precise blocker.

## Acceptance gates

The effort is successful only when **all** of the following are true.

### A. Namespace and ownership gates

- No durable public declaration is owned by an `LRA.VolumeI` through
  `LRA.VolumeVII` namespace.
- Curricular volume file paths and import routers may remain.
- `LRA.Identity` is the direct owner of the identity/equality theory.
- The namespace `LRA.Number` does not exist; durable number-system material is
  under `LRA.NumberSystems`.
- Metric-space theory is under `LRA.Analysis.MetricSpaces`.
- Measure theory is under `LRA.Analysis.MeasureTheory`.
- Functional analysis is under `LRA.Analysis.FunctionalAnalysis`.
- There is no public `LRA.Space` root created solely for the orienting
  `MathematicalSpaceDefinition`.
- Every public declaration has exactly one canonical owner.
- Every merge recorded in the final inventory points to an existing surviving
  declaration.
- There are no accidental declarations at `_root_`; an executable `main`, if
  retained, is explicitly classified and justified.
- No compatibility aliases remain except mathematically intentional synonyms,
  specifically the approved `LRA.Order.TotalOrder` abbreviation of
  `LRA.Order.LinearOrder`.
- Do not introduce a `Chain` abbreviation.

### B. Carrier and function gates

- No declaration, import, source file, or documentation reference remains for
  `LRA.Carrier` or `LRA.Carrier.Carrier`.
- `LRA.Function` accepts `Domain : Type u` and `Codomain : Type v` with
  independent universe levels.
- A compile-time example demonstrates a function between two different types
  and a universe-polymorphic check demonstrates independent universes.
- Generic function concepts are not duplicated in number-system-local
  namespaces.
- A canonical set-theoretic function triple and its function condition exist
  against the established set backend.
- Evaluation existence, evaluation uniqueness, and the appropriate
  extensionality result are present with mathematically sufficient hypotheses.
- Exactly one intentional representation/morphism theorem family relates typed
  functions to set-theoretic functions; there are no coercions or automatic
  bridge instances.
- The representation theorem exposes all required encoding and set-construction
  assumptions and does not claim that arbitrary Lean types are automatically
  backend sets.

### C. Bounds and pilot gates

- `LRA.Order.Bounds` contains only generic order/relation-level mathematics.
- `LRA.Analysis.Bounds` contains the real-analysis specialization and uses
  nonempty/bounded hypotheses exactly where mathematically required.
- The nine duplicate real-analysis bounds predicates have one owner each.
- All consumers use the surviving definitions.
- Useful pilot bounds content has either been promoted to its canonical owner
  or deliberately rejected as redundant.
- Obsolete Lean source under `LRA/Pilot` is removed after that review.
- No scratch metric structure is accidentally part of the stable public API.

### D. Import and interoperability gates

- Each durable semantic domain has a working canonical import router.
- Every retained curricular volume aggregate imports successfully.
- A small smoke module can import `LRA.Function`, `LRA.Identity`, `LRA.Order`,
  `LRA.Analysis.Bounds`, `LRA.Analysis.MetricSpaces`,
  `LRA.Analysis.MeasureTheory`, and `LRA.NumberSystems` together.
- Existing Mathlib order/set adapters still compile.
- The design neither requires nor introduces broad global conversion instances.

### E. Inventory gates

- The final inventory is generated from a fully compiled environment plus a
  reconciled source scan.
- There are no unexplained source-only declarations.
- There are no exact duplicate fully qualified names.
- There are no unintended proposed-name collisions, including
  case-insensitive collisions.
- Authored declarations, generated companions, private implementation details,
  executable entrypoints, and pilot/internal declarations are classified
  separately.
- Regenerating the inventory twice produces byte-identical output and the
  review records its SHA-256.
- The review explicitly documents every remaining intentional synonym,
  duplicate-looking but semantically distinct family, and internal namespace.

### F. Verification gates

- Run `lake build` and require success.
- Run the repository's governed build/check command selected by the route
  resolver and require success. If governance policy itself is stale relative
  to the approved architecture, update the canonical owner only when that owner
  is in scope and available; do not mask the failure downstream.
- Run focused builds or Lean smoke files for the function, set-theoretic
  function, order bounds, analysis bounds, and semantic import routers.
- Search for all removed namespace prefixes and require zero stale references
  outside historical review artifacts that clearly describe the old state.
- Review `git diff --check`, the complete diff, and `git status`.
- Do not claim success with a skipped or failing gate.

## Required handoff

Report:

1. the final namespace architecture;
2. the declarations deleted, moved, merged, internalized, or deliberately kept;
3. the typed-function and set-theoretic-function designs;
4. the exact statement and assumptions of the isolated representation theorem;
5. pilot material promoted or deleted;
6. semantic import routes added;
7. inventory counts and checksum;
8. every verification command and result;
9. any remaining blocker or deliberately deferred decision.

Do not describe the effort as complete unless every acceptance gate passes.
