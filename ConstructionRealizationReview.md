# LRA Construction Realization Cross-Cutting Review

## Purpose

This note corrects and sharpens a classification used in earlier construction reviews.

The following declarations have prose saying that a newly constructed carrier realizes a named model interface:

```text
QuotientOrderedPairsRealizesIntegerModel
RationalQuotientFractionsRealizesRationalModel
DedekindRealizesRealModel
CauchyRealizesRealModel
```

However, each formal result type is merely the corresponding packaged model type:

```text
IntegerModel
RationalModel
RealModel
RealModel
```

respectively.

The result types do **not** require the returned model carrier to be the constructed carrier and do not state that the returned operations/order/certificates agree with the constructed ones.

---

# P0 — realization declarations are detached from their constructed carriers

For example, the Cauchy declaration has the form

```text
CauchyRealizesRealModel
    (rational_model : RationalModel)
    (absolute_value_data : RationalMetricData rational_model) :
    RealModel.
```

Its type does not contain

```text
Carrier rational_model absolute_value_data
```

at all.

Thus, formally, an implementation could return an unrelated existing `RealModel` and satisfy the declaration.

The same issue applies to the integer quotient-pair, rational quotient-fraction, and Dedekind declarations.

**Severity: P0 SPECIFICATION / SEMANTIC DETACHMENT.**

---

# Correction to earlier defect wording

Earlier review notes sometimes described these declarations as directly **false realization theorems** under weak input contracts.

The more precise classification is:

1. the construction-specific input contracts are indeed too weak to prove the intended structure on the constructed carrier in several cases;
2. but the current formal `...Realizes...Model` declarations do not actually assert that intended proposition at all.

Therefore the existing declarations are generally **under-specified/vacuous as realization certificates**, rather than direct formal contradictions.

Examples:

- `WholeNumberArithmeticForQuotientPairs` is too weak to prove that its quotient carrier is a discrete ordered integral domain;
- `IntegerAndPositiveNaturalData` is too weak to prove that its fraction quotient carrier is a field;
- arbitrary `RationalModel` is too broad a source for the intended Dedekind real construction;
- arbitrary `RationalMetricData` is too broad for the intended ordinary-real Cauchy completion.

But the current realization declarations fail even before those mathematical issues matter, because they do not identify their returned carrier with the construction carrier.

This note supersedes any earlier wording that called those bare packaged-model return types themselves false solely from a counterexample to the intended carrier realization.

---

# Correct realization pattern

The project already has `ofCarrier` constructors for the model classes. That suggests the cleanest pattern:

1. register operations directly on the constructed carrier;
2. prove canonical law certificates directly on that carrier;
3. invoke the relevant model constructor with the constructed carrier explicitly.

Schematic form:

```text
noncomputable def QuotientOrderedPairsRealizesIntegerModel
    (data : AdequateWholeNumberData) : IntegerModel :=
  IntegerModel.ofCarrier (Carrier data)
```

where the required instances/certificates for `Carrier data` have already been constructed.

Likewise:

```text
RationalModel.ofCarrier (RationalCarrier data)
RealModel.ofCarrier (Dedekind.Cut rational_model)
RealModel.ofCarrier (Cauchy.Carrier rational_model metric)
```

This makes carrier identity definitional rather than documentary.

Alternatively use an explicit realization certificate:

```text
structure Realization (Constructed : Type) where
  model : RealModel
  carrier_equiv : Constructed ≃ model.Carrier
  operation_compatibility : ...
```

but direct `ofCarrier` is preferable when the operations are already defined on the construction carrier.

---

# Why this matters

Without carrier coupling, statements such as

```text
"the Dedekind construction is a RealModel"
```

or

```text
"the rational quotient realizes RationalModel"
```

are not available to downstream proofs, even if the declaration compiles.

A downstream theorem cannot safely infer that:

- the quotient operations are field operations;
- the cut order is the `RealModel` order;
- the Cauchy quotient is complete;
- the canonical embeddings land in the packaged model's actual carrier.

This breaks the intended Landau-style architecture in which each concrete number system certifies that it obeys the generic laws.

---

# Recommended repository-wide rule

For every declaration named

```text
XRealizesY
XIsY
XFormsY
```

check that the formal result type explicitly mentions `X` or fixes the returned carrier/operations definitionally.

A prose comment is not sufficient.

This same audit pattern should be applied to future:

- topology realizations;
- metric realizations;
- algebraic structure realizations;
- measure-space constructions;
- quotient constructions.

---

# Choice audit

No Choice issue is involved. This is purely a dependent-typing/specification problem.

---

# Verdict

| Declaration family | Verdict |
|---|---|
| Integer quotient `RealizesIntegerModel` | **P0 DETACHED** |
| Rational quotient `RealizesRationalModel` | **P0 DETACHED** |
| Dedekind `RealizesRealModel` | **P0 DETACHED** |
| Cauchy `RealizesRealModel` | **P0 DETACHED** |
| Construction input adequacy | **SEPARATE MATHEMATICAL ISSUE** |
| Choice usage | **NONE** |

---

# Immediate repair order

1. make realization return types definitionally use the constructed carrier;
2. prove/register operations and certificates on that carrier;
3. then strengthen each construction input contract enough to discharge those certificates;
4. only after that rely on the packaged model in universal-property or comparison theorems.
