# Part 10 — The Complex Numbers \(\mathbb C\)

## 0. Purpose

The complex numbers are constructed as ordered pairs of real numbers. No quotient is required.

## 1. Construction and Operations

**Definition 1.1 (Complex numbers).**
Define
\[
\mathbb C:=\mathbb R\times\mathbb R.
\]

**Definition 1.2 (Complex addition).**
For \((a,b),(c,d)\in\mathbb C\), define
\[
(a,b)+(c,d):=(a+c,b+d).
\]

**Definition 1.3 (Complex multiplication).**
For \((a,b),(c,d)\in\mathbb C\), define
\[
(a,b)(c,d):=(ac-bd,ad+bc).
\]

**Definition 1.4 (Zero, one, and additive inverse).**
Define
\[
0_{\mathbb C}:=(0,0),
\qquad
1_{\mathbb C}:=(1,0),
\qquad
-(a,b):=(-a,-b).
\]

## 2. Field Structure

**Theorem 2.1 (Additive laws).**
Complex addition is associative and commutative, \(0_{\mathbb C}\) is its identity, and every \(z\in\mathbb C\) has the stated additive inverse.

**Theorem 2.2 (Multiplicative laws).**
Complex multiplication is associative and commutative, \(1_{\mathbb C}\) is its identity, and multiplication distributes over addition.

**Definition 2.3 (Complex conjugate).**
For \(z=(a,b)\), define
\[
\overline z:=(a,-b).
\]

**Theorem 2.4 (Conjugation identities).**
For all \(z,w\in\mathbb C\),
\[
\overline{z+w}=\overline z+\overline w,
\qquad
\overline{zw}=\overline z\,\overline w,
\qquad
\overline{\overline z}=z.
\]
If \(z=(a,b)\), then
\[
z\overline z=(a^2+b^2,0).
\]

**Theorem 2.5 (Positive denominator for nonzero complex numbers).**
If \((a,b)\ne(0,0)\), then \(a^2+b^2>0\).

**Definition 2.6 (Multiplicative inverse).**
For \(z=(a,b)\ne0_{\mathbb C}\), define
\[
z^{-1}:=
\left(
\frac{a}{a^2+b^2},
-\frac{b}{a^2+b^2}
\right).
\]

**Theorem 2.7 (Correctness of the inverse formula).**
For every nonzero \(z\in\mathbb C\),
\[
zz^{-1}=1_{\mathbb C}=z^{-1}z.
\]

**Theorem 2.8 (Field structure).**
The structure \((\mathbb C,+,\cdot,0_{\mathbb C},1_{\mathbb C})\) is a field.

## 3. Real Embedding and Standard Form

**Definition 3.1 (Real embedding).**
Define \(\iota:\mathbb R\to\mathbb C\) by
\[
\iota(x):=(x,0).
\]

**Theorem 3.2 (The real embedding is a field embedding).**
The map \(\iota\) is injective and preserves zero, one, addition, and multiplication.

**Definition 3.3 (Imaginary unit).**
Define
\[
i:=(0,1).
\]

**Theorem 3.4 (The imaginary unit squares to minus one).**
The element \(i\) satisfies
\[
i^2=-1_{\mathbb C}.
\]

**Theorem 3.5 (Standard form).**
Every \(z=(a,b)\in\mathbb C\) satisfies
\[
z=\iota(a)+\iota(b)i.
\]
After identifying \(\mathbb R\) with its image, write \(z=a+bi\).

## 4. Real and Imaginary Parts

**Definition 4.1 (Real part).**
Define \(\operatorname{Re}:\mathbb C\to\mathbb R\) by \(\operatorname{Re}(a,b):=a\).

**Definition 4.2 (Imaginary part).**
Define \(\operatorname{Im}:\mathbb C\to\mathbb R\) by \(\operatorname{Im}(a,b):=b\).

**Theorem 4.3 (Coordinate recovery and equality).**
For every \(z\in\mathbb C\),
\[
z=\iota(\operatorname{Re}z)+\iota(\operatorname{Im}z)i.
\]
Moreover,
\[
z=w
\quad\Longleftrightarrow\quad
\operatorname{Re}z=\operatorname{Re}w
\text{ and }
\operatorname{Im}z=\operatorname{Im}w.
\]

**Theorem 4.4 (Real linearity).**
The functions \(\operatorname{Re}\) and \(\operatorname{Im}\) are linear over \(\mathbb R\).

**Theorem 4.5 (Parts expressed through conjugation).**
For every \(z\in\mathbb C\),
\[
\iota(\operatorname{Re}z)=\frac{z+\overline z}{2}
\]
and
\[
\iota(\operatorname{Im}z)=\frac{z-\overline z}{2i}.
\]

**Normalization notes.** Keep \(\iota\) in the formal statement because the left sides are real-valued and the right sides are complex-valued.

## 5. Modulus and Metric Structure

**Definition 5.1 (Complex modulus).**
For \(z=(a,b)\), define
\[
|z|:=\sqrt{a^2+b^2}.
\]

**Theorem 5.2 (Basic modulus properties).**
For every \(z\in\mathbb C\),
\[
|z|\ge0,
\qquad
|z|=0\Longleftrightarrow z=0_{\mathbb C}.
\]

**Theorem 5.3 (Multiplicativity of modulus).**
For all \(z,w\in\mathbb C\),
\[
|zw|=|z||w|.
\]

**Theorem 5.4 (Triangle inequality).**
For all \(z,w\in\mathbb C\),
\[
|z+w|\le|z|+|w|.
\]

**Definition 5.5 (Euclidean metric).**
Define
\[
d(z,w):=|z-w|.
\]

**Theorem 5.6 (Metric structure).**
The function \(d\) is a metric on \(\mathbb C\).

## 6. Non-Orderability

**Theorem 6.1 (The complex field is not orderable).**
There is no strict total order on \(\mathbb C\) that makes \(\mathbb C\) an ordered field.

**Dependencies.** Apply the abstract theorem that a field containing an element whose square is \(-1\) is not orderable.

## 7. Algebraic Closure

**Theorem 7.1 (Fundamental theorem of algebra).**
Every nonconstant polynomial in \(\mathbb C[x]\) has a root in \(\mathbb C\). Equivalently, every nonconstant polynomial in \(\mathbb C[x]\) factors over \(\mathbb C\) as a product of linear factors. Thus \(\mathbb C\) is algebraically closed.

**Proof status.** Statement only unless a proof with explicit analytic or topological dependencies is later supplied.

## 8. Final Structural Summary

**Theorem 8.1 (Structure of the complex numbers).**
The complex numbers form an algebraically closed field containing an embedded copy of \(\mathbb R\). They carry the Euclidean metric induced by the modulus but admit no compatible total order.
