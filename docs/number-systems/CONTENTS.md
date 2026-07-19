# Streamlined Number-Systems Package

This package is the mathematical source of truth for the proof-ready Lean and Blueprint refactor.

## Order

1. Abstract laws
2. Canonical embeddings
3. Universal properties
4. Streamlined construction workflows
5. Natural numbers
6. Whole numbers
7. Place-value integers
8. Divisibility and Euclidean division
9. Integers: canonical, Tao, and Mendelson
10. Rationals and continued fractions
11. Reals: Dedekind, Cauchy, Cantor, primitive interval quotient, dyadic
12. Computable reals and real extensions
13. Extended reals and interval arithmetic over an existing real field
14. Complex numbers
15. Characteristic, cardinality, and comparison matrix
16. Isomorphism requirements for constructed number systems
17. Volume III interoperability and substitutability tests
18. Sequel: p-adic numbers

## Proof-readiness rule

Definitions must be mathematically complete. Theorem statements must be final. Only proof bodies may contain `sorry`.

Construction-specific isomorphism, preservation, reflection, embedding-compatibility, and substitutability theorem proofs are intentionally left as `sorry` until reached in the declared proof order. Concrete tests may compile against these pending theorems, but a suite is not verified while its bridge depends on `sorryAx`.
