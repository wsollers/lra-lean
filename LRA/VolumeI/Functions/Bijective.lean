import LRA.VolumeI.Functions.Injective
import LRA.VolumeI.Functions.Surjective

namespace LRA.VolumeI.Functions

universe u

/--
Bijectivity of a function.

Logical form:

```lean
def Bijective {Domain Codomain : Type u} (map : Domain -> Codomain) : Prop :=
  Injective map /\ Surjective map
```
-/
def Bijective {Domain Codomain : Type u} (map : Domain -> Codomain) : Prop :=
  Injective map /\ Surjective map

end LRA.VolumeI.Functions
