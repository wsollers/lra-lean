# LRA Integer Construction Bridges Review

## Scope

Focused review of the transition from natural/whole-number arithmetic into the concrete integer constructions, especially:

- `NaturalNumbers/Constructions/WholeNumbers`;
- `Integers/Constructions/QuotientOrderedPairs`;
- Tao formal differences;
- Mendelson positive-pair construction;
- Polish two-sided-successor integers;
- registration into `LRA.AlgebraicStructures` and `IntegerStructure`.

Project rule: `sorry` proof bodies are neutral. Statements whose hypotheses do not imply their conclusions, and realization records detached from their intended carrier, are not neutral.

---

# Files reviewed

- `LRA/NumberSystems/NaturalNumbers/Constructions/WholeNumbers/Carrier.lean`
- `.../Operations.lean`
- `.../Laws.lean`
- `.../Instances.lean`
- `LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/*`
- `LRA/NumberSystems/Integers/Constructions/Tao/Carrier.lean`
- `LRA/NumberSystems/Integers/Constructions/Mendelson/Carrier.lean`
- `LRA/NumberSystems/Integers/Constructions/Polish/TwoSidedSuccessor/Carrier.lean`
- `.../Instances.lean`

---

# WholeNumbers: good carrier, weak source contract

The carrier construction

```text
Option Element
```

is a clean way to adjoin a new zero to a one-based positive-natural carrier:

```text
none   = 0
some n = embedded positive natural n.
```

Addition and multiplication extend the positive-natural operations with zero as additive identity / multiplicative absorber.

The certificate-builder layer is architecturally strong: derived facts are fed into the canonical `LRA.AlgebraicStructures` law families instead of defining another semiring hierarchy.

However, the input record

```text
NaturalArithmeticForWholeNumbers
```

contains only

```text
model : PeanoSystem Element SetObject
strictOrder : Element -> Element -> Prop
```

with no laws imposed on `strictOrder`.

Nevertheless `ordered_semiring_structure` claims totality, transitivity, translation invariance, and positive-multiplication compatibility for the induced order.

Taking `strictOrder := False` gives an immediate counterexample.

**Severity: P0 INPUT CONTRACT TOO WEAK.**

The source Peano model also inherits the generic backend-strength issue from `PeanoNaturalNumbersReview.md`: recursion-derived arithmetic is only justified once full predicate induction / subset adequacy is available.

---

# Missing canonical bridge into formal-difference integers

`QuotientOrderedPairs` does not consume WholeNumbers' canonical algebra/order certificates directly. Instead it introduces the bespoke record

```text
WholeNumberArithmeticForQuotientPairs
```

and manually repeats operation and order laws.

The reviewed repository search found no adapter from the WholeNumbers certificate builders into this record.

This is likely the architectural source of the under-specification previously found in the quotient construction.

The bespoke record omits requirements later needed for the advertised integer structure, including at least:

- nontriviality;
- no-zero-divisors/domain strength;
- totality/discreteness of order;
- order translation reflection/cancellation.

In particular, representative-order well-definedness needs a law such as

```text
a + c <= b + c <-> a <= b
```

not merely preservation in one direction.

## Recommended bridge

Define one construction-facing certificate, preferably in terms of the canonical law classes, e.g. conceptually:

```text
structure WholeNumberLawsForIntegerCompletion (W : Type) where
  semiring : ... canonical semiring/domain laws ...
  linearOrder : ...
  addOrderCancellation : forall a b c, a + c <= b + c <-> a <= b
  discreteness : ...
```

or avoid a bespoke structure entirely by taking the relevant typeclass certificates as parameters.

Then provide an adapter from a correctly certified `WholeNumbers` carrier.

---

# Tao and Mendelson inherit the same weak contract

Tao's construction defines

```text
WholeNumberArithmeticForTaoFormalDifferences :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs
```

and Mendelson defines

```text
PositiveNaturalPairData :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs.
```

Thus these are not independent input specifications: they inherit exactly the same strengths and weaknesses as the default quotient-pairs interface.

This is good reuse mechanically, but it means fixing the shared input contract is prerequisite to all three constructions.

**Severity: inherited P0 until the common input contract is strengthened.**

---

# Polish two-sided successor construction

The Polish construction is substantially cleaner.

Its carrier is an explicit inductive disjoint union:

```text
zero
positive successor ray
negative predecessor ray
```

with successor and predecessor defined by structural recursion.

It then registers:

- additive laws;
- multiplicative laws;
- nontriviality;
- no-zero-divisors;
- partial/linear order certificates;
- order compatibility;
- order discreteness;
- successor/predecessor laws;
- successor-as-add-one;
- multiplication step laws;
- two-sided discreteness/induction.

The smoke tests synthesize canonical `CommutativeRingLaws`, `IntegralDomainLaws`, `LinearOrderLaws`, and `OrderedRingLaws`.

This is exactly the intended machine -> theorem -> certificate architecture.

Its realization into generic `IntegerStructure` uses

```text
PredicateSet Z
```

so full two-sided predicate induction is available; it is not affected by the arbitrary-backend categoricity defect except when passed through the overly generic theorem signature.

**Verdict: PASS / STRONG ARCHITECTURAL EXAMPLE.**

---

# Recommended integer-tower architecture

The desired path should be:

```text
Strong Peano / natural realization
    |
    v
Certified zero-based WholeNumbers
  - commutative cancellative additive monoid
  - nontrivial commutative semiring / domain properties
  - linear discrete order
  - order-operation compatibility
  - translation cancellation
    |
    v
FormalDifferenceCompletion
  - QuotientOrderedPairs
  - Tao presentation
  - Mendelson presentation
    |
    v
Canonical integer certificates
  - CommutativeRingLaws
  - IntegralDomainLaws
  - LinearOrderLaws
  - OrderedRingLaws
  - OrderDiscretenessLaw
    |
    +--> bridge to successor-based IntegerStructure
```

The Polish construction provides an independent direct route to the same canonical integer certificates.

A later comparison theorem should then prove the concrete constructions isomorphic as ordered rings / integer structures rather than relying on broad model names.

---

# Choice audit

No new genuine family-wise Choice usage was found.

- the `Classical.choose` calls used to select quotient operations from already-proved unique/existence theorems are ordinary witness extraction;
- the issues here concern missing algebra/order hypotheses and backend induction strength, not AC.

---

# Verdict

| Area | Verdict |
|---|---|
| WholeNumbers `Option` carrier | **PASS** |
| WholeNumbers arithmetic extension idea | **PASS** |
| WholeNumbers source order contract | **P0 TOO WEAK** |
| WholeNumbers canonical certificate builders | **GOOD ARCHITECTURE** |
| WholeNumbers -> quotient-pairs canonical adapter | **MISSING** |
| QuotientOrderedPairs shared input contract | **P0 TOO WEAK** |
| Tao formal-difference input | **INHERITS SAME P0** |
| Mendelson positive-pair input | **INHERITS SAME P0** |
| Polish carrier and law certification | **PASS / STRONG** |
| Polish `IntegerStructure` realization backend | **PASS (`PredicateSet`)** |
| Choice usage | **NO NEW GENUINE AC** |

---

# Immediate repair order

1. strengthen `NaturalArithmeticForWholeNumbers` with actual source order laws / canonical certificates;
2. establish full-induction adequacy before using generic Peano recursion to define arithmetic;
3. replace or strengthen `WholeNumberArithmeticForQuotientPairs` using canonical structure certificates;
4. add a direct adapter from certified WholeNumbers into the formal-difference input;
5. let QuotientOrderedPairs, Tao, and Mendelson all consume the strengthened shared interface;
6. register the quotient carrier directly into canonical integer law certificates;
7. add an explicit bridge between ordered-ring discreteness and successor-based `IntegerStructure` for concrete integers;
8. prove comparison/isomorphism among Polish, quotient-pairs, Tao, and Mendelson only after their individual certificates are sound.
