import LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.Theory

namespace LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory

universe u

/--
`toUniverseLStructure` TODO

Predicate logic:

  def toUniverseLStructure
      {SetObject : Type u}
      [Membership SetObject SetObject]
      (A U : SetObject)
      (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) :
      UniverseLStructure SetObject where
    base := A
    carrier := U
    carrierHypothesis := universeHypothesis

Predicate logic (unfolded):

  def toUniverseLStructure
      {SetObject : Type u}
      [Membership SetObject SetObject]
      (A U : SetObject)
      (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) :
      UniverseLStructure SetObject where
    base := A
    carrier := U
    carrierHypothesis := universeHypothesis (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def toUniverseLStructure
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) :
    UniverseLStructure SetObject where
  base := A
  carrier := U
  carrierHypothesis := universeHypothesis
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
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
