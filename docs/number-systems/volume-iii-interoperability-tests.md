# Volume III Interoperability and Unit-Test Standard

## Purpose

Volume II constructs number systems from first principles. Volume III may use
Mathlib and therefore verifies each completed construction against the canonical
Lean/Mathlib presentation.

A construction is not considered interoperability-tested until there is a proved
isomorphism or equivalence to the appropriate reference type and all native
operations used by the construction commute with that bridge.

## Reference carriers

| Constructed system | Reference carrier | Required bridge |
|---|---|---|
| one-based positive naturals | `PNat` or the chosen positive-natural reference | successor/order isomorphism |
| whole numbers | `Nat` | semiring and order isomorphism |
| canonical integers | `Int` | ordered-ring isomorphism |
| Tao integers | `Int` | ordered-ring isomorphism |
| Mendelson integers | `Int` | ordered-ring isomorphism |
| canonical rationals | `Rat` | ordered-field isomorphism |
| reduced rationals | `Rat` | ordered-field isomorphism |
| fraction-field rationals | `Rat` | ordered-field isomorphism |
| Dedekind reals | `Real` | complete ordered-field isomorphism |
| Cauchy reals | `Real` | complete ordered-field isomorphism |
| Cantor interval reals | `Real` | complete ordered-field isomorphism |
| primitive interval quotient reals | `Real` | complete ordered-field isomorphism |
| dyadic reals | `Real` | complete ordered-field isomorphism |
| complex numbers | `Complex` | field isomorphism preserving conjugation |

The exact reference type for positive naturals must be fixed once and used
consistently. Do not silently switch between `Nat`, `PNat`, and a subtype.

## Required proof obligations

Each bridge must prove:

1. forward and inverse maps;
2. left-inverse and right-inverse laws;
3. preservation of zero and one when present;
4. preservation of addition;
5. preservation of negation and subtraction when present;
6. preservation of multiplication;
7. preservation of inverse and division away from zero when present;
8. preservation and reflection of strict and non-strict order for ordered systems;
9. preservation of canonical embeddings from the previous number system;
10. preservation of construction-specific functions, such as successor,
    predecessor, absolute value, floor, ceiling, conjugation, real part, and
    imaginary part;
11. compatibility with quotient representatives where the carrier is a quotient.

## Required test categories

Every completed bridge receives examples in the following categories.

### Round-trip and substitutability

- constructed -> reference -> constructed;
- reference -> constructed -> reference;
- equality reflection through the bridge;
- substitution into unary functions;
- substitution into binary functions;
- substitution into predicates and relations.

### Constants and numerals

- zero;
- one;
- positive numerals;
- negative numerals where applicable;
- canonical images of the previous system.

### Arithmetic

- addition in all sign combinations;
- additive inverse;
- subtraction;
- multiplication in all sign combinations;
- zero absorption;
- powers;
- inverse and division, including explicit nonzero hypotheses;
- Euclidean quotient and remainder where applicable.

### Order

- strict order;
- non-strict order;
- equality and trichotomy examples;
- monotonicity of addition;
- sign-sensitive multiplication inequalities;
- density for rationals;
- discreteness for integers;
- least-upper-bound examples for real constructions.

### Functions

Test every native named function exposed by the construction. The test must use
the native constructed function and then transport its output. A wrapper defined
by converting to the reference type, computing there, and converting back does not
count as a test of the construction.

### Quotient behavior

For quotient constructions, include examples showing that distinct representatives
of the same value:

- are equivalent;
- map to the same reference value;
- produce equivalent results under every representative operation;
- cannot change order or predicate truth values.

## Acceptance rule

Examples depending on a theorem containing `sorry` compile but do not establish
correctness. The website and proof scoreboard must distinguish:

- bridge statement present;
- bridge proof pending;
- bridge proved;
- interoperability examples compiled using a proved bridge.

A construction is green only in the final category.
