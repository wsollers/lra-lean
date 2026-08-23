# Complex Numbers Proof Order

Tracks the proofs needed to land the complex-number construction, in the
order they should be discharged. Every item marked `[ ]` is currently
`sorry`; nothing is filled in until it's checked off.

## Backends

Unlike `RealNumbers` (six competing constructions), `ComplexNumbers` has
exactly one: `OrderedPairs`, the classical `R × R` construction, generic
over *any* certified carrier `R` (the project's own carriers, Mathlib's
`ℝ`/`ℚ`/`ℤ`, anything else with the right Volume I certificates). There is
no rival axiomatization of the complex numbers to reconcile the way
Cauchy sequences and Dedekind cuts compete to construct the reals, so no
second construction is expected here -- the `Constructions/` directory
layout is kept for consistency with every other number system in this
migration, not because a second construction is anticipated.

Unlike every quotient-based construction elsewhere in this migration
(Cauchy, RationalQuotientFractions, ...), `ComplexNumber R` is a plain
two-field structure, not built from a coarser representative type modulo
an equivalence relation. This reshapes what the "Equivalence" and
"WellFoundedness" pipeline stages hold: see below.

---

# Part A -- OrderedPairs

Split from the former two-file construction
(`LRA.VolumeII.ComplexNumbers.Construction.Construction`, 636 lines, plus
its own `Construction.Model.lean` wrapper, moved separately -- see
"Construction/Model.lean" below). The source declared a stacked
`namespace LRA.NumberSystems.ComplexNumbers.Construction` /
`namespace ComplexNumber`; flattened here into the one dotted namespace
`LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs`, per the
repo's no-stacked-namespaces convention. No declaration name changed.

- [x] `Carrier.lean` -- `ComplexNumber`, `OfNat 0`/`OfNat 1` instances,
      `imaginaryUnit`, written (no proof obligation).
- [x] `Equivalence.lean` -- `ext` (coordinatewise equality), written and
      proved outright in the source (`cases`/`simp_all`, not `sorry`).
      Repurposed from this migration's usual "equivalence relation +
      quotient" role, per Dedekind's precedent for non-quotient carriers:
      `ext` is this carrier's actual "when are two elements the same"
      fact.
- [x] `WellFoundedness.lean` -- no new content. `ComplexNumber R` is a
      plain structure, so Lean's own structure recursor already supplies
      what this stage exists to provide for quotient carriers; unlike
      Cauchy's analogous file, no `induction_on_representatives`-style
      lemma was needed.
- [x] `Operations.lean` -- `Add`/`Neg`/`Sub`/`Mul` instances,
      `conjugation`, `normSquared`, the totalized `Inv` instance,
      `of_real`, written (no proof obligation).
- [ ] `WellDefinedness.lean` -- `norm_squared_ne_zero_of_nonzero` is
      `sorry`. Relocated here from the source's `FieldTheorems` section:
      it is what makes the raw `Inv` instance in `Operations.lean`
      mathematically meaningful (the norm it divides by cannot vanish on
      a nonzero input), the same well-definedness role this stage plays
      for quotient constructions' operations.
- [ ] `Laws.lean` -- the remaining ring/field law statements
      (`addition_is_associative` through `imaginary_unit_squared`, then
      `one_ne_zero_complex`, `mul_inv_cancel_complex`,
      `inv_zero_complex`) -- all `sorry`, moved unchanged.
- [ ] `Behavior.lean` -- the embedding theorems (`of_real_preserves_*`,
      `of_real_is_injective`) and the polynomial/algebraic-closure
      section (`Polynomial`, `Polynomial.evaluate`,
      `Polynomial.nonconstant`, `algebraic_closure_obligation`) -- all
      `sorry`, but the local polynomial carrier now includes the missing
      leading-coefficient invariant so `degree ≠ 0` really does mean the
      polynomial is nonconstant (`Polynomial.evaluate`'s body is `sorry`
      directly, not `by sorry`, matching the source).
- [x] `Instances.lean` -- the ring and field certificate `instance`
      declarations (already genuine, non-`sorry` instances wrapping the
      `sorry`-stated theorems above -- this is valid Lean, not something
      this migration invented) plus the smoke tests
      (`CommutativeRingLaws (ComplexNumber Int)`,
      `FieldLaws (ComplexNumber Rat)`, `FieldLaws (ComplexNumber Real)`),
      moved unchanged.

---

## `Construction.lean` / `Construction/Model.lean` -- no switch to retire

Moved unchanged from `LRA.VolumeII.ComplexNumbers.Construction`/
`Construction.Model`, repointed to import
`LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs` in place of
the old `Construction.Construction`. Like Rational's and Real's
`Construction/Model.lean`, there is no switch: `complexNumbersModel`
takes its carrier `R` as an explicit parameter.
