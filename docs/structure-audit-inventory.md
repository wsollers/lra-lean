# Structure Audit: Issue Inventory And Proposed Solutions

Static audit of `lra-lean` repository structure against documented governance.
No build was run; no validator gate was executed. All findings are derived from
file-tree inspection, whole-repo import grepping, a static import-resolution
pass (every `import LRA....` line checked against the filesystem), git history
of the deletion commit, and comparison against `scripts/validate_structure.py`.

Governance sources consulted:

- Canonical governance repo `lra-governance` (resolved via the route resolver,
  route `author-lean-theorem`): `capabilities/overlays/lra-lean.md`,
  `capabilities/reference/architecture/lra-lean-architecture.md`.
- Repo-local authoritative docs: `PurposeAndArchitecture.md`, `DESIGN.md`,
  `ExternalInterfaces.md`, `docs/interface-model-standardization-inventory.md`.
- Existing validator: `scripts/validate_structure.py`,
  `scripts/structure_validator_plugins/folder_structure.py`.

---

## 1. What documented structure rules already exist?

| Rule | Source |
|---|---|
| Durable top-level subjects (`Identity`, `Logic`, `Set`, `SetSystems`, `Relation`, `Function`, `Morphism`, `Cardinality`, `Operation`, `UniversalAlgebra`, `AlgebraicStructures`, `Order`, `NumberSystems`, `EuclideanSpace`, `Analysis`, `Topology`, `LinearAlgebra`). `Algebra`, `Carrier`, `Interop` (top-level), `Meta`, `Pilot`, `Spaces`, `Volume*` are explicitly named as transitional/auxiliary and "should not be treated as new ownership models." | `PurposeAndArchitecture.md` §"Top-Level Subjects" |
| Subject layout: `<Subject>.lean` router + `<Subject>/{Definition,Group,Examples,Failures,Interop}`; concept files use a fixed role set (`Definition`, `Theorems`, `Characterizations`, `Consequences`, `Relationships`). | `PurposeAndArchitecture.md` §"Subject Layout", §"Concept File Roles" |
| `Interface` / `Interface/ModelTheory` / `Interface/UniversalAlgebra` / `Realizations` decision table and required internal shapes (`LStructure.lean`, `Theory.lean`, `Model.lean`; `Signature/Definition.lean`). | `ExternalInterfaces.md`; also `capabilities/reference/architecture/lra-lean-architecture.md` in canonical governance |
| `Realizations` = concrete backends satisfying an interface contract; must not be named `Model` or `Construction/ModelTheory`. | `ExternalInterfaces.md` §"Realizations", §"Naming Rules" |
| NumberSystems three-layer rule: `NumberSystems/Interface/` (generic) → `NumberSystems/<System>/` (system theory) → `NumberSystems/<System>/Constructions/<Construction>/` (concrete). A theorem belongs at the highest layer where it is true. | `PurposeAndArchitecture.md` §"Generic Interfaces And Implementations" |
| Construction Pipeline file-role order: `Carrier → Equivalence → WellFoundedness → Operations → WellDefinedness → Laws → Behavior → Instances`. | `PurposeAndArchitecture.md` §"Construction Pipeline" |
| Import discipline: lower layers never import higher layers; core (`Definition`/`Theorems`/…) must not import `Examples`/`Failures`/optional interop. | `PurposeAndArchitecture.md` §"Import Discipline"; enforced partially by validator (`_check_core_import_quarantine`) |
| VolumeII is Mathlib-free (zero package dependencies); VolumeI and VolumeIII+ permit Mathlib. | `DESIGN.md` §2 |
| Peano-first architecture: all VolumeII definitions/theorems parametrize over `(ps : PeanoSystem)`; recursion factors through one shared architecture. | `DESIGN.md` §3, §3.5, §10 |
| Migration matrix for `Interface`/`ModelTheory`/`UniversalAlgebra`/`Realizations` families (A–D) with a recommended chunk order. | `docs/interface-model-standardization-inventory.md` |
| Legacy `Model.lean`/`Axioms.lean`/`Satisfaction.lean`/`Structure.lean` under `Interface/ModelTheory` and legacy `Construction/ModelTheory` are validator-checked and rejected (unless `--allow-legacy-construction-modeltheory`). | `scripts/structure_validator_plugins/folder_structure.py` |

## 2. Which current files or imports violate those rules?

Two independent classes of violation were found:

**A. Dangling imports of deleted `LRA.Volume{II,III,VII}.*` modules.** Commit
`b686083` ("Checkpoint Euclidean coordinates and volume cleanup") deleted 31
files under `LRA/VolumeII/**`, `LRA/VolumeIII/**`, and `LRA/VolumeVII/**`
without repointing their consumers. A full static pass over all 3,794 `import
LRA....` lines in the repository (`LRA/` and `test/`) resolved every import
target against the filesystem; **exactly 25 import lines across 20 files** are
unresolvable, and all 25 target one of the 7 module paths seeded in the task
(confirming the seed list is exhaustive — no additional broken imports exist).
`lakefile.lean`'s `LRAAll` target uses `globs := #[.andSubmodules \`LRA]`
("total coverage... every module under `LRA/`... including... `Interop`...
still have to compile"), so all 25 are live build blockers, not dead code —
this includes the nominally-unreferenced `LRA/Interop/Mathlib.lean`.

**B. Placement/naming drift against `ExternalInterfaces.md` and the
standardization inventory**, independent of the deletion:

- `LRA/Set/Model/{Model,Theory,LStructure}.lean` duplicates the canonical
  `LRA/Set/Interface/ModelTheory/{LStructure,Theory,Model}.lean` triplet that
  already exists side-by-side with it. `lakefile.lean:36` declares
  `LRA.Set.Model` — not `Interface.ModelTheory` — as the actual build root
  consumed by `LRAStandardizedFoundations`, and five live files still import
  `LRA.Set.Model` directly.
- `LRA/EuclideanSpace/Model/{Euclidean3Space,Euclidean4Space,EuclideanN,
  CartesianPlane,RealLine}.lean` are concrete coordinate-space realizations
  named `Model`, even though `EuclideanSpace/Interface/ModelTheory/` already
  holds the real model-theory triplet — exactly the naming collision
  `ExternalInterfaces.md` calls out ("do not use model-theoretic folders to
  mean one implementation").
- `LRA/Analysis/MetricSpace/Construction/ModelTheory.lean` and
  `LRA/Analysis/MeasureTheory/AlgebraOfSets/Construction/ModelTheory/**`
  are the legacy "Family C" locations from
  `docs/interface-model-standardization-inventory.md`, still present and
  unresolved.
- Zero `Interface/UniversalAlgebra/` folders exist anywhere in the tree,
  despite `ExternalInterfaces.md`'s own worked examples naming `Ring`,
  `Field`, and `BooleanAlgebra` as `Interface + ModelTheory + UniversalAlgebra`
  subjects.
- `LRA/Algebra`, `LRA/Carrier`, `LRA/Spaces` are imported directly from
  `LRA.lean` even though `PurposeAndArchitecture.md` names them as transitional
  and says new durable mathematics should not treat them as owners.

## 3. Validator coverage gaps vs. actual repository placement problems?

`scripts/structure_validator_plugins/folder_structure.py` checks exactly four
things: required/forbidden files inside `*/Interface/ModelTheory/`, a required
`Interface/UniversalAlgebra/Signature/Definition.lean` when that folder
exists, quarantine of `.Examples`/`.Failures` imports in core files, and
rejection of `*/Construction/ModelTheory/`. Everything else found in this
audit is a **coverage gap**, not a validator miss on a rule it already
encodes:

| Actual problem | Would the validator catch it today? |
|---|---|
| All 25 dangling `LRA.Volume*` imports | **No** — no import-resolution check exists at all |
| `Set/Model` vs `Set/Interface/ModelTheory` duplication | **No** — validator only inspects paths literally named `Interface/ModelTheory`; a sibling top-level `Model/` folder is invisible to it |
| `EuclideanSpace/Model/*` realizations misnamed as `Model` | **No** — same reason; it never inspects folders named `Model` outside `Interface/` |
| `AlgebraicStructures/*` missing `Interface/UniversalAlgebra` entrypoints | **No** — the check only fires when the folder already exists; it never flags an *absent* one that governance says should exist |
| NumberSystems three-layer rule / Construction Pipeline file order | **No** — no such check exists |
| Transitional top-level subjects (`Algebra`, `Carrier`, `Spaces`, …) still receiving new imports | **No** — no top-level-subject allowlist check exists |
| VolumeII Mathlib-free policy (`DESIGN.md` §2) | **No** — no Mathlib-import-policy check exists, and post-deletion there is no `VolumeII/` subtree left to scope it to |
| Legacy `Interface/ModelTheory` file names (`Axioms.lean`, `Satisfaction.lean`, `Structure.lean`) | **Yes** — already implemented and, per the audit, already fully resolved in the current tree (zero matches found) |
| Legacy `Construction/ModelTheory` | **Yes** — already implemented; `MetricSpace` and `AlgebraOfSets` instances are still present and would fail this check today |

So the validator's existing checks are in good shape for the two things they
were built for (legacy `ModelTheory` file names, legacy `Construction/
ModelTheory`); the audit's other findings are places the validator was never
extended to look, not silent failures of an existing rule.

## 4. Issue inventory (machine-readable)

| issue_id | category | severity | path | evidence | proposed_solution | requires_move | requires_import_rewire | requires_validator_change | notes |
|---|---|---|---|---|---|---|---|---|---|
| ISS-001 | forbidden-import | critical | 17 files under `LRA/NumberSystems/**` and `LRA/Arithmetic/ContinuedFractions/Definition.lean` importing `LRA.VolumeII.NumberSystems.Models` | Static import-resolution pass; module deleted in commit `b686083` (was `LRA/VolumeII/NumberSystems/Models.lean`, 463 lines, `namespace LRA.NumberSystems.Models`, built on `LRA.AlgebraicStructures.OrderedRing/OrderedField.Interface.ModelTheory.Model`) | Recreate the deleted content (`DiscretelyOrderedIntegralDomainModel`, `DenselyOrderedFieldModel`, `RealModel`, and the two Mathlib-witness defs) at a canonical NumberSystems-level home — e.g. `LRA/NumberSystems/Interface/ModelTheory/Model.lean` or a `NumberSystems/Theory/` layer per the "depends only on the generic interface → belongs above the construction folders" rule — since it is a thin composition over already-migrated `AlgebraicStructures` interfaces, not new mathematics. Then repoint all 17 imports. | true | true | true | Root cause shared by ISS-002/003 and a hard prerequisite for both; fix this first among the broken-import group |
| ISS-002 | forbidden-import | critical | `LRA/NumberSystems/Integers/UniversalProperty.lean`, `LRA/NumberSystems/RationalNumbers/UniversalProperty.lean` importing `LRA.VolumeII.NumberSystems.CanonicalEmbeddings` | Static import-resolution pass; deleted in `b686083` (was `LRA/VolumeII/NumberSystems/CanonicalEmbeddings.lean`, `namespace LRA.NumberSystems.Models.CanonicalEmbeddings`, itself imports `Models`) | Move alongside the ISS-001 replacement, e.g. `LRA/NumberSystems/Interface/ModelTheory/CanonicalEmbeddings.lean` (or fold into `Model.lean` if small enough); repoint both consumers | true | true | true | Depends on ISS-001 landing first |
| ISS-003 | forbidden-import | critical | `LRA/NumberSystems/RealNumbers/Extensions.lean` importing `LRA.VolumeII.NumberSystems.UniversalProperties` | Static import-resolution pass; deleted in `b686083` (was `LRA/VolumeII/NumberSystems/UniversalProperties.lean`, imports `CanonicalEmbeddings` and `LRA.Function.Properties.Definition`) | Recreate under the same new NumberSystems-level home as ISS-001/002; repoint the single consumer | true | true | true | Depends on ISS-002 landing first |
| ISS-004 | forbidden-import | critical | `LRA/NumberSystems/GaussianIntegers/Construction/Model.lean` importing `LRA.VolumeII.Arithmetic.Model.All` | Static import-resolution pass; deleted in `b686083` (was `LRA/VolumeII/Arithmetic/Model/All.lean`, aggregated `FirstOrderSignature`, `Theory`, `ModelBuilder`) | File opens `LRA.NumberSystems.Arithmetic.Model` — determine whether that namespace's content already exists under a canonical `NumberSystems`/`Arithmetic` location; if not, recreate the small aggregator there and repoint | false | true | true | Self-contained to one file; independent of ISS-001/002/003 |
| ISS-005 | forbidden-import | critical | `LRA/NumberSystems/GaussianIntegers/Construction/Model.lean` importing `LRA.VolumeII.Integers.Construction` | Static import-resolution pass; deleted in `b686083` (was `LRA/VolumeII/Integers/Construction.lean`, a 5-line router to `Construction/Model.lean`) | Repoint to the existing canonical `LRA/NumberSystems/Integers/Constructions/**` tree (already present and in canonical form) rather than recreating a Volume-scoped router | false | true | false | Same file as ISS-004; target already exists, so this is a pure rewire once the correct canonical construction is identified |
| ISS-006 | forbidden-import | critical | `LRA/Analysis/Bounds/Examples.lean`, `test/LRA/Analysis/Bounds/BoundsTests.lean` importing `LRA.VolumeIII.RealNumbers.LraReal` | Static import-resolution pass; deleted in `b686083` (was `LRA/VolumeIII/RealNumbers/LraReal.lean`, a concrete Dedekind-cut-of-`Rat` structure, `namespace LRA.NumberSystems.RealNumbers`). `Examples.lean` never references `LraReal` in its body (import is dead); `BoundsTests.lean` actively references `LRA.NumberSystems.RealNumbers.LraReal` as a type. No definition of `LraReal` exists anywhere in the current tree. | Two independent fixes: (1) in `Examples.lean`, delete the now-unused import outright. (2) In `BoundsTests.lean`, decide whether `LraReal`'s content is superseded by the already-migrated, model-parameterized `LRA/NumberSystems/RealNumbers/Constructions/Dedekind/Carrier.lean` (which builds a generic Dedekind-cut construction over any `DenselyOrderedFieldModel`) — if so, repoint the test to the Dedekind construction's carrier/instance; if the concrete `Rat`-cut convenience type is still wanted independently, recreate it under `NumberSystems/RealNumbers/Constructions/Dedekind/` or `Examples.lean`. | true (test) / false (Examples) | true | false | Only broken-import issue that is a genuine product/design decision, not a mechanical rewire; owner input needed |
| ISS-007 | forbidden-import | critical | `LRA/Interop/Mathlib.lean` importing `LRA.VolumeVII.WithMathlib` | Static import-resolution pass; deleted in `b686083` (was `LRA/VolumeVII/WithMathlib.lean`, single line `import LRA.VolumeVII.WithMathlib.MetricSpaces`, itself also deleted). No other file imports `LRA/Interop/Mathlib.lean`, but `lakefile.lean`'s `LRAAll` target globs `.andSubmodules \`LRA`, so it still compiles under CI's total-coverage target. | Delete the dangling import line; `LRA.Order.Interop.Mathlib` and `LRA.Order.Interop.AlgebraicLattice` (the file's other two imports) already point at real, migrated subject-level interop, so `WithMathlib.MetricSpaces` content should be re-homed under `LRA/Analysis/MetricSpace/Interop/Mathlib/` per the current subject-scoped Interop pattern if the content is still wanted, or the line simply dropped if superseded | false | true | false | Lowest blast radius of the seven — single line, single file, zero downstream consumers |
| ISS-008 | numbersystems-architecture-drift | high | `LRA/NumberSystems/` (absence of an `Interface/ModelTheory` home for cross-system model content) | `Models.lean`'s content (generic ordered-ring/ordered-field model wrappers used by Integers/Rationals/Reals/GaussianIntegers alike) was filed under `VolumeII/NumberSystems/` — a book/volume location — rather than under the `NumberSystems` subject's own `Interface/` layer, contradicting `PurposeAndArchitecture.md`'s "define once, at the canonical level of generality" and its NumberSystems layer table | When recreating (ISS-001), place at `NumberSystems/Interface/ModelTheory/` (or equivalent NumberSystems-owned interface layer) instead of restoring a `Volume*`-scoped path, so the same drift cannot recur | true | true | false | This is the root-cause architectural finding behind ISS-001/002/003; listed separately because the fix is a placement decision, not just a rewire |
| ISS-009 | modeltheory-placement | high | `LRA/Set/Model/{Model,Theory,LStructure}.lean` vs `LRA/Set/Interface/ModelTheory/{LStructure,Theory,Model}.lean` | Both directories exist simultaneously with the canonical triplet filenames; `lakefile.lean:36` declares `\`LRA.Set.Model` (not `Interface.ModelTheory`) as the build root; 5 live files (`NumberSystems/IntegerStructure/Definition.lean`, `NumberSystems/Integers/Constructions/QuotientOrderedPairs/Carrier.lean`, `NumberSystems/PeanoSystem/Definition.lean`, `SetSystems/Examples.lean`, `Set/Interop/Mathlib/{ZFSetModel,EndertonModel}.lean`) import `LRA.Set.Model` directly | Diff the two triplets for semantic drift; if `Interface/ModelTheory` is complete and correct, repoint the 5 consumers and the `lakefile.lean` root to it, then delete `Set/Model/`; if `Set/Model` is actually further ahead, migrate its content into `Interface/ModelTheory` instead and delete `Set/Model/` either way — never leave both | true | true | false | Matches `docs/interface-model-standardization-inventory.md` Family B (`Set`, priority medium-high); this audit found it is now live-duplicated, not merely un-migrated, which raises its priority |
| ISS-010 | realizations-placement | high | `LRA/EuclideanSpace/Model/{Euclidean3Space,Euclidean4Space,EuclideanN,CartesianPlane,RealLine}.lean` | `EuclideanSpace/Interface/ModelTheory/{LStructure,Theory,Model}.lean` already holds the real model-theory triplet; the `Model/` folder actually holds concrete coordinate-space realizations, imported by `LRA/EuclideanSpace.lean` (root router) and by `LRA/Analysis/MetricSpace/Realizations/Euclidean.lean` | Rename/move to `LRA/EuclideanSpace/Realizations/{Euclidean3Space,Euclidean4Space,EuclideanN,CartesianPlane,RealLine}.lean` per `ExternalInterfaces.md`'s explicit naming rule; update the root router import and the one cross-subject consumer | true | true | false | Mechanical, low-ambiguity move; two known import sites to update |
| ISS-011 | modeltheory-placement | medium | `LRA/Analysis/MetricSpace/Construction/ModelTheory.lean` | File body is now just `import LRA.Analysis.MetricSpace.Realizations.Euclidean` — a stale one-line forwarding shim left after the real content already moved to `Realizations/` | Delete the shim file and its `Construction/ModelTheory` directory once no importer references it; would already fail `validate_structure.py` (`_check_legacy_modeltheory`) without `--allow-legacy-construction-modeltheory` | true | false | false | Lowest-risk placement fix in the inventory — pure deletion once import-graph confirms nothing depends on the specific path rather than the target it forwards to |
| ISS-012 | modeltheory-placement | high | `LRA/Analysis/MeasureTheory/AlgebraOfSets/Construction/ModelTheory/{SetRings,SetAlgebras,BooleanAlgebras}/Signature.lean` and `.../ModelTheory.lean` | Directory still present; matches `docs/interface-model-standardization-inventory.md` Family C ("highest" priority) and Family D (Language/Signature split — resolved to `Signature.lean` consistently here, so Family D's naming concern is already moot for this subtree) | Classify each `ModelTheory.lean`/`Signature.lean` as either backend-satisfaction (→ move to `Realizations/`) or genuine formal interface logic (→ move to `Interface/ModelTheory/`) per the existing inventory doc's own guidance; largest remaining legacy footprint in the tree | true | true | false | Already scoped and staged as "Chunk 5" in `docs/interface-model-standardization-inventory.md`; this audit confirms it is still unresolved and still the largest instance of Family C |
| ISS-013 | modeltheory-placement | low | `LRA/Logic/Model/**` | Large top-level `Model/` tree under `Logic`; `PurposeAndArchitecture.md` explicitly assigns Logic ownership of "models, axioms, satisfaction" as core subject matter (unlike other subjects, where model theory is a packaging of an interface) | Needs a governance decision, not a mechanical fix: either affirm `Logic/Model` as the intentional exception (Logic *is* model theory, not a subject that *has* a model-theory interface) and document it, or normalize toward `Logic/Interface/ModelTheory` for naming consistency with every other subject | false | false | false | Flagged for clarification rather than as a confirmed violation |
| ISS-014 | universalalgebra-placement | medium | Repo-wide: zero `*/Interface/UniversalAlgebra/` directories exist | `find LRA -type d -path "*/Interface/UniversalAlgebra*"` returns nothing; `ExternalInterfaces.md`'s own worked example table names `Ring`, `Field`, `BooleanAlgebra` as `Interface + ModelTheory + UniversalAlgebra`; those subjects currently only have `Interface/ModelTheory` and import the top-level `LRA/UniversalAlgebra/` subject directly | Add `Interface/UniversalAlgebra/Signature/Definition.lean` entrypoints to the structures `ExternalInterfaces.md` names as needing both readings, starting with `Ring`/`Field` per the existing standardization inventory's Chunk 3 order | true | false | false | This is unimplemented documented target, not misplacement of existing content — lower urgency than the duplication issues |
| ISS-015 | validator-gap | high | `scripts/structure_validator_plugins/folder_structure.py` | No function inspects `import` targets for filesystem existence anywhere in the plugin | Add an import-resolution check: for every `import LRA....` line under validated targets, resolve the dotted path to a `.lean` file or package directory and emit an `error` finding if neither exists | n/a | n/a | true | Highest-leverage single validator change — would have caught all 25 dangling imports (ISS-001–007) at commit time and prevents regression |
| ISS-016 | validator-gap | medium | `scripts/structure_validator_plugins/folder_structure.py` (`_check_model_theory_dir`) | Function only calls `directory / "Interface" / "ModelTheory"`; never inspects a sibling `directory / "Model"`, so `Set/Model` (ISS-009) and `EuclideanSpace/Model` (ISS-010) are invisible to it even though both encode exactly the kind of legacy/duplicate pattern the plugin exists to catch | Add a check that flags any top-level `<Subject>/Model/` directory that coexists with `<Subject>/Interface/ModelTheory/` as a duplication error, and flags a bare `<Subject>/Model/` (no sibling `Interface/ModelTheory`) as a naming warning to review for the realization-vs-model-theory distinction | n/a | n/a | true | Directly closes the gap demonstrated by ISS-009 and ISS-010 |
| ISS-017 | validator-gap | medium | `scripts/structure_validator_plugins/folder_structure.py` | No check corresponds to the NumberSystems three-layer rule or the Construction Pipeline's fixed file-role order (`PurposeAndArchitecture.md` §"Construction Pipeline") | Add a plugin check scoped to `NumberSystems/*/Constructions/*/` that verifies present files are a subset of the eight named pipeline roles and flags `WellDefinedness` folded into `Operations` or `Behavior` folded into `Laws` as a smell (file exists but role-appropriate declarations for the other role are absent) | n/a | n/a | true | Lower urgency; requires light Lean-source heuristics beyond pure path checks |
| ISS-018 | validator-gap | medium | `scripts/structure_validator_plugins/folder_structure.py` | No check enforces `PurposeAndArchitecture.md`'s explicit statement that `Algebra`, `Carrier`, `Interop` (top-level), `Meta`, `Pilot`, `Spaces`, `Volume*` are non-canonical; `LRA.lean` still imports `Algebra`, `Carrier`, `Spaces` directly (ISS-019) with no automated signal | Add a check that raises a `warning`-severity finding for any new or modified `.lean` file under one of the named transitional top-level directories, pointing authors at the corresponding canonical subject | n/a | n/a | true | Would not force an immediate migration but would stop the transitional folders from silently growing further |
| ISS-019 | legacy-top-level-subject | medium | `LRA/Algebra/**`, `LRA/Carrier/**`, `LRA/Spaces/**` (all imported from `LRA.lean`) | `PurposeAndArchitecture.md` §"Top-Level Subjects" names these as transitional; `LRA.lean` imports `LRA.Algebra`, `LRA.Carrier`, `LRA.Spaces` alongside the canonical subjects. Content maps to existing canonical subjects: `Carrier/Countability` and `Carrier/Finiteness` → `Cardinality`; `Algebra/AbstractAlgebra` → `AlgebraicStructures`/`UniversalAlgebra`; `Algebra/LinearAlgebra` → the already-named top-level `LinearAlgebra` subject; `Spaces/MathematicalSpace` needs an owner decision (`EuclideanSpace` vs. a new top-level `Spaces`-equivalent subject) | Move each folder's content to its canonical subject one at a time (not as a single mass move), verifying no other file depends on the old namespace at each step | true | true | false | Large blast radius if done as one change; explicitly recommended to defer until after the broken-import repair (§6) |
| ISS-020 | legacy-top-level-subject | low | `LRA/Meta/**`, `LRA/Pilot/**` | Neither is imported by any `.lean` file in the repository (`grep -rn "^import LRA.Meta"` / `"^import LRA.Pilot"` both empty); `Meta` holds `DeclarationKeywords.lean`, `Pilot` holds non-Lean explorer/authoring assets (`.html`, `.py`, `.yaml`, `.md`) | Lowest-risk of the transitional folders: `Pilot` is largely non-Lean tooling/authoring material and may not need "subject" treatment at all; confirm intent with the repo owner before moving `Meta/DeclarationKeywords.lean` anywhere | false | false | false | No live consumers, so this is pure cleanup with no coupled rewire risk — safe to defer indefinitely |

## 5. Fix-type breakdown

- **Direct import rewires only** (no move, no validator change): ISS-005, ISS-007
- **Move/rename required** (with import rewires): ISS-001, ISS-002, ISS-003, ISS-004 (rewire only, pending target confirmation), ISS-006, ISS-008, ISS-009, ISS-010, ISS-012, ISS-014, ISS-019
- **Deletion only** (no rewire needed once confirmed orphaned): ISS-011
- **Validator enhancements** (no repo content change): ISS-015, ISS-016, ISS-017, ISS-018
- **Needs an owner/governance decision before any mechanical work**: ISS-006 (LraReal content), ISS-013 (Logic/Model exception)
- **Pure cleanup, no coupling**: ISS-020

## 6. What should be fixed first to reduce blast radius?

1. **Restore compilation (ISS-001 → ISS-007), in dependency order.** These are
   the only issues that actually break a declared Lake target today,
   and they are otherwise fully decoupled from every placement/duplication
   issue below. Order within this group by dependency, not by file count:
   - ISS-007 (`WithMathlib`, single orphaned file) and ISS-004/ISS-005
     (`GaussianIntegers/Construction/Model.lean`, self-contained) first — zero
     fan-in, zero risk of touching anything else.
   - ISS-001 (`Models.lean` recreation) next — everything else in the group
     depends on it existing at its new home.
   - ISS-002 (`CanonicalEmbeddings`) then ISS-003 (`UniversalProperties`), in
     that order, since `UniversalProperties` imports `CanonicalEmbeddings`
     which imports `Models`.
   - ISS-006 (`LraReal`) last within this group — it is the one item that
     needs a product decision (recreate the concrete cut type vs. repoint to
     the already-migrated generic Dedekind construction) rather than a
     mechanical rewire, and it is the most isolated (only 2 consumer files,
     neither depended on by anything else in the group).
2. **Add the import-resolution validator check (ISS-015) immediately after.**
   Cheapest possible change with the highest regression-prevention value —
   it converts "silently broken until someone greps for it" into "CI fails
   at the next `validate_structure.py` run," and it is what should have
   caught ISS-001–007 in the first place.
3. **Resolve the two live-duplication placement issues with contained blast
   radius**: ISS-010 (`EuclideanSpace/Model` → `Realizations`, two known
   import sites, purely mechanical) and ISS-011 (delete the stale
   `MetricSpace/Construction/ModelTheory.lean` shim). Both are small,
   well-understood, and do not require a design decision.
4. **Then the higher-risk consolidations**: ISS-009 (`Set/Model` vs
   `Set/Interface/ModelTheory` — requires a semantic diff of two live
   implementations before merging, plus a `lakefile.lean` root change) and
   ISS-012 (`AlgebraOfSets` legacy family — largest remaining footprint;
   already staged as "Chunk 5" in the standardization inventory, confirmed
   still open by this audit).
5. **Extend validator coverage for the remaining gaps** (ISS-016, ISS-017,
   ISS-018) once the content they would check is actually converging, so the
   new checks start green rather than immediately red.
6. **Defer the transitional top-level subjects** (ISS-019, ISS-020) and the
   net-new `Interface/UniversalAlgebra` entrypoints (ISS-014) — none of these
   block compilation or duplicate live content, and ISS-019 in particular has
   a large blast radius that should not be bundled with the urgent repair
   work above. ISS-013 (`Logic/Model`) needs a one-time governance
   clarification, not code changes, and can happen at any point independent
   of the rest of this list.
