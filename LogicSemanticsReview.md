# LRA Logic Semantics / Model Comparison Review

## Scope

Focused audit of the first-order model, satisfaction, theory, embedding, and isomorphism core used by the number-system model-theory layer.

Files reviewed include:

- `LRA/Logic/Model/Model.lean`
- `LRA/Logic/Semantics/Satisfaction.lean`
- `LRA/Logic/Semantics/Sentence.lean`
- `LRA/Logic/Theory.lean`
- `LRA/Logic/Model/Comparison/ModelEmbedding.lean`
- `LRA/Logic/Model/Comparison/ModelIsomorphism.lean`
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

**Definition verdict: PASS.**

---

# P0/P1 conceptual roadmap error — ordinary embeddings do NOT preserve every first-order formula

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

- homomorphism: preserves positive atomic structure according to the chosen convention;
- embedding: injective and preserves/reflects atomic structure;
- embedding preserves/refects **quantifier-free** formulas;
- elementary embedding: preserves all first-order formulas;
- isomorphism: bijective embedding, hence preserves all first-order formulas.

The structural-induction proof fails at the quantifier case unless surjectivity or elementarity is available.

### Severity

No false formula-preservation theorem was located in the current source search, so this is presently a **P1 roadmap/documentation defect** rather than an active P0 theorem.

It becomes P0 immediately if a future theorem states arbitrary formula preservation for `ModelEmbedding` without stronger hypotheses.

---

# `ModelIsomorphism`

The canonical logic-level `ModelIsomorphism` is correctly defined as

```text
ModelEmbedding + surjective.
```

Hence its underlying map is bijective.

For isomorphisms, full first-order formula satisfaction invariance really does follow by structural induction because witnesses/domain elements can be transported in both directions.

Recommended theorem surface:

```text
TermEvaluationCommutesWithIsomorphism
SatisfiesIffUnderIsomorphism
SentenceTruthInvariantUnderIsomorphism
ModelsTheoryInvariantUnderIsomorphism
```

These are high-value model-theory bridge theorems.

**Verdict: PASS; formula-invariance theorem surface should be added if absent.**

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

# Ownership recommendation

For the number systems:

```text
AlgebraicStructures
  owns algebra/order certificates

NumberSystems
  owns concrete carriers and adjacent embeddings/extensions

Logic.FirstOrder.ModelIsomorphism
  owns model-theoretic isomorphism
```

A local number-system equivalence structure may still be useful for algebra-facing theorem application, but it should bridge to the canonical logic isomorphism rather than duplicate the meaning of model isomorphism indefinitely.

---

# Choice audit

No genuine family-wise Choice use is inherent in the reviewed semantic definitions.

Model nonemptiness and choosing an arbitrary assignment value, when needed, involve a single witness and do not constitute AC.

---

# Verdict

| Dimension | Verdict |
|---|---|
| first-order `Model` | **PASS** |
| satisfaction semantics | **PASS** |
| sentence assignment independence | **PASS** |
| theory / semantic consequence | **PASS** |
| `ModelEmbedding` definition | **PASS** |
| claimed future all-formula preservation for embeddings | **P1 CONCEPTUAL ERROR; WOULD BE P0 IF FORMALIZED** |
| `ModelIsomorphism` | **PASS** |
| ordered-field model builder | **PASS** |
| isomorphism formula-invariance surface | **P1 HIGH-VALUE ADDITION** |
| Choice usage | **NO NEW GENUINE AC** |
