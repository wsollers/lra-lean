import LRA.VolumeI.Functions.Functions

namespace LRA.VolumeI.Functions

universe u

/--
Composition of functions.

Logical form:

```lean
def Composition {First Second Third : Type u}
    (secondMap : Second -> Third)
    (firstMap : First -> Second) : First -> Third :=
  fun input => secondMap (firstMap input)
```
-/
def Composition {First Second Third : Type u}
    (secondMap : Second -> Third)
    (firstMap : First -> Second) : First -> Third :=
  fun input => secondMap (firstMap input)

/--
Function composition is associative.

Logical form:

```lean
theorem CompositionAssociative {First Second Third Fourth : Type u}
    (thirdMap : Third -> Fourth)
    (secondMap : Second -> Third)
    (firstMap : First -> Second) :
    Composition thirdMap (Composition secondMap firstMap) =
      Composition (Composition thirdMap secondMap) firstMap
```
-/
theorem CompositionAssociative {First Second Third Fourth : Type u}
    (thirdMap : Third -> Fourth)
    (secondMap : Second -> Third)
    (firstMap : First -> Second) :
    Composition thirdMap (Composition secondMap firstMap) =
      Composition (Composition thirdMap secondMap) firstMap := by
  rfl

end LRA.VolumeI.Functions
