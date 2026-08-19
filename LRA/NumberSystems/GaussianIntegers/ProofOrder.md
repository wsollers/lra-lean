# Gaussian Integers Proof Order

Tracks the proofs needed to land the Gaussian-integer construction, in
the order they should be discharged. Every item marked `[ ]` is currently
`sorry`; nothing is filled in until it's checked off.

## Backends

Exactly one construction, `OrderedPairs` -- the same classical
ordered-pair shape as `ComplexNumbers.Constructions.OrderedPairs`, but
over a *commutative-ring* carrier `R` rather than a field (Gaussian
integers are a ring, not a field: no `Inv` instance, no norm-nonvanishing
obligation, no algebraic-closure theorem). No rival axiomatization is
expected, mirroring `ComplexNumbers`.

Unlike `ComplexNumbers`, the source (`LRA.VolumeII.GaussianIntegers
.Construction.Model`, 400 lines) never separated the construction itself
from its "active" instantiation and first-order model -- both lived in
one file. This migration performs that split too, so the two sibling
systems end up with the same shape: the construction moves to
`Constructions/OrderedPairs/*`; the active instantiation
(`ActiveGaussianInteger`, `gaussianArithmeticRingModel`,
`GaussianArithmeticRingModel`) moves to `Construction.lean` /
`Construction/Model.lean`, matching where Complex's analogous (but
switch-free) `complexNumbersModel` lives.

---

# Part A -- OrderedPairs

- [x] `Carrier.lean` -- `GaussianInteger`, `OfNat 0`/`OfNat 1` instances,
      `imaginaryUnit`, written (no proof obligation).
- [x] `Equivalence.lean` -- no new content. Unlike its sibling
      `ComplexNumbers.Constructions.OrderedPairs`, the source never
      stated a coordinatewise-equality `ext` lemma for `GaussianInteger`
      either -- not added here, since inventing one would be new content
      for symmetry with Complex, not something the source called for.
- [x] `WellFoundedness.lean` -- no new content, same reasoning as
      Complex's analogous file (plain structure, Lean's recursor
      suffices).
- [x] `Operations.lean` -- `Add`/`Neg`/`Sub`/`Mul` instances,
      `conjugation`, `normSquared`, written (no proof obligation). No
      `Inv` instance and no `of_real`-style embedding exist in the
      source (asymmetric with Complex, preserved as-is).
- [x] `WellDefinedness.lean` -- no new content: no `Inv` instance means
      no norm-nonvanishing obligation analogous to Complex's
      `norm_squared_ne_zero_of_nonzero`.
- [ ] `Laws.lean` -- the ring law statements (`addition_is_associative`
      through `imaginary_unit_squared`, `_gaussian`-suffixed where the
      source suffixed them) -- all `sorry`, moved unchanged. No
      `FieldTheorems` section exists (Gaussian integers are a ring, not
      a field).
- [x] `Behavior.lean` -- no new content: no embedding-theorems section
      and no algebraic-closure-style obligation exist in the source (no
      field structure to close algebraically).
- [x] `Instances.lean` -- the ring certificate `instance` declarations
      (already genuine, non-`sorry`), plus a smoke test over
      `GaussianInteger Int` (the `ActiveGaussianInteger`-specific smoke
      tests moved to `Construction/Model.lean` instead -- see below).

---

## `Construction.lean` / `Construction/Model.lean` -- switch stays downstream

Moved from the tail of `LRA.VolumeII.GaussianIntegers.Construction.Model`
(previously mixed into the same file as the construction). Holds
`ActiveGaussianInteger := GaussianInteger LRA.NumberSystems.Integers.Z`,
`gaussianArithmeticRingModel`, `GaussianArithmeticRingModel`, and the
`ActiveGaussianInteger`-specific smoke tests. Unlike Complex (no switch
at all) and unlike Rational/Real (switch already retired, parameter
instead), this file still sits downstream of Integer's active-carrier
switch (`LRA.VolumeII.Integers.Implementation`'s `Z` abbreviation) --
unchanged by this move, since retiring that switch is Integer's own
concern (§7.7 step 5), not this migration's.
