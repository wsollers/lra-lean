# LRA Concrete Set Foundations Review

## Scope

Maintained review of the concrete foundational set-theory realizations (`ZFC`, `NBG`, and `TG`) and the ordered-pair/relation-set layer that connects ordinary set theory to the generic relation/function chapters.

Special emphasis is placed on the project's requested Choice audit:

- distinguish genuine mathematical Choice principles from ordinary witness extraction;
- document genuine choice use outside the ZFC-specific development;
- do not penalize axioms merely for being axioms.

---

# Review 1 — ordered pairs, Cartesian products, and relations as sets

## Files reviewed

- `LRA/Set/Interface/Pairing.lean`
- `LRA/Set/Interface/CartesianProduct.lean`
- `LRA/Set/Interface/CartesianProductLaws.lean`
- `LRA/Set/Interface/RelationSets.lean`

## Ordered-pair abstraction

The pairing interface supports two mathematically different representations behind one API:

- one-sorted set-theory backends can use Kuratowski pairs;
- typed backends use ordinary product pairs.

The public law is exactly the important property:

```text
⟨a,b⟩ = ⟨c,d⟩ ↔ a = c ∧ b = d.
```

This is the correct abstraction boundary. Ordinary relation/function theory should not depend on the internal membership structure of an ordered pair.

**Verdict: PASS.**

## Cartesian product

`CartesianProductOf` is deliberately ambient-relative: it separates from an already available set of pairs rather than pretending a ZF universe contains a free-floating set of all pairs.

Its defining theorem correctly says that `a` is related to `b` exactly when:

1. the ordered pair is available in the ambient pair set;
2. `a` belongs to the left factor;
3. `b` belongs to the right factor.

The algebraic product laws reviewed — monotonicity and distributivity over union/intersection/difference — are correct relative to the fixed ambient pair set.

The source also correctly avoids the false identity

```text
(A×B) ∪ (C×D) = (A∪C) × (B∪D)
```

in general, since the right side contains cross terms.

**Verdict: PASS.**

## Relations/functions as sets

`Relates relation input output` is defined by membership of the ordered pair.

`IsPairwise` says every relation-set member is an ordered pair.

`IsSingleValued` gives the functional/vertical-line property.

`IsFunctionalSet` combines pairwise-ness and single-valuedness; it does not require a prescribed external domain to be total, which is appropriate for the standard set-theoretic notion of a function as a functional relation with its own domain.

`IsTotalOn` separately expresses totality on a chosen domain.

The layer also already defines generic domain, range, image, preimage, fiber, inverse relation, restriction, and further relation constructions downstream.

This is important for later measurable-function theory: preimage should reuse or bridge to this canonical operation rather than introduce an unrelated semantic notion.

**Verdict: PASS.**

---

# Review 2 — ZFC axiom boundary

## Files reviewed

- `LRA/Set/ZFC/Axioms.lean`
- `LRA/Set/ZFC/Axioms/Separation.lean`
- `LRA/Set/ZFC/Axioms/Replacement.lean`
- `LRA/Set/ZFC/Axioms/Choice.lean`
- `LRA/Set/ZFC/Definitions.lean`
- `LRA/Set/ZFC/Choice/Theorems.lean`
- `LRA/Set/ZFC/Union/Theorems.lean`

## ZFC axiom list

The ZFC aggregate imports the expected primitive assumptions: extensionality, empty set, pairing, union, power set, infinity, separation, replacement, foundation, and choice.

This is a recognizable ZFC-style foundation.

No defect is inferred merely from axiomatizing these principles.

---

# Important foundational qualification — Separation/Replacement are higher-order internalizations of schemas

The files encode the schemas as Lean parameters:

```text
Separation : (ZFCSet → Prop) → ZFCSet → ...
Replacement : (ZFCSet → ZFCSet → Prop) → ZFCSet → ...
```

This is convenient and common in higher-order formalization, but it is not literally the same semantic object as a first-order ZFC axiom schema ranging only over formulas of the object language.

The Lean axiom quantifies over arbitrary meta-level predicates/relations available in the surrounding type theory. Viewed as an axiom about one `ZFCSet` type, that is a stronger, higher-order/metatheoretic comprehension/replacement principle than the ordinary first-order schema when model-theoretic strength is considered.

## Recommendation

Do not necessarily change the implementation if the intended object is a strong external universe of sets usable from Lean. Instead document explicitly:

> Separation and Replacement are represented in Lean by higher-order parameters, internalizing the usual first-order schemas at the meta-level. This interface is intended as a usable set universe, not as a literal first-order model-theory encoding of ZFC syntax.

If the project later makes claims about models of first-order ZFC, consistency strength, completeness, or conservativity, a syntactic first-order theory/model layer must be kept distinct from this higher-order convenience universe.

**Severity: P1 FOUNDATIONAL/SEMANTIC DOCUMENTATION ISSUE, not an ordinary-set-mathematics error.**

---

# Replacement functional condition

The Replacement axiom correctly requires that for every `x ∈ A` there exists a unique `y` satisfying the relation, and then forms exactly the set of those outputs.

This is the standard functional form of Replacement.

**Verdict: CORRECT.**

## Documentation mismatch in `IsFunctionalOn`

`ZFC.Definitions.IsFunctionalOn` has the same existence-and-uniqueness formula, but its comment says the relation assigns **“at most one output”** to each member of `A`.

That prose is inaccurate. The formula says **exactly one output** for every member of `A`.

### Recommended wording

> `relation` assigns exactly one output to each member of `A`.

If the project also wants an “at most one” predicate, that should be a distinct single-valuedness notion.

**Severity: P2 DOCUMENTATION/PREDICATE-READING ERROR.**

The same wording mismatch also occurs in the TG definition file reviewed below and should be corrected consistently across concrete foundations.

---

# Choice axiom

The ZFC Choice axiom is stated for a pairwise-disjoint family of nonempty sets and yields a set meeting every family member in exactly one element.

This is a standard choice-set formulation of the Axiom of Choice. In ordinary ZF it is equivalent to more familiar formulations after the usual coding/disjointification constructions.

**Verdict: MATHEMATICALLY LEGITIMATE ZFC CHOICE AXIOM.**

## `TheChoiceSet` and `Classical.choose`

`ChoiceSetExists` invokes the mathematical Choice axiom to establish an existential choice-set statement.

`TheChoiceSet` then uses `Classical.choose` to name one witness.

This second step is **witness extraction**, not another independent family-wise Choice principle in the mathematics. The genuine Choice dependency is already the theorem `ChoiceSetExists`/axiom `Choice`.

**Choice classification: GENUINE AC AT `ZFC.Choice`; SUBSEQUENT `Classical.choose` IS WITNESS EXTRACTION.**

---

# `Classical.choose` elsewhere does not automatically mean AC

For example, `ZFC.Union.TheUnionOver` uses `Classical.choose (UnionOverExists A)` after the Union axiom has established existence of one union set.

Mathematically this is simply naming a witness from one existential statement. It is not the Axiom of Choice over a family.

The same classification should be applied throughout the repository:

- `Classical.choose` from one proved existential: **witness extraction**;
- simultaneous selection from an arbitrary family of existential statements: **genuine choice principle**, unless the index/witness structure supplies a canonical least witness or equivalent construction.

---

# Review 3 — NBG foundation and Choice boundary

## Files reviewed

- `LRA/Set/NBG/Axioms.lean`
- `LRA/Set/NBG/Axioms/Choice.lean`
- `LRA/Set/NBG/Axioms/ClassComprehension.lean`
- `LRA/Set/NBG/Choice/Theorems.lean`

## NBG axiom inventory

The NBG aggregate includes the ordinary set-theoretic axioms together with class comprehension and set-level Choice.

This is a recognizable NBG-style set/class foundation.

## Choice is set Choice, not Global Choice

The NBG `Choice` axiom has the same choice-set formulation used by ZFC: it concerns a **set** `A` of pairwise-disjoint nonempty sets and produces a set choice set.

That is importantly different from asserting a **global class choice function** on all nonempty sets.

The repository therefore does not silently conflate ordinary NBG + Choice with Global Choice in the reviewed axiom.

**Verdict: GOOD FOUNDATIONAL DISTINCTION.**

`NBG.Choice.TheChoiceSet` again uses `Classical.choose` only after the mathematical Choice axiom proves existence, so it is witness naming rather than an additional Choice principle.

## NBG class comprehension has the same higher-order qualification

`ClassComprehension` takes an arbitrary Lean predicate

```text
property : NBGSet → Prop
```

and produces a class containing exactly those sets.

This is a convenient external class-universe interface, but ordinary first-order NBG has a finite class-comprehension axiom scheme/formulation whose syntactic scope is part of the theory. The current Lean statement internalizes comprehension at the meta-level over arbitrary Lean predicates.

As with ZFC Separation/Replacement, this is not a problem for ordinary mathematical use if explicitly intended, but it must be distinguished from a literal object-language/model-theoretic formalization of first-order NBG.

**Severity: P1 FOUNDATIONAL DOCUMENTATION QUALIFICATION.**

---

# Review 4 — Tarski–Grothendieck foundation

## Files reviewed

- `LRA/Set/TG/Axioms.lean`
- `LRA/Set/TG/Axioms/Choice.lean`
- `LRA/Set/TG/Axioms/GrothendieckUniverse.lean`
- `LRA/Set/TG/Definitions.lean`
- `LRA/Set/TG/Choice/Theorems.lean`
- `LRA/Set/TG/GrothendieckUniverse/Theorems.lean`

## TG axiom inventory

TG extends the ZFC-style axiom aggregate with a Grothendieck-universe axiom. This is the expected broad architecture for Tarski–Grothendieck set theory.

The Choice axiom is again the same legitimate set-level Zermelo Choice formulation used in the ZFC and NBG backends.

## Grothendieck-universe axiom: good components

For every set `A`, the axiom produces a set `U` such that:

- `A ∈ U`;
- `U` is transitive;
- if `x ∈ U`, a powerset of `x` belongs to `U`;
- for `I ∈ U`, the image/range of an `I`-indexed Lean family whose values lie in `U` belongs to `U`.

These are all standard Grothendieck-universe-flavored closure requirements.

`TheGrothendieckUniverse` then uses `Classical.choose` merely to name one universe after `GrothendieckUniverseExists A`; this is ordinary witness extraction from the TG universe axiom, not mathematical AC.

## MAJOR — indexed-union closure is not stated

The current universe predicate/axiom closes `U` under the **range set**

```text
{ family i | i ∈ I }
```

but does not state that the **union of that family** belongs to `U`:

```text
⋃ i ∈ I, family i ∈ U.
```

A standard Grothendieck universe requires closure under indexed unions (equivalently, one of the usual closure systems that implies it). Merely knowing that the range/image of the family is itself an element of `U` does not, from the displayed universe fields alone, imply that the union of that range is an element of `U`.

Transitivity only says that members of members of `U` are themselves elements of `U`; it does not promote an externally constructed union subset of `U` to an **element** of `U`. Ambient existence of the union via the global Union axiom likewise does not establish closure of `U` under that union.

A repository search did not locate a current theorem deriving the missing union-closure property from `IsGrothendieckUniverseFor`.

### Required correction

Add an indexed-union closure clause, e.g. mathematically:

> if `I ∈ U` and `family i ∈ U` for every `i ∈ I`, then there exists `V ∈ U` whose elements are exactly those belonging to some `family i`.

Equivalently, add ordinary union closure `x ∈ U → ⋃x ∈ U` together with the current image/range closure; those two combine to give indexed unions.

Then prove the familiar derived closures: empty set, unordered pairs, singletons, finite tuples/products, ordinary unions, and function images.

**Severity: P0/P1 FOUNDATIONAL DEFINITION DEFECT — CURRENT `IsGrothendieckUniverseFor` IS WEAKER THAN THE STANDARD GROTHENDIECK-UNIVERSE NOTION.**

## Higher-order family parameter qualification

The TG family closure quantifies over an arbitrary Lean function

```text
family : TGSet → TGSet.
```

Like Separation/Replacement, this is an external/higher-order convenience rather than a literal first-order object-language formulation. TG is already commonly used metatheoretically, so this may be entirely intentional, but it should be documented.

## `IsFunctionalOn` wording repeats the ZFC mismatch

TG's `IsFunctionalOn` comment again says “at most one output,” while its formula requires an existing unique output for every `x ∈ A`.

Correct the prose to “exactly one output.”

---

# Updated Choice audit table

| Location | Use | Classification |
|---|---|---|
| `LRA/Set/ZFC/Axioms/Choice.lean` | choice set for pairwise-disjoint nonempty set-family | **Genuine Axiom of Choice** |
| `LRA/Set/ZFC/Choice/Theorems.lean` / `TheChoiceSet` | choose witness after AC-derived existence | **Witness extraction from AC-derived existence** |
| `LRA/Set/ZFC/Union/Theorems.lean` / `TheUnionOver` | choose one union-set witness | **Ordinary witness extraction; not mathematical AC** |
| `LRA/Set/NBG/Axioms/Choice.lean` | set-level choice set | **Genuine set Choice; not Global Choice** |
| `LRA/Set/NBG/Choice/Theorems.lean` / `TheChoiceSet` | choose witness after NBG Choice | **Witness extraction from AC-derived existence** |
| `LRA/Set/TG/Axioms/Choice.lean` | set-level choice set | **Genuine Axiom of Choice** |
| `LRA/Set/TG/Choice/Theorems.lean` / `TheChoiceSet` | choose witness after TG Choice | **Witness extraction from AC-derived existence** |
| `LRA/Set/TG/GrothendieckUniverse/Theorems.lean` / `TheGrothendieckUniverse` | choose one universe whose existence is an axiom | **Ordinary witness extraction; not AC** |
| `LRA/Cardinality/Properties/Countability/Theorems.lean` / `CountableSigmaOfCountableIndexCountableFibers` | simultaneous choice of counting maps for all existentially countable fibers | **Genuine family-wise choice outside foundational Choice trees** |

## Important audit principle

A raw occurrence of `Classical.choose` is not enough to classify a theorem as using mathematical AC. Its source existential must be inspected. This review records mathematical dependency, not merely Lean's implementation primitive.

---

# Choice audit note about search results

Repository code search currently returns some results at an older indexed revision. Such hits are used only to discover candidate files; conclusions are verified against current `main` files before being recorded as current behavior.

---

# Final verdict through Review 4

| Dimension | Verdict |
|---|---|
| Pairing abstraction | **PASS** |
| Cartesian-product mathematics | **PASS** |
| Relation-as-set vocabulary | **PASS** |
| ZFC ordinary axiom inventory | **PASS** |
| ZFC/NBG/TG Choice formulations | **PASS, WITH NBG GLOBAL-CHOICE DISTINCTION** |
| Witness extraction classification | **PASS / CLEAR** |
| Separation/Replacement/ClassComprehension encoding | **HIGHER-ORDER INTERNALIZATION; DOCUMENT** |
| `IsFunctionalOn` prose | **NEEDS “EXACTLY ONE”** |
| TG universe existence architecture | **RIGHT IDEA** |
| TG universe indexed-union closure | **MISSING — MAJOR FOUNDATIONAL CORRECTION** |

---

# Next review chunk

Review the predicate-set/Mathlib realizations and law registration against the canonical Set interface, then sample ZFC/NBG/TG backend registration files to confirm that each backend advertises only mathematically available capabilities. After that, continue the external Choice audit through non-foundational modules discovered by search.
