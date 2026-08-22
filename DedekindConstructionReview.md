# LRA Dedekind Real Construction Review

## Scope

Focused mathematical review of
`LRA/NumberSystems/RealNumbers/Constructions/Dedekind`.

Project-wide rule: `sorry` proof bodies are neutral. Definitions/theorem statements whose displayed hypotheses do not support the claimed mathematics are defects.

---

# Files reviewed

- `Carrier.lean`
- `Equivalence.lean`
- `Operations.lean`
- `WellDefinedness.lean`
- `Laws.lean`
- `Behavior.lean`
- `Instances.lean`

---

# Carrier: Dedekind cuts

`IsCut` requires a lower subset of the selected rational carrier to be:

1. nonempty;
2. proper;
3. downward closed;
4. without a greatest element.

This is the standard lower-cut definition.

`Cut` is correctly a subtype rather than a quotient, and extensional equality is the appropriate equality principle.

**Verdict: PASS.**

---

# Order

The non-strict order is inclusion and the strict order is proper inclusion.

For lower cuts in a linearly ordered field, cuts are comparable by inclusion; the stated strict-total-order theorem has the right mathematical shape.

**Verdict: PASS.**

---

# Rational embedding

The rational embedding sends `q` to the lower ray

```text
{ r | r < q }.
```

This is the canonical Dedekind embedding. The theorem asserting injectivity together with preservation/reflection of strict order is correctly shaped for a linearly ordered dense field.

**Verdict: PASS at the order-embedding level.**

For a full number-system comparison, also expose explicit preservation of `0`, `1`, addition, negation, multiplication, and inverse so that this is visibly an ordered-field embedding rather than merely an order embedding.

---

# Addition and negation

The raw sum cut is

```text
z in A + B  iff  exists a in A, b in B, z = a + b.
```

Although many texts write the equivalent downward-closure formulation, this exact-sum formulation is valid because if `z < a+b`, one may decrease one summand inside its downward-closed cut.

The negation cut

```text
x in -A iff exists r notin A, x < -r
```

is a standard formulation that correctly handles the no-greatest-element convention.

**Verdict: PASS.**

---

# Multiplication

The nonnegative-product lower set uses

```text
x < 0
or
exists a in A, b in B,
  0 < a, 0 < b, x < a*b.
```

under explicit nonnegativity hypotheses for both cuts. This is the standard positive-cone construction.

Arbitrary multiplication is then defined by a four-way sign specification. The cases are mathematically appropriate and the overlap at zero is intended to yield the same product.

**Verdict: core sign-case construction is correctly shaped.**

The project should eventually prefer a deterministic sign-case definition or prove the uniqueness theorem before exposing multiplication as a selected witness; the current `Classical.choose` is ordinary witness extraction, not an additional use of the Axiom of Choice.

---

# Completeness by union

For a nonempty family of cuts bounded above, `family_union` is the union of the member lower sets.

The hypotheses are exactly the ones needed:

- nonempty family ensures the union cut is nonempty;
- an upper cut ensures the union remains proper;
- downward closure and no-greatest-element are inherited from members.

The theorem that this union is the least upper bound is the standard Dedekind-completeness proof.

**Verdict: PASS.**

---

# P0 — parameter `RationalModel` is too broad for the final complete-ordered-field theorem

Every file is parameterized by

```text
rational_model : RationalModel.
```

But `RationalModel` in the current project means only a densely ordered field. It does **not** require the Archimedean property or require that the model actually be the rational-number fraction field.

The construction nevertheless states, for every such model:

```text
field_structure
ordered_field_structure
complete_ordered_field_structure
DedekindRealizesRealModel
```

and the final `RealModel` includes full least-upper-bound completeness.

This generality is not valid for arbitrary non-Archimedean ordered fields.

A non-Archimedean ordered field can satisfy the `RationalModel` certificate. The standard Dedekind completion construction cannot simultaneously give a complete ordered field extending it as an ordered field: every complete ordered field is Archimedean, and an ordered subfield of an Archimedean ordered field is Archimedean.

The source's lower-ray embedding and arithmetic definitions are precisely intended to embed the source field into the cut arithmetic, so this is not merely a naming issue.

## Repair

Require an Archimedean/fraction-field source model, ideally the actual rational construction, e.g. a hypothesis of the form

```text
ArchimedeanOrderedFieldSource rational_model
```

or parameterize the construction by the selected rational extension/universal-property package rather than by arbitrary `RationalModel`.

Then prove the rational embedding preserves all field operations and order.

**Severity: P0 INPUT-CONTRACT / FINAL-STRUCTURE OVERCLAIM.**

The cut carrier and LUB-by-union construction remain valuable and correct; the defect is the source-field generality of the final algebraic package.

---

# P0 — `archimedean_property` is independently false

Current statement:

```text
archimedean_property
    (natural_carrier : Type)
    (natural_to_rational : natural_carrier -> Rational rational_model)
    (cut : Cut rational_model) :
    exists natural,
      cut < rational_embedding (natural_to_rational natural)
```

There are no hypotheses on either `natural_carrier` or `natural_to_rational`.

## Immediate counterexamples

Take

```text
natural_carrier = Empty.
```

Then the existential conclusion is impossible.

Even with

```text
natural_carrier = Unit
```

and a constant map to `0`, the theorem says every cut lies below the embedded zero, which is false.

## Repair

Use the project's canonical natural-number carrier and canonical embedding, or assume explicitly that the image of `natural_to_rational` is cofinal:

```text
forall q, exists n, q < natural_to_rational n.
```

Then derive the Archimedean property of the cut completion.

**Severity: P0 FALSE THEOREM.**

---

# Field-structure definition is weaker than the canonical field certificate

The local `FieldStructure` proposition contains:

- additive-group laws;
- multiplicative/distributive laws;
- inverses for nonzero cuts.

It does not explicitly include

```text
zero != one.
```

The concrete cut structure should be nontrivial and the final `RealModel` requires canonical `OrderedFieldLaws`, so this can be proved. But a proposition named `FieldStructure` should either include nontriviality or reuse the canonical `LRA.AlgebraicStructures.FieldLaws` certificate.

**Severity: P1 duplication/definition alignment issue.**

---

# Architecture recommendation

Avoid a second local algebra hierarchy such as

```text
AdditiveGroupStructure
FieldStructure
OrderedFieldStructure
CompleteOrderedFieldStructure.
```

The project already has canonical law owners:

```text
LRA.AlgebraicStructures.FieldLaws
LRA.AlgebraicStructures.OrderedFieldLaws
LRA.Order.OrderCompletenessLaws
LRA.AlgebraicStructures.CompleteOrderedFieldLaws.
```

For the Dedekind construction, prove the cut operations satisfy those certificates directly, then package the `RealModel` from them.

This would also force nontriviality and operation compatibility to remain synchronized with the canonical definition of a field.

---

# Choice audit

No new genuine family-wise Axiom-of-Choice dependency was identified.

Uses of `Classical.choose` to name:

- a uniquely characterized sign-case product;
- a uniquely characterized reciprocal;

are witness extraction from already established existence/uniqueness and should not be recorded as independent AC use.

---

# Verdict

| Dimension | Verdict |
|---|---|
| Dedekind cut predicate | **PASS** |
| Cut subtype/extensionality | **PASS** |
| Inclusion order | **PASS** |
| Rational lower-ray embedding | **PASS at order level** |
| Addition | **PASS** |
| Negation | **PASS** |
| Nonnegative multiplication | **PASS in shape** |
| Sign-case arbitrary multiplication | **PASS in shape** |
| Supremum by union | **PASS / STANDARD** |
| Arbitrary `RationalModel` as source | **P0 TOO BROAD** |
| Complete ordered-field result for arbitrary source | **P0 OVERCLAIM** |
| Arbitrary-map `archimedean_property` | **P0 FALSE** |
| Local `FieldStructure` nontriviality | **P1 ALIGNMENT GAP** |
| Choice usage | **NO NEW GENUINE AC** |

---

# Immediate repair order

1. restrict the source to the actual rational/fraction-field construction or add a canonical Archimedean-source certificate;
2. replace the arbitrary-map Archimedean theorem with one using a canonical/cofinal natural embedding;
3. prove rational embedding preserves all ordered-field operations;
4. certify cut arithmetic directly against canonical `FieldLaws` / `OrderedFieldLaws`;
5. retain the union-of-cuts proof as the canonical LUB construction;
6. package `RealModel` only after those certificates are available;
7. then compare the Dedekind construction to Cauchy/interval constructions by explicit ordered-field isomorphisms.
