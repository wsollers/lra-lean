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

end LRA.Set.TG
