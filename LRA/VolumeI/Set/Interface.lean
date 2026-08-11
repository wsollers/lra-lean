import LRA.VolumeI.Set.Interface.Operations
import LRA.VolumeI.Set.Interface.Union
import LRA.VolumeI.Set.Interface.Intersection
import LRA.VolumeI.Set.Interface.Distributivity
import LRA.VolumeI.Set.Interface.Subset
import LRA.VolumeI.Set.Interface.Difference
import LRA.VolumeI.Set.Interface.SymmetricDifference
import LRA.VolumeI.Set.Interface.Complement

/-!
Aggregate import for the generic, backend-agnostic Set interface.

Two kinds of file live here, mirroring the machine/certificate split:

- `Operations.lean` -- *operation* classes (data, no laws) for the three
  set operations Lean core has no notation class for: `HasComplement`
  (`ᶜ`), `HasUniversal` (`𝒰`), `HasSymmDiff` (`∆`). Everything else
  (`∪`, `∩`, `⊆`, `\`, `∅`, `∈`) comes from Lean core's own classes, so
  backends register against those directly.

- One file per law family (`Union.lean`, `Intersection.lean`,
  `Distributivity.lean`, `Subset.lean`, `Difference.lean`,
  `SymmetricDifference.lean`, `Complement.lean`) -- each declares a
  `Prop`-valued *certificate* class (`UnionLaws`, ..., `ComplementLaws`)
  whose fields are the laws, plus one fluent PascalCase theorem per law
  that reads its proof off the certificate by instance search. Ordinary
  use is `UnionCommutative A B`: Lean unifies the backend from the type
  of `A`, finds the certificate, done. No law arguments, no bundled
  interface records, no backend machinery in any signature.

A backend opts in per family by proving the laws in its own `Laws/`
directory and registering one `instance` per family it actually
supports. Capability differences are structural, not conventional:
`ComplementLaws` requires `HasComplement`/`HasUniversal`, which Enderton
can never register (Russell's paradox), so complement theorems simply do
not elaborate at `Enderton.Set` -- while `LRASet` (and a future
Mathlib-backed `Set`) registers them and gets the whole family.

Each family's certificate requires exactly the operation classes its
laws mention: laws that mix operations live with the operation they
characterize (`SubsetIffUnionEqRight` in `Union.lean`,
`DifferenceUniversal` in `Complement.lean`, and so on).

The earlier hypothesis-threading interface (`Interface/Native/` +
`Interface/Fluent/`, each generic theorem taking its law as an explicit
argument) is retired to `hold/Set/InterfacePreLawclass/`; a
Mathlib-backed backend needs no adapter layer under this design -- its
"adapter" is one instance per family whose fields are Mathlib's own
lemmas.
-/
