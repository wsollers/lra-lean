# Feferman, *The Number Systems* — Theorem Index (Chapters 3–7)

**Source.** Feferman, *The Number Systems: Foundations of Algebra and Analysis*, book pp. 64–302
(PDF pp. 80–318; **offset PDF = book + 16**). Feferman is the primary source for the
`peano-systems` chapter (the recursion-theorem machinery beyond Landau's terse §1).

**Numbering.** Feferman numbers all labelled results per chapter as `‹chapter›.‹item›`
(e.g. `3.19 Theorem`, `3.28 Definition`). Primed variants (`3.4'`) occur; folded to base here.

**Extraction method & caveat.** The PDF is a scan with an embedded OCR text layer. This index is
**auto-extracted** from that layer (`pdftotext` + number/marker pairing). **Numbers and types are
reliable; titles/statements are OCR-approximate** — named laws came through (e.g. "Commutative law
for •"), but many snippets are noisy or are argument-lists, and a few numbers (`4.00`, `7.09`) are
mis-paired artifacts. Treat this as a *navigation map to decide what to formalize*, not as a
verified statement source — verify the exact statement against the page before porting any item.
Symbols: `•`/`■` = multiplication, `e`/`G`/`£` = `∈`, `P` = positive integers, `I` = integers,
`D` = integral domain, `K`/`L` = fields, `Re` = reals.

---

## Relevance map (to decide what to bring over)

| Feferman ch | Topic | Maps to your | Relevance |
|---|---|---|---|
| **3** | The Positive Integers (Peano, recursion, ℕ arithmetic, order, sequences) | `peano-systems` + `natural-numbers` | **DIRECT — the active front's source.** 3.3–3.5 = the recursion/categoricity machinery you decomposed; 3.7–3.45 = the ℕ ladder. |
| **4** | Integers / Integral Domains (construction of ℤ, ordered domains, divisibility, primes) | `whole-numbers` / `integers` | **Relevant for ℤ.** §4.1–4.3 (extension + construction) core; §4.5 number theory (primes, gcd, 4.40–4.58) likely **optional**. |
| **5** | Polynomials (simple extensions, polynomial forms, symmetric polynomials) | — | **Probably skip.** A vehicle for Feferman's field theory; not on the ℕ→ℤ→ℚ→ℝ spine unless your ℝ build needs it. |
| **6** | Fields / Rationals (fields of quotients, dense order, algebraic equations) | `rationals` | **§6.1–6.2 relevant for ℚ** (field-of-quotients construction 6.2–6.11). §6.3–6.4 (polynomials over a field) likely **skip**. |
| **7** | The Real Numbers (continuously ordered fields, Cauchy completion, series, transcendentals) | `reals` | **§7.1–7.2 relevant for ℝ** (continuously ordered field + completion 7.10–7.31). §7.3–7.5 (series, Sturm, transcendentals/countability) likely **optional**, though 7.62–7.70 (denumerability, Cantor, transcendentals exist) may be wanted. |

**Bottom line:** Chapter 3 is the only part that touches current work and it's the Feferman source
you've already mostly formalized. Chapters 4/6/7 §.1–.2 are the construction cores for ℤ/ℚ/ℝ — port
when you reach those volumes. Chapter 5 and the deep algebra/number-theory/transcendental material
are off the analysis spine — index-only unless a later proof reaches for them.

---
<!-- BODY: auto-extracted; titles OCR-approximate, verify before porting -->

## Chapter 3 — THE POSITIVE INTEGERS

### §3.1 Basic properties
- **3.3** Theorem — Let (P, Sc, 1) be a Peano system. Then for any x ∈ P … *(recursion / iteration)*
- **3.4** Theorem — Let (P, Sc, 1) be a Peano system. Suppose that S is a set … *(primitive recursion)*
- **3.5** Theorem — Any two Peano systems are isomorphic *(categoricity)*

### §3.2 The arithmetic of positive integers
- **3.7** Theorem — addition determined by recursion *(x, 1 …)*
- **3.8** Definition — multiplication *(x · y)*
- **3.9** Theorem — (associative law for +)  *(y + z …)*
- **3.10** Lemma — for any x ∈ P …
- **3.11** Theorem — Commutative law for +
- **3.12** Theorem — Cancellation law for +
- **3.13** Theorem — For any x, y ∈ P, y ≠ x + y
- **3.14** Theorem — Trichotomy law for +
- **3.16** Theorem — Left distributive law for · over +
- **3.17** Theorem — (right distributive / x + y …)
- **3.18** Lemma — For all x ∈ P, 1 · x = x
- **3.19** Theorem — Commutative law for ·
- **3.20** Theorem — Associative law for ·
- **3.22** Definition — *(x, y …)*
- **3.23** Theorem

### §3.3 Order
- **3.24** Definition — x < y iff ∃v, y = x + v
- **3.25** Theorem — order properties (for any x, y, z ∈ P …)
- **3.26** Corollary
- **3.27** Definition — simply ordered system (S, <)
- **3.28** Definition — bounds / least element on (S, <), A ⊆ S
- **3.29** Lemma — on a simply ordered system (S, <)
- **3.30** Definition — S is well-ordered by <
- **3.31** Theorem — x < Sc(y) iff x ≤ y  *(discreteness)*
- **3.32** Theorem — (P, <) properties
- **3.34** Definition — (S, <)
- **3.35** Theorem — characterization (P', <')
- **3.36** Theorem — (P, <) satisfies 3.35(i)–(iii), 1 least *(well-ordering of P)*
- **3.37** Theorem — for any x, y, z ∈ P …
- **3.38** Corollary — for any x, y, z, w ∈ P …
- **3.39** Corollary — for any x, y, z ∈ P …

### §3.4 Sequences, sums and products
- **3.41** Definition — iterated operation H(1 …)
- **3.42** Definition — finite sum over a binary operation +
- **3.43** Definition — infinite sequence terms; ∑ notation
- **3.44** Theorem — closure under + over sequences
- **3.45** Theorem — sequence identities

## Chapter 4 — THE INTEGERS / INTEGRAL DOMAINS

### §4.1 Toward extending the positive integers
- **4.1** Definition — *(v + z …)*
- **4.2** Theorem — uniqueness of additive identity (if x+u=x ∀x then u=0)
- **4.4** Corollary
- **4.6** Theorem — for any x, y, u ∈ D …
- **4.7** Theorem — x · 0 = 0
- **4.9** Theorem — subtraction (y − z …)
- **4.10** Definition — integer powers (x ∈ D, n ∈ P)
- **4.11** Theorem — power laws (x, y ∈ D, m, n ∈ P)
- **4.12** Theorem

### §4.2 Integral domains
- **4.13** Definition — integral domain (commutative ring with unity + condition)
- **4.14** Theorem — integral-domain characterization
- **4.15** Definition — ordered integral domain
- **4.16** Theorem — (D, +, ·, <, 0, 1)
- **4.17** Theorem — positive cone Pos ⊆ D
- **4.18** Theorem
- **4.19** Definition — absolute value |x|
- **4.20** Theorem — (construction/characterization of integers)

### §4.3 Construction and characterization of the integers
- **4.22** Theorem — (I, +, ·, <, 0, 1) exists *(ℤ construction)*
- **4.23** Theorem — characterization (ℤ unique up to iso)

### §4.4 The integers as an indexing system
- **4.25** Theorem — Pₐ = {x ∈ I : x > a}
- **4.27** Theorem — infinite sequence indexing
- **4.29** Definition — permutation of a set S
- **4.30** Theorem — permutations of {1,…,n}
- **4.31** Definition — x ∈ D, n ∈ I, n > 0
- **4.33** Theorem — (x−1)∑xⁿ = xⁿ⁺¹−1 *(geometric sum)*
- **4.35** Theorem
- **4.36** Theorem

### §4.5 Mathematical properties of the integers
- **4.37** Theorem — division algorithm (∃ q, r)
- **4.39** Theorem — divisibility identities
- **4.40** Definition — prime
- **4.42** Definition — gcd
- **4.43** Theorem — ideal/subset characterization
- **4.44** Theorem — {ax+by} satisfies 4.43
- **4.45** Definition
- **4.46** Theorem — gcd properties
- **4.47** Theorem — prime + product (Euclid's lemma)
- **4.48** Theorem
- **4.49** Theorem — well-ordered induction
- **4.50** Theorem — a > 1 properties
- **4.52** Theorem — infinitely many primes
- **4.53** Theorem — base-b representation
- **4.54** Theorem — bⁿ ≤ a < bⁿ⁺¹
- **4.55** Theorem — (D, +, ·, 0, 1)
- **4.57** Theorem — (I, +, ·, 0, 1)
- **4.58** Theorem — congruences =ₘ are the only congruence relations
- **4.59** Definition

## Chapter 5 — POLYNOMIALS  *(likely off-spine; index only)*

### §5.1 Polynomial functions and polynomial forms
- **5.1** Definition — polynomial of one variable
- **5.2** Definition — simple extension D[ξ]
- **5.3** Definition — simple extension structure
- **5.5** Lemma — simple transcendental extension
- **5.6** Theorem — uniqueness of simple transcendental extensions
- **5.7** Theorem — existence of simple transcendental extension
- **5.9** Definition — element representation
- **5.10** Definition — f(ξ) ∈ D[ξ]
- **5.11** Lemma — deg(f(ξ))
- **5.12** Definition — divisibility in D[ξ]
- **5.13** Theorem — ξ − a
- **5.14** Theorem — degree-n polynomial roots
- **5.15** Corollary — D infinite ⇒ polynomial identity
- **5.16** Definition — derivative f'
- **5.17** Theorem — product/derivative law

### §5.2 Polynomials in several variables
- **5.18** Theorem — D[ξⱼ]
- **5.19** Definition — multivariate extension
- **5.20** Theorem — k-fold extension
- **5.21** Theorem — isomorphic integral domains
- **5.23** Definition — integral domain E ⊇ D
- **5.24** Theorem
- **5.25** Definition — f(ξ₁,…,ξₖ)
- **5.26** Definition — symmetric polynomial
- **5.27** Theorem — 0 < n < k
- **5.28** Theorem — elementary symmetric functions
- **5.29** Theorem — symmetric polynomial theorem

## Chapter 6 — FIELDS / RATIONALS

### §6.1 Toward extending integral domains
- **6.2** Definition — quotient construction a/b (b ≠ 0)
- **6.3** Theorem — fraction arithmetic well-defined
- **6.4** Definition
- **6.5** Theorem — m = 0 case
- **6.6** Theorem — fraction equality/operations
- **6.7** Definition — densely ordered set
- **6.8** Theorem — K densely ordered by <
- **6.9** Theorem — any finite integral domain is a field

### §6.2 Fields of quotients
- **6.11** Theorem — (Q, +, ·, 0, 1) field of quotients exists *(ℚ construction)*
- **6.14** Theorem — any ordered field containing ℤ contains ℚ *(minimality)*
- **6.15** Theorem — (D, +, ·, 0, 1) embedding

### §6.3 Solutions of algebraic equations in fields
- **6.17** Definition — linear systems
- **6.18** Theorem — subfield K ⊆ L, coefficients aᵢⱼ ∈ K
- **6.19** Theorem — f(ξ) = ∑…
- **6.20** Corollary — monic case
- **6.21** Corollary — n > 1, a ∈ I, |a| > …

### §6.4 Polynomials over a field  *(likely skip)*
- **6.22** Definition — gcd of polynomials
- **6.23** Theorem
- **6.24** Definition — prime/irreducible over K
- **6.25** Theorem — factorization
- **6.26** Theorem
- **6.27** Theorem — subfield K ⊆ L
- **6.28** Definition
- **6.30** Theorem — gcd d(ξ)
- **6.31** Corollary — gcd invariance
- **6.32** Definition — (f, g) for polynomials
- **6.33** Theorem — f, g, h ∈ K[ξ]
- **6.34** Theorem — p prime in K[ξ]
- **6.35** Theorem — degree condition
- **6.36** Theorem — monic prime factorization
- **6.37** Theorem — n = 1 ⇒ prime
- **6.38** Definition
- **6.39** Theorem

## Chapter 7 — THE REAL NUMBERS

### §7.1 Toward extending the rationals
- **7.2** Definition — ordered system (S, <)
- **7.4** Theorem — (Rₐ, <) Dedekind-style
- **7.5** Theorem — (S, <)
- **7.6** Definition — cut/section in S
- **7.7** Lemma — (S, <)
- **7.8** Definition — (S, <)

### §7.2 Continuously ordered fields
- **7.10** Definition — continuously ordered field (K, +, ·, <, 0, 1)
- **7.11** Definition — Cₐ = {x ∈ Rₐ : a < x}
- **7.13** Theorem — Cₐ properties
- **7.14** Definition
- **7.16** Theorem — completion of Rₐ
- **7.18** Lemma — sup/inf existence (A ⊆ K, A ≠ ∅)
- **7.19** Definition
- **7.20** Lemma — sequences xₖ ∈ K
- **7.21** Definition — convergent sequence
- **7.23** Definition — Cauchy (|xₖ − xₗ| < ε for k,l > m)
- **7.24** Definition
- **7.26** Definition — bounded sequence
- **7.27** Theorem — Cauchy ⇒ convergent *(completeness)*
- **7.28** Definition — constant sequence embedding
- **7.29** Theorem — operations on Fd(A)
- **7.30** Theorem — every a ∈ K has approximating sequence
- **7.31** Theorem — there exists a continuously ordered field *(ℝ exists)*

### §7.3 Infinite series and representations of real numbers  *(optional)*
- **7.33** Definition — sequence of reals
- **7.34** Theorem — convergence
- **7.35** Lemma — a ∈ Re, a > 0
- **7.38** Theorem — comparison (0 < yᵢ < xᵢ)
- **7.39** Theorem — base-b real representation
- **7.41** Corollary — radius of convergence
- **7.42** Lemma
- **7.44** Theorem — series product (Cauchy product)
- **7.46** Definition — function on Re
- **7.47** Lemma
- **7.49** Theorem
- **7.51** Theorem — F(x) = G(x) + H(x)
- **7.52** Corollary — polynomial functions
- **7.54** Corollary
- **7.55** Theorem — unique nth root (n ∈ P, a > 0)
- **7.56** Definition — nonnegative root
- **7.57** Theorem
- **7.59** Definition — Sturm sequence
- **7.60** Theorem — Sturm's theorem

### §7.5 Algebraic and transcendental numbers  *(optional)*
- **7.61** Definition — algebraic / transcendental
- **7.62** Definition — equivalent sets (∃ bijection)
- **7.63** Theorem — A ~ subset properties
- **7.64** Definition — denumerable / countable
- **7.65** Theorem — countability
- **7.66** Theorem
- **7.67** Theorem — A, B denumerable ⇒ A × B denumerable
- **7.70** Theorem — transcendental reals exist *(Cantor)*
- **7.71** Theorem — ξ − y
