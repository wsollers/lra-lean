-- LRA/VolumeIII/RealNumbers/LraReal.lean
-- A lightweight LRA real carrier for early Volume III API tests.

import Mathlib.Data.Rat.Defs
import Mathlib.Data.Set.Basic

namespace LRA.VolumeIII.RealNumbers

/-- An LRA real as a lower Dedekind cut of rationals.

Logical form:

```lean
structure LraReal where
  lower : Set Rat
  nonempty : lower.Nonempty
  not_all : exists q : Rat, q ∉ lower
  downward : forall {p : Rat}, p ∈ lower -> forall {q : Rat}, q < p -> q ∈ lower
  open_above : forall {p : Rat}, p ∈ lower -> exists r, r ∈ lower /\ p < r
```
-/
structure LraReal where
  lower : Set Rat
  nonempty : lower.Nonempty
  not_all : exists q : Rat, q ∉ lower
  downward : forall {p : Rat}, p ∈ lower -> forall {q : Rat}, q < p -> q ∈ lower
  open_above : forall {p : Rat}, p ∈ lower -> exists r, r ∈ lower /\ p < r

end LRA.VolumeIII.RealNumbers
namespace LRA.VolumeIII.RealNumbers.LraReal

/-- The available order on `LraReal` is cut inclusion. -/
instance : Preorder LraReal where
  le x y := x.lower ⊆ y.lower
  le_refl x := Set.Subset.refl x.lower
  le_trans _ _ _ hxy hyz := Set.Subset.trans hxy hyz

end LRA.VolumeIII.RealNumbers.LraReal
namespace LRA.VolumeIII.RealNumbers
