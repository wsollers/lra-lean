# Irrational Numbers and Mixed Arithmetic

## Definition of Rationality Inside a Real Construction

Let \(\iota:\mathbb Q\to\mathbb R\) be the selected rational embedding associated with a real construction.

A real number \(x\) is **rational** when it lies in the image of \(\iota\):

\[
\operatorname{Rational}(x)
\iff
\exists q\in\mathbb Q\;\bigl(\iota(q)=x\bigr).
\]

A real number \(x\) is **irrational** when it is not rational:

\[
\operatorname{Irrational}(x)
\iff
\neg\operatorname{Rational}(x).
\]

The irrational carrier is the subtype

\[
\mathbb I
=
\{x\in\mathbb R: \operatorname{Irrational}(x)\}.
\]

Irrationality is therefore relative to the selected copy of \(\mathbb Q\) inside the constructed real field. This avoids identifying rationality by presentation-dependent representatives.

## Rational Arithmetic Is Closed

The embedded rationals are closed under the field operations inherited from \(\mathbb R\).

### Theorem: Rational Closure Under Addition

For all \(x,y\in\mathbb R\),

\[
\operatorname{Rational}(x)\land\operatorname{Rational}(y)
\implies
\operatorname{Rational}(x+y).
\]

### Theorem: Rational Closure Under Negation

\[
\operatorname{Rational}(x)
\implies
\operatorname{Rational}(-x).
\]

### Theorem: Rational Closure Under Subtraction

\[
\operatorname{Rational}(x)\land\operatorname{Rational}(y)
\implies
\operatorname{Rational}(x-y).
\]

### Theorem: Rational Closure Under Multiplication

\[
\operatorname{Rational}(x)\land\operatorname{Rational}(y)
\implies
\operatorname{Rational}(xy).
\]

### Theorem: Rational Closure Under Inversion and Division

If \(x\neq0\), then

\[
\operatorname{Rational}(x)
\implies
\operatorname{Rational}(x^{-1}).
\]

If \(y\neq0\), then

\[
\operatorname{Rational}(x)\land\operatorname{Rational}(y)
\implies
\operatorname{Rational}(x/y).
\]

All Lean proofs of these statements are intentionally left as `sorry` until the corresponding rational embedding laws have been proved.

## Mixed Rational–Irrational Arithmetic

### Addition

For every rational \(q\) and irrational \(\alpha\),

\[
q+\alpha\in\mathbb I,
\qquad
\alpha+q\in\mathbb I.
\]

### Subtraction

For every rational \(q\) and irrational \(\alpha\),

\[
q-\alpha\in\mathbb I,
\qquad
\alpha-q\in\mathbb I.
\]

### Multiplication

The rational factor must be nonzero. If \(q\in\mathbb Q\), \(q\neq0\), and \(\alpha\in\mathbb I\), then

\[
q\alpha\in\mathbb I,
\qquad
\alpha q\in\mathbb I.
\]

The nonzero hypothesis is necessary because

\[
0\cdot\alpha=0\in\mathbb Q.
\]

### Division

If \(q\in\mathbb Q\), \(q\neq0\), and \(\alpha\in\mathbb I\), then

\[
\frac{\alpha}{q}\in\mathbb I,
\qquad
\frac{q}{\alpha}\in\mathbb I.
\]

Every irrational is nonzero because \(0\) is rational. The condition \(q\neq0\) in the second statement is necessary because

\[
\frac{0}{\alpha}=0\in\mathbb Q.
\]

## Negation

### Theorem: Negation Preserves Irrationality

\[
\alpha\in\mathbb I
\implies
-\alpha\in\mathbb I.
\]

## Irrationals Are Not Closed Under Arithmetic

Fix an irrational real \(\alpha\) with

\[
\alpha^2=2.
\]

The intended canonical witness is \(\alpha=\sqrt2\). In Lean, the construction is represented by a `SquareRootTwoWitness` containing:

- a real value \(\alpha\),
- a proof that \(\alpha^2\) is the embedded rational \(2\),
- a proof that \(\alpha\) is irrational.

The existence and irrationality proofs are left as `sorry` until square roots have been constructed in the chosen real model.

### Failure of Closure Under Addition

Both \(\alpha\) and \(-\alpha\) are irrational, but

\[
\alpha+(-\alpha)=0\in\mathbb Q.
\]

### Failure of Closure Under Subtraction

Both operands are irrational, but

\[
\alpha-\alpha=0\in\mathbb Q.
\]

### Failure of Closure Under Multiplication

\[
\alpha\alpha=2\in\mathbb Q.
\]

### Failure of Closure Under Division

Since \(\alpha\neq0\),

\[
\frac{\alpha}{\alpha}=1\in\mathbb Q.
\]

Therefore the irrational numbers are not closed under addition, subtraction, multiplication, or division.

## Proof-Readiness Requirements

The Lean module must satisfy the following:

1. Rationality is defined as membership in the image of the selected rational embedding.
2. Irrationality is the negation of rationality.
3. Mixed arithmetic theorems state all necessary nonzero hypotheses.
4. Counterexample theorems have genuine existential conclusions rather than the proposition `True`.
5. Square-root existence and irrationality are theorem obligations, not fabricated definitions.
6. Every unfinished proof body is `sorry`.
7. No definition contains `sorry`.
