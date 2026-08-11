import LRA.VolumeI.Set.Enderton
import LRA.VolumeI.Set.LRASet
import LRA.VolumeI.Set.Interface
import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Set.MathlibZFSet

/-!
Aggregate import for the Set chapter.

Four backends, two ontologies, two provenances:

|                    | hand-built (proofs are ours) | Mathlib-backed (redirection) |
|--------------------|------------------------------|------------------------------|
| typed predicate    | `LRASet`                     | `MathlibPredicateSet`        |
| single-sorted ZF   | `Enderton`                   | `MathlibZFSet`               |

All four are registered against the same operation classes, so `A ∪ B`,
`A ∩ B`, `A ⊆ B`, `A \ B`, `∅`, and `x ∈ A` resolve at any backend's
type, and the generic fluent theorems (`UnionCommutative A B`, ...)
resolve their certificate from argument types by instance search -- no
law arguments, no plumbing.

Capability differences are structural, not conventional: the predicate
backends have an ambient carrier and register the complement/universal
family (`Aᶜ`, `𝒰`) and the universal-set-based `Preimage`/`Image`
vocabulary; the ZF backends cannot (Russell's paradox), and those
notations simply do not elaborate at their types. The same boundary is
thus enforced twice -- against this project's Enderton axioms and against
Mathlib's ZFC model.

Note: the two Mathlib backends import Mathlib. `Enderton`, `LRASet`, and
`Interface` remain Mathlib-free; drop the last two imports above for a
Mathlib-free build of the chapter.
-/
