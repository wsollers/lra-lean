# LRA Repository-Wide Consistency / Semantic P0 Sweep

## Scope

Final targeted audit requested after the subject-by-subject mathematical review.

This pass is **not** a new deep review of research-phase topology, measure theory, functional analysis, abstract algebra extensions, or spaces. Those areas are intentionally left in research status. They appear here only when a repository-wide pattern exposes a clear semantic P0, stale status declaration, or cross-cutting architecture defect.

Primary search targets:

- literal semantic placeholders (`:= 0`, `:= True`, etc.);
- tautologies / self-equivalences / self-equalities standing in for real laws;
- theorem names stronger than their statements (`unique`, `isomorphic`, `converges`, etc.);
- detached `...Realizes...Model` declarations;
- stale comments saying modules are inactive/not imported when aggregate roots import them;
- duplicate semantic owners;
- weaknesses in the existing proof-readiness checker.

Project rule: `sorry` theorem proofs are neutral. A fake definition, vacuous theorem statement, or theorem whose assumptions do not imply its conclusion is not neutral.

---

# Executive verdict

The repository's strongest foundational pattern remains sound:

```text
carrier / machine
-> explicit laws
-> canonical certificates
-> derived bundles / models.
```

The largest repository-wide risk is **semantic placeholder leakage**: draft declarations that look like real definitions/theorems to downstream code because they have ordinary public names and are imported by aggregate modules.

This is substantially more dangerous than `sorry` because a `sorry` says “this theorem is not proved yet,” whereas

```text
def ImportantQuantity := 0
```

quietly gives every downstream theorem a false or degenerate meaning.

The final sweep confirms four systematic categories that should be repaired before the repository is described as proof-ready:

1. semantic stubs / vacuous statements;
2. detached or under-specified realization/universal-property declarations;
3. duplicate concept ownership;
4. stale import/status documentation that misidentifies active code as isolated draft code.

---

# P0 category 1 — literal semantic stubs

The repository-wide search for `:= 0` returns both legitimate zero definitions and semantically fake placeholders. The dangerous cases are definitions whose mathematical meaning is nonconstant but whose implementation is literally zero.

Already confirmed examples include:

```text
OscillationOnSet := 0
OscillationAtPoint := 0
JumpOf := 0
LimsupAt := 0
LiminfAt := 0
MeshOf := 0
PartitionMesh := 0
LowerDarbouxSum := 0
UpperDarbouxSum := 0
PointOscillation := 0
TotalVariation := 0
FunctionSupremumOnSet := 0
FunctionInfimumOnSet := 0
PointwiseSupremumFamily := 0
PointwiseInfimumFamily := 0.
```

These were identified in the earlier subject reviews and are reconfirmed as a repository-wide pattern.

## Exact active example: `MonotoneFunctions.lean`

The file defines

```text
JumpOf ... := 0
LimsupAt ... := 0
LiminfAt ... := 0
```

and subsequently states theorems such as

```text
MonotoneDiscontinuitiesAreJumps : JumpOf f I c > 0.
```

With `JumpOf = 0`, this conclusion is impossible.

This is the clearest illustration of why literal semantic placeholders are worse than unfinished theorem proofs.

**Severity: P0.**

## Policy recommendation

If the mathematical object is not yet defined, prefer one of:

- do not publish the declaration yet;
- define a predicate/specification with existence theorem pending;
- isolate it in a clearly non-imported scaffold namespace;
- use a deliberately named placeholder type/namespace that downstream theorem files cannot mistake for the real object.

Do **not** use a mathematically meaningful public name with a dummy constant implementation.

---

# P0 category 2 — vacuous / disconnected theorem statements

The sweep found theorem statements where the formal proposition does not use the central mathematical data named by the theorem.

## Continued fractions

`infinite_continued_fraction_converges` currently has the shape

```text
exists value,
  forall neighborhood,
    neighborhood value ->
      exists index, neighborhood value.
```

The continued fraction does not occur in the conclusion. Neither does any sequence of convergents. The result follows from the hypothesis `neighborhood value` after choosing any index.

This is a formal theorem about nothing resembling continued-fraction convergence.

Similarly, the current finite-value relation does not encode successive reciprocal evaluation, and the current Lagrange theorem does not connect its real value to its fraction and allows the zero polynomial.

See `NumberSystemsFinalReview.md` for the full cluster.

**Severity: P0.**

## Primitive-interval construction summary

Previously confirmed examples:

```text
equivalent first second <-> equivalent first second
```

inside the final construction proposition, and a so-called canonical comparison isomorphism that is only the identity self-map on one carrier.

These are tautological certification clauses, not construction theorems.

**Severity: P0.**

## Computable-real arithmetic closure

Previously confirmed closure statement selects arbitrary operations and asks only for reflexive equivalence of each result with itself. It therefore certifies no arithmetic behavior.

**Severity: P0.**

---

# P0 category 3 — detached `Realizes...Model` declarations

Repository search confirms the systematic pattern across real constructions:

```text
CauchyRealizesRealModel
CantorRealizesRealModel
DedekindRealizesRealModel
PrimitiveIntervalsRealizesRealModel
DyadicRealizesRealModel
ComputableRealizesRealModel
```

and analogous declarations for quotient-pair integers and quotient-fraction rationals.

The defining defect is the same:

```text
ConstructionRealizesModel (...) : RealModel
```

rather than a result whose carrier is definitionally/propositionally the construction carrier.

For example:

```text
QuotientOrderedPairsRealizesIntegerModel (...) : IntegerModel
RationalQuotientFractionsRealizesRationalModel (...) : RationalModel.
```

The comments say `Carrier data` realizes the model interface, but the return type does not encode that claim.

A proof could return an unrelated model and still satisfy the declaration type.

**Severity: P0 specification/coupling defect when treated as a realization theorem.**

## Preferred pattern

After installing the actual operations/certificates on the constructed carrier:

```text
IntegerModel.ofCarrier ConstructedIntegerCarrier
RationalModel.ofCarrier ConstructedRationalCarrier
RealModel.ofCarrier ConstructedRealCarrier.
```

Then, where adjacent number-system semantics matter, package the corresponding

```text
RationalExtension
RealExtension
```

with the actual embedding.

---

# P0/P1 category 4 — theorem names stronger than statements

Several declarations advertise categorical/universal conclusions while formalizing only existence of an embedding.

## Universal properties

Current structures include:

```text
IntegerUniversalProperty.InitialForDiscreteOrderedRings
```

but only require existence of a structure-preserving map. Initiality requires uniqueness.

Likewise `RationalUniversalProperty.FractionFieldProperty` requires an extension map but not uniqueness of the extension.

Most visibly:

```text
CompleteOrderedFieldCharacterization.UniqueUpToOrderedFieldIsomorphism
```

requires only

```text
exists comparison, EmbeddingPreservesOrderedField ... comparison.
```

There is no surjectivity and no uniqueness.

Thus the field name says “unique up to isomorphism” while the proposition says only “embeds into every other model.”

**Severity: P0 name/statement mismatch if consumed as the named universal property.**

## General rule

Search/lint names containing

```text
Unique
Isomorphism
Equivalent
Converges
Complete
Realizes
```

and verify the conclusion contains the structural ingredients implied by the name:

- `Unique`: uniqueness quantifier;
- `Isomorphism`: bijectivity/two-sided inverse + preservation;
- `Converges`: an actual sequence/net/filter relation to the claimed limit;
- `Realizes`: carrier/operations tied to the constructed object.

---

# P0 category 5 — under-specified source contracts

A recurring repository pattern is not a placeholder implementation but a record whose field names suggest mathematical semantics that its laws never require.

Major examples already established:

- WholeNumbers accepts arbitrary `strictOrder` then proves ordered-semiring behavior;
- quotient ordered pairs lack enough order reflection/translation laws;
- rational fractions accept denominator carriers without adequacy/cofinality;
- `gcd` and `absolute_numerator` are just arbitrary functions;
- Cauchy real construction accepts an arbitrary weak `absolute_value` not tied to ordered-field absolute value;
- Dyadic approximation bundles named functions like `power_of_two` without the laws those names imply;
- computable-real carrier stores arbitrary Lean functions rather than an encoded computability certificate.

The general failure mode is:

```text
semantic name
!=
formal law contract.
```

Lean reasons from types and fields, not from identifiers.

**Severity: P0 wherever later theorems use the informal meaning rather than the actual contract.**

---

# P0 category 6 — backend-relative strength hidden by universal theorem names

The Peano and IntegerStructure reviews exposed a cross-cutting version of the same issue.

Induction quantifies only over the selected `SetObject` or Henkin `SecondOrderDomain`, yet generic categoricity/recursion claims are stated as though full predicate induction were available.

This pattern should be searched/linted conceptually whenever a theorem quantifies over a representation backend:

```text
“all subsets” theorem
but only represented/admissible subsets are quantified.
```

The second-order layer already has the right distinction (`HenkinModel`); the Peano/Integer theory names need to respect it.

---

# Stale status comments — active modules called “not imported”

The repository-wide search for

```text
Draft module; not yet imported
```

returns many files that are now explicitly imported by aggregate modules.

Confirmed examples:

## Continuity

`LRA/Analysis/Continuity/MonotoneFunctions.lean` begins:

```text
Draft module; not yet imported by the active Volume III root.
```

but `LRA/Analysis/Continuity.lean` imports

```text
LRA.Analysis.Continuity.MonotoneFunctions.
```

The same continuity aggregate imports other files carrying similar historical draft headers.

## Functions

`LRA/Analysis/Functions/AlgebraOfFunctions.lean` says it is

```text
not yet imported by the active Volume III root
```

and even claims it can be freely discarded without touching the working project.

But `LRA/Analysis/Functions.lean` imports it directly.

## Sequences

The search finds the same header pattern in many sequence modules (`Monotonicity`, `Tails`, `Limits`, `Cauchy`, `Divergence`, `Subsequences`, `LiminfLimsup`, `ClusterValues`, etc.), while `LRA/Analysis/Sequences.lean` imports those modules explicitly.

### Why this matters

This is more than cosmetic documentation drift. It obscures which semantic placeholders are active dependencies. A developer reading `JumpOf := 0` beneath “not imported” may reasonably defer it, while it is actually reachable through the public aggregate import.

**Severity: P1 repository-status defect; raises P0 exposure risk for semantic stubs.**

### Repair

Automate a check:

- parse aggregate imports / reachable module graph;
- fail or warn when a reachable module contains phrases such as `not imported`, `isolated draft`, or `can be freely discarded`.

---

# Duplicate concept ownership

The final sweep confirms multiple parallel semantic owners remain.

## Function properties

Canonical project function theory already owns generic properties under `LRA.Function`.

`LRA.Analysis.Functions.AlgebraOfFunctions` separately defines:

```text
IsInjectiveOn
IsSurjectiveOn
IsBijectiveOn
IsInverseFunctionOf
```

explicitly described as project-parallel to Mathlib's notions.

This is now imported by the active `LRA.Analysis.Functions` aggregate despite its header still calling it disposable draft code.

Recommended ownership:

```text
LRA.Function
```

owns generic function concepts;

```text
LRA.Analysis.Functions
```

uses/bridges those concepts for real-analysis statements.

## Cardinality/countability

Search confirms parallel countability/finiteness concepts under both `LRA.Carrier` and `LRA.Cardinality`, plus older number-system-local countability notions.

The canonical Carrier/Cardinality review already identified semantic divergence in the Volume II countability notion.

Choose one canonical semantic owner and make all other layers adapters or theorem aliases.

## Model isomorphism

Number-system comparison code defines a local real-model isomorphism while `LRA.Logic.FirstOrder.ModelIsomorphism` already owns the general model-theoretic notion.

Use the logic definition for model theory; provide an algebra-facing equivalence bridge if needed.

## Topology/functions/analysis duplicate owners

Earlier audits found multiple topology and real-function owners. Per the user's instruction, those research-phase areas are not expanded further here. The consistency recommendation still stands: do not allow parallel definitions to become independently authoritative without bridge/equivalence theorems.

**Severity: generally P1 architecture; P0 when semantically different duplicates are silently treated as interchangeable.**

---

# Existing proof-readiness checker is too syntactic

`scripts/check-proof-readiness.py` is a good start and explicitly states the correct philosophy: reject placeholder mathematics, not theorem `sorry`s.

But its current checks cover only:

1. theorem conclusion literally `True`;
2. definition literally `:= True`;
3. definitions/structures manufactured directly with `:= by sorry`.

It does **not** catch the major semantic P0 classes found in this audit.

## Recommended checker extensions

### 1. Suspicious numeric dummy definitions

Warn on literal implementations such as

```text
:= 0
:= 1
:= []
```

when the declaration name contains semantic indicators such as

```text
Supremum Infimum Limsup Liminf Oscillation Mesh Variation Jump Measure Integral Distance Norm
```

This must be allowlisted because legitimate `zero` definitions exist.

### 2. Self-equivalence / self-equality detection

Flag proposition bodies normalized to patterns like

```text
P <-> P
x = x
f = f
```

when they occur as fields of a structure or conjuncts of a named mathematical summary theorem.

### 3. Unused central parameters

For theorem names containing `Converges`, warn when the named sequence/fraction/net parameter does not appear in the conclusion.

Likewise for `Realizes`: warn when the constructed carrier/data parameter does not appear in the result type except as an unused input to the declaration.

This would have caught the continued-fraction convergence theorem and detached realization wrappers.

### 4. Name/shape heuristics

- `Unique` -> require a uniqueness clause or known unique-existence structure;
- `Isomorphism` -> require a known isomorphism/equivalence type or two-sided inverse/bijective field;
- `Realizes` -> require carrier equality/indexing or a dependent model type;
- `Equivalent`/`iff` summary clauses -> reject syntactically identical sides unless declaration explicitly documents reflexivity.

### 5. Active-module stale-header check

Build the import graph and warn if a reachable module's opening comments contain

```text
not yet imported
inactive
isolated draft
freely ... discarded
```

### 6. Detached model-lint

For declarations matching

```text
*RealizesIntegerModel
*RealizesRationalModel
*RealizesRealModel
```

warn when the return type is merely the bare model type rather than an indexed/dependent realization tying carrier and operations to the input construction.

---

# Existing repository audits do not replace semantic checking

`CLEANUP.md` explicitly describes itself as a **structural count**, not a semantic audit.

`ProofsToDo.md` inventories theorem proof completion but cannot detect a theorem whose statement is vacuous or a definition whose implementation is semantically fake.

This is why the current audit found serious defects even in files that build or have complete theorem inventories.

Recommended project status dimensions should remain separate:

```text
BUILD       -- elaborates/compiles
PROOF       -- no sorryAx where required
SEMANTICS   -- definitions/statements reviewed for intended mathematics
COUPLING    -- construction/model wrappers actually refer to intended carrier
OWNERSHIP   -- no unbridged competing canonical definitions
```

A module should be called proof-ready only when all applicable dimensions are green.

---

# Repository-wide P0 queue after final sweep

This list groups the major confirmed issues by root cause rather than repeating every theorem from the subject reviews.

## A. False theorem statements / insufficient hypotheses

- reciprocal-completeness equivalence for arbitrary Archimedean ordered field;
- arbitrary-uniformity order-completeness/Cauchy-completeness equivalence;
- injective-image arbitrary empty-index intersection;
- generated sigma algebra without admissibility/nonvacuity;
- generic Peano categoricity and iterator completeness over arbitrary set backends;
- generic IntegerStructure categoricity over arbitrary set backends;
- Takeuti quantifier rules without fresh bound variable;
- rational/real construction theorems whose source contracts are too weak;
- continued-fraction Lagrange/convergence statements.

## B. Fake semantic definitions

- continuity oscillation/jump/limsup/liminf zero stubs;
- integration partition mesh / Darboux sums / point oscillation / total variation zero stubs;
- function supremum/infimum zero stubs;
- computable-real effective-Cauchy and equivalence definitions that do not encode their names.

## C. Detached certification

- `...RealizesIntegerModel` quotient-pair wrapper;
- `...RealizesRationalModel` quotient-fraction wrapper;
- six `...RealizesRealModel` construction wrappers;
- comparison `real_model` witnesses selected independently of the named concrete constructions;
- configurable construction selector whose return type does not depend on selected construction.

## D. Tautological/empty certification

- PrimitiveIntervals final equivalence self-iff;
- PrimitiveIntervals field-structure self-equality conjunct;
- Computable arithmetic closure reflexive equivalence clauses;
- legacy comparison operation-respect claims with arbitrary operations/setoids.

## E. Terminology/strength mismatches with P0 consequences

- Henkin Peano/Integer theories called “full second-order”;
- ordinary `ModelEmbedding` docs suggesting all-formula preservation;
- `UniqueUpToOrderedFieldIsomorphism` only supplies embedding;
- universal properties omit uniqueness;
- `PeanoSystem.one` used as zero by concrete zero-based models.

---

# Areas intentionally not expanded in this final pass

Per project direction, the following remain research-phase and were **not** subjected to a new exhaustive topical audit here:

- topology beyond previously recorded core findings;
- measure construction/integration beyond clear semantic stubs already identified;
- linear/functional analysis;
- advanced abstract algebra;
- normed/metric/vector/function spaces;
- other advanced analysis modules.

Their previously recorded P0s remain valid findings, but no new completeness judgment is being made for those research areas in this final sweep.

---

# Final consistency recommendations

## Immediate

1. extend `check-proof-readiness.py` to catch semantic-stub patterns;
2. remove/replace literal fake definitions before proving downstream theorems;
3. repair detached `Realizes...` declarations to be carrier-coupled;
4. correct universal-property/isomorphism theorem types so names match statements;
5. repair continued-fraction definitions/statements before any proof effort;
6. remove stale “not imported/inactive draft” headers from modules reachable through public aggregates.

## Architectural

7. declare canonical owners for generic Function, Cardinality/Countability, model isomorphism, topology, and other duplicated concepts;
8. require explicit bridge/equivalence theorems for secondary pedagogical presentations;
9. distinguish BUILD / PROOF / SEMANTICS / COUPLING / OWNERSHIP status in generated reports;
10. prefer `sorry` in a real theorem obligation over a fake total implementation of an unfinished mathematical object.

---

# Final verdict of this consistency pass

The repository has a strong underlying architecture in its best modules, but **build success and theorem inventory completeness currently overstate mathematical readiness** because semantic placeholders and detached specifications can elaborate successfully.

The highest-value cleanup is therefore not more theorem proving. It is to make every public declaration mean what its name says before proofs are filled in.

Once the P0 semantic/coupling defects listed in the review files are repaired, the foundational spine (sets, relations, order, functions, algebraic certificates, core logic, and the sound number-system constructions) is well positioned for sustained proving and note-taking while the advanced analysis/spaces material continues in research phase.

---

# Choice audit

No new genuine family-wise Axiom-of-Choice dependency was identified in this repository-wide consistency sweep.

The previously confirmed non-foundational use remains the countable-sigma/countable-fibers result requiring family-wise witness choice. ZFC/NBG/TG choice axioms are deliberate foundational Choice. Individual `Classical.choose` witness extraction throughout construction code is not being counted as AC.
