# Part 7E — The Real Numbers by Binary Expansions

## 0. Purpose

This construction represents real numbers by canonical signed binary expansions. The ambiguity
\[
0.1000\ldots=0.0111\ldots
\]
is resolved by excluding fractional expansions that are eventually all \(1\).

## 1. Dyadic Rationals

**Definition 1.1 (Dyadic rational).**
A dyadic rational is a rational number of the form
\[
\frac{m}{2^n}
\]
with \(m\in\mathbb Z\) and \(n\in\mathbb W\).

**Theorem 1.2 (Dyadic subring).**
The set \(\mathbb D\) of dyadic rationals is an ordered subring of \(\mathbb Q\).

**Theorem 1.3 (Density of dyadic rationals).**
If \(x,y\in\mathbb Q\) and \(x<y\), then there exists \(d\in\mathbb D\) such that
\[
x<d<y.
\]

## 2. Binary Fractional Expansions

**Definition 2.1 (Binary digit sequence).**
A binary digit sequence is a sequence \((d_n)_{n\in\mathbb N}\) with \(d_n\in\{0,1\}\) for every \(n\).

**Definition 2.2 (Canonical binary digit sequence).**
A binary digit sequence is canonical if it is not eventually equal to \(1\).

**Definition 2.3 (Partial sums).**
For a binary digit sequence \((d_n)\), define
\[
s_N:=\sum_{n=1}^{N}d_n2^{-n}.
\]

**Theorem 2.4 (Partial sums are Cauchy).**
For every binary digit sequence, \((s_N)\) is a rational Cauchy sequence.

**Definition 2.5 (Value of a fractional expansion).**
Define
\[
\operatorname{val}(d_1d_2\ldots):=[s_N]\in\mathbb R_C.
\]

**Theorem 2.6 (Binary-tail ambiguity).**
Every expansion that is eventually all \(1\) has the same value as a unique terminating expansion obtained by carrying to the preceding digit.

**Theorem 2.7 (Uniqueness of canonical fractional expansions).**
Two canonical binary digit sequences have the same value if and only if they are termwise equal.

## 3. Signed Binary Reals

**Definition 3.1 (Unsigned binary expansion).**
An unsigned binary expansion consists of a canonical finite binary numeral for the integer part and a canonical binary fractional digit sequence.

**Definition 3.2 (Value of an unsigned expansion).**
If the integer digits are \((e_k,\ldots,e_0)\) and the fractional digits are \((d_n)\), define the value by
\[
\sum_{j=0}^{k}e_j2^j+\operatorname{val}(d_1d_2\ldots).
\]

**Definition 3.3 (Canonical signed binary real).**
A canonical signed binary real is either zero or a pair \((\sigma,u)\), where \(\sigma\in\{-1,1\}\) and \(u\) is a nonzero unsigned binary expansion.

**Definition 3.4 (Value map).**
Define \(V:\mathbb R_B\to\mathbb R_C\) by sending zero to \(0_C\) and \((\sigma,u)\) to \(\sigma\) times the Cauchy-real value of \(u\).

**Theorem 3.5 (Existence of canonical binary expansions).**
Every Cauchy real number is the value of a canonical signed binary real.

**Theorem 3.6 (Uniqueness of canonical signed binary expansions).**
The value map \(V\) is injective.

**Theorem 3.7 (Binary representation theorem).**
The value map \(V\) is a bijection from canonical signed binary expansions to \(\mathbb R_C\).

## 4. Transported Structure

**Definition 4.1 (Arithmetic and order on binary reals).**
Transport addition, multiplication, zero, one, additive inverses, reciprocals, and strict order from \(\mathbb R_C\) through \(V\).

**Theorem 4.2 (Ordered-field isomorphism).**
The map \(V:\mathbb R_B\to\mathbb R_C\) is an ordered-field isomorphism.

**Corollary 4.3 (Completeness).**
The binary real numbers form a complete Archimedean ordered field.

## 5. Normalization Requirements

- Distinguish digit strings from their values.
- Exclude eventually-all-\(1\) tails to obtain uniqueness.
- Prove the representation theorem before identifying expansions with real numbers.
- Prefer transported arithmetic to informal carry algorithms unless the carry algorithms are separately formalized.

## 6. Streamlined quotient-operation workflow

All quotient operations in this file should use the abstract descent machinery in `gpt-00-abstract-laws.md`.

For each raw binary operation \(O\) on representatives:

1. define \(O\) before defining the class operation;
2. prove that \(O\) respects the equivalence relation in the first argument;
3. prove right respect separately, or derive it from commutativity;
4. invoke the induced-operation theorem to obtain the operation on classes.

For each unary operation, predicate, or order relation:

1. define it on representatives;
2. prove representative independence;
3. invoke the corresponding induced unary-operation, predicate, or relation theorem.
