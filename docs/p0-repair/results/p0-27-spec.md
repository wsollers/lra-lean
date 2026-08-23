# p0-27 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/Logic/Proof/System/Takeuti`
- Build target: `LRA.Logic.Proof.System.Takeuti`
- Last good stop: `2026-08-23`: spec frozen on disk and ready for implementation

## Brief Summary

`p0-27` repairs two linked defects in the Takeuti sequent-calculus owner
surface. First, the quantifier rules build `∀x` and `∃x` by
`body.substFreeByBound a x` without requiring `x` to be fresh for `body`, so
an already-bound `x` inside `body` can be accidentally captured. Second, the
raw syntax permits `FormulaArg.bound x` anywhere inside an atom, with no
structural condition ensuring that each such bound variable is actually under
an enclosing quantifier.

The bounded fix is to add an explicit well-scopedness invariant to Takeuti
formula arguments, formulas, and sequents; strengthen the quantifier rule
constructors with the missing `BoundVarFresh` side condition; and retarget the
`LK` and `LJ` proof-system surfaces so they admit only well-scoped initial
sequents and well-scoped rule applications.

## Exact Repair List

- Extend
  [LRA/Logic/Proof/System/Takeuti/Term.lean](/F:/repos/lra-lean/LRA/Logic/Proof/System/Takeuti/Term.lean:1)
  with a structural `FormulaArg.WellScopedIn` predicate parameterized by the
  currently available bound-variable scope.

- Extend
  [LRA/Logic/Proof/System/Takeuti/Formula.lean](/F:/repos/lra-lean/LRA/Logic/Proof/System/Takeuti/Formula.lean:1)
  with `Formula.WellScopedIn` and top-level `Formula.WellScoped`, so raw
  Takeuti formulas expose the missing scoped-syntax invariant directly.

- Extend
  [LRA/Logic/Proof/System/Takeuti/Judgement.lean](/F:/repos/lra-lean/LRA/Logic/Proof/System/Takeuti/Judgement.lean:1)
  with `Judgement.WellScoped` requiring every antecedent and succedent formula
  to be top-level well-scoped.

- Retarget
  [LRA/Logic/Proof/System/Takeuti/Rule.lean](/F:/repos/lra-lean/LRA/Logic/Proof/System/Takeuti/Rule.lean:1)
  so the four quantifier rule constructors (`allLeft`, `allRight`, `exLeft`,
  `exRight`) explicitly require `body.BoundVarFresh x`, and add a
  `ScopedRule` wrapper demanding well-scoped upper and lower sequents.

- Retarget
  [LRA/Logic/Proof/System/Takeuti/LK.lean](/F:/repos/lra-lean/LRA/Logic/Proof/System/Takeuti/LK.lean:1)
  and
  [LRA/Logic/Proof/System/Takeuti/LJ.lean](/F:/repos/lra-lean/LRA/Logic/Proof/System/Takeuti/LJ.lean:1)
  so the exported proof-system surfaces use scoped initial sequents and
  scoped-rule applications rather than the unconstrained raw shapes.

## Acceptance Criteria

- The Takeuti quantifier rule constructors no longer permit the known
  bound-variable capture pattern; each use of `substFreeByBound a x` at the
  rule surface requires `body.BoundVarFresh x`.
- The Takeuti syntax owner exposes a structural well-scopedness predicate for
  formula arguments, formulas, and sequents.
- The exported `LK` and `LJ` proof-system surfaces accept only well-scoped
  initial sequents and well-scoped rule applications.
- The repair stays inside the canonical Takeuti owner modules and does not
  widen into a separate representation overhaul.
- `python scripts/validate_structure.py --path LRA/Logic/Proof/System/Takeuti`
  passes.
- `lake build LRA.Logic.Proof.System.Takeuti` passes.

## Blockers Or Dependencies

No earlier open P0 blocks this item.

The bounded repair closes the Takeuti capture defect by freshness side
conditions and closes the dangling-bound-variable defect by an explicit scoped
syntax invariant; it does not require the broader second-order or soundness
repairs queued later in `LRAReview.md`.
