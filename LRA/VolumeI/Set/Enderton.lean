import LRA.VolumeI.Set.Enderton.Primitives
import LRA.VolumeI.Set.Enderton.Axioms.Axioms
import LRA.VolumeI.Set.Enderton.Definitions
import LRA.VolumeI.Set.Enderton.Theorems.Theorems
import LRA.VolumeI.Set.Enderton.Instances
import LRA.VolumeI.Set.Enderton.Laws.Laws

/-!
Aggregate import for the Enderton chapter of Volume I set theory.

This chapter is fully axiomatic, from identity through the set axioms: it
takes `Identity`'s primitive equality axioms as given, adds the primitive
single-sorted language of sets (`Primitives.lean`), states the nine ZFC
axioms as bare propositions with no operation smuggled in as data
(`Axioms/Axioms.lean`), names the textbook predicates those axioms talk about
(`Definitions.lean`), and proves each axiom's existence/uniqueness theorem
plus its chosen witness (`Theorems/`), in the same order Enderton develops
them: Extensionality, Empty Set, Pairing, Union (with binary union derived
from it), Power Set, Separation, Replacement, Infinity, Foundation, Choice --
plus `RelativeComplement` and `Intersection`, both direct instances of
Separation, and `SymmetricDifference`, derived from relative complement and
binary union.

`Instances.lean` registers `Set` against Lean's shared notation classes
(`Union`, `Inter`, `HasSubset`, `EmptyCollection`, `SDiff`) and the
project's `HasSymmDiff`; the `Membership` instance lives with the primitive
language in `Primitives.lean`. `Laws/` then holds the Enderton proofs of
each interface law family, and registers the `Prop`-valued certificate
instances (`UnionLaws Set`, `IntersectionLaws Set`, ...) that make the
generic fluent theorems in `Set.Interface` -- `UnionCommutative`,
`DifferenceSelf`, and the rest -- resolve at `Set` by instance search, with
no explicit law arguments anywhere. The complement family is the deliberate
exception: no `HasComplement`/`HasUniversal` instance exists for `Set`
(Russell's paradox), so those theorems are structurally unavailable rather
than stubbed.
-/
