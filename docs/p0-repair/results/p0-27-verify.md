# p0-27 Verify Result

- Status: `approved`
- Task backend: `main-thread coordinator`
- Verify task id: `main-thread`
- Launched: `2026-08-23`
- Last good stop: `2026-08-23`: verification completed with no bounded correction list

## Verifier Outcome

The spec is correct.

1. The review note identifies two real defects in the same owner surface: the
   Takeuti quantifier rules currently allow capture through
   `substFreeByBound`, and the raw Takeuti atom syntax permits dangling bound
   variables with no scopedness invariant.

2. The bounded repair is to add a structural scopedness invariant and thread it
   into the exported proof-system surfaces, while separately strengthening the
   quantifier rule constructors with the missing binder-freshness hypothesis.

3. A scoped invariant plus scoped `LK`/`LJ` wrappers is sufficient here; this
   closes the unsound exposed surface without forcing a larger de Bruijn or
   intrinsically scoped representation rewrite.

4. The scoped validator on `LRA/Logic/Proof/System/Takeuti` plus the direct
   `lake build LRA.ProofTheory.System.Takeuti` target are sufficient gates for
   the bounded change.

## Resolution

`p0-27` is ready for implementation on `main`: add the scoped syntax
predicates, require `BoundVarFresh` in the quantifier rule constructors,
retarget `LK` and `LJ` to scoped initial/rule surfaces, then run the scoped
validator and build gates before commit and push.
