import LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.Theory

namespace LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory

universe u

def toUniverseLStructure
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) :
    UniverseLStructure SetObject where
  base := A
  carrier := U
  carrierHypothesis := universeHypothesis

end LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory
