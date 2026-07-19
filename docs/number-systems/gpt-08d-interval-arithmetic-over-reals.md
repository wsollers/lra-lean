# Part 8D — Interval Arithmetic as a Numerical Tool over \(\mathbb R\)

## 0. Purpose

This document develops an enclosure calculus after a real field has already been constructed. Unlike Part 7D, its objects are ordinary subsets of an existing \(\mathbb R\), not representatives used to construct \(\mathbb R\).

## 1. Real Intervals and Basic Measurements

**Definition 1.1 (Closed real interval).**
For \(a,b\in\mathbb R\) with \(a\le b\), define
\[
[a,b]:=\{x\in\mathbb R:a\le x\le b\}.
\]

**Definition 1.2 (Interval hull).**
For a nonempty bounded set \(A\subseteq\mathbb R\), define
\[
\operatorname{hull}(A):=[\inf A,\sup A].
\]

**Definition 1.3 (Width, radius, and midpoint).**
For \(X=[a,b]\), define
\[
\operatorname{wid}(X)=b-a,
\qquad
\operatorname{rad}(X)=\frac{b-a}{2},
\qquad
\operatorname{mid}(X)=\frac{a+b}{2}.
\]

## 2. Enclosure Operations

**Definition 2.1 (Addition, negation, and subtraction).**
For \(X=[a,b]\) and \(Y=[c,d]\), define
\[
X+Y=[a+c,b+d],
\]
\[
-X=[-b,-a],
\]
and
\[
X-Y=[a-d,b-c].
\]

**Definition 2.2 (Multiplication).**
Define
\[
XY=[\min\{ac,ad,bc,bd\},\max\{ac,ad,bc,bd\}].
\]

**Definition 2.3 (Reciprocal and division).**
If \(0\notin Y=[c,d]\), define
\[
Y^{-1}=[1/d,1/c]
\]
and
\[
X/Y=XY^{-1}.
\]

**Theorem 2.4 (Exact range property).**
Each operation above is the interval hull of the corresponding pointwise real operation over independent operands.

## 3. Inclusion and Dependency

**Theorem 3.1 (Inclusion monotonicity).**
If \(X\subseteq X'\) and \(Y\subseteq Y'\), then every defined basic interval operation on \(X,Y\) is contained in the corresponding operation on \(X',Y'\).

**Definition 3.2 (Natural interval extension).**
The natural interval extension of a real expression is obtained by replacing each real operation with its interval counterpart.

**Theorem 3.3 (Fundamental inclusion property).**
Whenever the natural interval extension is defined, it contains every value of the original real expression obtained by choosing each variable from its prescribed interval.

**Definition 3.4 (Dependency phenomenon).**
Dependency overestimation is the enlargement that occurs when repeated occurrences of the same variable are evaluated as independent interval operands.

**Required examples.** Compare exact ranges with natural interval evaluations for
\[
x-x,
\qquad
x/x,
\qquad
x(1-x).
\]

## 4. Algebraic Laws and Failures

**Theorem 4.1 (Commutativity and associativity).**
Interval addition and interval multiplication are commutative and associative.

**Theorem 4.2 (Failure of additive inverses).**
If \(X\) is nondegenerate, then
\[
X+(-X)\ne[0,0].
\]

**Theorem 4.3 (Subdistributivity).**
For all real intervals \(X,Y,Z\),
\[
X(Y+Z)\subseteq XY+XZ.
\]

**Theorem 4.4 (Failure of distributivity).**
There exist real intervals for which the inclusion in Theorem 4.3 is strict.

## 5. Outward-Rounded Machine Intervals

**Definition 5.1 (Floating-point enclosure).**
A floating-point interval is a pair of machine numbers \([\underline x,\overline x]\) interpreted as containing every real number between its endpoints.

**Definition 5.2 (Outward rounding).**
An interval operation is outward rounded if its lower endpoint is rounded toward \(-\infty\) and its upper endpoint is rounded toward \(+\infty\).

**Theorem 5.3 (Machine inclusion correctness).**
If each elementary floating-point interval operation is outward rounded, then the computed interval contains the exact real range of the corresponding elementary operation.

**Proof obligations.** State the assumed floating-point model and treat exceptional values, overflow, underflow, subnormal numbers, and division by intervals containing zero explicitly.

## 6. Functions and Lipschitz Enclosures

**Definition 6.1 (Interval extension of a function).**
Let \(f:D\to\mathbb R\). An interval extension of \(f\) is a map \(F\) on intervals satisfying
\[
f(X\cap D)\subseteq F(X)
\]
for every admissible interval \(X\).

**Theorem 6.2 (Monotone function enclosure).**
If \(f\) is monotone on \([a,b]\), then its exact interval range is determined by its endpoint values.

**Theorem 6.3 (Lipschitz enclosure).**
If \(f\) is \(L\)-Lipschitz on \(X=[m-r,m+r]\), then
\[
f(X)\subseteq[f(m)-Lr,f(m)+Lr].
\]

## 7. Box Arithmetic and GPU-Oriented Extensions

**Definition 7.1 (Axis-aligned box).**
An axis-aligned box in \(\mathbb R^d\) is a Cartesian product of closed real intervals.

**Theorem 7.2 (Componentwise inclusion).**
Componentwise outward-rounded interval evaluation preserves containment for vector and box computations built from inclusion-isotone elementary operations.

**Normalization notes.** Later implementation documents should distinguish mathematical interval operations from the concrete IEEE 754/Vulkan realization and list all platform assumptions.

## 8. Final Structural Summary

**Theorem 8.1 (Status of real interval arithmetic).**
Real interval arithmetic is an inclusion-preserving calculus for verified enclosures. It is not a ring or field, and its dependency behavior is an operational feature rather than a defect in the real-number construction.
