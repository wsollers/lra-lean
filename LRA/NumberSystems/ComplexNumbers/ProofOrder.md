# LRA.NumberSystems.ComplexNumbers — Proof Order

Ledger notation: see [`LRA/ProofOrderNotation.md`](../../ProofOrderNotation.md).

## Narrative order

Unlike `RealNumbers` (six competing constructions), `ComplexNumbers` has
exactly one: `OrderedPairs`, the classical `R × R` construction, generic
over *any* certified carrier `R` (the project's own carriers, Mathlib's
`ℝ`/`ℚ`/`ℤ`, anything else with the right Volume I certificates). There is
no rival axiomatization of the complex numbers to reconcile the way Cauchy
sequences and Dedekind cuts compete to construct the reals, so no second
construction is expected here — the `Constructions/` directory layout is
kept for consistency with every other number system, not because a second
construction is anticipated.

Unlike every quotient-based construction elsewhere in `NumberSystems`
(Cauchy, RationalQuotientFractions, …), `ComplexNumber R` is a plain
two-field structure, not built from a coarser representative type modulo
an equivalence relation. This reshapes the pipeline: `Equivalence.lean`
holds `ext` (coordinatewise equality) rather than a quotient relation, and
`WellFoundedness.lean` needs no `induction_on_representatives`-style lemma
(Lean's own structure recursor already supplies what that stage exists to
provide for quotient carriers).

Proof order follows the import chain: `Equivalence` (`ext` — already
proved outright, `cases`/`simp_all`, not `sorry`) is used by later files;
`WellDefinedness` (`norm_squared_ne_zero_of_nonzero` — what makes the raw
`Inv` instance in `Operations.lean` mathematically meaningful: the norm it
divides by cannot vanish on a nonzero input) comes next; then `Laws`, the
ring and field law statements; then `Behavior`, the real-axis embedding
theorems (`of_real_preserves_*`) plus the algebraic-closure obligation
(needs a *complete* ordered base field — completeness of `R` is where
analysis enters, not this construction). `Carrier`, `Operations`, and
`Instances` are definitions and already-genuine instance declarations with
no theorem/lemma of their own.

## Per-theorem ledger

Status determined by direct inspection: every entry below except `ext` has
a proof body that is the single tactic `sorry` with no intermediate
lemmas, so a textual read and an axiom-closure check (`#print axioms`)
agree exactly; `ext` has a real proof (`cases first; cases second;
simp_all`) and is marked complete on that basis. Re-derive via
`scripts/GenerateProofOrderManifest.lean` once a Lean toolchain is
available, rather than trusting this by-eye pass for any future edit to
this subject.

Context shared by entries that need it: let `R` be a type. Ring-section
entries assume `CommutativeRingLaws(R)`; field-section and
`WellDefinedness`/`Behavior` entries assume `OrderedFieldLaws(R)`
(`algebraic_closure_obligation` additionally assumes order-completeness of
`R`), stated once per section below rather than repeated per entry.

### `Constructions/OrderedPairs/Equivalence.lean`

#### ext

∀ first second : ComplexNumber(R), first.real_part = second.real_part ∧ first.imaginary_part = second.imaginary_part → first = second

**Status: COMPLETE**

### `Constructions/OrderedPairs/WellDefinedness.lean`

Assumes `OrderedFieldLaws(R)`.

#### norm_squared_ne_zero_of_nonzero

∀ value : ComplexNumber(R), value ≠ 0 → normSquared(value) ≠ 0

**Status: PENDING**

### `Constructions/OrderedPairs/Laws.lean` — ring section

Assumes `CommutativeRingLaws(R)`.

#### addition_is_associative

∀ a b c : ComplexNumber(R), (a + b) + c = a + (b + c)

**Status: PENDING**

#### addition_is_commutative

∀ a b : ComplexNumber(R), a + b = b + a

**Status: PENDING**

#### zero_add_complex

∀ a : ComplexNumber(R), 0 + a = a

**Status: PENDING**

#### add_zero_complex

∀ a : ComplexNumber(R), a + 0 = a

**Status: PENDING**

#### neg_add_cancel_complex

∀ a : ComplexNumber(R), -a + a = 0

**Status: PENDING**

#### add_neg_cancel_complex

∀ a : ComplexNumber(R), a + -a = 0

**Status: PENDING**

#### multiplication_is_associative

∀ a b c : ComplexNumber(R), (a * b) * c = a * (b * c)

**Status: PENDING**

#### multiplication_is_commutative

∀ a b : ComplexNumber(R), a * b = b * a

**Status: PENDING**

#### one_mul_complex

∀ a : ComplexNumber(R), 1 * a = a

**Status: PENDING**

#### mul_one_complex

∀ a : ComplexNumber(R), a * 1 = a

**Status: PENDING**

#### zero_mul_complex

∀ a : ComplexNumber(R), 0 * a = 0

**Status: PENDING**

#### mul_zero_complex

∀ a : ComplexNumber(R), a * 0 = 0

**Status: PENDING**

#### left_distributive_complex

∀ a b c : ComplexNumber(R), a * (b + c) = a * b + a * c

**Status: PENDING**

#### right_distributive_complex

∀ a b c : ComplexNumber(R), (a + b) * c = a * c + b * c

**Status: PENDING**

#### imaginary_unit_squared

imaginaryUnit * imaginaryUnit = -(1 : ComplexNumber(R))

**Status: PENDING**

### `Constructions/OrderedPairs/Laws.lean` — field section

Assumes `OrderedFieldLaws(R)`.

#### one_ne_zero_complex

(1 : ComplexNumber(R)) ≠ 0

**Status: PENDING**

#### mul_inv_cancel_complex

∀ value : ComplexNumber(R), value ≠ 0 → value * value⁻¹ = 1

**Status: PENDING**

#### inv_zero_complex

(0 : ComplexNumber(R))⁻¹ = 0

**Status: PENDING**

### `Constructions/OrderedPairs/Behavior.lean` — embedding section

Assumes `CommutativeRingLaws(R)`.

#### of_real_preserves_zero

of_real(0 : R) = (0 : ComplexNumber(R))

**Status: PENDING**

#### of_real_preserves_one

of_real(1 : R) = (1 : ComplexNumber(R))

**Status: PENDING**

#### of_real_preserves_addition

∀ first second : R, of_real(first + second) = of_real(first) + of_real(second)

**Status: PENDING**

#### of_real_preserves_negation

∀ value : R, of_real(-value) = -of_real(value)

**Status: PENDING**

#### of_real_preserves_multiplication

∀ first second : R, of_real(first * second) = of_real(first) * of_real(second)

**Status: PENDING**

#### of_real_is_injective

∀ first second : R, of_real(first) = of_real(second) → first = second

**Status: PENDING**

### `Constructions/OrderedPairs/Behavior.lean` — algebraic-closure obligation

Assumes `OrderedFieldLaws(R)` and order-completeness of `R`. `Polynomial(R)`
is a degree with a coefficient function `Fin(degree + 1) → ComplexNumber(R)`;
`nonconstant(polynomial) := polynomial.degree ≠ 0`.

#### algebraic_closure_obligation

∀ polynomial : Polynomial(R), nonconstant(polynomial) → ∃ root : ComplexNumber(R), evaluate(polynomial, root) = (0 : ComplexNumber(R))

**Status: PENDING**
