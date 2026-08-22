# p0-15 Verify Result

- Status: `approved`
- Task backend: `main-thread coordinator`
- Verify task id: `main-thread`
- Launched: `2026-08-22`
- Last good stop: verification completed with no bounded correction list

## Verifier Outcome

The spec is correct and implementation-complete.

1. The live defect is a false theorem surface about what "two" means. The
   rational `sqrt-two` cut theorems still abstracted over an arbitrary carrier
   element named `two`, which leaves the intended irrationality target
   underspecified.

2. The rational quotient-fractions behavior owner is the right place to repair
   the theorem surface. The affected declarations live there already, and the
   canonical rational `2` should be defined once in that owner rather than
   passed as an external theorem argument.

3. The real irrationality owner also needs a named canonical constant. The
   `SquareRootTwoWitness` structure should talk about the selected embedded
   real `2`, not a raw `one + one` term repeated inline inside the witness
   contract.

4. Two scoped validator/build pairs are sufficient because the repair spans two
   altered components: the rational router for the quotient-fractions theorem
   owner and the real router for the irrationality witness owner.

## Resolution

`p0-15` is ready for implementation on `main`: define canonical `two`
constants in the rational and real `sqrt-two` owners, retarget the affected
theorem surfaces to those constants, then run the scoped validator and build
gates for both altered components before commit and push.
