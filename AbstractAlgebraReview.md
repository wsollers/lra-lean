# LRA Abstract Algebra Review

## Scope

Maintained mathematical review of the reference abstract-algebra definitions under `LRA.Algebra.AbstractAlgebra` and their suitability as upstream algebraic vocabulary for number systems, linear algebra, and analysis.

Project-wide rules apply: `sorry` proof bodies are neutral; genuine definition defects and missing law hypotheses are not.

---

# Files reviewed

- `LRA/Algebra.lean`
- `LRA/Algebra/AbstractAlgebra.lean`
- `LRA/Algebra/AbstractAlgebra/Definition/Structures.lean`

---

# Semigroup

`SemigroupDefinition` consists of a binary operation together with associativity.

**Verdict: PASS.**

---

# Monoid

`MonoidDefinition` extends the semigroup data with an identity and both left/right identity laws.

**Verdict: PASS.**

---

# Group

`GroupDefinition` extends the monoid with an inverse operation and the single axiom

```text
inv(a) * a = 1.
```

Because the underlying multiplication is associative and already has a two-sided identity, a left inverse for every element is sufficient to derive the corresponding right-inverse law.

So this is a legitimate economical group axiom system.

Recommended derived theorems include:

- right inverse;
- inverse uniqueness;
- inverse of identity;
- inverse of inverse;
- inverse of a product;
- cancellation laws.

**Verdict: PASS.**

---

# Ring

`RingDefinition` gives:

- an abelian additive group in economical left-inverse form;
- associative multiplication with a two-sided unit;
- both distributive laws.

The omitted right additive identity/right inverse are derivable from additive commutativity.

This is a standard unital ring definition; multiplication is intentionally not assumed commutative.

**Verdict: PASS.**

---

# P0/P1 — `FieldDefinition` lacks nontriviality

`FieldDefinition` extends `RingDefinition` with:

```text
mul_comm
inv : K -> K
forall a, a != 0 -> inv(a) * a = 1.
```

But it does **not** require

```text
0 != 1.
```

Consequently the one-element zero ring satisfies the entire structure:

- all ring laws hold;
- multiplication is commutative;
- the inverse condition is vacuous because no element is nonzero.

Thus the current record includes the trivial ring and is not the standard field notion used by Mathlib or ordinary analysis/algebra.

## Required repair

Add an explicit nontriviality axiom, preferably

```text
zero_ne_one : zero != one.
```

Equivalent formulations are possible, but the project should expose this requirement by name because it is an important law-certification fact for concrete number systems.

After that, derive:

- nonzero inverses are also right inverses;
- inverse of a nonzero element is nonzero;
- no zero divisors;
- multiplicative cancellation for nonzero factors;
- quotient/division laws.

**Severity: P0/P1 FOUNDATIONAL DEFINITION DEFECT.**

It is P0 if this record is already being used as the project's actual notion of field; P1 if it remains orientation-only reference data as the file comment suggests.

---

# `AlgebraicStructureDefinition` is not really an algebraic-structure package

Current shape:

```text
structure AlgebraicStructureDefinition where
  Carrier : Type
  structureData : Carrier -> Prop
```

A predicate on **elements** of the carrier does not package algebraic operations and laws on that carrier. For example, it cannot by itself distinguish two different group structures on the same underlying type.

If the intent is merely “a carrier together with a distinguished unary property,” rename it accordingly.

If the intent is a generic package for one of the reference structures, use a genuinely structural representation, for example a tagged/sigma-style package whose data contains the selected operations/laws, or avoid this wrapper entirely and keep the typed structures separate.

**Severity: P1 MODELING/NAMING ISSUE.**

---

# Relationship to the operation-law architecture

For the project's Landau-style design, the most valuable abstraction is not merely a parallel list of bundled structures but explicit named law predicates and certification theorems.

Recommended dependency direction:

```text
binary operation
  -> associative / commutative / identity / inverse laws
  -> Semigroup certificate
  -> Monoid certificate
  -> Group certificate

(additive group + multiplicative monoid + distributivity)
  -> Ring certificate

(commutative ring + nontriviality + inverse law for nonzero elements)
  -> Field certificate.
```

This allows concrete systems such as integers, rationals, reals, modular systems, polynomial rings, and function spaces to prove exactly which law requirements they satisfy.

For each bundled structure, expose theorem-level equivalences or constructors saying precisely which named laws are necessary and sufficient.

---

# Interop

The file comment says these structures are reference/orientation data and formal proofs should use Mathlib's hierarchy.

That is reasonable, but if these names are intended to appear in notes and learning proofs, add explicit bridges:

```text
SemigroupDefinition <-> Mathlib Semigroup data
MonoidDefinition <-> Mathlib Monoid data
GroupDefinition <-> Mathlib Group data
RingDefinition <-> Mathlib Ring data
FieldDefinition <-> Mathlib Field data
```

The `FieldDefinition` bridge cannot be correct until nontriviality is added.

---

# Examples and failure modes worth adding

High-value examples:

- `Nat` under addition: commutative monoid, not group;
- `Int` under addition: abelian group;
- `Int` with `+` and `*`: commutative ring, not field;
- `Rat` / `Real`: fields;
- matrices: rings, generally noncommutative;
- functions `X -> R` under pointwise operations: rings when `R` is a ring.

High-value failure separators:

- associative operation need not have identity;
- monoid need not have inverses;
- group need not be commutative;
- ring need not be commutative;
- commutative ring need not be a field;
- the trivial ring demonstrates why `0 != 1` is a genuine field requirement;
- integral domains and division rings should be distinguished from fields if/when added.

---

# Choice audit

No Axiom-of-Choice dependency is inherent in these algebraic definitions.

Existence of bases belongs to linear algebra and is audited separately; it should not leak into the elementary group/ring/field hierarchy.

---

# Verdict

| Dimension | Verdict |
|---|---|
| Semigroup definition | **PASS** |
| Monoid definition | **PASS** |
| Group definition | **PASS — economical axiom system** |
| Ring definition | **PASS** |
| Field inverse law | **PASS IN SHAPE** |
| Field nontriviality `0 != 1` | **MISSING / FOUNDATIONAL DEFECT** |
| Generic algebraic-structure package | **P1 MIS-MODELED / MISNAMED** |
| Mathlib interop | **NOT LOCATED** |
| Law-certificate bridge | **NEEDS BUILDOUT** |
| Choice usage | **NONE** |

---

# Immediate implementation order

1. add `zero_ne_one` to `FieldDefinition`;
2. derive standard group/ring/field consequences rather than adding redundant axioms;
3. connect these bundles to the project's named operation-law predicates;
4. repair or rename `AlgebraicStructureDefinition`;
5. add Mathlib interop;
6. add canonical examples and failure separators;
7. build the missing linear-subspace/span/basis hierarchy on top of the corrected field/vector-space foundation.
