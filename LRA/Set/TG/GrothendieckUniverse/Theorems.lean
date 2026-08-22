import LRA.Set.TG.Axioms.GrothendieckUniverse
import LRA.Set.TG.Definitions

namespace LRA.Set.TG

/-- Every TG set is contained in a Grothendieck universe. -/
theorem GrothendieckUniverseExists (A : Set) :
    exists U : Set, IsGrothendieckUniverseFor A U := by
  sorry

/-- A chosen Grothendieck universe containing `A`. -/
noncomputable def TheGrothendieckUniverse (A : Set) : Set :=
  Classical.choose (GrothendieckUniverseExists A)

/-- The chosen Grothendieck universe has the expected closure properties. -/
theorem TheGrothendieckUniverseIsGrothendieckUniverseFor (A : Set) :
    IsGrothendieckUniverseFor A (TheGrothendieckUniverse A) := by
  sorry

/-- A Grothendieck universe is closed under ordinary union of any member.

If `X ∈ U`, transitivity gives `i ∈ U` for every `i ∈ X`. Applying the
indexed-union closure clause to the identity family `i ↦ i` therefore produces
an element of `U` whose members are exactly the members of members of `X`.

Logical form:

```lean
theorem GrothendieckUniverseClosedUnderUnion
    {A U X : Set}
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (XInUniverse : X ∈ U) :
    exists union : Set,
      union ∈ U /\ IsUnionOf X union
```
-/
theorem GrothendieckUniverseClosedUnderUnion
    {A U X : Set}
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (XInUniverse : X ∈ U) :
    exists union : Set,
      union ∈ U /\ IsUnionOf X union := by
  sorry

end LRA.Set.TG
