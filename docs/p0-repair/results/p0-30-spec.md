# p0-30 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/Analysis/Sequences`
- Build target: `LRA.Analysis.Sequences`
- Last good stop: `2026-08-23`: spec frozen on disk and implemented on `main`

## Brief Summary

`p0-30` repairs a semantic mismatch in the draft real-sequence limsup/liminf
owner surface. The file `LRA/Analysis/Sequences/LiminfLimsup.lean` exposed
real-valued `TailSupSeq`, `TailInfSeq`, `LimsupSeq`, and `LiminfSeq` on
arbitrary real sequences by taking `sSup` and `sInf` of every tail set in `ℝ`.

That is not mathematically honest for the real-valued codomain the file uses:
tail suprema need a bounded-above witness and tail infima need a bounded-below
witness. Without those hypotheses, the owner surface silently relies on the
ambient totalized complete-lattice operations on `ℝ`, which is exactly the
false empty/unbounded semantics flagged in `LRAReview.md`.

The bounded repair is to make the raw tail-supremum and tail-infimum sequence
owners require the corresponding one-sided boundedness witnesses, package those
witnesses existentially inside the exported limsup/liminf relations, and
retarget the one direct well-definedness theorem in `OrderLimits.lean` that
talked about the raw tail sequences.

## Exact Repair List

- Strengthen
  [LRA/Analysis/Sequences/LiminfLimsup.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences/LiminfLimsup.lean:1)
  so `TailSupSeq` requires `BoundedAboveSeq x` and `TailInfSeq` requires
  `BoundedBelowSeq x` before taking real-valued `sSup` / `sInf` of the tail
  sets.

- Retarget the same owner file so `LimsupSeq x L` now means
  `∃ h : BoundedAboveSeq x, ConvergesTo (TailSupSeq x h) L`, and `LiminfSeq`
  dually packages a bounded-below witness.

- Retarget the same file's immediate monotonicity theorems so
  `TailSupremaAreDecreasing` takes a bounded-above witness and
  `TailInfimaAreIncreasing` takes a bounded-below witness.

- Retarget
  [LRA/Analysis/Sequences/OrderLimits.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences/OrderLimits.lean:1)
  so `TailSupremaInfimaConverge` states convergence only for well-defined
  one-sided bounded tail sequences, while `BoundedSequenceLimsupLiminf`
  continues to expose the packaged limsup/liminf existence result.

## Acceptance Criteria

- The raw real-valued tail-supremum owner no longer exists on arbitrary
  sequences; it requires a bounded-above witness.
- The raw real-valued tail-infimum owner no longer exists on arbitrary
  sequences; it requires a bounded-below witness.
- The exported limsup/liminf relations remain real-valued relations on
  sequences, but they now package the required one-sided boundedness witness
  explicitly instead of relying on totalized `sSup` / `sInf` semantics.
- The direct order-limits well-definedness theorem is aligned with the repaired
  owner surface.
- `python scripts/validate_structure.py --path LRA/Analysis/Sequences` passes.
- `lake build LRA.Analysis.Sequences` passes.

## Blockers Or Dependencies

No earlier open P0 blocks this item.
