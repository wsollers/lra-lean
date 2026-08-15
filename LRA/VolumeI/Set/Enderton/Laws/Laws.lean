import LRA.VolumeI.Set.Enderton.Laws.Membership
import LRA.VolumeI.Set.Enderton.Laws.Union
import LRA.VolumeI.Set.Enderton.Laws.Intersection
import LRA.VolumeI.Set.Enderton.Laws.Distributivity
import LRA.VolumeI.Set.Enderton.Laws.Difference
import LRA.VolumeI.Set.Enderton.Laws.SymmetricDifference
import LRA.VolumeI.Set.Enderton.Laws.Subset

/-!
Aggregate import for the Enderton law certificates: one file per interface
family, each proving the family's laws for `Enderton.Set` and registering
the `Prop`-valued certificate instance (`UnionLaws Set`, ...) that makes
the generic fluent theorems (`LRA.Set.UnionCommutative`, ...)
available at `Set` by instance search.

No `Complement.lean` here, and there never will be: the complement family
requires `HasComplement`/`HasUniversal` instances, and Enderton
structurally cannot have an absolute complement or universal set
(Russell's paradox). The absence is enforced by the type system --
`Aᶜ`/`𝒰` do not elaborate at `Set` -- not by convention. `LRASet/Laws/`
is where that family lives.
-/
