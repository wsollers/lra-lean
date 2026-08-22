# LRA Concrete Set Foundations Review

## Scope

Maintained review of the concrete foundational set-theory realizations (`ZFC`, later `NBG` and `TG`) and the ordered-pair/relation-set layer that connects ordinary set theory to the generic relation/function chapters.

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

The layer also already defines generic:

- domain;
- range;
- image;
- preimage;
- fiber;
- inverse relation;
- restriction;
- further relation constructions downstream.

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

The ZFC aggregate imports the expected primitive assumptions:

- extensionality;
- empty set;
- pairing;
- union;
- power set;
- infinity;
- separation;
- replacement;
- foundation;
- choice.

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

---

# Choice axiom

The ZFC Choice axiom is stated for a pairwise-disjoint family of nonempty sets and yields a set meeting every family member in exactly one element.

This is a standard choice-set formulation of the Axiom of Choice. In ordinary ZF it is equivalent to more familiar formulations after the usual coding/disjointification constructions.

**Verdict: MATHEMATICALLY LEGITIMATE ZFC CHOICE AXIOM.**

## `TheChoiceSet` and `Classical.choose`

`ChoiceSetExists` invokes the mathematical Choice axiom to establish an existential choice-set statement.

`TheChoiceSet` then uses

```text
Classical.choose (ChoiceSetExists ...)
```

to name one witness.

This second step is **witness extraction**, not another independent family-wise Choice principle in the mathematics. The genuine Choice dependency is already the theorem `ChoiceSetExists`/axiom `Choice`.

**Choice classification: GENUINE AC AT `ZFC.Choice`; SUBSEQUENT `Classical.choose` IS WITNESS EXTRACTION.**

---

# `Classical.choose` elsewhere does not automatically mean AC

For example, `ZFC.Union.TheUnionOver` uses:

```text
Classical.choose (UnionOverExists A)
```

after the Union axiom has established existence of one union set.

Mathematically this is simply naming a witness from one existential statement. It is not the Axiom of Choice over a family.

The same classification should be applied throughout the repository:

- `Classical.choose` from one proved existential: **witness extraction**;
- simultaneous selection from an arbitrary family of existential statements: **genuine choice principle**, unless the index/witness structure supplies a canonical least witness or equivalent construction.

This distinction should be kept in the maintained choice audit.

---

# Initial Choice audit table

| Location | Use | Classification |
|---|---|---|
| `LRA/Set/ZFC/Axioms/Choice.lean` | Choice set for pairwise-disjoint nonempty family | **Genuine Axiom of Choice** |
| `LRA/Set/ZFC/Choice/Theorems.lean` / `TheChoiceSet` | `Classical.choose` after `ChoiceSetExists` | **Witness extraction from AC-derived existence** |
| `LRA/Set/ZFC/Union/Theorems.lean` / `TheUnionOver` | choose the unique/existing union-set witness | **Ordinary witness extraction; not mathematical AC** |
| `LRA/Cardinality/Properties/Countability/Theorems.lean` / countable sigma of existentially countable fibers | simultaneous choice of counting maps for all fibers | **Genuine family-wise choice outside ZFC tree** |

The NBG/TG choice modules and non-foundational `Classical.choose` sites will be classified in subsequent passes.

---

# Choice audit note about search results

Repository code search currently returns some results at an older indexed revision. Such hits are used only to discover candidate files; conclusions must be verified against the current `main` file before being recorded as current behavior.

---

# Final verdict through Review 2

| Dimension | Verdict |
|---|---|
| Pairing abstraction | **PASS** |
| Cartesian-product mathematics | **PASS** |
| Relation-as-set vocabulary | **PASS** |
| ZFC ordinary axiom inventory | **PASS** |
| Replacement functional statement | **PASS** |
| `IsFunctionalOn` prose | **NEEDS “EXACTLY ONE,” NOT “AT MOST ONE”** |
| Separation/Replacement schema encoding | **STRONGER HIGHER-ORDER INTERNALIZATION; DOCUMENT CLEARLY** |
| Choice axiom | **PASS AS ZFC FOUNDATION** |
| Choice/witness-extraction distinction | **CLEARLY SEPARABLE** |

---

# Next review chunk

Review the current NBG and TG axiom/Choice formulations, then inspect representative concrete ZFC/NBG/TG theorem files to verify that chosen objects use `Classical.choose` only as witness naming unless a genuine family-wise Choice theorem is intentionally being consumed. After that, review the predicate-set/Mathlib realizations and law registration against the canonical interface.
