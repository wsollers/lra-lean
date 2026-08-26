import LRA.Set.Constructions.GrothendieckUniverse.Definitions

namespace LRA.Set.Constructions.GrothendieckUniverse

universe u

class GrothendieckUniverseAxiom
    (SetObject : Type u) [Membership SetObject SetObject] : Prop where
  universeExists :
    ∀ A : SetObject, ∃ U : SetObject, IsGrothendieckUniverseFor A U

end LRA.Set.Constructions.GrothendieckUniverse
