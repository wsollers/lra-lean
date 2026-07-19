# Volume III Interoperability and Substitutability Tests

## Purpose

Volume III tests each completed Volume II construction against the corresponding Lean or Mathlib reference type. The tests begin only after the required isomorphism theorem has been stated.

The construction-specific isomorphism proofs remain `sorry` until their place in the proof queue. Test modules may be compiled while depending on those pending theorems, but they are not considered verified until the isomorphism theorem and all preservation theorems are proved without `sorryAx`.

## Test architecture

Each construction receives a dedicated module under

```text
LRA/VolumeIII/Interop/<Construction>NameIsomorphism.lean
```

and, when useful, a separate test module under

```text
LRA/VolumeIII/Tests/<Construction>NameTests.lean
```

The interoperability module contains:

1. conversion functions;
2. inverse theorem statements;
3. the structured isomorphism object;
4. operation-preservation theorem statements;
5. order-preservation and reflection theorem statements;
6. commuting theorems for named functions and embeddings.

The test module contains concrete examples and generic transport checks.

## Required test groups

### Carrier substitutability

Test both directions of transport:

```lean
example (value : Reference) :
    toReference (fromReference value) = value := by
  exact to_reference_after_from_reference value

example (value : Constructed) :
    fromReference (toReference value) = value := by
  exact from_reference_after_to_reference value
```

Test equality reflection:

```lean
example (left right : Constructed) :
    left = right ↔ toReference left = toReference right := by
  exact equality_substitutability bridge left right
```

### Constants and numerals

Test:

- zero;
- one;
- two and several larger positive numerals;
- negative numerals for integer-like systems;
- representative variants of the same quotient value.

### Arithmetic operations

Test the native constructed operations:

- addition;
- negation;
- subtraction;
- multiplication;
- exponentiation by natural exponents;
- inversion and division for fields.

The test must evaluate the constructed operation first and then transport the result. A wrapper that performs the operation directly in the reference type does not count.

Correct pattern:

```lean
example (left right : Constructed) :
    toReference (constructedAdd left right) =
      toReference left + toReference right := by
  exact map_add left right
```

Rejected pattern:

```lean
def fakeTest (left : Constructed) (right : Reference) : Reference :=
  toReference left + right
```

### Order

For ordered systems, test:

- equality;
- strict order;
- non-strict order;
- trichotomy transport;
- minimum and maximum when defined;
- monotonicity of addition;
- positivity behavior under multiplication.

Order tests must cover preservation and reflection, not only one implication.

### Public functions

Test all named public functions that exist for the construction, including as applicable:

- successor and predecessor;
- absolute value and sign;
- quotient and remainder;
- divisibility;
- floor and ceiling;
- numerator, denominator, and normalization;
- conjugation;
- real and imaginary parts;
- norm;
- canonical embeddings.

### Quotient representative independence

For quotient constructions, provide multiple representatives of the same value and test that:

- they are equivalent under the defining relation;
- their quotient classes are equal;
- every induced operation gives equal quotient results;
- every induced predicate or order relation has the same truth value.

Examples include:

- integer formal differences `(a,b)` and `(a+c,b+c)`;
- rational fractions `a/b` and `(ka)/(kb)` for positive nonzero `k`;
- equivalent Cauchy sequences;
- equivalent nested interval sequences;
- equivalent dyadic expansions.

### Embedding tower

Test the canonical embeddings and their composition:

- natural to whole;
- whole to integer;
- integer to rational;
- rational to real;
- real to complex.

For each embedding, test constants, arithmetic, injectivity, order where applicable, and commutation with the reference embedding.

## Construction matrix

Each completed construction receives its own bridge even when several constructions target the same reference type.

| Construction | Reference | Required structure |
|---|---|---|
| Peano naturals | `Nat` | ordered semiring and recursion functions |
| whole numbers | `Nat` | ordered semiring |
| canonical integers | `Int` | ordered ring |
| Tao integers | `Int` | ordered ring |
| Mendelson integers | `Int` | ordered ring and positive-part recovery |
| Polish integers | `Int` | ordered ring, successor, predecessor |
| canonical rationals | `Rat` | ordered field |
| reduced rationals | `Rat` | ordered field and normalization |
| fraction-field rationals | `Rat` | ordered field |
| Dedekind reals | `Real` | complete ordered field |
| Cauchy reals | `Real` | complete ordered field |
| Cantor reals | `Real` | complete ordered field |
| primitive interval reals | `Real` | complete ordered field |
| dyadic reals | `Real` | complete ordered field |
| constructed complex numbers | `Complex` | field, conjugation, projections, norm |

## Test completion status

A test suite has three statuses:

1. **scaffolded** — final test statements exist, but the isomorphism or preservation proofs contain `sorry`;
2. **compiled** — the suite builds, possibly with `sorryAx`;
3. **verified** — the suite builds and every required bridge theorem is free of `sorryAx`.

Concrete examples must not be reported as proof that a construction is correct. The isomorphism and structure-preservation theorems are the correctness result; the examples are regression tests and demonstrations.

## CI requirements

Volume III CI shall:

- build every interoperability and test module;
- report `#print axioms` for each construction-specific isomorphism theorem;
- fail if a suite is labeled verified while depending on `sorryAx`;
- fail if a test computes through a reference-type wrapper instead of the native constructed operation;
- maintain a generated matrix of scaffolded, compiled, and verified suites.
