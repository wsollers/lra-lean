# LRA Propositional Logic Review

## Scope

Focused review of the propositional syntax/model/theory layer as the simplest complete test case for the project's general logic architecture.

Files reviewed include:

- `LRA/Logic/Syntax/Propositional/Formula.lean`
- `LRA/Logic/Model/Propositional/PropositionalModel.lean`
- `LRA/Logic/Model/Propositional/ModelsAndTheories.lean`
- the current `LRA/Logic/Proof` tree by repository search.

Project rule: unfinished proofs are neutral; this review concerns definition/theorem correctness and readiness.

---

# Syntax and evaluation

The primitive propositional formula syntax is

```text
atom
negation
implication
```

with conjunction, disjunction, and biconditional defined from those primitives.

The evaluator is the standard Boolean semantics:

```text
eval(p) = valuation(p)
eval(not phi) = not eval(phi)
eval(phi -> psi) = not eval(phi) or eval(psi).
```

The derived-connective truth-table theorems for `and`, `or`, and `iff` are correctly stated and proved.

**Verdict: PASS.**

---

# Propositional models

`PropositionalModel L` is correctly just a valuation

```text
L.Atoms -> Bool.
```

This is the right semantic object. It should not be forced into the first-order `Model` type merely for uniformity.

The documentation also correctly identifies the genuine bridge to first-order logic: propositional atoms correspond to nullary relation symbols.

That is an excellent conceptual point and would make a useful explicit interop theorem later.

**Verdict: PASS.**

---

# Satisfaction, validity, satisfiability, semantic consequence

The following definitions are standard:

```text
M satisfies phi
modelClass phi
ModelsOfTheory Gamma
TheoryOfModels K
IsValid phi
IsSatisfiable Gamma
SemanticConsequence Gamma phi.
```

In particular,

```text
Gamma |= phi
```

is defined as inclusion of `ModelsOfTheory Gamma` in the model class of `phi`, which is exactly the usual semantic consequence relation.

**Verdict: PASS.**

---

# Galois connection comment is mathematically correct but not yet a theorem surface

The source comments state the standard correspondence

```text
Gamma subset TheoryOfModels K
<->
K subset ModelsOfTheory Gamma.
```

This is correct.

The resulting closure operators are also natural:

```text
Cn(Gamma) := TheoryOfModels (ModelsOfTheory Gamma)
EC(K) := ModelsOfTheory (TheoryOfModels K).
```

They are currently described as future additions rather than implemented canonical definitions/theorems.

Recommended elementary theorem surface:

```text
ModelsTheoryGaloisConnection
TheorySubsetSemanticClosure
SemanticClosureMonotone
SemanticClosureIdempotent
ModelClassClosureMonotone
```

**Severity: P2 useful pedagogical completion, not a defect.**

---

# Missing syntactic proof system

A repository search did not locate a propositional derivability calculus connected to this semantic layer, nor propositional soundness/completeness theorems.

The generic `ProofSystem` abstraction exists elsewhere, so propositional logic is the ideal first consumer.

Possible choices:

- Hilbert system over `not`/`impl`;
- natural deduction;
- a propositional fragment of the Takeuti sequent calculus after its first-order binding issues are isolated.

For learning purposes, a small explicit Hilbert or sequent system is probably preferable because it makes the distinction

```text
Gamma |- phi
```

versus

```text
Gamma |= phi
```

first-class.

**Severity: P1 curriculum/proof-readiness gap.**

---

# Highest-value metatheorems

Before attempting first-order completeness, propositional logic should establish:

```text
Soundness:
  Gamma |- phi -> Gamma |= phi

Completeness:
  Gamma |= phi -> Gamma |- phi
```

For finite propositional theories, truth-table decidability can also provide a computational completeness route.

Then add:

```text
phi valid <-> emptyTheory |= phi
phi satisfiable <-> not (not phi valid)
Gamma inconsistent <-> ModelsOfTheory Gamma = empty
```

with whatever syntactic inconsistency notion the chosen proof system supplies.

This would exercise the full syntax/proof/semantics architecture without quantifier or substitution complications.

---

# Propositional compactness

No project-facing propositional compactness theorem was located.

A useful theorem before first-order compactness is:

```text
A propositional theory is satisfiable
iff every finite subset is satisfiable.
```

This can be developed independently and provides an excellent conceptual bridge to first-order compactness later.

Depending on how arbitrary atom types and theories are handled, the proof strategy may involve a compactness principle / choice-like logical principle; the actual dependency should be audited when formalized rather than assumed now.

---

# Bridge to first-order logic

The source already identifies the correct embedding:

```text
propositional atom p
<->
nullary relation symbol R_p.
```

Recommended later bridge:

1. build a first-order signature with one nullary relation for each propositional atom;
2. translate propositional formulas to first-order sentences;
3. translate valuations to one-element first-order models (or any nonempty domain with the same nullary interpretations);
4. prove satisfaction preservation/reflection.

This gives a precise theorem that propositional semantics is the nullary-relational fragment of first-order semantics.

**Severity: P2 illuminating bridge, not required for correctness.**

---

# Choice audit

No genuine Choice dependency occurs in the present propositional syntax/model semantics.

Future compactness proofs should document any use of ultrafilters, maximal consistent sets, Tychonoff-style arguments, or other choice-sensitive machinery according to the proof actually chosen.

---

# Verdict

| Dimension | Verdict |
|---|---|
| formula syntax | **PASS** |
| Boolean evaluation | **PASS** |
| derived connectives | **PASS** |
| valuation-as-model | **PASS** |
| satisfaction / validity / satisfiability | **PASS** |
| semantic consequence | **PASS** |
| model/theory Galois connection | **CORRECT COMMENT; THEOREM SURFACE MISSING** |
| syntactic derivability | **MISSING** |
| soundness/completeness | **P1 MAJOR NEXT STEP** |
| propositional compactness | **MISSING, HIGH-VALUE PRECURSOR** |
| first-order nullary-relation bridge | **P2 HIGH-VALUE ADDITION** |
| Choice usage | **NONE CURRENTLY** |

---

# Recommended order

1. define a propositional proof calculus;
2. define syntactic consequence `Gamma |- phi`;
3. prove soundness;
4. prove completeness;
5. add semantic closure/Galois-connection theorems;
6. add propositional compactness;
7. add the nullary-relation translation into first-order logic;
8. then reuse the lessons learned in first-order soundness/completeness.
