# LRA Measure Theory Review

## Scope

Maintained mathematical review of `LRA.Analysis.MeasureTheory`, measurable-space prerequisites, the function/preimage dependency layer, and the basic measure-space reference definitions.

Project-wide rules apply: `sorry` is neutral scaffolding; legitimate axioms are not penalized; genuine mathematical Choice is distinguished from witness extraction.

---

# Current measure-theory skeleton

`LRA.Analysis.MeasureTheory.lean` currently imports:

- measurable spaces;
- measure spaces;
- algebras of sets.

This is a reasonable early skeleton, not yet a full measure-theory curriculum.

The MeasureTheory algebra layer correctly aliases the canonical `LRA.SetSystems` structures instead of redefining ring/algebra/sigma-ring/sigma-algebra notions.

**Verdict: GOOD OWNERSHIP.**

---

# Measurable-space definition

`MeasurableSpaceDefinitionOn X` is standard:

1. empty set measurable;
2. complements measurable;
3. countable unions measurable.

**Verdict: PASS.**

Still expose the standard derived closure laws:

- universal set;
- finite union/intersection;
- difference;
- countable intersection;
- symmetric difference;
- countable De Morgan laws.

---

# P1 — measurable-space interop is scaffold-only

`MeasurableSpace/Interop/ToMathlib.lean` and `FromMathlib.lean` are currently only route comments.

Required bridge:

1. textbook record -> Mathlib `MeasurableSpace`;
2. reverse conversion;
3. equivalence of project `IsMeasurable` and Mathlib `MeasurableSet`;
4. compatibility/round-trip theorems.

**Severity: P1.**

---

# Measurable maps should be a thin layer over `LRA.Function`

The function review established that the full preimage calculus already exists:

- `PreimageClass`;
- union/empty/monotonicity;
- arbitrary/countable union;
- intersection/difference/complement/symmetric difference for functions;
- arbitrary/countable intersection;
- universal class;
- composition and identity preimages.

Therefore MeasureTheory should not introduce another preimage operation.

Recommended project-facing definition:

```text
MeasurableMap sourceSigma targetSigma f :=
  forall B, targetSigma.IsMeasurable B ->
    sourceSigma.IsMeasurable (PreimageClass f B)
```

Then prove:

- identity measurable;
- constant maps measurable;
- composition measurable;
- restrictions/inclusions measurable when the corresponding measurable-space constructions are available;
- product projections measurable once product measurable spaces exist.

**Severity: P1 MISSING LAYER; DEPENDENCIES ARE ALREADY STRONG.**

---

# P0 dependency correction — current `GeneratedSigmaAlgebra` is not sound generically

An earlier version of this review treated `LRA.SetSystems.GeneratedSigmaAlgebra` as a correct dependency. The deeper SetSystems audit found a counterexample; that earlier verdict is superseded.

Current membership definition quantifies over all sigma algebras on `ambient` that admit every generator. If **no** such sigma algebra exists, the condition is vacuously true for every set.

Example on ordinary `Set Nat`:

```text
ambient = empty set
generator G := G = {0}
```

No sigma algebra on the empty ambient can contain `{0}`, since every sigma member must be a subset of the ambient. Hence the universal implication defining generated membership is vacuous for every `A`. The current theorem `GeneratedSigmaAlgebraMembersAreSubsets` would then assert every `A ⊆ empty`, false.

**Severity: P0 in `SetSystemsReview.md`.**

## Consequence for measurable-map generator criteria

The desired theorem

> preimages of all generators measurable => map measurable for the generated sigma algebra

is still mathematically important, but it must wait for a corrected generated-sigma construction with an explicit admissibility/nonvacuity hypothesis.

Recommended generic premise:

```text
GeneratorAdmissible ambient generator :=
  exists sigma : SigmaAlgebraOfSets ambient,
    forall G, generator G -> sigma.IsMember G
```

On ordinary `Set X`, this can be derived from the fact that all generators are subsets of the ambient, using the full relative powerset sigma algebra.

---

# Borel construction is currently blocked by that P0

The intended idea

```text
Borel = sigma(open sets)
```

is correct.

But the temporary

```text
BorelSigmaAlgebra ambient opens := GeneratedSigmaAlgebra ambient opens
```

inherits the current generated-sigma defect.

The eventual topology-owned Borel layer should:

1. obtain open sets from an actual topology;
2. prove they lie inside the intended ambient carrier;
3. establish an admissible containing sigma algebra;
4. form the generated sigma algebra;
5. bridge it to Mathlib `BorelSpace`/`MeasurableSpace`.

Only after this correction should the project prove the generated-family measurable-map criterion and `continuous -> Borel measurable`.

---

# Product/subspace measurable-space roadmap

The reviewed function layer already provides:

- first projection `X × Y -> X`;
- second projection `X × Y -> Y`;
- pairing `z ↦ (f z, g z)`;
- composition;
- canonical preimage calculus.

So the future product measurable structure should be characterized as the smallest measurable structure making both projections measurable.

Then expose the universal property:

```text
Product f g is measurable
  iff f is measurable and g is measurable
```

under the appropriate product measurable structure.

For subspaces, define the induced measurable structure by preimages under the inclusion map and prove the inclusion measurable.

The current `LRA.Function.Canonical` tree is sparse beyond identity; named subset inclusions and quotient projections would be useful reusable maps but are not mathematical blockers for the first product-space implementation.

---

# Basic measure definition

`MeasureDefinition X measurableSets` has the correct core ideas:

```text
measure : Set X -> ENNReal
measure empty = 0
countable additivity on pairwise-disjoint measurable sequences.
```

## P1 — nonmeasurable-set values are unconstrained

The field is defined on all subsets while the axioms constrain measurable sets only. Two records can therefore encode the same textbook measure on the sigma algebra but differ arbitrarily outside it.

Recommended resolution:

1. measure on the subtype of measurable sets; or
2. explicit extensional equivalence ignoring nonmeasurable values; or
3. decisive bridge to Mathlib `Measure`, whose all-set semantics are fixed.

**Severity: P1 SEMANTIC/API ISSUE.**

The extra hypothesis asserting that the union of a measurable sequence is measurable is redundant by the measurable-space axioms.

**Severity: P2.**

---

# Basic measure consequences needed before integration

Add:

- finite additivity;
- monotonicity;
- countable subadditivity;
- continuity from below;
- continuity from above under finite-measure hypothesis;
- difference formula under appropriate finiteness;
- null-set consequences;
- increasing/decreasing union/intersection formulas;
- finite/probability/sigma-finite predicates if in scope.

---

# Examples and construction path

Sigma-algebra examples already exist in `SetSystems` and should be re-exported.

Project-facing measure examples still needed early:

- Dirac measure;
- counting measure.

Lebesgue measure should come later through the standard conceptual route:

1. premeasure;
2. outer measure;
3. Caratheodory measurable sets;
4. extension theorem;
5. completion;
6. Lebesgue measure;
7. product measure.

---

# Choice audit

No genuine family-wise Choice dependency was identified in the measurable-space or measurable-map architecture reviewed here.

The generated-sigma P0 is an admissibility/nonvacuity problem, not a Choice problem.

---

# Current readiness verdict

| Dimension | Verdict |
|---|---|
| Sigma-algebra ownership | **PASS** |
| Measurable-space definition | **PASS** |
| Derived measurable-set closure | **NEEDS BUILDOUT** |
| Measurable-space <-> Mathlib interop | **P1 PLACEHOLDER** |
| Function/preimage dependency layer | **PASS — STRONG** |
| Measurable-map layer | **MISSING / P1** |
| Generated sigma algebra dependency | **P0 — MUST FIX FIRST** |
| Borel construction | **CORRECT IDEA, CURRENTLY BLOCKED BY P0** |
| Product/subspace measurable spaces | **NOT YET BUILT** |
| Basic measure axiom | **CORE IDEA PASS** |
| Nonmeasurable-set measure semantics | **P1** |
| Dirac/counting examples | **MISSING / P1** |
| Ready for integration | **NO** |

---

# Immediate priority order

1. fix `GeneratedSigmaAlgebra` admissibility/nonvacuity P0;
2. fix the function empty-index intersection P0 in `FunctionReview.md`;
3. complete measurable-space <-> Mathlib interop;
4. add the thin measurable-map predicate over canonical `PreimageClass`;
5. prove identity/composition/constant measurability;
6. build product and subspace measurable structures using canonical projections/inclusions;
7. after generated-sigma repair, add generator measurability criterion;
8. connect topology -> Borel sigma algebra -> measurable space;
9. prove continuous -> Borel measurable;
10. resolve measure semantics/interop and add basic measure consequences;
11. add Dirac/counting examples;
12. only then begin integration/simple functions.
