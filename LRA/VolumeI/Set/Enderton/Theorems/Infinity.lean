import LRA.VolumeI.Set.Enderton.Axioms.Axioms
import LRA.VolumeI.Set.Enderton.Definitions

/-!
Existence of an inductive set.

Unlike Empty Set, Pairing, Union, and Power Set, Infinity does not pin down a
unique object: many inductive sets exist (e.g. any inductive set enlarged by
extra members stays inductive), so there is no `TheInductiveSet` chosen
witness here, and no uniqueness theorem to state. The next textbook step —
separating out the *smallest* inductive set, `ω`, using this existence result
together with Separation and Power Set applied to a fixed witness — is a
larger, separate theorem left for a later file, not attempted here.
-/

namespace LRA.VolumeI.Set.Enderton

/-- There exists an inductive set. This is the Axiom of Infinity restated
using the named `IsInductiveSet` predicate.

Logical form:

```lean
theorem InductiveSetExists :
    ∃ A : Set, IsInductiveSet A
```
-/
theorem InductiveSetExists :
    ∃ A : Set, IsInductiveSet A := by
  sorry

end LRA.VolumeI.Set.Enderton
