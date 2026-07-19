# Streamlined Construction Workflows

## Purpose

The number-system documents use two recurring construction mechanisms:

1. **Peano iteration**, which turns recursive clauses into actual operations;
2. **quotient descent**, which turns representative-level operations into
   operations on equivalence classes.

These mechanisms solve different well-definedness problems and should not be
conflated.

---

# 1. Recursive construction on a Peano system

A display such as
\[
F(a,1)=c(a),
\qquad
F(a,S(n))=G(a,F(a,n))
\]
is only a recursive specification. By itself, it does not prove that:

- a value exists at every stage;
- only one value is produced;
- the resulting assignment is a function;
- the function has the intended domain and codomain;
- the construction is unique.

The Parameterized Peano Iterator Theorem supplies all of these facts at once.

## Standard workflow

\[
\text{parameterized iterator data}
\longrightarrow
\text{existence and uniqueness theorem}
\longrightarrow
\text{unique operation}
\longrightarrow
\text{named recursive-clause theorems}.
\]

## Example: addition

Choose
\[
c(m)=S(m),
\qquad
G(m,x)=S(x).
\]
The theorem gives the unique operation \(+\) satisfying
\[
m+1=S(m),
\qquad
m+S(n)=S(m+n).
\]

The base and successor clauses are then recorded as named theorems and reused
in associativity, commutativity, cancellation, and order proofs.

## Why this is simpler

Without the parameterized theorem, one first constructs a separate iterator
\(f_m\) for each \(m\), then informally packages the family into a binary
operation. The parameterized theorem produces the required binary function
directly:
\[
F:P\times P\to P.
\]

---

# 2. Descent of structure to a quotient

Suppose \(A/{\sim}\) is a quotient. A raw formula
\[
[a]\overline O[b]:=[O(a,b)]
\]
does not automatically define an operation on classes. It is valid only if the
answer is independent of representatives.

## Direct four-representative proof

The unsplit method begins with
\[
a\sim a',
\qquad
b\sim b'
\]
and proves
\[
O(a,b)\sim O(a',b')
\]
in one calculation.

## Split compatibility proof

The streamlined method proves:
\[
a\sim a'
\Longrightarrow
O(a,b)\sim O(a',b),
\]
and
\[
b\sim b'
\Longrightarrow
O(a,b)\sim O(a,b').
\]

Then
\[
O(a,b)\sim O(a',b)\sim O(a',b'),
\]
so transitivity gives full compatibility.

## Standard workflow

\[
\text{raw representative operation}
\longrightarrow
\text{left/right compatibility}
\longrightarrow
\text{full compatibility}
\longrightarrow
\text{induced quotient operation}.
\]

If the raw operation is commutative, one-sided compatibility is often enough.

## Why this is simpler

The split method:

- uses one equivalence hypothesis at a time;
- produces shorter algebraic calculations;
- localizes failures to one coordinate;
- reuses the abstract induced-operation theorem;
- matches function congruence proofs in formal systems;
- scales to unary operations, predicates, relations, and finite arity.

---

# 3. The two methods solve different problems

## Peano iteration proves

- existence;
- totality;
- single-valuedness;
- uniqueness;
- correct arity;
- satisfaction of recursive clauses.

## Quotient descent proves

- representative independence;
- compatibility with equivalence;
- existence of induced operations, predicates, and relations on classes.

A recursively defined operation may later be used inside a quotient construction.
For example:

1. addition and multiplication are constructed on \(\mathbb N\) by Peano
   iteration;
2. those operations define raw pair operations for \(\mathbb Z\);
3. quotient compatibility allows the pair operations to descend to integer
   classes.

Thus the methods form a pipeline rather than competing alternatives.

---

# 4. House normalization rules

## Recursive operations

Every recursive operation guide should contain:

1. iterator data;
2. existence-and-uniqueness theorem;
3. formal definition of the operation;
4. base-clause theorem;
5. successor-clause theorem;
6. proof-status entry for totality and uniqueness.

## Quotient operations

Every quotient operation guide should contain:

1. representative carrier;
2. equivalence relation;
3. proof that the relation is an equivalence relation;
4. raw representative operation;
5. left/right compatibility lemmas;
6. induced quotient operation theorem;
7. named class-level operation;
8. proof-status entry for representative independence.

## Terminology

Use distinct phrases:

- **recursively well-defined** for existence and uniqueness from recursive data;
- **representative-independent** for compatibility with quotient equivalence;
- **defined on its stated domain** for partial operations.

Avoid using the unqualified phrase “well-defined” when the proof obligation is
ambiguous.

---

# 5. Construction coverage

## Peano iteration

Use for:

- addition on \(\mathbb N\);
- multiplication;
- positive powers;
- factorial;
- finite sums and products;
- iterated functions.

## Quotient descent

Use for:

- the canonical, Tao, and Mendelson constructions of \(\mathbb Z\);
- \(\mathbb Q\);
- Cauchy-sequence reals;
- interval-quotient reals;
- dyadic/binary reals;
- later quotient constructions such as
  \(\mathbb R[x]/(x^2+1)\).

---

# 6. Final summary

The streamlined architecture is:

\[
\boxed{
\text{Peano iteration constructs operations}
}
\]

followed, where necessary, by

\[
\boxed{
\text{quotient compatibility transports operations to equivalence classes}.
}
\]

This separates construction from transport, reduces duplicate algebra, and
gives every operation a clear proof obligation.
