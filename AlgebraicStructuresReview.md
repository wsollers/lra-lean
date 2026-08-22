# LRA Canonical Algebraic Structures Review

## Scope

Maintained mathematical and architectural review of the canonical `LRA.Operation` + `LRA.AlgebraicStructures` hierarchy, especially the structures upstream of ordered fields and real analysis.

This review distinguishes this canonical certificate layer from the separate orientation-only records under `LRA.Algebra.AbstractAlgebra`.

---

# Files reviewed

- `LRA/Operation/Laws.lean`
- `LRA/Operation/Laws/Associative/Definition.lean`
- `LRA/Operation/Laws/Identity/Definition.lean`
- `LRA/Operation/Theorems.lean`
- `LRA/AlgebraicStructures.lean`
- `LRA/AlgebraicStructures/Field/Definition.lean`
- `LRA/AlgebraicStructures/Field/Laws/Definition.lean`
- `LRA/AlgebraicStructures/DivisionRing/Laws/Definition.lean`
- `LRA/AlgebraicStructures/NontrivialRing/Laws/Definition.lean`
- `LRA/AlgebraicStructures/OrderedField/Laws/Definition.lean`
- `LRA/AlgebraicStructures/CompleteOrderedField/Definition.lean`
- `LRA/AlgebraicStructures/CompleteOrderedField/Laws/Definition.lean`
- `LRA/AlgebraicStructures/CompleteOrderedField/Relationships.lean`
- `LRA/Order/Laws/OperationCompatibility/Definition.lean`
- `LRA/AlgebraicStructures/ProofsToDo.md`

---

# Architecture verdict

The canonical structure architecture is strong and closely matches the project's stated Landau-style goal.

## Machines

Operations are supplied by ordinary Lean operation classes such as:

- `Add`;
- `Mul`;
- `Neg`;
- `Inv`;
- `Div`;
- `LE` / `LT`;
- numeral structures for `0` and `1`.

This is good capability discipline: a carrier does not gain an operation merely because a later theorem would like one.

## Certificates

Small `Prop` classes certify individual laws or closely related law families.

## Named bundles

Named structures combine certificates rather than introducing unrelated replacement operations.

This allows concrete number systems and other carriers to prove the exact requirements they satisfy.

**Verdict: PASS — RECOMMENDED CANONICAL OWNER.**

---

# Operation-law layer

The canonical law tree explicitly separates:

- associativity;
- commutativity;
- identity;
- inverse;
- absorbing elements;
- cancellation;
- distributivity;
- idempotence;
- absorption;
- nilpotence;
- closure.

Representative definitions are mathematically exact. For example:

```text
Associative operation :=
  forall a b c,
    operation (operation a b) c = operation a (operation b c)
```

and

```text
TwoSidedIdentity operation identity :=
  LeftIdentity operation identity
  and RightIdentity operation identity.
```

The theorem layer already proves structural transfer results, including associativity and identity of endomap composition and pointwise lifting of associative/identity/inverse laws.

This is exactly the kind of theorem surface needed for “if operation X satisfies laws A/B/C, then the induced operation Y also satisfies them.”

**Verdict: PASS.**

---

# Field hierarchy

The canonical field structure is correctly split into signature and laws.

`FieldConceptSignature` extends the commutative-ring signature with total inversion.

`FieldLaws` is:

```text
DivisionRingLaws R,
MultiplicativeCommutativeLaws R.
```

`DivisionRingLaws` includes:

- ring laws;
- `NontrivialityLaw`;
- multiplicative inverses for nonzero elements;
- the explicit totalization convention `0⁻¹ = 0`.

`NontrivialityLaw` states

```text
1 != 0.
```

Therefore the canonical field hierarchy correctly excludes the zero ring.

**Verdict: PASS.**

This is superior to silently relying on Mathlib's totalized inversion convention because the project explicitly records `0⁻¹ = 0` as a law.

---

# Ordered fields

`OrderedFieldLaws` combines:

- additive-group laws;
- commutative multiplicative laws;
- distributivity;
- zero absorption;
- nontriviality;
- inverse laws;
- linear-order laws;
- addition/order compatibility;
- multiplication/order compatibility.

The multiplication compatibility certificate uses the positive-cone formulation

```text
0 <= a -> 0 <= b -> 0 <= a*b.
```

Together with ring laws and a linear order, this is a standard economical ordered-ring formulation from which the usual multiplication inequalities can be derived.

**Verdict: PASS.**

Recommended consequence surface:

- translation preserves order;
- multiplication by positive elements preserves order;
- multiplication by negative elements reverses order;
- squares are nonnegative;
- `0 < 1` from nontriviality + linear order + ordered-ring laws;
- reciprocal positivity and reciprocal order reversal on positive elements.

---

# Complete ordered fields

The concept signature correctly introduces no new operation:

```text
CompleteOrderedFieldConceptSignature := OrderedFieldConceptSignature.
```

Completeness is a property, not extra algebraic data.

The law bundle is

```text
CompleteOrderedFieldLaws R SetObject :=
  OrderedFieldLaws R
  and OrderCompletenessLaws R SetObject.
```

This is architecturally correct and correctly delegates generic LUB/Dedekind completeness to `LRA.Order`.

## Important positive point: Archimedeanness is not an axiom here

The complete-ordered-field certificate does **not** build Archimedeanness into the definition.

That is mathematically appropriate: for ordinary complete ordered fields, the Archimedean property should be derived from order completeness rather than postulated as a defining field law.

This also helps isolate the separate false completeness/reciprocal theorem already recorded in `AnalysisCompletenessReview.md`.

**Verdict: PASS.**

## Backend-relative qualification

As already noted in the order/bounds review, `OrderCompletenessLaws R SetObject` is completeness relative to the represented set backend. That is acceptable, but concrete realizations must establish that the backend represents the intended subsets before making full textbook completeness claims.

---

# Model-theoretic boundary

`CompleteOrderedField/Relationships.lean` explicitly notes that full Dedekind/LUB completeness quantifies over sets/cuts and is not an ordinary first-order property of the ordered-field language.

Therefore the first-order model-theoretic reduct of a complete ordered field is its ordered-field structure rather than a first-order theory expressing full second-order completeness.

**Verdict: PASS — IMPORTANT FOUNDATIONAL DISTINCTION.**

This aligns well with the project's separate first-order/model-theory work.

---

# Relationship to Universal Algebra

`LRA.UniversalAlgebra` should remain complementary:

```text
LRA.Operation
    individual laws

LRA.AlgebraicStructures
    named law bundles / certificates

LRA.UniversalAlgebra
    signatures, term algebras, equations,
    satisfaction, homomorphisms, congruences,
    quotients, products, free/universal constructions.
```

Eventually it would be illuminating to express an equational law such as associativity as a universal-algebra equation and prove equivalence with the direct `LRA.Operation.Laws.Associative` predicate for the corresponding interpreted binary operation.

That is a bridge theorem, not a reason to merge the layers.

---

# Proof inventory

`LRA/AlgebraicStructures/ProofsToDo.md` currently reports:

```text
52 entries across 15 modules
21 completed
31 sorry
```

The visible inventory includes straightforward wrappers such as additive/multiplicative associativity, identities, inverse cancellation, and discrete-integer consequences.

Per project policy, the remaining `sorry` bodies are not mathematical defects. The important point is that the certificate/theorem surface is already nontrivial and substantially more developed than `LRA.Algebra.LinearAlgebra`.

---

# P1 — orientation `AbstractAlgebra` records should not compete with this layer

The separate `LRA.Algebra.AbstractAlgebra` reference records duplicate semigroup/monoid/group/ring/field concepts but are less complete and less connected.

In particular its `FieldDefinition` currently omits nontriviality, while the canonical `FieldLaws` correctly includes it.

Recommended ownership rule:

> All proof-facing algebraic structure certification should use `LRA.AlgebraicStructures`. The `LRA.Algebra.AbstractAlgebra` records should be a pedagogical facade derived from it, or removed if unused.

**Severity: P1 OWNERSHIP / DRIFT RISK.**

---

# Missing theorem relationships worth adding

The hierarchy would be even stronger with explicit named implication/characterization theorems such as:

```text
FieldLaws -> IntegralDomainLaws
FieldLaws -> CommutativeRingLaws
OrderedFieldLaws -> FieldLaws
OrderedFieldLaws -> LinearOrderLaws
CompleteOrderedFieldLaws -> OrderedFieldLaws
```

and “requirements to satisfy X” equivalences/constructors wherever useful.

Also expose the standard structure-separation counterexamples:

- monoid not group;
- group not abelian;
- ring not commutative;
- commutative ring with zero divisors;
- integral domain not field;
- ordered field not complete (`Rat`);
- complete ordered field example (`Real`).

These are high-value for the learning goal because they make the hierarchy non-vacuous.

---

# Choice audit

No genuine family-wise Axiom-of-Choice dependency was found in the reviewed operation/algebraic-structure certificate layer.

The algebraic laws themselves are purely finitary/equational/order-theoretic.

Choice becomes relevant later for basis/maximality constructions, not here.

---

# Verdict

| Dimension | Verdict |
|---|---|
| Operation-law ownership | **PASS — STRONG** |
| Machine/certificate separation | **PASS — STRONG** |
| Semigroup/monoid/group/ring hierarchy | **PASS** |
| Canonical field nontriviality | **PASS** |
| Totalized inverse convention | **PASS — EXPLICIT** |
| Ordered-field law bundle | **PASS** |
| Complete ordered-field bundle | **PASS** |
| Archimedean separation | **PASS** |
| Model-theoretic completeness boundary | **PASS** |
| Mathlib bridge/adapters | **PRESENT** |
| Orientation `AbstractAlgebra` duplication | **P1 DRIFT RISK** |
| Choice usage | **NONE** |

---

# Immediate recommendations

1. declare `LRA.Operation` and `LRA.AlgebraicStructures` canonical in ownership documentation;
2. route number-system certifications through these bundles;
3. derive/fix the orientation-only `AbstractAlgebra` records from canonical certificates;
4. add explicit hierarchy implication/characterization theorems;
5. add canonical positive and negative examples for each major structure transition;
6. bridge direct operation-law predicates to universal-algebra equation satisfaction where pedagogically useful;
7. keep Archimedean/completeness theorems in the analysis/order layer, not as hidden field axioms.
