import LRA.VolumeI.Function.Bijective.Theorems
import LRA.VolumeI.Function.Bijective.Definition
import LRA.VolumeI.Function.Inverse.Definition
import LRA.VolumeI.Function.Inverse.Relationships

namespace LRA.Function.Bijective

open LRA.Function
open LRA.Function.Injective
open LRA.Function.Surjective

universe u v

/--
**[Theorem — BijectiveIffInjectiveAndSurjective]**

Bijectivity is exactly injectivity together with surjectivity.

Logical form:

```lean
theorem BijectiveIffInjectiveAndSurjective
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    Bijective map <-> Injective map /\ Surjective map
```
-/
theorem BijectiveIffInjectiveAndSurjective
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    Bijective map <-> Injective map /\ Surjective map := by
  sorry
/--
**[Theorem — BijectiveOfTwoSidedInverse]**

A map with a two-sided inverse is bijective.

Logical form:

```lean
theorem BijectiveOfTwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    {map : Function Domain Codomain}
    {inverse : Function Codomain Domain}
    (twoSidedInverse :
      LRA.Function.Inverse.TwoSidedInverse map inverse) :
    Bijective map
```
-/
theorem BijectiveOfTwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    {map : Function Domain Codomain}
    {inverse : Function Codomain Domain}
    (twoSidedInverse :
      LRA.Function.Inverse.TwoSidedInverse map inverse) :
    Bijective map := by
  sorry
end LRA.Function.Bijective
