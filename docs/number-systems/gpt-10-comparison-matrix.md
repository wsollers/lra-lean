# Final Companion — Comparison Matrix of the Number Systems

## 0. Purpose

This document records the principal structures and properties gained, retained, or lost along the canonical chain. The matrix is a summary; every entry must cite a proved theorem in the relevant construction file before final publication.

## 1. Core Comparison Matrix

| System | Additive structure | Multiplicative structure | Ring/field status | Order | Order type | Completeness | Standard topology/metric | Cardinality | Characteristic |
|---|---|---|---|---|---|---|---|---|---|
| \(\mathbb N\) (one-based) | Commutative cancellative semigroup | Commutative monoid with identity \(1\) | No additive identity; not a semiring under the adopted convention | Compatible strict total order | Discrete; well-ordered | Not Dedekind complete as an ordered field notion; induction available | Discrete topology under the usual metric inherited later | Countably infinite | Not applicable until embedded in a unital ring |
| \(\mathbb W\) | Commutative monoid with identity \(0\) | Commutative monoid with identity \(1\) | Commutative semiring | Compatible total order | Discrete; well-ordered | Not a field; no order-field completeness | Discrete | Countably infinite | \(0\) in the semiring sense |
| \(\mathbb Z\) | Abelian group | Commutative monoid on all elements; nonzero cancellation | Discretely ordered integral domain | Compatible total order | Discrete; not well-ordered | Not order complete | Discrete in the usual metric | Countably infinite | \(0\) |
| \(\mathbb Q\) | Abelian group | Nonzero elements form an abelian group | Ordered field | Compatible total order | Dense; Archimedean | Not Dedekind complete; not Cauchy complete | Metric topology from \(|x-y|\); dense in \(\mathbb R\) | Countably infinite | \(0\) |
| \(\mathbb R\) | Abelian group | Nonzero elements form an abelian group | Complete Archimedean ordered field | Compatible total order | Dense; no endpoints | Dedekind complete and Cauchy complete | Connected, locally compact, second countable metric topology | Continuum | \(0\) |
| \(\overline{\mathbb R}\) | Partial extended addition | Partial extended multiplication | Not a field or ring | Complete total order with endpoints | Dense interior with \(\pm\infty\) endpoints | Every subset has extended supremum and infimum under stated conventions | Compact order topology; metrizable | Continuum | Not applicable |
| \(\mathbb C\) | Abelian group | Nonzero elements form an abelian group | Algebraically closed field | No compatible field order | Not orderable as a field | Complete as a metric field; algebraically closed | Connected, locally compact, second countable metric topology on \(\mathbb R^2\) | Continuum | \(0\) |
| \(\mathbb R_{\mathrm{comp}}\) | Abelian group | Nonzero elements form a group pointwise | Countable ordered subfield of \(\mathbb R\) | Inherited total order, not uniformly decidable from names | Dense in \(\mathbb R\) | Not complete as a metric subspace | Subspace topology; effectively represented | Countably infinite | \(0\) |
| \(\mathbb Q_p\) | Abelian group | Nonzero elements form an abelian group | Complete valued field | No compatible total order making it an ordered field | Ultrametric and non-Archimedean | Cauchy complete for \(|\cdot|_p\) | Totally disconnected, locally compact metric topology | Continuum | \(0\) |

## 2. Canonical-Map Matrix

| Map | Injective | Preserves \(+\) | Preserves \(\cdot\) | Preserves identities | Preserves/refects order | Dense image | Universal role |
|---|---:|---:|---:|---:|---:|---:|---|
| \(\mathbb N\to\mathbb W\) | Yes | Yes | Yes | Preserves \(1\); source has no \(0\) | Yes | No | Adjoins additive identity outside the image |
| \(\mathbb W\to\mathbb Z\) | Yes | Yes | Yes | Yes | Yes | No | Group completion of addition |
| \(\mathbb Z\to\mathbb Q\) | Yes | Yes | Yes | Yes | Yes | No in the usual topology on \(\mathbb Q\) | Fraction-field embedding |
| \(\mathbb Q\to\mathbb R\) | Yes | Yes | Yes | Yes | Yes | Yes | Metric/order completion |
| \(\mathbb R\to\mathbb C\) | Yes | Yes | Yes | Yes | Order not transported to a compatible complex-field order | Closed, not dense | Adjoins a root of \(x^2+1\); later algebraic closure theorem |

## 3. Gain-and-Loss Ledger

**Theorem 3.1 (Successive algebraic gains).**
The extension chain successively introduces:

1. an additive identity in \(\mathbb W\);
2. additive inverses in \(\mathbb Z\);
3. multiplicative inverses of nonzero elements in \(\mathbb Q\);
4. order completeness in \(\mathbb R\);
5. roots of every nonconstant complex polynomial in \(\mathbb C\).

**Theorem 3.2 (Successive losses or tradeoffs).**
The same chain exhibits the following tradeoffs:

1. well-ordering is lost when passing beyond the nonnegative discrete systems;
2. discreteness is lost at \(\mathbb Q\);
3. countability is lost at \(\mathbb R\);
4. compatible field order is lost at \(\mathbb C\);
5. full real completeness is not retained by the computable-real subfield.

## 4. Completion Comparison

| Completion | Starting object | Structure used | Result | Defining convergence |
|---|---|---|---|---|
| Dedekind completion | \(\mathbb Q\) | Linear order | \(\mathbb R\) | Cuts / least-upper-bound gaps |
| Cauchy completion | \(\mathbb Q\) | Usual metric | \(\mathbb R\) | \(|x_n-x_m|\to0\) |
| Primitive interval completion | Rational intervals | Nested enclosure and overlap | \(\mathbb R\) | Diameters vanish and families persistently overlap |
| \(p\)-adic completion | \(\mathbb Q\) | \(p\)-adic metric | \(\mathbb Q_p\) | \(|x_n-x_m|_p\to0\) |

## 5. Normalization Requirements

1. Replace every provisional matrix entry with an exact theorem citation.
2. Distinguish algebraic completeness, order completeness, and metric completeness.
3. Distinguish literal subset inclusion from canonical identification through embeddings.
4. Do not assign characteristic to systems before a unital ring structure is specified.
5. State topology relative to the metric or order structure that generates it.
