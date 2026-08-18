import LRA.VolumeI.Function.Composition.Definition
import LRA.VolumeI.Function.Injective.Definition
import LRA.VolumeI.Function.Surjective.Definition
import LRA.VolumeI.Function.Bijective.Definition

namespace LRA.Function.Composition

open LRA.Function

universe u v w

/--
**[Definition — CompositeInjectiveSecondNotInjective]**

The composite can be injective while its second leg is not.

Logical form:

```lean
def CompositeInjectiveSecondNotInjective
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (first : Function Domain Middle)
    (second : Function Middle Codomain) : Prop
```
-/
def CompositeInjectiveSecondNotInjective
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (first : Function Domain Middle)
    (second : Function Middle Codomain) : Prop :=
  LRA.Function.Injective.Injective (Composition second first) /\
    ¬ LRA.Function.Injective.Injective second

/--
**[Definition — CompositeSurjectiveFirstNotSurjective]**

The composite can be surjective while its first leg is not.

Logical form:

```lean
def CompositeSurjectiveFirstNotSurjective
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (first : Function Domain Middle)
    (second : Function Middle Codomain) : Prop
```
-/
def CompositeSurjectiveFirstNotSurjective
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (first : Function Domain Middle)
    (second : Function Middle Codomain) : Prop :=
  LRA.Function.Surjective.Surjective (Composition second first) /\
    ¬ LRA.Function.Surjective.Surjective first

/--
**[Definition — CompositeBijectiveWithSlackMiddle]**

The composite can be bijective while neither stage is forced to be bijective
in the missing direction.

Logical form:

```lean
def CompositeBijectiveWithSlackMiddle
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (first : Function Domain Middle)
    (second : Function Middle Codomain) : Prop
```
-/
def CompositeBijectiveWithSlackMiddle
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (first : Function Domain Middle)
    (second : Function Middle Codomain) : Prop :=
  LRA.Function.Bijective.Bijective (Composition second first) /\
    (¬ LRA.Function.Surjective.Surjective first \/
      ¬ LRA.Function.Injective.Injective second)

end LRA.Function.Composition
