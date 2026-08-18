import LRA.VolumeI.Function.Injective.Definition
import LRA.VolumeI.Function.Examples.Canonical

namespace LRA.Function.Injective

open LRA.Function
open LRA.Function.Examples.Canonical

universe u v

/--
**[Definition — HasCollision]**

A map has a collision when two distinct domain elements have the same image.

Logical form:

```lean
def HasCollision {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) : Prop
```
-/
def HasCollision {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) : Prop :=
  exists first second : Domain, first ≠ second /\ map first = map second

/--
**[Theorem — HasCollisionIffNotInjective]**

A collision is exactly a failure of injectivity.

Logical form:

```lean
theorem HasCollisionIffNotInjective
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    HasCollision map <-> ¬ Injective map
```
-/
theorem HasCollisionIffNotInjective
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    HasCollision map <-> ¬ Injective map := by
  sorry
/--
**[Theorem — CollapseHasCollision]**

The Boolean collapse map has a collision.

Logical form:

```lean
theorem CollapseHasCollision :
    HasCollision collapse
```
-/
theorem CollapseHasCollision :
    HasCollision collapse := by
  sorry
/--
**[Theorem — CollapseNotInjective]**

The Boolean collapse map is not injective.

Logical form:

```lean
theorem CollapseNotInjective :
    ¬ Injective collapse
```
-/
theorem CollapseNotInjective :
    ¬ Injective collapse := by
  sorry
end LRA.Function.Injective
