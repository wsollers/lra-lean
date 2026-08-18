import LRA.VolumeI.Function.Typed.Definition

namespace LRA.Function.Retraction

open LRA.Function

universe u v

/--
**[Definition — RetractionOf]**

A retraction of an inclusion-like map recovers every element of the smaller
domain.

Logical form:

```lean
def RetractionOf {Small : Type u} {Large : Type v}
    (retraction : Function Large Small)
    (inclusion : Function Small Large) : Prop
```
-/
def RetractionOf {Small : Type u} {Large : Type v}
    (retraction : Function Large Small)
    (inclusion : Function Small Large) : Prop :=
  forall input, retraction (inclusion input) = input

end LRA.Function.Retraction
