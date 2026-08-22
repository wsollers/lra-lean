# LRA Logic Semantics / Model Comparison Review

## Scope

Focused audit of the first-order model, satisfaction, theory, embedding, isomorphism, reduct, expansion, and preservation infrastructure used by the number-system model-theory layer.

Files reviewed include:

- `LRA/Logic/Model/Model.lean`
- `LRA/Logic/Semantics/Satisfaction.lean`
- `LRA/Logic/Semantics/Sentence.lean`
- `LRA/Logic/Theory.lean`
- `LRA/Logic/Model/Comparison/ModelEmbedding.lean`
- `LRA/Logic/Model/Comparison/ModelIsomorphism.lean`
- `LRA/Logic/Model/Comparison/ModelIsomorphismSymmetric.lean`
- `LRA/Logic/Model/Comparison/Examples.lean`
- `LRA/Logic/Model/Comparison/Reduct.lean`
- `LRA/Logic/Model/Comparison/Expansion.lean`
- `LRA/AlgebraicStructures/OrderedField/Interface/ModelTheory/LStructure.lean`

Project rule: `sorry` is neutral; statement/definition errors and incorrect claimed implications are not.

---

# First-order `Model`

The model structure is standard and well designed:

```text
nonempty typed domain
interpretation of function symbols
interpretation of relation symbols
interpretation of constants
logical equality fixed to actual equality
```

Using `Domain : Type` rather than an ambient-set-with-membership encoding is appropriate in Lean and avoids unnecessary membership bookkeeping.

The explicit nonempty-domain convention is standard for ordinary first-order model theory.

**Verdict: PASS.**

---

# Satisfaction

`Satisfies M assignment formula` has the expected recursive semantics:

- relation applications evaluate argument terms and apply the interpreted relation;
- equality uses the model's diagonal equality interpretation;
- negation is logical negation;
- implication is implication;
- universal quantification ranges over every domain element and updates the assignment.

Derived conjunction and existential semantics are correct.

**Verdict: PASS.**

---

# Sentences

The sentence semantics layer correctly proves that satisfaction of a closed formula is independent of the assignment.

`ModelsOfTheory` still quantifies over assignments when checking sentences; this is redundant but mathematically harmless because assignment independence has already been proved.

A convenience definition such as

```text
SentenceSatisfied M sentence
```

could choose any assignment using domain nonemptiness, but is not necessary for correctness.

**Verdict: PASS.**

---

# Theories and semantic consequence

The definitions of:

```text
FormulaTheory
Theory
ModelsOfFormulaTheory
ModelsOfTheory
TheoryOfModels
SemanticConsequence
```

are mathematically standard.

For formula theories, requiring satisfaction under every assignment is the usual universal-closure reading of open axioms/schemas.

**Verdict: PASS.**

---

# `ModelEmbedding`

The definition is a standard strong model embedding:

```text
injective domain map
preserves function symbols
preserves constants
preserves AND reflects relation symbols
```

This correctly gives atomic-formula preservation/reflection.

The worked examples `Z -> Q -> R` are useful and mathematically correct examples of this notion in the ordered-ring language.

**Definition verdict: PASS.**

---

# P1 conceptual roadmap error — ordinary embeddings do NOT preserve every first-order formula

The documentation of `ModelEmbedding` says, in substance, that the stronger fact

> an embedding preserves the truth of every formula, not just atomic ones

should follow later by structural induction.

That is false for an ordinary model embedding.

Quantifiers range over the entire target domain, so injectivity plus atomic preservation/reflection is insufficient.

## Counterexample

Consider the usual ring-language embedding

```text
Z -> Q.
```

It preserves and reflects equality and all ring operations, hence is a structure embedding in the relevant algebraic language.

But the sentence

```text
exists x, 2*x = 1
```

is false in `Z` and true in `Q`.

Thus satisfaction of arbitrary first-order formulas is not invariant under ordinary embeddings.

### Correct hierarchy

```text
homomorphism
  -> atomic positive preservation according to convention

embedding
  -> injective + atomic preservation/reflection
  -> quantifier-free formula preservation/reflection

elementary embedding
  -> preservation/reflection of all first-order formulas

isomorphism
  -> bijective embedding
  -> preservation/reflection of all first-order formulas
```

The structural-induction proof for an ordinary embedding fails at the quantifier case because a witness in the larger target model need not lie in the image.

### Severity

No false formula-preservation theorem was located in the current source search, so this is presently a **P1 roadmap/documentation defect** rather than an active P0 theorem.

It becomes P0 immediately if a future theorem states arbitrary formula preservation for `ModelEmbedding` without stronger hypotheses.

---

# Missing `ElementaryEmbedding` concept

No current project-facing `ElementaryEmbedding` notion was located in the reviewed comparison tree.

This is an important distinction to make explicit before deeper model theory. A natural definition is an embedding `f : M -> N` such that for every formula and assignment,

```text
M |= phi[s] iff N |= phi[f o s].
```

Equivalent formulations via formulas with parameters can be added later.

This concept should remain distinct from ordinary `ModelEmbedding`.

**Severity: P1 model-theory readiness gap.**

---

# `ModelIsomorphism`

The canonical logic-level `ModelIsomorphism` is correctly defined as

```text
ModelEmbedding + surjective.
```

Hence its underlying map is bijective.

`ModelIsomorphism.toEquiv` correctly packages the bijection as an equivalence, and `inverseEmbedding` correctly proves that the inverse map is itself a structure embedding. This recovers symmetry as a theorem rather than baking two maps into the primary definition.

The `Classical.choice` hidden in inverse extraction from bijectivity is single-witness extraction, not a family-wise AC dependency.

For isomorphisms, full first-order formula satisfaction invariance does follow by structural induction because witnesses/domain elements can be transported in both directions.

Recommended theorem surface:

```text
TermEvaluationCommutesWithEmbedding
AtomicSatisfactionIffUnderEmbedding
QuantifierFreeSatisfactionIffUnderEmbedding

TermEvaluationCommutesWithIsomorphism
SatisfiesIffUnderIsomorphism
SentenceTruthInvariantUnderIsomorphism
ModelsTheoryInvariantUnderIsomorphism
```

The embedding-level term theorem is useful even before quantifier-free formulas; the full formula theorem belongs at the isomorphism or elementary-embedding level.

**Verdict: PASS; preservation theorem surface is P1 missing.**

---

# Reducts and expansions

`Model.reduct` along a signature embedding is correctly deterministic: it keeps the same domain and forgets vocabulary not in the embedded sub-signature.

`Model.expand` correctly requires interpretations of genuinely new symbols and reuses the old interpretations for embedded symbols. This is the right distinction between reduct and expansion.

No Choice dependency is inherent in either definition.

High-value follow-up theorems:

```text
reduct(expand(M,...)) = M
```

at least extensionally on interpretations, and satisfaction transport for formulas translated along the signature embedding.

**Verdict: PASS.**

---

# Ordered-field first-order builder

The ordered-field first-order model builder interprets

```text
+, *, -, inverse, 0, 1, <
```

which is sufficient to represent the ordinary ordered-field language used by number-system comparisons.

Completeness is intentionally not a symbol/first-order axiom of this structure. It remains an external property of a `RealModel`, which is mathematically correct.

Therefore the canonical logic `ModelIsomorphism` is an appropriate final model-theory representation of an ordered-field isomorphism between concrete real constructions.

**Verdict: PASS.**

---

# Number-system ownership recommendation

For the number systems:

```text
AlgebraicStructures
  owns algebra/order certificates

NumberSystems
  owns concrete carriers and adjacent embeddings/extensions

Logic.FirstOrder.ModelEmbedding
  owns ordinary model embeddings

Logic.FirstOrder.ElementaryEmbedding
  should own elementary embeddings

Logic.FirstOrder.ModelIsomorphism
  owns model-theoretic isomorphism
```

A local number-system equivalence structure may still be useful for algebra-facing theorem application, but it should bridge to the canonical logic isomorphism rather than duplicate the meaning of model isomorphism indefinitely.

---

# Readiness before deeper model theory

Before using this layer for Compactness, Lowenheim-Skolem, types, elementary submodels, or model-completeness, the following theorem/concept ladder should be explicit:

1. term evaluation under embeddings;
2. quantifier-free preservation under embeddings;
3. elementary embeddings;
4. full satisfaction invariance under isomorphism;
5. substructure induced by an embedding;
6. elementary substructure;
7. reduct/expansion satisfaction transport;
8. theory satisfaction invariance under isomorphism.

The current semantic foundations are strong enough to support this development.

---

# Choice audit

No genuine family-wise Choice use is inherent in the reviewed semantic definitions.

- model nonemptiness and choosing an arbitrary assignment value, when needed, involve a single witness;
- extracting the inverse of one bijection uses single-witness choice;
- reduct and expansion are deterministic once their explicit data are supplied.

---

# Verdict

| Dimension | Verdict |
|---|---|
| first-order `Model` | **PASS** |
| satisfaction semantics | **PASS** |
| sentence assignment independence | **PASS** |
| theory / semantic consequence | **PASS** |
| `ModelEmbedding` definition | **PASS** |
| worked `Z -> Q -> R` embedding examples | **PASS** |
| claimed future all-formula preservation for embeddings | **P1 CONCEPTUAL ERROR; WOULD BE P0 IF FORMALIZED** |
| elementary embedding concept | **P1 MISSING** |
| `ModelIsomorphism` | **PASS** |
| inverse isomorphism infrastructure | **PASS** |
| term / quantifier-free / isomorphism preservation ladder | **P1 MISSING** |
| reduct | **PASS** |
| expansion | **PASS** |
| ordered-field model builder | **PASS** |
| Choice usage | **NO NEW GENUINE AC** |
