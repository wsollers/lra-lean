import LRA.VolumeI.Map.Bijective.Theorems
import LRA.VolumeI.Map.Bijective.Definition
import LRA.VolumeI.Map.Inverse.Definition
import LRA.VolumeI.Map.Inverse.Relationships

namespace LRA.Map.Bijective

open LRA.Map.Typed
open LRA.Map.Injective
open LRA.Map.Surjective

universe u v

/--
**[Theorem — BijectiveIffInjectiveAndSurjective]**

Bijectivity is exactly injectivity together with surjectivity.

Logical form:

```lean
theorem BijectiveIffInjectiveAndSurjective
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    Bijective map <-> Injective map /\ Surjective map
```
-/
theorem BijectiveIffInjectiveAndSurjective
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    Bijective map <-> Injective map /\ Surjective map := by
  sorry
/--
**[Theorem — BijectiveOfTwoSidedInverse]**

A map with a two-sided inverse is bijective.

Logical form:

```lean
theorem BijectiveOfTwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    {map : TypedMap Domain Codomain}
    {inverse : TypedMap Codomain Domain}
    (twoSidedInverse :
      LRA.Map.Inverse.TwoSidedInverse map inverse) :
    Bijective map
```
-/
theorem BijectiveOfTwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    {map : TypedMap Domain Codomain}
    {inverse : TypedMap Codomain Domain}
    (twoSidedInverse :
      LRA.Map.Inverse.TwoSidedInverse map inverse) :
    Bijective map := by
  sorry
end LRA.Map.Bijective
