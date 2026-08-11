import LRA.VolumeI.Set.LRASet.LRASet
import LRA.VolumeI.Set.LRASet.Operations
import LRA.VolumeI.Set.LRASet.Instances
import LRA.VolumeI.Set.LRASet.Laws.Laws

/-!
Aggregate import for the LRASet chapter: a typed predicate-set backend,
sibling to `Set.Enderton`.

Where `Enderton` is fully axiomatic -- a single-sorted primitive language,
nine ZFC axioms, and existence/uniqueness/chosen-witness theorems for each --
`LRASet` needs none of that: `LRASet Alpha := Alpha -> Prop` makes every
operation a total, directly-defined function, so there is nothing to prove
exists and nothing to prove unique. That asymmetry is expected, not a gap:
well-foundedness and well-definedness are Enderton-specific work, paid once,
not a cost every backend repeats.

The chapter splits four ways: `LRASet.lean` (the core type, membership, and
extensionality), `Operations.lean` (the named operation vocabulary,
including the `Complement`/`Universal` pair no Enderton set can have),
`Instances.lean` (registration against Lean's shared notation classes and
the project's capability classes `HasComplement`/`HasUniversal`/
`HasSymmDiff`), and `Laws/` (the law-family certificates -- one instance
per interface family, including the complement family that exists only for
this backend).
-/
