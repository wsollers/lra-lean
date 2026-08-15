# Prompt: Audit and Redesign the LRA Namespace

You are reviewing the namespace architecture of the `lra-lean` repository.
The repository has grown through mathematically organized modules, pilot work,
volume-specific development, and local compatibility vocabulary. This has
created names whose fully qualified forms may be repetitive or harder to use
than the underlying mathematics warrants. For example, the module
`LRA.Carrier.Carrier` declares the abbreviation `LRA.Carrier.Carrier`, even
though that declaration is definitionally just `Type u`.

Perform an evidence-based audit of the complete project-owned namespace and
propose a simpler, more fluent public naming architecture. Preserve meaningful
mathematical grouping and pedagogical order while removing accidental nesting,
duplicated nouns, inconsistent namespace depth, and distinctions caused only
by the current filesystem layout.

This is an analysis and design task. Do not rename declarations, move Lean
files, add compatibility aliases, or otherwise edit Lean source. Write the
review and proposed migration for approval before implementation begins.

## Primary objectives

1. Gather every project-owned fully qualified declaration name beginning with
   `LRA` from the compiled Lean environment.
2. Inventory the namespace prefixes containing those declarations.
3. Inventory the Lean module tree separately from the declaration namespace
   tree.
4. Identify project-owned declarations that escape the `LRA` namespace and
   assess whether that leakage is deliberate.
5. Explain where module paths, namespace paths, and declaration names agree
   and where they differ.
6. Find redundant, overly deep, ambiguous, inconsistent, or misleading names.
7. Propose a compact semantic namespace hierarchy with exact old-name to
   proposed-name mappings.
8. Demonstrate that the proposed API remains logically grouped, discoverable,
   compatible with Mathlib usage, and suitable for later LRA volumes.
9. Give a dependency-aware migration plan, but do not perform the migration.

## Required preparation

1. Read repository-root `AGENTS.md`, resolve governance for this exact task,
   and load the returned eager instructions.
2. Record the reviewed Git revision, branch, and worktree status. Preserve all
   unrelated files and generated artifacts.
3. Read the repository architecture governing modules, topics, concepts, and
   semantic file roles.
4. Inspect `lakefile.lean`, `LRA.lean`, all aggregate modules, and every Lean
   source file below `LRA/`.
5. Inspect the checked-out Mathlib source for the naming conventions of the
   mathematical concepts with which LRA is intended to interoperate.
6. Treat existing inventories, including `lean-decl-inventory.txt`, as prior
   artifacts that may help with comparison, not as authoritative current
   state.

## Do not conflate three different trees

Build and analyze these independently.

### 1. Module tree

A module is determined by an importable source path. For example:

```text
LRA/Carrier/Carrier.lean  ->  LRA.Carrier.Carrier
```

Record every project module, its aggregate owner, imports, and whether it is a
definition module, semantic companion, topic router, volume router, pilot, or
other infrastructure.

### 2. Namespace tree

Record every explicit namespace opened by project source and every namespace
prefix implied by declarations. A namespace is an organizational prefix; it
is not automatically the same thing as a module or directory.

### 3. Declaration tree

Gather declarations from the compiled Lean environment rather than relying
only on text search. Source search may supplement the environment inventory,
but it must not be the sole source because structures, classes, inductives,
instances, and commands can generate declarations.

For each project-owned declaration, record at least:

- fully qualified name;
- short name;
- immediate namespace;
- declaration kind (`def`, `abbrev`, `theorem`, `axiom`, `structure`, `class`,
  `inductive`, instance, projection, recursor, notation-related declaration,
  or other generated declaration);
- complete type or signature;
- universe parameters;
- defining module and source file when recoverable;
- whether it is authored or compiler-generated;
- whether it is public API, an implementation detail, a pilot declaration, or
  uncertain;
- primary aggregate through which it is exported;
- known references from other project modules; and
- collisions or close analogues in Lean core, Std, and the pinned Mathlib.

Generated projections, constructors, recursors, and instance declarations
must be inventoried, but classify them separately so they do not inflate the
count of authored mathematical concepts.

## Required inventory artifacts

Produce both:

1. `namespace-review.md` at the repository root: the human architectural
   review and proposal.
2. `namespace-inventory.tsv` at the repository root: one declaration per row,
   with stable columns suitable for sorting and diffing. At minimum use:

```text
fq_name	short_name	namespace	kind	module	source_file	authored_or_generated	api_status	type_summary	proposed_fq_name	action
```

Sort the inventory deterministically by fully qualified name. Escape tabs and
newlines in signature summaries. State exactly how the inventory was produced
so it can be regenerated after migration.

Also include compact summary tables in the Markdown report. Do not paste the
entire machine inventory into the report.

## Audit questions

### Repetition and accidental nesting

Identify names that repeat the same concept at adjacent levels, such as:

```text
LRA.Carrier.Carrier
LRA.<Topic>.<Concept>.<Concept>
LRA.<Volume>.<Topic>.<Topic>.<Declaration>
```

Do not assume repetition is automatically wrong. Decide whether each segment
communicates a real distinction or merely mirrors a directory name.

### Curricular location versus semantic ownership

The repository is organized into learning volumes, but a declaration's
mathematical identity may not be volume-specific. Explicitly compare at least
these possible policies:

1. public names remain volume-qualified, such as
   `LRA.VolumeI.Order.LinearOrder`;
2. source modules remain volume-organized while stable public declarations use
   semantic names such as `LRA.Order.LinearOrder`; or
3. a justified hybrid in which only genuinely volume-specific material keeps
   a volume prefix.

Do not choose a policy merely because it shortens names. Evaluate ownership,
future volumes, collisions, import discipline, discoverability, and migration
cost.

### Folder organization versus public fluency

Concept-family paths such as

```text
Order/<Topic>/<Concept>/Definition.lean
Order/<Topic>/<Concept>/Theorems.lean
```

are useful for repository navigation. Determine whether every directory level
also belongs in the public declaration name. A well-organized filesystem and
a fluent public API need not have identical depth.

Compare how definitions, concept-specific theorem names, examples, failure
modes, relationships, and interoperability declarations should be exposed.
Recommend when declarations should live directly in a semantic namespace and
when a nested concept namespace prevents genuine ambiguity.

### Mathematical synonyms and compatibility aliases

Distinguish three cases:

1. one mathematical concept with two standard names, where a documented
   `abbrev` such as `TotalOrder := LinearOrder` may be legitimate permanent
   vocabulary;
2. a temporary compatibility alias created only because a declaration moved;
3. two related but non-equivalent concepts, such as a linear order on a whole
   carrier and a chain predicate on a subset.

Do not recommend permanent aliases merely to avoid updating this small
project. Any proposed synonym must be mathematically standard and must not
collapse distinct concepts.

### Structures, fields, and local binders

Audit recurring names such as `Carrier`, `relation`, `Order`, and law fields
at all levels. Distinguish harmless local binder names and structure
projections from globally awkward declarations. Check whether a structure
name followed by a projection, for example `Poset.Carrier`, is normal fluent
usage or signals a duplicated namespace.

### Root namespace hygiene

List the immediate children of `LRA` and classify each as a semantic domain,
curricular volume, infrastructure concern, pilot area, compatibility layer, or
accidental singleton. Identify project declarations unintentionally created
at `_root_` or in namespaces owned by Lean or Mathlib.

Recommend a small, stable set of root semantic categories. Avoid both a flat
dump of unrelated declarations and a hierarchy whose only purpose is to echo
the filesystem.

### Mathlib interoperability

Check both syntactic and semantic compatibility:

- LRA carriers are definitionally ordinary Lean types where intended;
- LRA declarations do not unnecessarily shadow common Mathlib declarations;
- standard Mathlib structures and typeclasses remain usable without adapters
  when definitions are already definitionally compatible;
- genuine representation differences have explicit, well-owned adapters;
- opening an LRA namespace does not create unreasonable ambiguity with
  `Set`, `Relation`, `LinearOrder`, `PartialOrder`, `WellFounded`, `Supremum`,
  or other common vocabulary; and
- the proposal does not introduce instance loops or competing global
  instances.

For every collision, show realistic qualified and `open`-namespace usage. Do
not reject a mathematically canonical name solely because Mathlib uses the
same short name; determine whether qualification or namespace ownership makes
the use clear.

## Design principles for the proposal

Apply these principles explicitly and identify any necessary exception:

1. **One concept, one canonical owner.**
2. **Say each noun once unless repetition expresses a real distinction.**
3. **Prefer the shortest name that remains unambiguous in realistic use.**
4. **Keep mathematical domains coherent rather than merely shallow.**
5. **Separate curricular source placement from semantic API ownership when
   that improves stability.**
6. **Do not encode file roles such as `Definition` or `Theorems` into public
   declaration names.**
7. **Do not create compatibility debt by default.**
8. **Preserve genuine mathematical synonyms only when their equivalence is
   definitional and pedagogically useful.**
9. **Keep pilots and experimental APIs visibly non-production.**
10. **Make common signatures pleasant to read both fully qualified and under
    narrowly opened namespaces.**

## Required proposal format

For every authored public declaration, assign one action:

- `KEEP` — current fully qualified name is already appropriate;
- `MOVE` — same short declaration name under a different namespace;
- `RENAME` — declaration's short name should change;
- `MERGE` — duplicate declarations should have one canonical owner;
- `REMOVE` — declaration adds no mathematical or API value;
- `SYNONYM` — retain a mathematically standard definitional abbreviation;
- `INTERNALIZE` — keep the declaration but remove it from the intended public
  surface; or
- `DEFER` — insufficient evidence, with the missing decision named.

Every action other than `KEEP` must include:

- current fully qualified name;
- proposed fully qualified name, if any;
- declaration kind and source file;
- reason grounded in fluency, ownership, mathematics, or interoperability;
- known consumers;
- collision analysis;
- whether a compatibility alias is mathematically justified;
- required import and aggregate updates; and
- a small before/after Lean usage example.

Provide a complete deterministic mapping table, not only representative
examples. Group large families when one rule applies uniformly, but make the
result mechanically expandable to one row per declaration.

## Alternative architectures

Present at least two coherent namespace architectures before recommending
one. For each alternative show:

- a namespace tree to at least three meaningful levels;
- representative fully qualified names from carrier vocabulary, relations,
  sets, order theory, algebra, and later volumes;
- common Lean usage with and without `open`;
- advantages;
- costs and collision risks;
- effect on module paths and aggregate imports; and
- expected migration size.

The recommended architecture must explain why it is better than the strongest
alternative, not merely why it is shorter than the current tree.

## Migration plan

Give an implementation sequence that keeps the repository buildable in small
commits. Include:

1. canonical namespace policy and naming glossary;
2. inventory baseline and regression tooling;
3. foundational carrier/relation/set names;
4. Volume I mathematical domains;
5. downstream volume consumers;
6. pilots and experimental modules;
7. aggregate imports and documentation;
8. removal of obsolete aliases or namespaces; and
9. final stale-name and namespace-leak checks.

Prefer direct repository-wide updates over long-lived forwarding modules. If
a temporary alias is truly necessary, give an explicit removal condition and
deadline. Do not implement any step during this review.

## Verification requirements

Run and report:

- the governance-required repository check;
- the meaningful explicit Lean build target if the default target does not
  compile the project;
- a stale-reference search for every proposed removed namespace;
- a duplicate-short-name and collision analysis;
- a check for project-owned declarations outside the intended namespace;
- a comparison between source-discovered and environment-discovered
  declarations; and
- deterministic regeneration of `namespace-inventory.tsv`.

Compilation establishes that names resolve, not that the architecture is
good. Conversely, expected `sorry` warnings are not namespace findings.

## Evaluation rubric

Score the current namespace and each proposed architecture independently.

| Category | Points | Full-credit standard |
|---|---:|---|
| Inventory completeness | 20 | Every project-owned declaration and namespace is accounted for, with authored and generated names distinguished. |
| Mathematical ownership | 20 | Every public concept has one correct semantic owner; non-equivalent concepts remain distinct. |
| Fluency and compactness | 20 | Common names are concise, readable, and free from accidental repeated segments without becoming ambiguous. |
| Organization and discoverability | 15 | Related concepts remain coherently grouped and module aggregates make them easy to find. |
| Mathlib and Lean interoperability | 15 | Names coexist predictably with core and Mathlib vocabulary, and adapters exist only for real representation differences. |
| Migration quality | 10 | The old-to-new map is complete, dependency-aware, verifiable, and avoids permanent compatibility debt. |
| **Total** | **100** | |

Apply these caps:

- An incomplete fully qualified declaration inventory caps the score at 59.
- Any proposal that merges mathematically distinct concepts caps mathematical
  ownership at 5/20.
- A proposal without a complete old-to-new mapping caps migration quality at
  3/10.
- A proposal derived only from file paths, without compiled-environment
  inspection, caps inventory completeness at 8/20.
- A proposal that treats volume placement and semantic ownership as the same
  question without analysis caps organization at 8/15.

## Required `namespace-review.md` structure

1. **Review metadata** — revision, branch, worktree, tools, and scope.
2. **Executive verdict** — the central namespace problem and recommended
   policy in concise terms.
3. **Inventory methodology** — how modules, namespaces, and declarations were
   gathered and reconciled.
4. **Current namespace map** — root children, major subtrees, counts, and API
   classifications.
5. **Fully qualified name findings** — repetition, excessive depth,
   inconsistency, leakage, collisions, and strong existing names.
6. **Module-versus-namespace assessment** — where alignment helps and where
   it harms fluency.
7. **Mathlib interoperability assessment** — definitional compatibility,
   collisions, adapters, and realistic usage.
8. **Alternative architectures** — at least two complete candidates.
9. **Recommended namespace architecture** — tree, policy, and representative
   usage.
10. **Complete rename and ownership map** — exact deterministic actions.
11. **Migration plan** — dependency-aware implementation sequence and alias
    removal policy.
12. **Scorecards** — current tree and each proposed alternative.
13. **Acceptance criteria** — objective conditions for approving and
    completing the migration.
14. **Verification report** — commands, outcomes, warnings, and limitations.

## Reviewer conduct

- Be exact about the difference between a module, namespace, declaration, and
  structure projection.
- Use the compiled Lean environment as the authority for declaration names.
- Do not equate shorter with better without testing realistic use.
- Do not preserve accidental hierarchy merely because it currently compiles.
- Do not flatten mathematical domains into an unstructured `LRA` namespace.
- Do not create aliases merely to avoid updating consumers.
- Do not merge standard synonyms with related but non-equivalent concepts.
- Cite exact fully qualified names and source files for every finding.
- Mark generated, pilot, internal, and uncertain declarations explicitly.
- Do not edit Lean source during the audit.
- If governance, source ownership, or inventory completeness cannot be
  established, report the blocker rather than inventing a namespace policy.
