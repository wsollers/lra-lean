# Analysis Carrier Migration Punchlist

Goal: keep the analysis development on `ℝ`/`ℕ` for now, and prepare the in-house
carrier layer so a later migration to `R` and `N` can happen branch-by-branch
without breaking continuity, limits, and differentiation.

Checkpoint commit: `0c46dda0` (`Checkpoint carrier alias and unfolded rendering refactor`)

## Current decision

- [x] Revert the first-pass conversion of
      `LRA/Analysis/Continuity/PointContinuity.lean`
      back to `ℝ`/`ℕ`
- [x] Revert the first-pass conversion of
      `LRA/Analysis/Limits/Definition/Limits.lean`
      back to `ℝ`/`ℕ`
- [ ] Leave derivative and rendering refactors in place

## `R` analysis-carrier interface

The selected in-house real carrier must elaborate every expression currently
used in the continuity, limits, and derivative foundations.

### Core literals and algebra

- [ ] Provide `Zero R`
- [ ] Provide `One R`
- [ ] Provide `Add R`
- [ ] Provide `Neg R`
- [ ] Provide `Sub R` or `HSub R R R`
- [ ] Provide `Mul R`
- [ ] Provide `Div R`

### Bundled additive structure

- [ ] Provide `AddSemigroup R`
- [ ] Provide `AddMonoid R`
- [ ] Provide `AddGroup R`
- [ ] Confirm subtraction notation elaborates from the bundled additive
      structure rather than only from raw `HSub`

### Order structure

- [ ] Provide `LE R`
- [ ] Provide `LT R`
- [ ] Provide the preorder / partial-order layer needed for `≤`, `<`, `≥`, `>`
- [ ] Verify mixed uses like `0 < ε`, `x ≤ y`, `c < x`, and `x < c + δ`

### Lattice / absolute-value support

- [ ] Provide the order-theoretic structure needed for `max`
- [ ] Provide the order-theoretic structure needed for `min` if analysis files
      rely on it in nearby branches
- [ ] Provide whichever of `SemilatticeSup R`, `Lattice R`, or a compatible
      replacement is required for `abs`
- [ ] Verify `|x|`, `|x - c|`, and `|(f x - f c) / (x - c) - D|` elaborate

### Field-style expressions used by derivatives

- [ ] Verify `x - c`
- [ ] Verify `f x - f c`
- [ ] Verify `(f x - f c) / (x - c)`
- [ ] Verify `c + δ`
- [ ] Verify `c - δ`

### Packaging / visibility

- [ ] Audit `LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Instances.lean`
      for operations already present but not exported as standard Lean instances
- [ ] Decide whether `R` should expose instances directly from the chosen
      witness or through a wrapper module
- [ ] Add a single smoke-test file that checks the full analysis-carrier surface
      for the current `R`

## `N` sequence-index interface

The selected in-house sequence carrier must support the tail-style quantifiers
used throughout sequential continuity, limits, and derivatives.

### Core order

- [ ] Provide `LE N`
- [ ] Provide `LT N`
- [ ] Provide enough preorder / partial-order structure for `n ≥ N`
- [ ] Verify `∀ n ≥ N, ...` elaborates in definitions

### Arithmetic used by tails and shifts

- [ ] Provide a zero-like starting point if the chosen carrier needs one
- [ ] Provide successor structure
- [ ] Provide `Add N` if tail-shift lemmas use `N + 1`
- [ ] Verify sequence-shift expressions elaborate

### Carrier decision

- [ ] Decide whether sequence theory should use `N`
- [ ] Decide whether sequence theory should instead use `W` / `N_0`
- [ ] Record the decision explicitly in `LRA.NumberSystems.Carriers`
- [ ] Keep one default sequence-index carrier for analysis foundations so the
      branch does not mix `N`, `W`, and `ℕ`

### Packaging / visibility

- [ ] Audit the Landau natural carrier for order instances that exist in theory
      but are not exported to Lean typeclass search
- [ ] Add a smoke-test file that checks `xs : N → R`, `∃ N : N`, and
      `∀ n ≥ N, ...` elaborate for the chosen carrier

## Foundation migration plan after instances exist

- [ ] Convert `LRA/Analysis/Continuity/PointContinuity.lean` as a whole branch
- [ ] Convert `LRA/Analysis/Limits/Definition/Limits.lean`
- [ ] Convert `LRA/Analysis/Limits/LimitsAtInfinity/Definition/LimitsAtInfinity.lean`
- [ ] Convert `LRA/Analysis/Limits/Equivalence/Theorems/Equivalence.lean`
- [ ] Convert `LRA/Analysis/Differentiation/DerivativeDefinition.lean`
- [ ] Convert immediate differentiation dependents only after the foundations compile

## Process guardrails

- [ ] Migrate whole dependency branches, not isolated theorem statements
- [ ] Update actual Lean declarations and hover-comment `Logical form` blocks together
- [ ] Add a tiny elaboration test before converting a whole file
- [ ] Treat carrier migration as a tree: finish each dependency layer before
      moving upward into equivalence theorems and derivatives
