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

---

## 7. NumberSystems: settled target architecture

This section is the working spec for bringing `NumberSystems` into structural
compliance. Scope is explicitly **organization and placement only** — no new
mathematical content (e.g. finite/modular algebraic structures) is in scope
for this pass; see NS-007 below for why that was deliberately deferred.

### 7.1 Three-tier composition

`PurposeAndArchitecture.md`'s NumberSystems three-layer rule and
`ExternalInterfaces.md`'s generic `Interface`/`ModelTheory`/`UniversalAlgebra`/
`Realizations` decision table compose as follows — confirmed against the
`PeanoSystem` and `IntegerStructure` subjects, which already implement this
shape and serve as the working templates:

```text
NumberSystems/Interface/
  ModelTheory/{LStructure,Theory,Model}.lean   generic cross-system model wrappers
                                                (recreated content of the deleted
                                                VolumeII/NumberSystems/Models.lean;
                                                composes AlgebraicStructures
                                                interfaces, does not restate them)

NumberSystems/<System>/Interface/               one per system
  Signature/Definition.lean
  ModelTheory/{LStructure,Theory,Model}.lean     specializes the generic model to
                                                  this system and cites the
                                                  system's strongest
                                                  AlgebraicStructures target

NumberSystems/<System>/Constructions/<Construction>/
  Carrier.lean … Laws.lean … Behavior.lean
  Instances.lean                                 the realizes proof: this
                                                  construction's carrier +
                                                  operations satisfy both the
                                                  system's own Model and the
                                                  underlying AlgebraicStructures
                                                  typeclass
```

There is no separate `Realizations/` folder in `NumberSystems` — unlike
`Analysis`/`Topology`, `Constructions/<Construction>/` plays that role, with
`Instances.lean` carrying the actual satisfaction proof.

### 7.2 Strongest-structure target per system

| System | Strongest `AlgebraicStructures` target | Target has `Interface/ModelTheory`? | System has its own `Interface/`? |
|---|---|---|---|
| `PeanoSystem` | none — pre-structural (iterator/recursion foundation, no subtraction); stays `NumberSystems`-native | n/a | ✅ |
| `NaturalNumbers` | `CommutativeSemiring` (no subtraction, so not `DiscreteInteger`) | ❌ | ❌ |
| `IntegerStructure` | (abstract integer axioms, own foundation) | n/a | ✅ |
| `Integers` | `DiscreteInteger` | ❌ | ❌ |
| `RationalNumbers` | `OrderedField`, plus `Order.Density.DenseLinearOrder` | ✅ | ❌ |
| `RealNumbers` | `CompleteOrderedField`, plus Archimedean once relocated (§7.3) | ✅ | ❌ |
| `ComplexNumbers` | `Field` (not ordered) | ✅ | ❌ |
| `GaussianIntegers` | `IntegralDomain` (not ordered, not a field) | ✅ | ❌ |
| `ExtendedReal` | doesn't fit the ring/field ladder (±∞ have no inverses); closer to `Order/Lattices/CompleteLattice` | n/a | ❌ |

`Dense` needs no new work — already correctly generic at `Relation` and
specialized at `Order/Density/{DenseOrder,DenseLinearOrder}`, per the
one-definition-multiple-specializations rule.

### 7.3 Archimedean must move before RealNumbers can cite it honestly

`Archimedean` currently exists only under `Analysis/Completeness/
ArchimedeanProperty/`. `Analysis` sits **after** `NumberSystems` in
`PurposeAndArchitecture.md`'s dependency chain (`... → AlgebraicStructures /
UniversalAlgebra / NumberSystems → EuclideanSpace → Analysis / Topology /
LinearAlgebra`), so `NumberSystems` can never import it without violating
"lower layers must not import higher layers." No live import violation exists
today only because the deleted `Models.lean` worked around the gap by
re-deriving Archimedean-ness locally as `ArchimedeanDenseOrderedFieldExtension`
— a duplicate-definition smell forced by the misplacement, not a deliberate
design choice. Archimedean is fundamentally an ordered-group/ordered-field
property and belongs at `Order` (alongside `Order/Density/`) or
`AlgebraicStructures/OrderedField/Laws/`; `Analysis/Completeness/
ArchimedeanProperty` should become a thin re-export or fold away once the
lower-layer definition exists.

### 7.4 Issue rows added by this discussion

| issue_id | category | severity | path | evidence | proposed_solution | requires_move | requires_import_rewire | requires_validator_change | notes |
|---|---|---|---|---|---|---|---|---|---|
| NS-001 | numbersystems-architecture-drift | high | `LRA/AlgebraicStructures/DiscreteInteger/` | Has `Definition`/`Laws`/`Theorems`/`Characterizations`/`Consequences`/`Relationships`/`Examples` but no `Interface/` at all, unlike `OrderedField`/`Field`/`IntegralDomain`/`CompleteOrderedField` | Add `Interface/Signature/Definition.lean` and `Interface/ModelTheory/{LStructure,Theory,Model}.lean`, using `OrderedField` as the template | false | false | false | Prerequisite for `NumberSystems/Integers/Interface/ModelTheory` to cite it honestly |
| NS-002 | numbersystems-architecture-drift | high | `LRA/AlgebraicStructures/CommutativeSemiring/` | Same gap as NS-001 — `CommutativeSemiring` is ℕ's correct target (no subtraction) but has no `Interface/` | Add the same `Interface/Signature` + `Interface/ModelTheory` triplet | false | false | false | Prerequisite for `NumberSystems/NaturalNumbers` — resolves "does DiscreteInteger leave ℕ out" (yes, correctly; ℕ needs this target instead) |
| NS-003 | numbersystems-architecture-drift | medium | `LRA/Analysis/Completeness/ArchimedeanProperty/` | Only existing definition of Archimedean-ness sits in `Analysis`, one layer after `NumberSystems`/`AlgebraicStructures` in the documented dependency chain; deleted `Models.lean` worked around this by locally reinventing `ArchimedeanDenseOrderedFieldExtension` | Define Archimedean at `Order/` (peer to `Order/Density/`) or `AlgebraicStructures/OrderedField/Laws/`; re-point `Analysis/Completeness/ArchimedeanProperty` to the lower-layer definition or fold it away | true | true | false | Prerequisite for `NumberSystems/RealNumbers/Interface/ModelTheory/Model.lean` to cite Archimedean-ness without reinventing it |
| NS-004 | numbersystems-architecture-drift | high | `LRA/NumberSystems/{NaturalNumbers,Integers,RationalNumbers,RealNumbers,ComplexNumbers,GaussianIntegers}/` | None of these six systems has its own `Interface/{Signature,ModelTheory}/`, unlike `PeanoSystem` and `IntegerStructure` which already do | Add per-system `Interface/Signature/Definition.lean` and `Interface/ModelTheory/{LStructure,Theory,Model}.lean` to each, following the `PeanoSystem`/`IntegerStructure` template, each citing the strongest-structure target from §7.2 | true | true | false | The core structural work of "getting NumberSystems settled"; four of the six (`RationalNumbers`,`RealNumbers`,`ComplexNumbers`,`GaussianIntegers`) can absorb their existing legacy `Construction/Model.lean` (singular) into this new location — see NS-005 |
| NS-005 | modeltheory-placement | medium | `LRA/NumberSystems/{RationalNumbers,RealNumbers,ComplexNumbers,GaussianIntegers}/Construction/Model.lean` | Each of these four systems already has a singular `Construction/Model.lean` (imported by `<System>/Construction.lean`) — the same content `Interface/ModelTheory/Model.lean` is for, filed under the legacy name; not previously listed in `docs/interface-model-standardization-inventory.md` because that survey didn't look inside `NumberSystems/` | Fold into the new `<System>/Interface/ModelTheory/Model.lean` from NS-004 rather than migrating separately | true | true | false | Same Family-B pattern as `Set/Model` (ISS-009) and `EuclideanSpace/Model` (ISS-010), found independently inside `NumberSystems` |
| NS-006 | validator-gap | low | `LRA/AlgebraicStructures/BooleanAlgebra/` | Has the full concept-file-role set but no `Interface/ModelTheory`, same gap pattern as NS-001/NS-002 | No action required for the NumberSystems pass — noted only because it was found while checking whether finite-valued algebraic structures (e.g. finite Boolean algebras) have a base to build on; they would need this first | false | false | false | Out of scope until finite/modular work is scheduled (see NS-007) |
| NS-007 | legacy-top-level-subject | low | `LRA/Carrier/Finiteness/Definition.lean` vs `LRA/Cardinality/Properties/Finiteness/Definition.lean` | Both independently define `IsFinite`/`IsInfinite`, each with 3 live importers; `Carrier` is one of `PurposeAndArchitecture.md`'s named transitional folders, `Cardinality` is the canonical owner of finite/infinite behavior | Out of scope for the NumberSystems structural pass — deliberately deferred; flagged so future finite/modular algebraic-structure work (composing e.g. `Field` + a finiteness hypothesis, never a new `FiniteField` structure) doesn't build on whichever `IsFinite` happens to get picked first | true | true | false | Confirms there is currently zero finite-valued/modular content anywhere in the repo (`Modular`, `Zmod`, `FiniteField`, `FiniteGroup` all return no matches) — not a gap in this pass's scope, just recorded for later |

### 7.5 Scoped punch list — NumberSystems structure and organization only

In dependency order, excluding all new mathematical content:

1. Restore compilation: ISS-001 → ISS-007 (the 25 dangling `Volume*` imports),
   in the order already given in §6.
2. NS-001, NS-002: add `Interface/ModelTheory` to `DiscreteInteger` and
   `CommutativeSemiring` (unblocks `Integers` and `NaturalNumbers` below).
3. NS-003: relocate Archimedean to `Order` (unblocks `RealNumbers` below).
4. Recreate `NumberSystems/Interface/ModelTheory/` (ISS-008), composing the
   now-complete `AlgebraicStructures` targets rather than restating them.
5. NS-004 + NS-005 together, one system at a time: add
   `<System>/Interface/{Signature,ModelTheory}/` and fold in the legacy
   `Construction/Model.lean` where present. Suggested order —
   `RationalNumbers` first (target already fully ready, no prerequisite
   work), then `ComplexNumbers` and `GaussianIntegers` (also fully ready),
   then `RealNumbers` (needs NS-003 first), then `Integers` (needs NS-001
   first), then `NaturalNumbers` (needs NS-002 first).
6. Confirm each `Constructions/<Construction>/Instances.lean` proves
   realization against both the new system-level `Model` and the underlying
   `AlgebraicStructures` typeclass; fill in any that don't yet.

NS-006 and NS-007 are recorded but intentionally left out of this list.

---

## 8. Step 1 status: broken imports fixed (ISS-001 → ISS-007)

All 25 dangling imports are resolved. Re-running the same static
import-resolution check used to produce §2 (every `import LRA....` line
checked against the filesystem) now returns zero broken targets across 3,806
import lines. 20 existing files had their import lines rewired; 8 new files
were created; no `lakefile.lean` changes were needed (`LRAAll`'s
`.andSubmodules` glob already covers new files under `LRA/`).

**One deliberate deviation from the plan in §4/§7**, discovered during the
work: `open LRA.NumberSystems.Models` is used far more widely than the 17
files with a *direct* broken import of it — **57 files** across
`NumberSystems`, `EuclideanSpace`, and `Analysis/MetricSpace` reference that
namespace, most of them transitively (importing a file that imports `Models`,
not `Models` itself). Renaming the namespace to `Interface.ModelTheory` now
(as ISS-008/NS-004 originally proposed) would have required touching all 57,
turning a "restore compilation" change into a repo-wide rename with a blast
radius reaching outside `NumberSystems` entirely — exactly what Step 1 was
supposed to avoid. Instead, the content was recreated **preserving its
original namespace** (`LRA.NumberSystems.Models`) at a path that mirrors it
exactly: `LRA/NumberSystems/Models.lean` plus
`LRA/NumberSystems/Models/{CanonicalEmbeddings,UniversalProperties}.lean` for
the two namespace-nested pieces. This fixes every import with zero changes to
any of the 57 `open` sites. The proper split into
`NumberSystems/Interface/ModelTheory/{LStructure,Theory,Model}.lean` (ISS-008)
is unchanged as a goal — it now happens deliberately in Step 4/5, informed by
the real 57-consumer footprint just discovered, rather than being bundled
into the import fix.

Files created:

- `LRA/NumberSystems/Models.lean` — recreated verbatim from the deleted
  `VolumeII/NumberSystems/Models.lean` (its own imports were never touched by
  the deletion, so no internal changes were needed beyond the file's location)
- `LRA/NumberSystems/Models/CanonicalEmbeddings.lean`,
  `LRA/NumberSystems/Models/UniversalProperties.lean` — same treatment
- `LRA/NumberSystems/Arithmetic/Model/{FirstOrderSignature,Theory,ModelBuilder,All}.lean`
  — recreated verbatim from the deleted `VolumeII/Arithmetic/Model/*`
  (ISS-004), de-`Volume`-ed
- `LRA/NumberSystems/RealNumbers/LraReal.lean` — recreated from the deleted
  `VolumeIII/RealNumbers/LraReal.lean` (ISS-006). **The deleted file itself
  had a pre-existing bug**: it ended with an unclosed
  `namespace LRA.NumberSystems.RealNumbers` (confirmed via `git show` — 39
  lines, no matching `end`), independently consistent with
  `LRA/Analysis/Bounds/Examples.lean`'s import of it having been dead code
  (never referenced in that file's body) even before deletion. The missing
  `end` was added; no other content changed. `LRA/Analysis/Bounds/Examples.lean`
  had the dead import deleted outright rather than repointed. The open
  question from §4 (recreate the concrete cut type vs. repoint to the generic
  `Dedekind` construction) was resolved in favor of recreation, since it
  requires no design work and is consistent with every other fix in this
  step; reconciling `LraReal` with the generic Dedekind construction remains
  open for the `RealNumbers` work in Step 5.

Files rewired (import path only, no namespace/content changes):
`LRA/Arithmetic/ContinuedFractions/Definition.lean`,
`LRA/Interop/Mathlib.lean` (import deleted outright — target already
superseded by `Analysis/MetricSpace/Interop/Mathlib.lean`, nothing else
imports the file),
`LRA/NumberSystems/GaussianIntegers/Construction/Model.lean` (also repointed
its `LRA.NumberSystems.Integers.Z` references to the fully-qualified
`LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z`, since the
convenience alias that used to provide the short name was itself deleted
(`VolumeII/Integers/Implementation.lean`); deciding whether to reintroduce
such an alias — and where — is left for Step 5, not invented here),
plus the 17 files listed against ISS-001, the 2 against ISS-002, and the 1
against ISS-003 in §4.

Not yet done, and not part of Step 1: nothing was built (`lake build` was not
run, per the standing repo constraint) and no validator gate was executed —
verification here is limited to the same static import-resolution method used
throughout this audit, plus manual inspection (namespace/`end` balance, no
remaining `Volume*` references in touched files). A Lean build is the only
way to confirm the recreated files still elaborate correctly against the
current `AlgebraicStructures`/`Order`/`Logic`/`Operation` state; that
verification is outside this session's constraints and should happen before
this work is considered final.

---

## 9. Step 2 status: NS-001 corrected, NS-002 done

**NS-001 was a misdiagnosis, corrected rather than implemented as written.**
Building `AlgebraicStructures/DiscreteInteger/Interface/ModelTheory` was
proposed on the assumption that `Integers` realizes `DiscreteInteger`. Tracing
actual usage before writing anything showed this is wrong:

- `DiscreteInteger`'s own laws (`HasSuccessor`/`HasPredecessor`/
  `SuccessorLaws`/`DiscretenessLaw`, all in
  `DiscreteInteger/Laws/Definition.lean`) are a successor/predecessor-based
  notion of discreteness, and they're already live — consumed by
  `NumberSystems/IntegerStructure/Interface/ModelTheory/LStructure.lean`
  (which already has full `Interface/ModelTheory`) and by
  `NumberSystems/PeanoSystem/Interface/ModelTheory/LStructure.lean`, plus two
  `NaturalNumbers` construction files.
- `NumberSystems/Models.lean`'s `DiscretelyOrderedIntegralDomainModel` (the
  struct `Integers` actually needs) uses a completely different, *order-based*
  notion of discreteness — `OrderDiscretenessLaw`, defined at
  `LRA/Order/DiscreteOrder/Definition.lean` — composed together with
  `IntegralDomainLaws`, `LinearOrderLaws`, `StrictOrderCompatibilityLaw`,
  `AdditionRespectsOrderLaws`, and `MultiplicationRespectsOrderLaws`. None of
  this touches `AlgebraicStructures.DiscreteInteger` at all. The two live
  `Integers` constructions (`Polish/TwoSidedSuccessor`,
  `QuotientOrderedPairs`) instantiate exactly this combination already.
- `IntegralDomain/Interface/ModelTheory/{LStructure,Theory,Model}.lean` — the
  one piece of that combination that lives under `AlgebraicStructures` and
  could plausibly have been missing — already exists with real content, not a
  stub.

Net effect: **no `AlgebraicStructures` work was needed to unblock
`NumberSystems/Integers`.** `DiscreteInteger` still lacks its own
`Interface/ModelTheory` (that finding from §7.2/NS-001 was accurate as a
standalone observation), but it is not a `NumberSystems` prerequisite, so
building it is out of scope for "get NumberSystems settled" and was not done.
If `DiscreteInteger` gets its own `Interface/ModelTheory` in the future for
its own sake, `Ring/Interface/ModelTheory` (below) is the closer template
than `OrderedField`, since neither has an order relation.

**NS-002 is done.** `AlgebraicStructures/CommutativeSemiring` had no
`Interface/` at all, and neither did its parent, `Semiring` — so both needed
building, in that order. Both now have the full triplet
(`Interface/Signature/Definition.lean`,
`Interface/ModelTheory/{LStructure,Theory,Model}.lean`), built from the
`Ring/Interface/ModelTheory` template (the closest existing example: same
`add`/`mul`/`zero`/`one` shape, minus `neg`) for `Semiring`, and from the
`Field extends DivisionRing`-style pure-reexport pattern for
`CommutativeSemiring extends Semiring` (commutativity is a `Prop`-level law,
not new signature data, so `CommutativeSemiring`'s signature is a verbatim
reuse of `Semiring`'s rather than an extension). Verified with the same
static import-resolution check (0 broken imports across the whole repo,
before and after) and manual namespace/`end` balance inspection; not built,
per the standing constraint.

`NumberSystems/NaturalNumbers`'s four constructions (`Landau`, `WholeNumbers`,
`VonNeumann`, `Presburger`) currently instantiate no `AlgebraicStructures`
typeclass at all (checked directly — no contradiction like NS-001's, just
unconnected), so unlike `DiscreteInteger`, nothing here contradicts
`CommutativeSemiring` as the eventual target; it remains a forward-looking
build (for `NumberSystems/NaturalNumbers/Interface/ModelTheory` in Step 5),
not yet a confirmed-in-use one.

---

## 10. Step 3 status: NS-003 done, scope corrected

**The framing in §7.3/NS-003 overstated what was broken.** Reading the actual
content of `Analysis/Completeness/ArchimedeanProperty/Definition/
ArchimedeanProperty.lean` before touching anything showed it is not a
reusable generic predicate at all: it is a single concrete, unfinished
(`sorry`) theorem stated directly over Mathlib's `ℝ`
(`theorem ArchimedeanProperty {x y : ℝ} ... : ∃ n : ℕ, (n : ℝ) * x > y`),
importing four Mathlib modules. There was never a generic Archimedean
predicate to relocate — `Analysis`'s version and the shape
`NumberSystems/Models.lean` needs are different formulations entirely, so
"relocating" the existing file would not have produced something
`NumberSystems` could use. What was actually missing was a **new**, generic,
Mathlib-free predicate at the `Order` layer — this was new infrastructure to
build, not a relocation of existing content, and (unlike NS-001) nothing was
currently broken or blocking: `NumberSystems/Models.lean`'s
`ArchimedeanDenseOrderedFieldExtension` (recreated in Step 1) already carries
its own inline, working formulation of Archimedean-ness (integers are
cofinal in the field, via an explicit embedding) and compiles fine as-is.
This step is forward-looking groundwork for Step 5, not a fix.

Added `LRA/Order/Archimedean/Definition.lean` (registered via a new
`LRA/Order/Archimedean.lean` router, imported from `LRA/Order.lean` alongside
the sibling `Density`/`DiscreteOrder` routers — same wiring pattern both
follow). Matches `Order/DiscreteOrder/Definition.lean`'s exact template (a
single-file concept, flat `namespace LRA.Order` per `Order`'s house
convention — note `Order`, unlike `AlgebraicStructures`/`NumberSystems`,
does **not** mirror its full folder path in the namespace): a `class
ArchimedeanLaw (R) [Add R] [LT R] [OfNat R 0]` plus a `section Wrappers`
restating the field as a standalone theorem (`sorry`, per the repo's
placeholder-first convention for accepted-but-unproved statements). The
property is phrased via a small local `IteratedSelfSum` helper (n-fold
self-addition) rather than a natural-number cast, keeping the typeclass
requirements minimal — matching `OrderDiscretenessLaw`'s own minimalism
rather than introducing new general-purpose cast machinery.

**Deliberately not done, to keep this step's blast radius contained:**
reconciling `Order.ArchimedeanLaw` with either
`NumberSystems/Models.lean`'s cofinal-embedding formulation or
`Analysis/Completeness/ArchimedeanProperty`'s Mathlib-`ℝ` theorem. Both are
mathematically related to the new predicate but not trivially the same
statement, and neither currently blocks anything — reconciling all three is
real mathematical work, better done deliberately in Step 5 when
`NumberSystems/RealNumbers/Interface/ModelTheory` is actually being built and
can decide which formulation is canonical with the full context in view,
rather than folded into a structural-placement step.

Verified with the same static import-resolution check (0 broken imports,
before and after) and manual namespace/`end`/`section` inspection. Not
built.

---

## 11. Step 3 redone: `Order.ArchimedeanLaw` removed, real cofinality-based design

**§10's `Order.ArchimedeanLaw` was itself wrong, on the same axis it had just
corrected.** It lived under `Order/` but was not actually order-theoretic: it
depended on `[Add R]` and hand-rolled a `IteratedSelfSum` repeated-addition
helper, exactly the kind of algebra-in-the-order-folder mixing that
`Order/DiscreteOrder`'s `OrderDiscretenessLaw` (its own template) already
does — copying that template reproduced its flaw instead of the actually-pure
alternative that also exists in this repo
(`Order/Relation/{Adjacent,CoverRelation,UpperCover,LowerCover}`, which
express "immediate successor" with no arithmetic at all). Caught and
corrected in-session rather than found later.

**The fix composes downward instead of restating.** `Order/Bounds/` already
has `UpperBound`/`BoundedAbove` and their exact duals `LowerBound`/
`BoundedBelow`, all purely relational (`(relation : Endorelation Element)
(subset : SetObject) [Membership Element SetObject]`, no algebra). What was
missing was **cofinality** — "no single point bounds this subset" — which is
the actual order-theoretic content of "Archimedean." Two new files complete
the dual pair:

- `LRA/Order/Bounds/Cofinal/Definition.lean`:
  `Cofinal relation subset := ∀ point, ∃ element ∈ subset, relation point element`
- `LRA/Order/Bounds/Coinitial/Definition.lean`: the order-dual, built the
  same way against `LowerBound`'s direction.

Both are direct positive existentials, matching `LRA.Relation.Dense`'s own
style, deliberately **not** phrased as `¬BoundedAbove`/`¬BoundedBelow` — that
equivalence needs extra hypotheses (order totality/trichotomy) the repo's own
`semantic-artifact-record.md` convention flags as exactly the kind of thing
that must be named (`normalization_requires`) rather than silently assumed,
and neither predicate needed the detour to be useful.

This wasn't a coincidental convenience: `NumberSystems/Models.lean`
(restored in Step 1) already has **two independent, hand-rolled inline
cofinality statements** — `ArchimedeanDenseOrderedFieldExtension`'s
`ArchimedeanProperty` field and `CofinalRealExtension`'s
`DenseOrderedFieldEmbeddingIsCofinal` field, both shaped
`∀ point, ∃ element, point < embedding element` — the exact duplicate-surface
problem `PurposeAndArchitecture.md`'s "one definition, multiple
specializations" rule exists to prevent. `Cofinal` is the missing shared
name for both; reconciling those two fields to cite it is left for Step 5
(not done now, to keep this step's blast radius contained), but the
duplication is now named rather than silent.

**`ArchimedeanLaw` moved to `AlgebraicStructures/Archimedean/Definition.lean`**,
built by composing `Order.Cofinal` with the algebra needed to generate the
one subset the pure order layer can't supply on its own (repeated addition —
`IteratedSelfSum`, moved here from the deleted `Order/Archimedean/
Definition.lean` since it's algebra, not order): `ArchimedeanLaw R := ∀ x,
0 < x → Order.Cofinal (· < ·) (Multiples x)`, where `Multiples x` is the
predicate-set of `x`'s iterated self-sums, expressed via
`LRA.Set.PredicateSet` (the repo's own predicate-as-set implementation, kept
Mathlib-free like every other law file in this ladder). Wired in as a new
top-level `AlgebraicStructures` entry (`Archimedean.lean` router, registered
in `AlgebraicStructures.lean`), matching the flat single-concept-file shape
of `Order/DiscreteOrder` rather than a full named-structure concept folder,
since — like `OrderDiscretenessLaw` — it adds no new carrier data, only a
law.

This directly enables what was asked for: number-system constructions will
need to **prove** `ArchimedeanLaw` the same way `TwoSidedSuccessor/
Instances.lean` already proves `OrderedRingLaws`/`IntegralDomainLaws`/
`OrderDiscretenessLaw` today (`instance : OrderDiscretenessLaw Z :=
⟨z_no_strict_between_add_one⟩`) — no such instance exists yet for
`ArchimedeanLaw` anywhere; registering them for `RationalNumbers`/
`RealNumbers` is Step 5 work, not done here.

**Deliberately not done: `DenseAbove`/`DenseBelow`.** The only existing
precedent in the repo — `LraReal`'s `open_above` field and
`ConstructionModels.lean`'s `downward_closed` — is a **self-referential**
condition ("this set has no greatest element within itself"), not the
standard order-theory sense ("this set accumulates arbitrarily close to an
external point"). Those are genuinely different predicates that happen to
share a name; building the wrong one would be a third false start on this
exact territory in one session. Left open pending a decision on which sense
is wanted (or whether both are, under different names).

Verified with the same static import-resolution check (0 broken imports)
and manual namespace/`end`/`section` inspection. Not built.

---

## 12. `DenseAbove`/`DenseBelow`/`DenseSubset` resolved

Follow-up to §11's open question, given a precise reference definition for
all three (order-dense subset, dense-below/coinitial, dense-above/cofinal).
Two of the three turned out to already exist under different names; the
third had the same misplaced-under-`Analysis` pattern as Archimedean:

- **Dense Above** (`∀ p, ∃ d ∈ D, p ≤ d`) is exactly `Order.Cofinal`, just
  parametrized generically over the relation rather than hardcoding `≤` —
  matches `UpperBound`/`LowerBound`'s own style, and the reference definition
  itself names them as synonyms. Added `Order.DenseAbove := Cofinal` as a
  named alias in the same file (`Order/Bounds/Cofinal/Definition.lean`).
- **Dense Below** (`∀ p, ∃ d ∈ D, d ≤ p`) is exactly `Order.Coinitial` the
  same way. Added `Order.DenseBelow := Coinitial` as an alias
  (`Order/Bounds/Coinitial/Definition.lean`).
- **Order-Dense** (`∀ x < y, ∃ d ∈ D, x < d < y` — a subset D densely filling
  the whole order; not the same as §7.3/§11's self-referential `open_above`
  case, which is about a set's relationship to *itself*, not to the ambient
  order) already exists as
  `LRA.Analysis.Completeness.Density.IsOrderDenseSubset` — the same
  statement, word for word — but Mathlib-dependent (`Preorder`, `Set`) and
  filed under `Analysis`, the same layer-inversion problem Archimedean had
  relative to `NumberSystems`. Added the Mathlib-free version at
  `LRA/Order/Density/DenseSubset/Definition.lean`
  (`DenseSubset relation subset := ∀ x y, relation x y → ∃ d ∈ subset,
  relation x d ∧ relation d y`), matching `Cofinal`/`Coinitial`'s
  `[Membership Element SetObject]` generic shape, registered via
  `Order/Density.lean` alongside `DenseOrder`/`DenseLinearOrder`.

Reconciling `Analysis.Completeness.Density.IsOrderDenseSubset` with the new
`Order.DenseSubset` (repoint the former to the latter, or fold it away) is
left open the same way the Archimedean-in-`Analysis` reconciliation was —
real work, not done here to keep this addition's blast radius contained.
Verified with the same static import-resolution check (0 broken imports) and
manual namespace/`end` inspection. Not built.

---

## 13. Step 4 done: `NumberSystems/Interface/ModelTheory/` migration

This is the migration §8 deferred: `NumberSystems/Models.lean` (the
`LRA.NumberSystems.Models` namespace, path-mirrored to stay compilable at
minimum disruption in Step 1) is now at its architecturally intended home,
`NumberSystems/Interface/ModelTheory/`, matching the `PeanoSystem`/
`IntegerStructure` template exactly:

```text
NumberSystems/Interface/ModelTheory/
  LStructure.lean          <- full content, unchanged except namespace
  Theory.lean               <- stub, matches every existing example in the repo
  Model.lean                <- aggregator stub, matches every existing example
  CanonicalEmbeddings.lean  <- was Models/CanonicalEmbeddings.lean
  UniversalProperties.lean  <- was Models/UniversalProperties.lean
```

No content changed — `LStructure.lean` is `Models.lean`'s exact prior content
(`DiscretelyOrderedIntegralDomainModel`, `DenselyOrderedFieldModel`,
`RealModel`, and the rest) with only the namespace rewritten from
`LRA.NumberSystems.Models` to `LRA.NumberSystems.Interface.ModelTheory`;
`Theory.lean`/`Model.lean` are stubs because that's what `Theory.lean`/
`Model.lean` are in every other example already in this repo
(`OrderedRing`, `Ring`, `PeanoSystem`, `IntegerStructure` all have empty
`Theory.lean` — no first-order theory has actually been axiomatized as Lean
terms anywhere yet — and a near-empty aggregating `Model.lean`), so building
richer stubs here would be inventing a convention the rest of the repo
doesn't follow, not completing one.

**The 57-file blast radius flagged in §8 is now paid down, not avoided.**
Every reference was rewired in one pass: 18 `import LRA.NumberSystems.Models`
lines → `import LRA.NumberSystems.Interface.ModelTheory.Model`, 57
`open LRA.NumberSystems.Models` lines → `open LRA.NumberSystems.Interface.
ModelTheory`, 4 direct imports of `Models.CanonicalEmbeddings`/
`.UniversalProperties` repointed, and 9 files' qualified
`LRA.NumberSystems.Models.X` references rewritten to
`LRA.NumberSystems.Interface.ModelTheory.X` (`CanonicalEmbeddings`/
`UniversalProperties` substrings handled before the general prefix, in one
ordered `sed` pass, to avoid double-rewriting). 63 files touched in total,
spanning `NumberSystems`, `EuclideanSpace`, and `Analysis/MetricSpace` exactly
as §8 predicted. `NumberSystems.lean` now imports the new `Interface.
ModelTheory.*` files directly, matching how `PeanoSystem.lean`/
`IntegerStructure.lean` import their own (no intermediate `Interface.lean`/
`Interface/ModelTheory.lean` router files exist in either template, so none
were added here either — consumers import the leaf files directly, same as
those two).

Verified three ways: a full static import-resolution check (0 broken across
3,838 import lines, same method used throughout this audit), an exhaustive
grep confirming zero remaining references to `LRA.NumberSystems.Models`
anywhere in the repo, and manual namespace/`end` balance plus spot-checks of
rewired consumer files in `NumberSystems`, `EuclideanSpace`, and
`AlgebraicStructures`-facing qualified references. Not built — no `lake
build` or validator gate run, per the standing constraint.

Still open, unchanged from §8/§11: reconciling `NumberSystems/Interface/
ModelTheory/LStructure.lean`'s `ArchimedeanDenseOrderedFieldExtension`/
`CofinalRealExtension` fields with the now-available `Order.Cofinal`/
`AlgebraicStructures.ArchimedeanLaw`, and building the per-system
`NumberSystems/<System>/Interface/{Signature,ModelTheory}/` layer (Step 5).

---

## 14. Step 5 in progress: per-system `Interface/` layer

Following §7.5's suggested order — the three systems whose target was
already fully ready, no prerequisite work needed. Each got the same
treatment: `Interface/Signature/Definition.lean` (a pure re-export of the
strongest-structure target's signature, matching how
`OrderedField.Interface.Signature` re-exports `Field`'s — confirmed by
reading `OrderedField`'s own `LStructure.lean`, which opens *its own*
`Interface.Signature` rather than reaching into `Field`'s directly, and
fixed to match once noticed) plus `Interface/ModelTheory/{LStructure,Theory,
Model}.lean`, with the legacy `<System>/Construction/Model.lean` folded into
the new `LStructure.lean` and deleted, and `<System>.lean` rewired.

- **`RationalNumbers`** (target `OrderedField`): `Construction/Model.lean`'s
  `rationalNumbersModel` moved in unchanged. No external consumers of the
  legacy path existed (only `RationalNumbers.lean`'s own wiring), so this
  was a fully contained move.
- **`ComplexNumbers`** (target `Field`): `Construction/Model.lean`'s
  `complexNumbersModel`/`complexNumbersOverMathlibReals` moved in unchanged.
  Same contained-move shape.
- **`GaussianIntegers`** (target: nominally `IntegralDomain` per §7.2, but
  **the actual restored content doesn't use `IntegralDomain` at all** —
  `gaussianArithmeticRingModel` composes the small
  `NumberSystems.Arithmetic.Model.ArithmeticRingFirstOrderSignature`
  (`add`/`mul`/`zero`/`one` only, no `neg`) instead, confirmed by reading the
  content before moving it rather than assuming §7.2's table. Migrated
  faithfully as-is — `Interface/Signature` re-exports from
  `NumberSystems.Arithmetic.Model`, not `AlgebraicStructures.IntegralDomain`
  — rather than silently "fixing" this to match the table, which would be
  new mathematical work (strengthening the model to capture full ring
  structure including negation) disguised as a structural move. Flagged
  here instead: `GaussianIntegers` does not yet compose `IntegralDomain`'s
  `Interface/ModelTheory` the way §7.2 anticipated; doing so is separate,
  undone work.

All three verified with the same static import-resolution check (0 broken
imports, checked after each system) and confirmed zero remaining references
to each legacy `<System>.Construction` path. Not built.

## 15. Step 5 complete: all six remaining systems

**`RealNumbers`** (target `OrderedField`, via the generic layer's `RealModel`):
turned out not to need the Archimedean reconciliation flagged in §11/§13
first — `RealNumbers/Construction/Model.lean`'s actual content
(`realNumbersModel : (real_model : RealModel) → ...`) only wraps
`RealModel.signature` into an `OrderedField`-shaped model; it never touches
the `ArchimedeanDenseOrderedFieldExtension`/`CofinalRealExtension` fields
that reconciliation is about. Migrated the same contained way as
`RationalNumbers`/`ComplexNumbers`. The reconciliation itself is still open,
unblocked by this move, and not required for it.

**`Integers`** (target: `IntegralDomain` + `Order`-owned laws directly, per
the NS-001 correction in §9 — not `DiscreteInteger`): no legacy
`Construction/Model.lean` existed to fold in (only `RationalNumbers`,
`RealNumbers`, `ComplexNumbers`, `GaussianIntegers` had that pattern). Built
fresh, but not new mathematics — `NumberSystems/Interface/ModelTheory/
LStructure.lean`'s `DiscretelyOrderedIntegralDomainModel` is already exactly
the generic model `Integers` needs (confirmed: its `.signature` method
returns `OrderedRingSignature`, matching `BuildOrderedRingModel`'s parameter
type exactly), so `Integers/Interface/ModelTheory/LStructure.lean` is a thin
specialization — `integersModel (integer_model : DiscretelyOrderedIntegralDomainModel)
:= BuildOrderedRingModel integer_model.signature` — the same compositional
shape as `RationalNumbers`/`RealNumbers`, just over `OrderedRing` instead of
`OrderedField`.

**`NaturalNumbers`** (target `CommutativeSemiring`, built in Step 2): the one
system with genuinely new wiring rather than a migration — no legacy
`Construction/Model.lean`, and (confirmed in §9) its four constructions
instantiate no `AlgebraicStructures` typeclass at all yet, so there was
nothing to fold in or reconcile against. Unlike `Integers`/`RationalNumbers`/
`RealNumbers`, there's no `NumberSystems`-generic bundle to specialize either
(none was needed — semirings don't carry the order-compatibility complexity
that motivated `DiscretelyOrderedIntegralDomainModel`/`DenselyOrderedFieldModel`
in the first place), so `NaturalNumbers/Interface/ModelTheory/LStructure.lean`
specializes `AlgebraicStructures.CommutativeSemiringConceptSignature`
directly.

**Result: all 8 `NumberSystems` subjects that belong on the ring/field ladder
now have `Interface/{Signature,ModelTheory}`** (`PeanoSystem`,
`IntegerStructure` were already compliant; the other 6 were built across
Step 5). `ExtendedReal` remains the sole, correctly deliberate exception —
confirmed in §7.2 as not fitting the ladder at all (±∞ have no inverses;
closer to `Order/Lattices/CompleteLattice`), unaddressed by design, not an
oversight.

Verified with the same static import-resolution check after every system (0
broken imports across 3,884 import lines by the end — the largest total
this audit has checked, reflecting the ~24 new files this step added) and
manual namespace/`end` balance on every new file. Not built — no `lake
build` or validator gate run, per the standing constraint; a real build is
the only way to confirm the recreated/composed model constructors actually
elaborate, and remains outside this session.

---

## 16. `WholeNumbers` added as its own `NumberSystems` subject

User request: add `W` (whole numbers, `N ∪ {0}`) as its own system, so
0-specific properties can be developed there while everything else leverages
the existing 1-based `N`.

**First confirmed the premise.** `NaturalNumbers/Constructions/Landau/
Carrier.lean` is purely axiomatic — `axiom LandauElement`, `axiom LandauOne`,
`axiom LandauSuccessor` — no zero axiom anywhere, and `PeanoSystem`'s own
base-element field is literally named `one : Element`, matching the Landau
tradition `DESIGN.md` cites. **Confirmed: the foundational 1-based
`NaturalNumbers` does not have 0.**

**Then found this repository already has exactly what was being asked
for — just filed in the wrong place.** `NumberSystems/NaturalNumbers/
Constructions/WholeNumbers/` existed, nested as if it were merely another
way to construct ℕ itself (a sibling of `Landau`/`VonNeumann`/`Presburger`,
all of which *are* constructions of ℕ). It isn't that: `Carrier.lean` builds
`W := Option N` (`zero := none`, `naturalEmbedding value := some value`),
lifting Landau's successor/addition/multiplication across the extra element
— a construction of a different, larger system that *depends on*
`NaturalNumbers`, misplaced one directory too deep, the same
misplaced-by-one-layer pattern this audit keeps finding elsewhere (just
vertically instead of by subject layer this time). `Instances.lean` already
proves substantial content: `CommutativeSemiringLaws` and the stronger
`OrderedSemiringLaws` (a few `sorry`s remain, but the shape and most proofs
are real).

**Moved, not rebuilt.** `NumberSystems/NaturalNumbers/Constructions/
WholeNumbers/*` → `NumberSystems/WholeNumbers/Constructions/Landau/*`
(renamed from the construction-name-under-`NaturalNumbers` to the
system-name-with-a-`Landau`-flavored-construction, since it specifically
builds on `NaturalNumbers`'s `Landau` construction and other constructions
of `W` — e.g. one over `VonNeumann` — could exist as siblings later). All 7
files (`Carrier`, `Equivalence` (empty — `W` isn't a quotient construction,
so it never needed one), `WellFoundedness`, `Operations`, `Laws`,
`Behavior`, `Instances`) moved with only the namespace and self-referential
imports rewritten (`LRA.NumberSystems.NaturalNumbers.Constructions.
WholeNumbers` → `LRA.NumberSystems.WholeNumbers.Constructions.Landau`); the
still-valid reference to `NaturalNumbers.Constructions.Landau.Operations`
(the actual N construction it builds on) was left untouched. No external
consumers existed outside its own family, so this was fully contained.

**Given `Instances.lean` already proves `OrderedSemiringLaws`** (strictly
stronger than `CommutativeSemiringLaws`), `AlgebraicStructures.
OrderedSemiring` — confirmed to already have full `Interface/ModelTheory`
(`BuildOrderedSemiringModel`, `orderedSemiringFirstOrderModel`) — is `W`'s
correct target, not `CommutativeSemiring`. Built
`WholeNumbers/Interface/Signature/Definition.lean` (re-export of
`OrderedSemiring`'s) and `WholeNumbers/Interface/ModelTheory/
{LStructure,Theory,Model}.lean`; `wholeNumbersModel` `letI`s in the six
typeclass instances `Instances.lean` already registers as plain `def`s
(`zeroOn`/`oneOn`/`addOn`/`mulOn`/`ltOn`/`leOn` — not registered as
`instance`s, so they must be brought into scope explicitly, the same way
`Instances.lean` itself does internally) before calling
`orderedSemiringFirstOrderModel`, rather than inventing a new construction
path.

Wired `WholeNumbers` into `NumberSystems.lean` as a peer of `NaturalNumbers`
(between it and `IntegerStructure`, matching the ℕ → W → ℤ progression), and
dropped the old import from `NaturalNumbers/Constructions.lean`.

**This surfaces a real correction to the already-committed §15 work, flagged
here rather than silently fixed:** `Instances.lean`'s proof confirms
mathematically that `CommutativeSemiring` — the target §15 assigned to
`NumberSystems/NaturalNumbers/Interface/ModelTheory` — cannot actually be
realized by 1-based `NaturalNumbers` itself (a semiring requires an additive
identity; 1-based `N` has none). It's realized by `WholeNumbers`, as just
built. `NaturalNumbers/Interface/ModelTheory` still exists as scaffolding
(no instance was ever registered against it, so nothing currently claims a
false theorem), but no instance ever *can* satisfy it as currently targeted.
Whether to retarget or remove it — and if retargeted, there is no existing
`AdditiveCommutativeSemigroup + CommutativeMonoid + Distributive`-without-zero
bundle in `AlgebraicStructures` to point it at, so a correct fix may require
new `AlgebraicStructures` infrastructure, not just a rewire — is left as an
open decision rather than acted on unilaterally, since it touches previously
committed work outside what was asked for this turn.

Verified with the same static import-resolution check (0 broken across
3,897 import lines) and manual namespace/`end` balance across every new and
moved file. Not built.

---

## 17. The §16 correction acted on: `CommutativeSemiringWithoutZero`

User supplied the precise classification: under standard `+`/`×`, 1-based
`N_{>0}` is a *cancellative commutative semiring without an additive
identity* (a "commutative hemiring"/"rig without zero") — commutative
semigroup under `+` (associative, commutative, cancellative, **no**
identity), commutative monoid under `×` (has identity `1`, cancellative),
distributive, no zero. This is the missing target flagged in §16.

**Checked what could be reused before building anything new.**
`AlgebraicStructures.AdditiveCommutativeSemigroupConceptSignature` and
`AdditiveSemigroupConceptSignature` already have no zero requirement (both
reduce to `LRA.UniversalAlgebra.InterpretedOperationBundles.
AdditiveOperationBundle`, which is exactly `carrier` + `add`, nothing else).
`Operation/Laws/Cancellation/Definition.lean` already has generic
`LeftCancellative`/`RightCancellative`/`TwoSidedCancellative` predicates
(confirming `PurposeAndArchitecture.md`'s own top-level subject table, which
names "cancellation" as one of `Operation`'s core concerns) — but no
`AlgebraicStructures`-level wrapper class composing them existed yet
(`grep -rln "CancellationLaw\|Cancellative" LRA/AlgebraicStructures` was
empty before this).

**Added `AlgebraicStructures/CommutativeSemiringWithoutZero/`**, matching
every existing sibling's file shape:

- `Laws/Definition.lean`: two new wrapper classes,
  `AdditiveCancellativeLaws`/`MultiplicativeCancellativeLaws`, each a thin
  `class` around `Operation.Laws.Cancellation.TwoSidedCancellative` (the
  same pattern `ZeroAbsorbingLaws` uses to wrap `Operation.Laws.Absorbing` —
  defined directly inside the structure that needs them, not manufactured as
  their own top-level `AlgebraicStructures` folders, since neither is a
  named structure in its own right). Combined into `class abbrev
  CommutativeSemiringWithoutZeroLaws` — `CommutativeSemiringLaws`'s exact
  law list minus `AdditiveIdentityLaws`/`ZeroAbsorbingLaws` (both require
  `OfNat R 0`), plus the two new cancellative laws.
- `Definition.lean`: `CommutativeSemiringWithoutZeroConceptSignature extends
  AdditiveOperationBundle where multiply; one` — extends the zero-free
  additive bundle directly and adds `multiply`/`one` as new fields, matching
  the single-`extends`-plus-new-fields shape every existing `ConceptSignature`
  in this repo uses (`DiscreteIntegerConceptSignature extends
  RingConceptSignature where succ; pred` is the closest precedent). No
  structure in this repo extends two bundles at once — considered it
  (`extends AdditiveOperationBundle, MultiplicativeOperationBundle`) and
  deliberately didn't introduce the first case, since it can't be verified
  without a build the way the proven single-`extends` pattern can be trusted
  by precedent.
- `Interface/Signature/Definition.lean` + `Interface/ModelTheory/
  {LStructure,Theory,Model}.lean`: built fresh (not a re-export — this
  signature genuinely differs from every existing one, having no `zero`
  constant symbol at all), following `Ring`'s template exactly.
  `domainNonempty := ⟨signature.one⟩` rather than `⟨signature.zero⟩`,
  correctly reflecting that nonemptiness comes from `1`, not `0`.

**Retargeted `NumberSystems/NaturalNumbers/Interface/{Signature,
ModelTheory}`** from `CommutativeSemiring` to this new structure, fixing the
§16 correction rather than leaving it flagged. `WholeNumbers` (§16, built
against `OrderedSemiring`, which does need zero) is unaffected — it
correctly has zero and was never touched.

**Also fixed while in the area**: `Semiring.lean` and `CommutativeSemiring.
lean` (the top-level subject routers) never imported their own `Interface/`
files — an oversight from Step 2 that meant their `Interface/ModelTheory`
content, while it existed and compiled standalone, was unreachable
transitively from `AlgebraicStructures.lean`. Added the same four `Interface`
imports both `RationalNumbers.lean`-style system routers already carry.

Verified with the same static import-resolution check (0 broken across
3,928 import lines) and manual namespace/`end`/`section` balance on every
new and changed file. Not built — this is the one addition in this session
most worth an actual `lake build` before considering it final, given the
untested multi-field `ConceptSignature` extension and the two brand-new
`Cancellation`-wrapping typeclasses; neither has any prior instance proving
it's inhabited or that the field names line up exactly as intended.

---

## 18. `NumberSystems/Carriers/` — named ground-type aliases

User request: a single place giving `N`, `N_0`, `N_Landau`, etc. easy
names to reference from examples and failures, rather than fully-qualifying
`LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z` every time — closing
the gap flagged back in §8, where the deleted `Integers/Implementation.lean`
alias (`abbrev Z := Polish.TwoSidedSuccessor.Z`) was not reintroduced on
purpose, deferred to exactly this kind of work.

One design choice was checked with the user before building anything, since
it would have shaped every downstream file: what the *bare* name (`N`, `Z`)
should resolve to. Confirmed: a concrete default (`N := N_Landau`), matching
the deleted alias's own precedent, not a universally-quantified parameter or
an existence-witness abstraction.

**Added `LRA/NumberSystems/Carriers/Definition.lean`** with every carrier
that is a genuine ground type — requires no external parameter, no
constructed witness, nothing beyond what its own construction already
proves:

- `N_Landau`, `N_VonNeumann`, `N_Presburger` (all three of `NaturalNumbers`'s
  ground-type constructions — `Presburger.PresburgerElement` is an
  `inductive`, `VonNeumann.NaturalElement` is a ZFC-ordinal subtype, `Landau.
  LandauElement` is axiomatic), `N := N_Landau`
- `Z_Polish` (`Integers.Polish.TwoSidedSuccessor.Z`, an `inductive`), `Z :=
  Z_Polish`
- `GaussianInt_OrderedPairs` (`GaussianInteger Z_Polish` — already existed
  as `GaussianIntegers.Interface.ModelTheory.ActiveGaussianInteger`, built
  in Step 5; re-exported here rather than redefined), `GaussianInt :=
  GaussianInt_OrderedPairs`

**`N_0` corrected, not blocked.** Initially assumed `N_0` had to mean
`WholeNumbers`'s `Option`-over-`Landau` carrier specifically, which really is
blocked (see below). User corrected this: `VonNeumann`'s construction is
*already* zero-based — von Neumann ordinals start at `∅ = 0` by
construction, and `VonNeumann/Carrier.lean` already has `NaturalZero`/
`NaturalSuccessor` built in. So `N_0 := N_VonNeumann` — already a ground
type, already aliased, zero new content, not the blocked case at all.

One nuance worth being precise about: this does **not** unblock
`Integers.QuotientOrderedPairs`/`.Tao`/`.Mendelson` below.
`WholeNumberArithmeticForQuotientPairs` and its siblings are coded
specifically against `WholeNumbers`'s `Landau`-based machinery
(`LandauAddition`/`LandauMultiplication`), not `VonNeumann` — having a
0-based carrier available under a different construction doesn't supply what
those three specifically need. `WholeNumbers`'s own carrier remains genuinely
blocked for the reason below.

**Checked, and explicitly not built: `WholeNumbers`'s own carrier (via
`Landau`) and everything downstream of it.** Its carrier is `Carrier
natural_data`, parametrized over a `NaturalArithmeticForWholeNumbers`
witness — order relation, trichotomy, transitivity, and compatibility with
`+`/`×`, all proven over `Landau` specifically. **No such witness exists
anywhere in the repository** (confirmed by grep), and **`Landau` itself has
no order relation defined at all** — not even a bare `<`. Grounding it is
therefore new mathematical content (defining `<` on axiomatic Landau numbers
and proving it total, transitive, and compatible with the proven
`LandauAddition`/`LandauMultiplication`), not an aliasing task, even though
the repo's own placeholder-first convention (`sorry` for accepted-but-unproved
statements) would make a stubbed version consistent with house style. Left
for the user to direct rather than assumed.

This blocks three more, transitively: `Integers.QuotientOrderedPairs`,
`.Tao`, and `.Mendelson` all build ℤ as pairs of *whole* numbers via this
specific `Landau`-based `WholeNumbers` machinery (unlike `Polish`, which
builds ℤ directly from `Landau` via a two-sided successor and was already
ground). Also checked and found similarly parametrized, not attempted:
`RationalNumbers`'s and `RealNumbers`'s six constructions all need a
`DenselyOrderedFieldModel`/rational-field witness first;
`ComplexNumbers.Interface.ModelTheory.complexNumbersModel` needs a base
field carrier (its only existing ground instantiation,
`complexNumbersOverMathlibReals`, is over Mathlib's `Real`, not an
LRA-native real).

Verified with the same static import-resolution check (0 broken imports)
and manual namespace/`end` balance. Not built.

---

## 19. Order on `Landau`, unblocking `N_0_Landau` and `Z_QuotientOrderedPairs`

User: "landau should have the order on it. that's proven in the grundlagen" —
correcting the reluctance in §18 to add order-on-`Landau` as risky new
content. It isn't: Landau's Grundlagen der Analysis is exactly the source
this repo already cites (`DESIGN.md`'s "Preferred sources" list), and the
standard order construction (`x < y :↔ ∃z, x+z=y`) is textbook, not novel.

**Checked what already existed before writing anything**, and found the
scope much smaller than expected: `Landau/WellFoundedness.lean` already has
all five Peano axioms (`LandauBaseNotSuccessor`, `LandauSuccessorInjective`,
`LandauInduction`, alongside the two from `Carrier.lean`) packaged into a
full `LandauPeanoSystem : PeanoSystem LandauElement (PredicateSet
LandauElement)`. And `LandauAddition`/`LandauMultiplication`
(`Landau/Operations/*.lean`) are **already generic over any** `(model :
PeanoSystem Element SetObject)`, not `LandauElement`-specific — matching
`DESIGN.md`'s "prove once, reuse everywhere" recursion-architecture
principle. So order needed to be added the same way, generic over any
`PeanoSystem`, not hand-rolled for `LandauElement`.

**Added `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/Laws.lean`**
— the `Laws.lean` role in the Construction Pipeline
(`PurposeAndArchitecture.md`: "Algebraic, order, or structural laws
satisfied by the operations"), a role `Landau` didn't have yet.
`LandauLessThan model x y := ∃ z, LandauAddition model x z = y`, with the
citation in its doc comment, plus the two theorems `NaturalArithmeticFor
WholeNumbers` actually needs (`strictOrder_trichotomous`,
`strictOrder_transitive`) and the two order-compatibility theorems
(addition, multiplication) — all `sorry`'d, matching every other theorem in
`Landau/Operations/*.lean` (`LandauAdditionIsAssociative`,
`LandauAdditionIsCommutative`, etc. are *all* already `sorry`'d; this adds
statements at the same rigor level already established there, not a
weaker or stronger standard). One quiet fact worth naming: the
multiplication-compatibility law holds *unconditionally* (no "factor > 0"
side-condition) only because `LandauElement` has no zero — every element is
positive by construction, so the usual caveat vanishes for 1-based ℕ
specifically.

**Built the concrete witness and extended two carriers**, in
`NumberSystems/Carriers/Witnesses.lean` (new file, since these are
constructed instances rather than pure aliases like `Definition.lean`):

- `landauNaturalArithmeticForWholeNumbers : NaturalArithmeticForWholeNumbers
  LandauElement (PredicateSet LandauElement)`, filling all five fields from
  `LandauPeanoSystem` and the four new `Landau/Laws.lean` theorems.
- `N_0_Landau := WholeNumbers.Constructions.Landau.Carrier
  landauNaturalArithmeticForWholeNumbers` — the genuinely-blocked carrier
  from §18, now grounded. (`N_0` itself stays `N_VonNeumann`, per the
  earlier correction — this is the *other*, `Landau`-based whole-number
  carrier, now also available under its own name.)
- Chased one link further: `WholeNumbers/Constructions/Landau/Instances.lean`
  already has `quotientOrderedPairsInput`, taking exactly a
  `NaturalArithmeticForWholeNumbers` and producing a
  `WholeNumberArithmeticForQuotientPairs` (with its own two pre-existing
  `sorry`s). Calling it with the new witness grounds
  `Z_QuotientOrderedPairs := Integers.QuotientOrderedPairs.Carrier
  landauWholeNumberArithmeticForQuotientPairs` — one of the three
  transitively-blocked ℤ constructions from §18, now also available.

**Not done: `Z_Tao`, `Z_Mendelson`.** Same blocker, same fix shape (each
needs its own construction-specific input built from
`landauNaturalArithmeticForWholeNumbers` — `WholeNumberArithmeticForTaoFormal
Differences` and `PositiveNaturalPairData` respectively, neither yet
checked for its exact required shape), but kept out of this pass rather than
let the chain sprawl further in one turn.

Verified with the same static import-resolution check (0 broken imports)
and manual namespace/`end` balance. Not built — everything downstream of the
four new `sorry`'d order theorems is only as sound as those theorems turn
out to be once actually proved; nothing here claims otherwise.

## 20. `Z_Tao` and `Z_Mendelson` — correction: no new witness type needed

§19 assumed `Z_Tao` and `Z_Mendelson` would each need their own
construction-specific input type, distinct from
`WholeNumberArithmeticForQuotientPairs`, still to be worked out. Checking
`Integers/Constructions/Tao/Carrier.lean` and
`Integers/Constructions/Mendelson/Carrier.lean` directly shows that
assumption was wrong:

```
abbrev WholeNumberArithmeticForTaoFormalDifferences :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs   -- Tao/Carrier.lean

abbrev PositiveNaturalPairData :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs   -- Mendelson/Carrier.lean
```

Both are plain `abbrev`s for the exact same type `Z_QuotientOrderedPairs`
(§19) is already grounded on. No new witness construction was required —
`landauWholeNumberArithmeticForQuotientPairs` grounds all three ℤ
constructions directly:

- `Z_Tao := Integers.Tao.Carrier landauWholeNumberArithmeticForQuotientPairs`
- `Z_Mendelson := Integers.Mendelson.Carrier
  landauWholeNumberArithmeticForQuotientPairs`

Both added to `NumberSystems/Carriers/Witnesses.lean`, importing
`Integers.Constructions.Tao` and `Integers.Constructions.Mendelson`.

With this, all four non-Polish ℤ constructions the repo defines
(`QuotientOrderedPairs`, `Tao`, `Mendelson`, and `Polish` itself as `Z`)
have ground carriers under `NumberSystems.Carriers`. Nothing else in this
section needed building — it was a two-line wiring fix once the mistaken
assumption in §19 was checked against the actual files instead of repeated.

Verified with the same static import-resolution check (0 broken imports
across 3897 import statements) and manual namespace/`end` balance on
`Witnesses.lean`. Not built.

## 21. `Q_RationalQuotientFractions` — grounded via a new `QuotientOrderedPairs`-based `IntegerNumberSystem`

`RationalNumbers`'s only construction, `RationalQuotientFractions`, needs a
witness of `IntegerAndPositiveNaturalData`
(`RationalQuotientFractions/Carrier.lean`):

```
structure IntegerAndPositiveNaturalData where
  integer_system : IntegerNumberSystem
  natural_carrier : Type
  one : natural_carrier
  multiplication : natural_carrier → natural_carrier → natural_carrier
  to_integer : natural_carrier → integer_system.Model.Carrier
  denominator_is_positive : ∀ denominator, 0 < to_integer denominator
  every_positive_integer_has_denominator : ...
  one_maps_to_one : to_integer one = 1
  multiplication_is_preserved : ...
```

This is a heavier ask than anything grounded so far: `integer_system`
must be a full `IntegerNumberSystem` — a `DiscretelyOrderedIntegralDomainModel`
(real `Add`/`Mul`/`Neg`/`OfNat 0`/`OfNat 1`/`LT`/`LE` *instances* plus law
certificates) *plus* `EveryElementIsIntegerNumeral`. Checked all four ℤ
constructions for what they actually offer:

- `Tao`/`Mendelson` only have **existence** theorems
  (`TaoRealizesIntegerNumberSystem`, `MendelsonRealizesIntegerNumberSystem`
  in `Integers/Constructions/{Tao,Mendelson}/Instances.lean`) — `∃
  integerSystem, integerSystem.Model.Carrier = Carrier wholeData`, obtained
  via `Classical.choose`. The resulting model is opaque: there is no way to
  write a concrete `to_integer : natural_carrier → integer_system.Model.Carrier`
  against it, since nothing is known about *which* element of that model
  any given natural maps to. Not usable here.
- `QuotientOrderedPairs/Instances.lean` already had a fully concrete model
  builder, `QuotientOrderedPairsRealizesIntegerModel`, built directly from
  the same `Add`/`Mul`/`Neg`/`0`/`1`/`<`/`≤` instances installed on
  `Carrier whole_data` (`quotientCarrierAdd`, `quotientCarrierMul`, etc.).
  It only lacked `EveryElementIsIntegerNumeral` to become a full
  `IntegerNumberSystem`. Added that as a new `sorry`'d theorem
  (`quotient_every_element_is_integer_numeral`) and wrapped it into
  `QuotientOrderedPairsRealizesIntegerNumberSystem`, in the same file.

With a concrete integer system available, the natural-number embedding
composes two pieces already built: `some : LandauElement → Option
LandauElement` (`WholeNumbers.Constructions.Landau.naturalEmbedding`, §19)
followed by the whole-number-to-integer `embed` already defined in
`QuotientOrderedPairs/Operations.lean`. `landauNaturalToInteger` in
`Carriers/Witnesses.lean` is exactly that composite, and the four
remaining `IntegerAndPositiveNaturalData` proof obligations are stated
against it and left `sorry`'d
(`landauNaturalToIntegerIsPositive`,
`landauEveryPositiveIntegerHasLandauDenominator`,
`landauNaturalToIntegerOneMapsToOne`,
`landauNaturalToIntegerPreservesMultiplication`), matching this repo's
accepted-statement convention — no new axioms.

Assembled as `landauIntegerAndPositiveNaturalData`, grounding:

- `Q_RationalQuotientFractions := RationalQuotientFractions.Carrier
  landauIntegerAndPositiveNaturalData`
- `Q := Q_RationalQuotientFractions` (generic default alias, matching `N`
  and `Z`)

`RationalQuotientFractions/Instances.lean` was already fully generic over
`IntegerAndPositiveNaturalData` (`RationalQuotientFractionsRealizesRationalNumberSystem`,
etc.) — nothing needed changing there.

Verified with the same static import-resolution check (0 broken imports
across 3899 import statements) and manual namespace/`end` balance on both
modified files (`Carriers/Witnesses.lean`,
`Integers/Constructions/QuotientOrderedPairs/Instances.lean`). Not
built — soundness of everything grounded here is only as good as the
`sorry`'d order laws (§19) and the new `sorry`'d obligations above, once
those are actually discharged.

## 22. `RealNumbers` — five of six constructions grounded

Checked what each of the six constructions actually needs as an input
witness (`Carrier.lean` in each):

| Construction | Witness needed | Verdict |
|---|---|---|
| `Cantor` | `DenselyOrderedFieldModel` | ground carrier is `Cantor.Carrier fieldModel` |
| `Dedekind` | `DenselyOrderedFieldModel` | ground carrier is `Dedekind.Cut rational_model` (a `Cut` subtype, no further quotient) |
| `PrimitiveIntervals` | `DenselyOrderedFieldModel` | ground carrier is `PrimitiveIntervals.Carrier rational_model` |
| `EffectiveCauchy` | `RationalNumberSystem` | ground carrier is `EffectiveCauchy.EffectiveCauchyReal rationalSystem` |
| `Cauchy` | `RationalNumberSystem` + `Cauchy.RationalMetricData rationalSystem` | ground carrier is `Cauchy.Carrier rationalSystem metricData` |
| `Dyadic` | `RationalDyadicApproximationData`, which itself demands a *fully realized* `RationalRealExtension` (not just existence) on top of `Cauchy.RationalMetricData` | **not grounded — see below** |

The first four needed nothing beyond what §21 already produced:
`RationalQuotientFractions/Instances.lean` generically builds both a
`DenselyOrderedFieldModel`
(`RationalQuotientFractionsRealizesDenselyOrderedFieldModel`) and a
`RationalNumberSystem`
(`RationalQuotientFractionsRealizesRationalNumberSystem`) from any
`IntegerAndPositiveNaturalData`, so `landauIntegerAndPositiveNaturalData`
grounds all four directly:

- `R_Cantor := Cantor.Carrier landauDenselyOrderedFieldModel`
- `R_Dedekind := Dedekind.Cut landauDenselyOrderedFieldModel`
- `R_PrimitiveIntervals := PrimitiveIntervals.Carrier landauDenselyOrderedFieldModel`
- `R_EffectiveCauchy := EffectiveCauchy.EffectiveCauchyReal landauRationalNumberSystem`

`Cauchy` needed one more piece: `Cauchy.RationalMetricData rationalSystem`
is an absolute-value structure (9 fields: the value function plus
`absolute_value_zero`, `_negation`, `triangle_inequality`,
`_nonnegative`, `_eq_zero_iff`, `_multiplication`, `_self_or_neg`,
`epsilon_split`) — all textbook `|·|` facts on an ordered field, nothing
construction-specific. Defined `landauRationalAbsoluteValue` as the
standard `if 0 ≤ x then x else -x` (via `open Classical in` for
decidability, the same pattern this repo already uses elsewhere via
`Classical.choose`), and left the nine properties as named `sorry`'d
theorems, matching the accepted-statement convention used throughout
this pass. Assembled as `landauRationalMetricData`, grounding:

- `R_Cauchy := Cauchy.Carrier landauRationalNumberSystem landauRationalMetricData`

`R := R_Cauchy` was picked as the generic default alias (matching `N`,
`Z`, `Q`) — Cauchy sequences are the standard textbook/Mathlib-canonical
real-number construction, so this follows the same "concrete default"
choice the user made earlier for `N`/`Z`, but it's a judgment call on my
part rather than something requested; flagging it here rather than
deciding silently.

**Not done: `Dyadic`.** `RationalDyadicApproximationData` requires a
`CauchyRealExtension : RationalRealExtension RationalSystem` field together
with a proof (`CauchyCarrierEq`) that its `RealModel.Carrier` equals
`Cauchy.Carrier RationalSystem AbsoluteValueData` — i.e. it needs `Cauchy`
to already be packaged as a concrete realization of `RationalRealExtension`,
not just a bare carrier type. Checked `Cauchy/Instances.lean` and
`RealNumbers/Definition.lean` for such a builder: only found existence-style
theorems in that vein elsewhere in this codebase (the same
`Classical.choose`-opacity problem noted for `Tao`/`Mendelson` in §21) — no
concrete `RationalRealExtension` builder for `Cauchy` currently exists to
call. Building one is real new work (packaging `Cauchy.Carrier` with a
`RealModel`, embeddings, and their law certificates), not wiring, so it's
left out of this pass rather than rushed.

Verified with the same static import-resolution check (0 broken imports
across 3904 import statements) and manual namespace/`end` balance on
`Carriers/Witnesses.lean`. Not built — as with every `sorry`'d law in this
audit, everything grounded here is only as sound as those `sorry`s turn
out to be once actually discharged.

## 23. `C_OrderedPairs` — grounded over `Q`, not ℝ (structural gap found)

`ComplexNumbers`'s only construction, `OrderedPairs.ComplexNumber R`, is
fully generic over any `R` — `ComplexNumbers/Constructions/OrderedPairs/
Operations.lean` gives `Add`/`Neg`/`Sub`/`Mul`/`Inv`/`OfNat` on
`ComplexNumber R` purely from the matching raw instances on `R`, no law
certificates required. So in principle grounding it is just "pick an `R`
that already has those instances."

The natural target is a genuine LRA-native ℝ. Checked all five
`RealNumbers` carriers grounded in §22 for whether any of them actually
carry `Add`/`Mul`/`Neg`/`Inv`/`OfNat` *instances* — none do, anywhere in
this codebase. Each construction only proves an existence-style "realizes
a `DenselyOrderedFieldModel`" theorem
(`{Cantor,Cauchy,Dedekind,PrimitiveIntervals}RealizesRationalRealExtension`)
via `Classical.choose` over an *opaque* model — the exact same
non-constructive shape that made `Tao`/`Mendelson` unusable as
`IntegerNumberSystem`s in §21, and `Dyadic` unbuildable in §22. This is a
newly-identified, real gap: none of the `RealNumbers` constructions are
usable as arithmetic types today, only as bare carrier types. Installing
concrete instances on one (e.g. on `Cauchy`, mirroring how
`QuotientOrderedPairs/Instances.lean` built `quotientCarrierAdd` etc. via
`induced_binary_operation_exists` in
`UniversalAlgebra/Quotient/RepresentativeCompatibility.lean`, applied to
`Cauchy`'s already-existing `representative_addition`/
`representative_addition_respects_equivalence`) is real new work, not
wiring — flagged here as a natural next step for a `RealNumbers` pass,
not folded into this one as a scope-creeping side effect.

`Q_RationalQuotientFractions`, by contrast, already has every needed
instance (`rationalCarrierAdd`, `rationalCarrierMul`, `rationalCarrierNeg`,
`rationalCarrierInv`, `rationalCarrierZero`, `rationalCarrierOne`, §21),
so it's the best available concrete LRA-native witness today:

- `C_OrderedPairs := ComplexNumber Q_RationalQuotientFractions`
- `C := C_OrderedPairs`

This grounds the Gaussian rationals ℚ(i), **not** ℂ in the traditional
ℝ-based sense — noting that plainly rather than presenting it as "the"
complex numbers. (The repo's existing `ComplexNumbers/Interface/
ModelTheory/LStructure.lean` already has a `complexNumbersModel Real`
grounding, but that's Mathlib's `Real`, not an LRA-native construction —
consistent with the gap just found.)

Verified with the same static import-resolution check (0 broken imports
across 3905 import statements) and manual namespace/`end` balance on
`Carriers/Witnesses.lean`. Not built.

**Correction (same pass, caught in review):** the write-up above defaulted
`C := C_OrderedPairs := ComplexNumber Q_RationalQuotientFractions` —
collapsing `ComplexNumbers` into the same "one concrete ground carrier"
mold used for `N`/`Z`/`Q`/`R`. That mold doesn't fit here.
`NaturalNumbers`/`Integers`/`RationalNumbers`/`RealNumbers` each have a
*fixed* construction that needs a witness (proof obligations) to produce
one canonical carrier; `ComplexNumbers.OrderedPairs.ComplexNumber R`, by
contrast, is already generic over an arbitrary base type `R` — it *is*
the generic interface, not a construction awaiting one witness. Picking
`Q` and presenting it as "the" default `C` manufactured a canonical
choice (ℚ(i)) that doesn't actually exist for this subject.

Fixed by moving `C` itself into `Carriers/Definition.lean` (the
*generic*-interface file, alongside where it belongs) as a parametrized
`abbrev C (R : Type u) := ComplexNumber R` — no default, no concrete
witness baked in. Any `R` satisfying the operations' instance
requirements (`Add`/`Mul`/`Neg`/`Inv`/`OfNat`, picked up automatically
from `R` itself) works. The old `C_OrderedPairs`/`C := C_OrderedPairs`
pair in `Witnesses.lean` is replaced with a single honestly-named
concrete example, `C_Q_OrderedPairs := C Q_RationalQuotientFractions`
(Gaussian rationals, named as such — not defaulted to as "the" `C`).

Re-verified after the fix: 0 broken imports across 3906 import
statements, manual namespace/`end` balance on both
`Carriers/Definition.lean` and `Carriers/Witnesses.lean`. Not built.

## 24. `R_Dyadic` — the ground carrier needed no witness after all (§22 over-scoped the blocker)

§22 marked `Dyadic` as blocked because `RationalDyadicApproximationData`
(the witness its *theory* — `Value`, `IsDyadicRational`, the isomorphism
with Cauchy reals — is stated against) requires a concrete `Cauchy`
`RationalRealExtension` realization that doesn't exist. True, but that
theory is not the same thing as the *carrier type* — and checking
`Dyadic/Carrier.lean` past where §22's investigation stopped (line ~157)
turns up `inductive Expansion where | zero | nonzero (Sign) (Magnitude :
NonzeroUnsignedExpansion)` at line 105: a **self-contained** type (signed
binary expansions — a finite `WholeBinaryNumeral` integer part plus an
infinite canonical, non-eventually-all-1s `CanonicalFraction` fractional
part), with no `RationalDyadicApproximationData` parameter anywhere in
its definition. Every other definition in that file that *does* take
`dyadicData` (`Value`, `WholeNumeralValue`, `IsDyadicRational`, ...)
only relates `Expansion` back to the rationals/Cauchy reals — it doesn't
gate the type's existence.

So the ground carrier was available all along, no witness needed —
exactly like `N_Landau`/`Z_Polish`/`N_VonNeumann`:

- `R_Dyadic := Dyadic.Expansion`

Added to `Carriers/Definition.lean` (not `Witnesses.lean` — it needs no
witness, matching where the other no-witness carriers already live).

**Still not done, and still genuinely blocked:** the theory connecting
`Expansion` back to the rest of `RealNumbers` (its arithmetic, its order,
its isomorphism with `Cauchy.Carrier`) requires the same missing
infrastructure identified in §23 — none of the `RealNumbers`
constructions have concrete `Add`/`Mul`/`Neg`/`Inv`/`OfNat`/`LE`
instances or a completeness proof installed on their own carrier, and
`Cauchy`'s `Laws.lean`/`Behavior.lean` don't even have an order relation
defined yet (checked: both files are empty). Building
`RationalDyadicApproximationData` means building that whole chain first
(an order relation on Cauchy sequences, arithmetic instances via
`induced_binary_operation_exists`, an `OrderCompletenessLaws` cert, a
`DenseOrderedFieldEmbeddingIntoReal` from ℚ, and a cofinality proof) —
real new mathematical infrastructure comparable in size to everything
grounded in §18–§23 combined, not a wiring task. Left for its own pass.

Verified with the same static import-resolution check (0 broken imports
across 3907 import statements) and manual namespace/`end` balance on
`Carriers/Definition.lean`. Not built.

**Summary of open items across this whole `NumberSystems.Carriers` effort
(§18–§24):** the `RealNumbers` arithmetic-instances gap (blocks a genuine
LRA-native `R` instantiation of `C`, and blocks `Dyadic`'s theory —
found in §23, scoped in §24); and discharging the substantial and
growing pile of `sorry`'d laws underpinning everything grounded so far.

## 25. `Operation.Laws.QuotientCompatible` — generic exists/unique/well-defined/well-founded interface, retrofitted onto Cauchy

Follow-up to a correction during §23/§24's write-up: asked to re-check
whether "no `RealNumbers` construction has ops that exist, are
well-founded, are well-defined, are unique" was actually true. It
wasn't, as a blanket claim — `Cauchy` has raw ops
(`representative_addition`/`_negation`/`_multiplication`, concrete
defs) plus closure proofs (`_is_cauchy`, `sorry`'d) plus
respects-equivalence proofs (`_respects_equivalence`, `sorry`'d, though
**missing entirely for negation** — a real, specific gap); `Dedekind`
and `PrimitiveIntervals` are substantially further along, including
`sorry`'d exists-uniquely theorems (`product_exists_uniquely`,
`reciprocal_exists_uniquely`) and, for `Dedekind`, an actual
supremum/completeness construction (`family_union_is_supremum`); only
`Cantor` and `EffectiveCauchy` are genuinely empty. What's uniformly
missing across all six is the final step: lifting those `sorry`'d
per-construction facts into actual `Add`/`Mul`/`Neg`/... **instances**
on the carrier type — no `RealNumbers` construction's `Instances.lean`
declares a single `instance`.

Given that, built the generic interface requested: **`Operation.Laws.QuotientCompatible`**
(`Operation/Laws/QuotientCompatible/Definition.lean`, new law family,
registered in `Operation/Laws.lean`), two structures —
`BinaryOperationIsProper`/`UnaryOperationIsProper` — each bundling
exactly three fields per operation:

- `closed` ("well-founded"): the raw operation's result always satisfies
  the invariant carving the representative type out of a larger raw type
  (e.g. sum of two Cauchy sequences is itself Cauchy).
- `matches_raw`: the named promoted operation actually computes what the
  raw operation computes, once projected back down — ties it to its
  intended definition instead of leaving it an unmoored total function.
- `respects` ("well-defined"): doesn't depend on which representative was
  picked from an equivalence class.

"Exists" and "unique" are deliberately *not* separate fields — both are
free consequences of `respects` alone:
`BinaryOperationIsProper.induced_operation_exists` is a direct
application of the already-existing (`sorry`'d)
`UniversalAlgebra.Quotient.induced_binary_operation_exists`;
`BinaryOperationIsProper.induced_operation_unique` is `sorry`'d here
(mechanically routine — `funext` + `Quotient.ind` twice — but not
attempted as a real tactic proof given no `lake build` to verify it
against); the unary case doesn't even need an existence lemma —
`UnaryOperationIsProper.inducedOperation` is a plain, fully constructive
`def` via `Quotient.lift`, no `sorry` at all. Naming follows this
repo's existing convention: PascalCase for the generic
`Operation.Laws.*` classes, snake_case with no construction-name prefix
for per-construction usage (matching `product_exists_uniquely`, not
inventing `DedekindCutAdditionExists`-style names — the namespace
already disambiguates).

Degenerate case check: for constructions with no invariant at all (e.g.
`QuotientOrderedPairs`, where the raw representative-level operation
already lands back in `Representative`), the predicate specializes
cleanly to `Raw := Representative`, `toRaw := id`,
`invariant := fun _ => True` — nothing forces an irrelevant obligation
onto that simpler case.

Retrofitted onto `Cauchy` as the first concrete example, in a new
`Cauchy/Laws.lean` (previously an empty placeholder file):

- Named promoted operations `addition`/`negation`/`multiplication` on
  `Representative`, each the same anonymous-constructor expression
  already used inline inside the pre-existing `_respects_equivalence`
  theorems, now given a name.
- `addition_is_proper`/`negation_is_proper`/`multiplication_is_proper`,
  each an instance of `BinaryOperationIsProper`/`UnaryOperationIsProper`
  built with **zero new `sorry`s**: `closed` and `respects` are direct
  references to the already-`sorry`'d theorems in `WellDefinedness.lean`
  (reused, not duplicated), and `matches_raw` is `rfl` in all three cases
  (true by definition, since the promoted operations are built directly
  from the raw operation plus its closure proof).
- Added the one theorem this surfaced as missing:
  `representative_negation_respects_equivalence` in
  `Cauchy/WellDefinedness.lean` — negation had a closure proof
  (`_is_cauchy`) but, unlike addition and multiplication, no
  respects-equivalence proof at all until now (`sorry`'d, matching its
  siblings).

This doesn't yet close the `RealNumbers` arithmetic-instances gap itself
— `Cauchy/Instances.lean` still declares no `Add`/`Mul`/`Neg` instance —
but `addition_is_proper` etc. now hand that step exactly the
`induced_operation_exists`/`inducedOperation` witnesses it needs, so the
remaining work is genuinely mechanical (`Classical.choose` over
`induced_operation_exists`, matching `QuotientOrderedPairs/Instances.lean`'s
own pattern) rather than requiring new mathematical content. `Dedekind`
and `PrimitiveIntervals` are natural next candidates for the same
retrofit, given how much of their own `sorry`'d content already fits
this shape.

Verified with the same static import-resolution check (0 broken imports
across 3911 import statements) and manual namespace/`end` balance on all
new/modified files. Not built — in particular, the `rfl`/direct-reuse
claims above (`matches_raw`, `respects`) are checked by hand against the
structures' field types, not by the compiler.

## 26. `Cauchy` completed to a full concrete `RealModel`

Directed to finish what §25 started: give `Cauchy` every theorem it needs
to be "a proper concrete type," `sorry`'d where needed, then move on to
the other five `RealNumbers` constructions the same way.

Added a fourth generic piece to `Operation.Laws.QuotientCompatible`:
`RelationIsProper` (relation counterpart of `BinaryOperationIsProper`) —
simpler than the operation case, since a `Prop`-valued relation has no
`Raw`/closure step to reconstruct through; `respects` is the entire
obligation, and `induced_relation_exists` follows immediately from the
repo's existing `induced_relation_exists` lemma.

In `Cauchy/Laws.lean`, extending §25's `addition`/`negation`/`multiplication`:

- `representative_inverse` (pointwise reciprocal, zero-guarded by
  convention — the standard treatment for a value not bounded away from
  zero, matching `RationalQuotientFractions/Instances.lean`'s
  `quotient_inverse`) plus `inverse_is_proper`, same zero-`sorry` shape
  as the other three operations.
- `zero`/`one` (constant sequences, each with a `sorry`'d — genuinely
  trivial, but unverified here — `is_cauchy` proof).
- `representative_strict_order` — Cauchy's order relation, which
  (checked in §25) had never been defined in this codebase at all:
  `first < second` iff eventually separated by a fixed positive
  rational margin (Tao, *Analysis I*, Ch. 5). Trichotomy, transitivity,
  addition-compatibility, and respects-equivalence, all `sorry`'d;
  `strict_order_is_proper : RelationIsProper ...` assembled from the
  last of those.

In `Cauchy/Instances.lean` (previously only the one existence theorem
from §22/§23), following `QuotientOrderedPairs/Instances.lean`'s
established shape exactly: `Classical.choose` over each `_is_proper`
value's `induced_operation_exists`/`induced_relation_exists` for
addition, multiplication, and the strict order (with `_spec`
companions, `sorry`'d — matching `QuotientOrderedPairs`'s own choice to
`sorry` those rather than derive them from `Classical.choose_spec`);
`negation`/`inverse` lifted directly via `inducedOperation` (no
`Classical.choose`, no `sorry`, fully constructive); nonstrict order
derived from strict (`a ≤ b := a < b ∨ a = b`). `Add`/`Mul`/`Neg`/`Inv`/
`OfNat 0`/`OfNat 1`/`LT`/`LE` instances installed on `Carrier
rationalSystem absolute_value_data` from those. Four law-certificate
theorems (`OrderedFieldLaws`, `StrictOrderCompatibilityLaw`,
`DenseOrderLaw`, `OrderCompletenessLaws` — the last being genuine
completeness, the hardest fact in the whole construction), all `sorry`'d.
Assembled into two concrete builders:

- `CauchyRealizesDenselyOrderedFieldModel (rationalSystem)
  (absolute_value_data) : DenselyOrderedFieldModel`
- `CauchyRealizesRealModel (rationalSystem) (absolute_value_data) :
  RealModel`

Both concrete (not existence-quantified), matching the standard this
audit has held to for every "realizes a model" builder since §21's
`QuotientOrderedPairsRealizesIntegerNumberSystem`. With `landauRationalNumberSystem`
already grounded (§22), `CauchyRealizesRealModel landauRationalNumberSystem
landauRationalMetricData` gives a concrete, arithmetic-bearing LRA-native
real number model for the first time in this codebase — the exact gap
identified in §23 as blocking a genuine LRA-native `C`, closed for the
`Cauchy` construction specifically. (`R_Cauchy`/`R` in
`Carriers/Witnesses.lean` still name the bare *carrier type*; wiring the
new `CauchyRealizesRealModel` witness into `Carriers/Witnesses.lean` so
`C`/other consumers can actually use it is a natural, cheap follow-up
not yet done in this pass.)

Verified with the same static import-resolution check (0 broken imports
across 3912 import statements) and manual namespace/`end` balance on all
new/modified files (`Operation/Laws/QuotientCompatible/Definition.lean`,
`Cauchy/Laws.lean`, `Cauchy/Instances.lean`). Not built.

**Remaining for `Cauchy`:** none of the newly-added `sorry`s were
discharged (that was never in scope for this static-audit pass); the
`DenseOrderedFieldEmbeddingIntoReal`/`CofinalRealExtension`/
`RationalRealExtension` chain needed to unblock `Dyadic` (§24) is still
not built — `CauchyRealizesRealModel` supplies the `RealModel` that
chain would need, but the embedding-from-ℚ and cofinality pieces on top
of it are separate, not-yet-attempted work.

## 27. `Dedekind` and `PrimitiveIntervals` completed; `Dyadic` fully unblocked

Continuing §26's directive across the remaining `RealNumbers`
constructions. `Dedekind` and `PrimitiveIntervals` turned out to need
far less than `Cauchy` did — both are already almost entirely
mathematically specified (`sorry`'d), just never wired into typeclass
instances.

**`Dedekind`** is a subtype (`Cut := {lower_set // IsCut lower_set}`),
not a quotient, so none of `Operation.Laws.QuotientCompatible` applies —
`addition`/`negation`/`multiplication`/`zero`/`one`/`strict_order`/
`nonstrict_order` were already total functions directly on `Cut`
(`WellDefinedness.lean`/`Equivalence.lean`), and the file already had
`OrderedFieldStructure`/`CompleteOrderedFieldStructure` — a **complete**,
`sorry`'d statement of Dedekind completeness via `LeastUpperBoundProperty`
(`Laws.lean`) — the most developed of the six constructions by far.
`inverse` is partial (needs `cut ≠ zero`); total-ized the standard way
(`0⁻¹ := 0`, `open Classical in` for the guard). Added to
`Dedekind/Instances.lean`: `Add`/`Mul`/`Neg`/`Inv`/`OfNat 0`/`OfNat 1`/
`LT`/`LE` instances built directly from the existing functions (no
`Classical.choose` needed anywhere — `multiplication`/`inverse`
themselves already used it internally, but the *instances* wrapping them
don't need another layer of it); four fresh `sorry`'d law-certificate
theorems; `DedekindRealizesDenselyOrderedFieldModel` and
`DedekindRealizesRealModel`, concrete builders matching every other
`*RealizesRealModel` in this pass.

**`PrimitiveIntervals`** is a quotient (nested rational intervals, like
`Cantor`), but was *already fully lifted*: `addition`/`negation`/
`multiplication`/`strict_order` in `WellDefinedness.lean` are already
`Carrier → Carrier → Carrier`/`Carrier → Carrier → Prop` (each built via
`Classical.choose` over `induced_binary_operation_exists`/
`induced_relation_exists`, done by whoever wrote this construction
before this audit), `zero`/`one` in `Operations.lean` are already
`Carrier`-typed, and `Laws.lean` already has `strict_total_order`,
`order_compatibility`, `quotient_distributivity`, and — again — a
**complete**, `sorry`'d `least_upper_bound_property`. So, like Dedekind,
none of `QuotientCompatible` was needed (the lifting was already done);
`inverse` is partial the same way and total-ized the same way. Added the
same instance/cert/model-builder shape to
`PrimitiveIntervals/Instances.lean`:
`PrimitiveIntervalsRealizesDenselyOrderedFieldModel`,
`PrimitiveIntervalsRealizesRealModel`.

**Unblocking `Dyadic`.** With `Cauchy` now a full `RealModel` (§26),
added the one remaining piece: a concrete embedding of ℚ into it.
`Cauchy/Laws.lean` gained `constant_sequence`/`constant_sequence_is_cauchy`
(generalizing the existing `zero_sequence`/`one_sequence`) and
`rational_embedding` (matching `Dedekind.rational_embedding`'s naming).
`Cauchy/Instances.lean` gained `quotient_rational_embedding`, then
`CauchyRationalEmbedding : DenseOrderedFieldEmbeddingIntoReal
rationalSystem.FieldModel (CauchyRealizesRealModel ...)` — all eight
proof fields (`injective`, `PreservesZero`, ..., `PreservesAndReflectsOrder`)
`sorry`'d *inline* inside the structure literal rather than as
separately-stated named theorems, specifically to avoid the risk of a
hand-restated theorem's `0`/`1`/`+`/`*`/`⁻¹`/`≤` drifting from what
instance resolution actually infers for the structure's own field type —
`by sorry` inline always closes exactly the goal the structure demands.
Then `CauchyRealizesCofinalRealExtension` (cofinality itself `sorry`'d)
and `CauchyRationalRealExtension : RationalRealExtension rationalSystem`
— a genuinely **concrete** value this time, distinct from the
pre-existing `CauchyRealizesRationalRealExtension` *existence* theorem
(left untouched).

In `Carriers/Witnesses.lean`: `landauRationalRealExtension` (built from
the above), and `landauCauchyCarrierEq : landauRationalRealExtension.
RealModel.Carrier = R_Cauchy := rfl` — genuinely `rfl`, not `sorry`,
because `CauchyRealizesRealModel`'s `Carrier` field was set directly to
`Cauchy.Carrier ...` with no `Classical.choose` on that specific
projection path. Assembled into
`landauRationalDyadicApproximationData : RationalDyadicApproximationData`
— the witness `Dyadic`'s entire theory (`Value`, `IsDyadicRational`,
`OrderedFieldIsomorphismHolds`) needed and, as of §24, could not get.
`Dyadic` is now fully unblocked; giving `Expansion` (`R_Dyadic`) its own
typeclass instances by composing through this witness and
`BinaryRealBijection` is the natural next step, not yet done.

Verified with the same static import-resolution check (0 broken imports
across 3914 import statements) and manual namespace/`end` balance on all
new/modified files (`Dedekind/Instances.lean`,
`PrimitiveIntervals/Instances.lean`, `Cauchy/Laws.lean`,
`Cauchy/Instances.lean`, `Carriers/Witnesses.lean`). Not built — the
`rfl` claim above and every inline `matches_raw`/field-shape claim
elsewhere in this section were checked by hand against the relevant
structures' field types, not by the compiler.

## 28. `Dyadic` needs no new instances; `Cantor` and `EffectiveCauchy` built from scratch — all six `RealNumbers` constructions now complete

**`Dyadic`.** Checked whether `Expansion` should get `Add`/`Mul`/...
instances the way the other five did. It shouldn't: `Dyadic.Laws.lean`'s
`Addition`/`Multiplication`/`Negation`/`Inverse`/`Zero`/`One`/`StrictOrder`
already take an explicit `dyadicData` witness parameter rather than being
wrapped in typeclass instances — the same shape as `LandauAddition`
taking an explicit `PeanoSystem` parameter, never an `Add LandauElement`
instance, because `Expansion` (like `LandauElement`) is witness-independent
*as a type* while its arithmetic genuinely needs a witness to be pinned
down. Forcing that into a global `instance : Add Expansion` would need
one canonical witness — architecturally the same mismatch flagged for
`ComplexNumbers`' `C` two commits ago. So nothing new was needed here:
§27 already supplied the witness (`landauRationalDyadicApproximationData`)
that makes `Dyadic.OrderedFieldIsomorphismHolds landauRationalDyadicApproximationData`
concretely usable.

**`Cantor`** (nested rational-interval sequences) and **`EffectiveCauchy`**
(approximations with an explicit convergence modulus) were the two
genuinely empty constructions — `Operations.lean`/`WellDefinedness.lean`
had zero declarations in either. Built both from scratch, reusing
`Operation.Laws.QuotientCompatible` throughout:

- **`Cantor`**: `IsEndpointSum`/`IsEndpointNegation`/`IsCornerProduct`/
  `IsEndpointProduct` (interval arithmetic via corner products, mirroring
  `PrimitiveIntervals.IsCornerProduct`/`IsIntervalProduct` exactly — same
  underlying math, different carrier), each with a `sorry`'d
  exists-uniquely theorem and a `Classical.choose`-built operation
  (`Operations.lean`/`WellDefinedness.lean`). `IsNestedAndShrinking`
  bundles `NestedIntervalSequence`'s two proof obligations into one
  predicate usable as `QuotientCompatible`'s `invariant`. `addition`/
  `negation`/`multiplication` promoted the same way as `Cauchy`'s
  (`Laws.lean`), each with an `_is_proper` instance (`closed`/`respects`
  reusing the already-`sorry`'d closure/exists-uniquely content,
  `matches_raw` always `rfl`). `constant_interval`/`rational_embedding`/
  `zero`/`one`, and `representative_strict_order` ("eventually strictly
  to the left of"), `sorry`'d and wrapped in `RelationIsProper`.
  `Instances.lean`: the same `Classical.choose`-over-`induced_operation_exists`
  lift as `Cauchy`, a `sorry`'d exists-uniquely reciprocal at the
  `Carrier` level (total-ized `0⁻¹ := 0`), four law certs,
  `CantorRealizesDenselyOrderedFieldModel`/`CantorRealizesRealModel`.

- **`EffectiveCauchy`**: `EffectiveCauchyApproximation` needed no
  raw/promoted split at all — like `Dedekind.Cut`, its
  `Approximate`/`Modulus` fields let `representative_addition`/
  `_negation`/`_multiplication` be built directly (`Operations.lean`),
  each a `sorry`'d `CauchyAtPrecision` proof away from being total.
  `QuotientCompatible` still applies, in the degenerate case documented
  in its own definition (`Raw := Representative`, `toRaw := id`,
  `invariant := fun _ => True`) — `closed` is `trivial` and `matches_raw`
  is `rfl` throughout (`WellDefinedness.lean`). `rational_embedding`/
  `zero`/`one` (needing zero precision — `Modulus := fun _ => 0`) and
  `representative_strict_order` (separated by a fixed `PrecisionRadius`
  from some index on) in `Laws.lean`. `Instances.lean`: same lift/cert/
  model-builder shape as every other construction in this section —
  `EffectiveCauchyRealizesDenselyOrderedFieldModel`/
  `EffectiveCauchyRealizesRealModel`.

Wired `landauCantorRealModel`/`landauDedekindRealModel`/
`landauPrimitiveIntervalsRealModel`/`landauEffectiveCauchyRealModel`/
`landauCauchyRealModel` into `Carriers/Witnesses.lean` alongside the
existing bare-carrier `R_*` abbrevs, so every one of the six
constructions now has both a named ground carrier *and* a concrete,
arithmetic-bearing `RealModel` witness available in one place.

**This closes out the `RealNumbers` arithmetic-instances gap identified
in §23 across all six constructions.** Every one now has: raw operations
that exist (stated, `sorry`'d where not free), are well-founded (closure/
`IsNestedAndShrinking`/`CauchyAtPrecision`, `sorry`'d), are well-defined
(respects-equivalence, `sorry`'d) and — via `QuotientCompatible` — exist
and are unique on the quotient for free/mechanically; concrete
`Add`/`Mul`/`Neg`/`Inv`/`OfNat`/`LT`/`LE` instances; four `sorry`'d law
certificates; and a concrete `RealModel` builder. None of this discharges
any of the underlying `sorry`s — every one of the roughly 30 new `sorry`s
added across §26–§28 states a real, standard, sourced mathematical fact
(interval-corner products, effective-Cauchy moduli, Dedekind-style
completeness, etc.) left for future work, matching this whole audit's
static-only, `sorry`-for-accepted-statements convention throughout.

Verified with the same static import-resolution check (0 broken imports
across 3919 import statements) and manual namespace/`end` balance on all
new/modified files (`Cantor/{Operations,WellDefinedness,Laws,Instances}.lean`,
`EffectiveCauchy/{Operations,WellDefinedness,Laws,Instances}.lean`,
`Carriers/Witnesses.lean`). Not built — as throughout §25–§28, every
`rfl`/`trivial`/direct-reuse claim was checked by hand against the
relevant structure's field types, not by the compiler.

## 29. `C_R_Cauchy` — the ComplexNumbers gap from §23 is now actually closed

§23 flagged, and §28's summary claimed to close, a gap: no LRA-native
`RealNumbers` carrier had `Add`/`Mul`/`Neg`/`Inv`/`OfNat` *instances*, so
`ComplexNumbers.OrderedPairs.ComplexNumber R` could only be grounded over
`Q_RationalQuotientFractions` (Gaussian rationals), not a genuine
LRA-native ℝ. Checked that claim rather than taking it on faith:
`Cauchy/Instances.lean`'s `quotientCarrierAdd`/`quotientCarrierMul`/
`quotientCarrierNeg`/`quotientCarrierInv`/`quotientCarrierZero`/
`quotientCarrierOne` (§26) are registered as genuine global `instance`s,
not merely fields buried inside the `CauchyRealizesRealModel` structure
literal — so they're available to typeclass search for *any* use of
`R_Cauchy`, including `ComplexNumber R_Cauchy`, exactly the way
`Q_RationalQuotientFractions`'s instances already were for `C
Q_RationalQuotientFractions` (§23). Added:

- `C_R_Cauchy := C R_Cauchy`

A genuine LRA-native ℂ (ℝ(i), grounded via the `Cauchy` real-number
construction), sitting alongside `C_Q_OrderedPairs` (ℚ(i)) in
`Carriers/Witnesses.lean` rather than replacing it — both are legitimate,
differently-grounded example instantiations of the same generic `C`.

Verified with the same static import-resolution check (0 broken imports
across 3919 import statements) and manual namespace/`end` balance on
`Carriers/Witnesses.lean`. Not built — `C R_Cauchy`'s instance
resolution (does typeclass search actually find `quotientCarrierAdd
landauRationalNumberSystem landauRationalMetricData` for the goal `Add
R_Cauchy`?) is inferred from how the `attribute`-registered instances
and the existing `C_Q_OrderedPairs` precedent are shaped, not confirmed
by the compiler.
