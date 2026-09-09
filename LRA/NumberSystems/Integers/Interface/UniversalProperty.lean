import LRA.NumberSystems.Integers.Interface.ModelTheory.Theory
import LRA.NumberSystems.Integers.Interface.ModelTheory.LStructure
import LRA.NumberSystems.Integers.Interface.Satisfy_ModelTheory
import LRA.UniversalAlgebra.Homomorphism.Definition
import LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObjects

namespace LRA.NumberSystems.Integers

open LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory
open LRA.NumberSystems.Integers.Interface.ModelTheory

/--
`DiscretelyOrderedIntegralDomain` A discretely-ordered integral domain realizing the ℤ signature: an `OrderedRingSignature` together with a proof that it satisfies `IntegersTheory`.

Predicate logic:

  abbrev DiscretelyOrderedIntegralDomain :=
    {signature : OrderedRingSignature // IntegersTheory signature}

Predicate logic (unfolded):

  abbrev DiscretelyOrderedIntegralDomain :=
    {signature : OrderedRingSignature // IntegersTheory signature} (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev DiscretelyOrderedIntegralDomain :=
  {signature : OrderedRingSignature // IntegersTheory signature}
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
abbrev DiscretelyOrderedIntegralDomain :=
  {signature : OrderedRingSignature // IntegersTheory signature}

/--
`DiscretelyOrderedIntegralDomainArrow` Structure-preserving maps between discretely-ordered integral domains, realized as homomorphisms between the first-order models each signature induces.

Predicate logic:

  abbrev DiscretelyOrderedIntegralDomainArrow
      (source target : DiscretelyOrderedIntegralDomain) :=
    LRA.UniversalAlgebra.Homomorphism
      (BuildOrderedRingModel source.val) (BuildOrderedRingModel target.val)

Predicate logic (unfolded):

  abbrev DiscretelyOrderedIntegralDomainArrow
      (source target : DiscretelyOrderedIntegralDomain) :=
    LRA.UniversalAlgebra.Homomorphism
      (BuildOrderedRingModel source.val) (BuildOrderedRingModel target.val) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev DiscretelyOrderedIntegralDomainArrow
    (source target : DiscretelyOrderedIntegralDomain) :=
  LRA.UniversalAlgebra.Homomorphism
    (BuildOrderedRingModel source.val) (BuildOrderedRingModel target.val)
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
abbrev DiscretelyOrderedIntegralDomainArrow
    (source target : DiscretelyOrderedIntegralDomain) :=
  LRA.UniversalAlgebra.Homomorphism
    (BuildOrderedRingModel source.val) (BuildOrderedRingModel target.val)

/--
`IntegersInitial` ℤ (realized here by Mathlib's `Int`) is the initial discretely-ordered integral domain: every discretely-ordered integral domain `A` receives exactly one homomorphism from ℤ, namely `n ↦ n • 1_A`.

Predicate logic:

  LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject LRA.NumberSystems.Integers.DiscretelyOrderedIntegralDomain LRA.NumberSystems.Integers.DiscretelyOrderedIntegralDomainArrow ⟨LRA.NumberSystems.Integers.Interface.ModelTheory.mathlibIntegerModel.signature, ⋯⟩

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject LRA.NumberSystems.Integers.DiscretelyOrderedIntegralDomain LRA.NumberSystems.Integers.DiscretelyOrderedIntegralDomainArrow ⟨{ carrier := LRA.NumberSystems.Integers.Interface.ModelTheory.mathlibIntegerModel.1, zero := 0, one := 1, add := fun x1 x2 => { hAdd := fun a b => LRA.NumberSystems.Integers.Interface.ModelTheory.mathlibIntegerModel.2.add a b }.hAdd x1 x2, multiply := fun x1 x2 => { hMul := fun a b => LRA.NumberSystems.Integers.Interface.ModelTheory.mathlibIntegerModel.3.mul a b }.hMul x1 x2, neg := fun x => LRA.NumberSystems.Integers.Interface.ModelTheory.mathlibIntegerModel.4.neg x, le := fun x1 x2 => LRA.NumberSystems.Integers.Interface.ModelTheory.mathlibIntegerModel.8.le x1 x2, StrictOrder := fun x1 x2 => LRA.NumberSystems.Integers.Interface.ModelTheory.mathlibIntegerModel.7.lt x1 x2 }, ⋯⟩

Logical form (Lean):

```lean
theorem IntegersInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      DiscretelyOrderedIntegralDomain
      DiscretelyOrderedIntegralDomainArrow
      ⟨mathlibIntegerModel.signature, satisfiesModelTheory mathlibIntegerModel⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem IntegersInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      DiscretelyOrderedIntegralDomain
      DiscretelyOrderedIntegralDomainArrow
      ⟨mathlibIntegerModel.signature, satisfiesModelTheory mathlibIntegerModel⟩ := by
  sorry
end LRA.NumberSystems.Integers
