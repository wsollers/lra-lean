import LRA.VolumeI.Function.Surjective.Definition
import LRA.VolumeI.Function.Examples.Canonical

namespace LRA.Function.Surjective

open LRA.Function
open LRA.Function.Examples.Canonical

universe u v

/--
**[Definition — MissesValue]**

A map misses a value when some codomain value is hit by no input.

Logical form:

```lean
def MissesValue {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) : Prop
```
-/
def MissesValue {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) : Prop :=
  exists output : Codomain, forall input : Domain, map input ≠ output

/--
**[Theorem — MissesValueIffNotSurjective]**

Missing a value is exactly a failure of surjectivity.

Logical form:

```lean
theorem MissesValueIffNotSurjective
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    MissesValue map <-> ¬ Surjective map
```
-/
theorem MissesValueIffNotSurjective
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    MissesValue map <-> ¬ Surjective map := by
  sorry
/--
**[Theorem — ShiftMissesZero]**

The successor shift misses zero.

Logical form:

```lean
theorem ShiftMissesZero :
    MissesValue shift
```
-/
theorem ShiftMissesZero :
    MissesValue shift := by
  sorry
/--
**[Theorem — ShiftNotSurjective]**

The successor shift is not surjective.

Logical form:

```lean
theorem ShiftNotSurjective :
    ¬ Surjective shift
```
-/
theorem ShiftNotSurjective :
    ¬ Surjective shift := by
  sorry
end LRA.Function.Surjective
