import LRA.Set.Constructions.GrothendieckUniverse.Definitions

namespace LRA.Set.Constructions.GrothendieckUniverse

universe u

/--
`GrothendieckUniverseAxiom` TODO

Predicate logic:

  class GrothendieckUniverseAxiom
      (SetObject : Type u) [Membership SetObject SetObject] : Prop where
    universeExists :
      ∀ A : SetObject, ∃ U : SetObject, IsGrothendieckUniverseFor A U

Predicate logic (unfolded):

  class GrothendieckUniverseAxiom
      (SetObject : Type u) [Membership SetObject SetObject] : Prop where
    universeExists :
      ∀ A : SetObject, ∃ U : SetObject, IsGrothendieckUniverseFor A U (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class GrothendieckUniverseAxiom
    (SetObject : Type u) [Membership SetObject SetObject] : Prop where
  universeExists :
    ∀ A : SetObject, ∃ U : SetObject, IsGrothendieckUniverseFor A U
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
class GrothendieckUniverseAxiom
    (SetObject : Type u) [Membership SetObject SetObject] : Prop where
  universeExists :
    ∀ A : SetObject, ∃ U : SetObject, IsGrothendieckUniverseFor A U

end LRA.Set.Constructions.GrothendieckUniverse
