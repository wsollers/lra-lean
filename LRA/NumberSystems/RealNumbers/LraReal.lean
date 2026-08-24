
import Mathlib.Data.Rat.Defs
import Mathlib.Data.Set.Basic

namespace LRA.NumberSystems.RealNumbers

/--
`LraReal` TODO

Predicate logic:

  structure LraReal where
  lower : Set Rat
  nonempty : lower.Nonempty
  not_all : exists q : Rat, q ∉ lower
  downward : forall {p : Rat}, p ∈ lower -> forall {q : Rat}, q < p -> q ∈ lower
  open_above : forall {p : Rat}, p ∈ lower -> exists r, r ∈ lower /\ p < r

Predicate logic (unfolded):

  structure LraReal where
  lower : Set Rat
  nonempty : lower.Nonempty
  not_all : exists q : Rat, q ∉ lower
  downward : forall {p : Rat}, p ∈ lower -> forall {q : Rat}, q < p -> q ∈ lower
  open_above : forall {p : Rat}, p ∈ lower -> exists r, r ∈ lower /\ p < r (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure LraReal where
  lower : Set Rat
  nonempty : lower.Nonempty
  not_all : exists q : Rat, q ∉ lower
  downward : forall {p : Rat}, p ∈ lower -> forall {q : Rat}, q < p -> q ∈ lower
  open_above : forall {p : Rat}, p ∈ lower -> exists r, r ∈ lower /\ p < r
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
structure LraReal where
  lower : Set Rat
  nonempty : lower.Nonempty
  not_all : exists q : Rat, q ∉ lower
  downward : forall {p : Rat}, p ∈ lower -> forall {q : Rat}, q < p -> q ∈ lower
  open_above : forall {p : Rat}, p ∈ lower -> exists r, r ∈ lower /\ p < r

end LRA.NumberSystems.RealNumbers
namespace LRA.NumberSystems.RealNumbers.LraReal

instance : Preorder LraReal where
  le x y := x.lower ⊆ y.lower
  le_refl x := Set.Subset.refl x.lower
  le_trans _ _ _ hxy hyz := Set.Subset.trans hxy hyz

end LRA.NumberSystems.RealNumbers.LraReal
namespace LRA.NumberSystems.RealNumbers

end LRA.NumberSystems.RealNumbers
