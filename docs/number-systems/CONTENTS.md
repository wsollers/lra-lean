# Streamlined Number-Systems Package

This package is the mathematical source of truth for the proof-ready Lean and Blueprint refactor.

## Order

1. Abstract laws
2. Canonical embeddings
3. Universal properties
4. Streamlined construction workflows
5. Proof-preparation roadmap
6. Natural numbers
7. Whole numbers
8. Divisibility and Euclidean division
9. Place-value integers
10. Integers: canonical, Tao, and Mendelson
11. Rationals
12. Reals: Dedekind, Cauchy, Cantor, primitive interval quotient, dyadic
13. Real extensions, extended reals, and interval arithmetic
14. Irrational numbers and continued fractions
15. Computable reals
16. Complex numbers
17. Characteristic and cardinality
18. Isomorphism requirements for constructed number systems
19. Volume III interoperability and substitutability tests
20. Comparison matrix
21. Sequel: p-adic numbers

## Proof-readiness rule

Definitions must be mathematically complete. Theorem statements must be final. Only proof bodies may contain `sorry`.

Construction-specific isomorphism, preservation, reflection, embedding-compatibility, and substitutability theorem proofs are intentionally left as `sorry` until reached in the declared proof order. Concrete tests may compile against these pending theorems, but a suite is not verified while its bridge depends on `sorryAx`.
