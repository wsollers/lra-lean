import LRA.VolumeI.Set.MathlibPredicateSet.Instances
import LRA.VolumeI.Set.MathlibPredicateSet.Laws

/-!
Aggregate import for the MathlibPredicateSet backend: Mathlib's `Set Alpha`
as an LRA set backend.

The Mathlib-backed sibling of `LRASet` -- typed predicate sets with an
ambient carrier, supporting the full capability set including complement
and universal set. Everything is redirection: `Instances.lean` registers
the project's capability classes against Mathlib's operations, and
`Laws.lean` registers every certificate with Mathlib's own lemmas as the
proofs. No `sorry` anywhere -- by design, this backend has nothing left
to prove.

Requires Mathlib; this is the "proving against Mathlib is too easy"
backend, kept for cross-checking the hand-built ones and for downstream
chapters that want Mathlib's automation.
-/
