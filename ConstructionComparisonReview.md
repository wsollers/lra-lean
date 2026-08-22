# LRA Real Construction Comparison Review

## Scope

Focused audit of the post-construction comparison/categoricity layer, especially `LRA/NumberSystems/RealNumbers/ConstructionModels.lean`.

Project rule: `sorry` proof bodies are neutral. The issue here is whether theorem types actually compare the concrete constructions named in their declarations.

---

# Generic `ModelIsomorphism`

The local `ModelIsomorphism first_model second_model` is a genuine bijective ordered-ring isomorphism shape:

- forward and inverse functions;
- left/right inverse laws;
- preservation of zero and one;
- preservation of addition and multiplication;
- preservation and reflection of order.

Although negation and inverse preservation are not explicit fields, they are derivable for unital field models from bijectivity plus preservation of the ring operations. This is not a substantive defect.

**Verdict: PASS.**

---

# Generic categoricity theorem

`complete_archimedean_ordered_fields_are_uniquely_isomorphic` states existence of a `ModelIsomorphism` between any two `RealModel`s and pointwise uniqueness of its forward map.

Given the project definition of `RealModel` as a complete ordered field over all `Set` subsets, this is the correct categoricity target. Completeness implies Archimedeanness, so the theorem name is mathematically appropriate even though Archimedeanness is not separately stored in `RealModel`.

**Verdict: mathematically sound target.**

---

# P0 — pairwise named construction comparisons do not compare the concrete constructions

The file declares comparison models such as

```text
DedekindCuts.real_model rational_model
CauchySequences.real_model rational_model
CantorNestedIntervals.real_model rational_model
PrimitiveIntervalQuotient.real_model rational_model
DyadicExpansions.real_model rational_model
```

but each is defined by selecting an arbitrary witness from a theorem of shape

```text
Nonempty RealModel.
```

The selected `RealModel` is not definitionally or propositionally tied to:

- `Dedekind.Cut rational_model`;
- `Cauchy.Carrier rational_model metric_data`;
- `Cantor.Carrier rational_model`;
- `PrimitiveIntervals.Carrier rational_model`;
- `Dyadic.Expansion`.

Therefore declarations such as

```text
dedekind_equiv_cauchy_exists
dedekind_equiv_cantor_exists
dedekind_equiv_interval_quotient_exists
dedekind_equiv_dyadic_exists
```

formally establish isomorphisms only between detached selected complete ordered fields.

They do **not** prove that the named concrete constructions are isomorphic.

This is the same semantic-detachment pattern previously identified in the `...RealizesRealModel` declarations, now propagated into the comparison layer.

**Severity: P0 SPECIFICATION / CONSTRUCTION-COUPLING DEFECT.**

---

# Why generic categoricity does not repair the problem automatically

Once two concrete construction carriers have genuinely been packaged as `RealModel`s, generic categoricity is exactly the right theorem to obtain their unique ordered-field isomorphism.

But the prerequisite is:

```text
RealModel.ofCarrier DedekindCarrier
RealModel.ofCarrier CauchyCarrier
...
```

with the actual construction operations/certificates installed.

The current comparison-model wrappers skip that prerequisite by selecting unrelated `RealModel` witnesses.

Thus the right repair is not to prove more pairwise isomorphism theorems. It is to repair the realization layer first.

---

# Legacy comparison definitions should not be authoritative

Earlier portions of `ConstructionModels.lean` also contain simplified comparison-only notions:

- Cauchy means constant sequence;
- Cauchy equivalence means pointwise equality;
- Cantor nesting/width conditions are bare propositions;
- Primitive-interval equivalence is literal equality;
- several operation-respects-equivalence theorems quantify arbitrary operations/setoids.

These are not faithful replacements for the dedicated construction modules.

Recommended status: **historical/comparison scaffold only** and eventually deprecate in favor of bridges to the concrete construction carriers.

---

# Correct comparison architecture

The desired architecture is:

```text
Concrete Dedekind carrier
  -> install operations/certificates
  -> DedekindRealModel : RealModel with Carrier := Cut ...

Concrete Cauchy carrier
  -> install operations/certificates
  -> CauchyRealModel : RealModel with Carrier := Cauchy.Carrier ...

Concrete PrimitiveIntervals carrier
  -> install operations/certificates
  -> PrimitiveIntervalsRealModel : RealModel with Carrier := Carrier ...
```

Then apply the single generic theorem

```text
complete_archimedean_ordered_fields_are_uniquely_isomorphic
```

to obtain all cross-construction equivalences.

If comparison maps should additionally commute with the selected rational embeddings, strengthen the comparison target to an isomorphism of `RealExtension`s over the same rational model, requiring

```text
comparison (iota₁ q) = iota₂ q.
```

That is the most canonical notion of “the two real constructions give the same extension of Q.”

---

# Recommended theorem hierarchy

1. `DedekindRealModel` tied to `Dedekind.Cut`;
2. `CauchyRealModel` tied to `Cauchy.Carrier`;
3. `PrimitiveIntervalsRealModel` tied to its quotient carrier;
4. corresponding `RealExtension` values with rational embeddings;
5. generic unique `RealModel` isomorphism;
6. prove it fixes the embedded rational field / package an extension isomorphism;
7. derive named pairwise comparison corollaries.

This avoids maintaining separate large pairwise proofs.

---

# Choice audit

`Classical.choice` used to choose one isomorphism from a single nonempty type is ordinary witness extraction, not family-wise AC.

No new genuine Choice dependency was identified.

---

# Verdict

| Dimension | Verdict |
|---|---|
| `ModelIsomorphism` shape | **PASS** |
| generic uniqueness of complete ordered fields | **PASS TARGET** |
| selected comparison `real_model`s | **P0 DETACHED FROM CONSTRUCTIONS** |
| named Dedekind/Cauchy/etc. pairwise comparisons | **P0 DO NOT FORMALLY COMPARE NAMED CARRIERS** |
| legacy Cauchy/Cantor/interval comparison predicates | **SCAFFOLD-ONLY / NOT AUTHORITATIVE** |
| preferred strategy | **REALIZE CONCRETE CARRIERS, THEN USE ONE GENERIC CATEGORICITY THEOREM** |
| Choice usage | **NO NEW GENUINE AC** |
