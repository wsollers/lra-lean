# LRA Model Theory Readiness Review

## Scope

Focused review of the current first-order / monadic second-order model-theory surface after the syntax, semantics, comparison, and Henkin-semantics audits.

Project rule: unfinished proofs are neutral. This file distinguishes mathematical defects from simply not-yet-built advanced theory.

---

# Current strengths

The project already has a strong foundational model-theory core:

```text
Signature
Model
Term evaluation
First-order satisfaction
Sentences / assignment independence
Formula theories / theories / semantic consequence
ModelEmbedding
ModelIsomorphism
Automorphism
Signature embeddings
Reducts
Expansions
Henkin monadic second-order models
Monadic second-order satisfaction
```

The basic first-order semantics and model-isomorphism definitions reviewed so far are mathematically sound.

This is enough to support concrete structure interpretation and comparison once the construction carriers are correctly tied to their logical models.

---

# P1 conceptual correction: embedding hierarchy

`ModelEmbedding` is an injective atomic structure embedding. It should support quantifier-free formula preservation/reflection after the corresponding term-transport theorem is proved.

It must **not** be treated as preserving arbitrary first-order formulas.

Correct hierarchy:

```text
ModelHomomorphism (if/when defined)
-> ModelEmbedding
-> ElementaryEmbedding
-> ModelIsomorphism
```

where:

- embeddings preserve/reflect quantifier-free structure;
- elementary embeddings preserve all first-order formulas;
- isomorphisms preserve all first-order formulas by bijectivity.

An `ElementaryEmbedding` concept is not currently present in the reviewed model tree.

---

# Missing first-order model-theory middle layer

No canonical project-facing layer was located for:

- substructures;
- generated substructures;
- elementary embeddings;
- elementary substructures;
- elementary equivalence;
- diagrams;
- types / realization of types;
- Tarski-Vaught test.

These are natural next definitions before Löwenheim-Skolem and more advanced classification/model-theory material.

**Severity: P1/P2 curriculum gap, not a correctness defect.**

---

# Missing metatheorems

No implemented project-facing theorem surface was located for:

- soundness of a first-order proof calculus;
- completeness theorem;
- compactness theorem;
- upward/downward Löwenheim-Skolem;
- preservation theorems connecting embeddings/isomorphisms to formula satisfaction.

The Takeuti sequent calculus is currently rule-syntax/scaffold level and has a quantifier-capture defect that must be repaired before soundness work.

Thus model-theoretic compactness should not yet be used as an internal dependency unless imported from Mathlib or postulated explicitly.

**Severity: P1 readiness frontier.**

---

# Recommended development order

The clean dependency order is:

```text
first-order syntax / substitution
-> first-order semantics
-> term transport under embeddings
-> quantifier-free preservation under embeddings
-> isomorphism formula invariance
-> proof-system soundness
-> proof-system completeness
-> compactness
-> substructures / elementary embeddings
-> Tarski-Vaught
-> Löwenheim-Skolem
-> types and further model theory
```

Substructures / elementary embeddings can be introduced before completeness if desired, but completeness/compactness should be available before the major model-theoretic existence theorems that depend on them.

---

# Henkin versus full second-order layer

The project has correctly introduced a separate Henkin model notion, but two repairs are required before it cleanly supports Peano/Integer model theory:

1. free second-order variable assignments should be restricted to admissible sets for standard open-formula Henkin semantics;
2. full second-order models must be distinguished explicitly from arbitrary Henkin models.

Only the full/adequate second-order version should support the familiar categoricity theorem for second-order Peano systems.

---

# Number-system implications

The number-system model theory should use the following division of labor:

```text
AlgebraicStructures
  algebra/order law certificates

NumberSystems
  actual carriers + adjacent embeddings/extensions

Logic.FirstOrder
  logical structures, embeddings, isomorphisms, theories

Logic.SecondOrderMonadic
  Henkin/full-subset distinctions for induction/completeness schemas
```

For real-number construction comparisons, once concrete carriers are packaged as actual `RealModel.ofCarrier` values, the generic logical `ModelIsomorphism` should be used rather than maintaining detached construction-specific comparison models.

---

# Choice audit

No new genuine Axiom-of-Choice use is required by the missing basic definitions above.

Later model-theoretic results may use Choice/Zorn depending on proof strategy and cardinal framework, especially some maximality/construction arguments. Those dependencies should be audited when actual proofs are written rather than inferred from theorem names.

---

# Verdict

| Area | Verdict |
|---|---|
| signatures/models | **PASS** |
| first-order satisfaction | **PASS** |
| model embeddings/isomorphisms | **PASS DEFINITIONS** |
| embedding all-formula preservation | **MUST NOT BE CLAIMED** |
| elementary embeddings/substructures | **MISSING** |
| soundness/completeness | **MISSING / PROOF-SYSTEM BLOCKED FIRST** |
| compactness | **MISSING** |
| Löwenheim-Skolem | **MISSING** |
| Henkin monadic second order | **GOOD CORE, OPEN-VALUATION + FULLNESS REPAIRS NEEDED** |
| advanced model-theory readiness | **FOUNDATION READY; MIDDLE/METATHEORY LAYER NOT YET BUILT** |

---

# Immediate next additions

1. term evaluation commutes with `ModelEmbedding`;
2. quantifier-free satisfaction preservation/reflection;
3. formula invariance under `ModelIsomorphism`;
4. `ElementaryEmbedding`;
5. `Substructure` / `ElementarySubstructure`;
6. repair and prove soundness of the proof calculus;
7. completeness;
8. compactness;
9. Tarski-Vaught and Löwenheim-Skolem.
