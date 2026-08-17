import LRA.VolumeI.Map.Composition.Definition
import LRA.VolumeI.Map.Injective.Definition
import LRA.VolumeI.Map.Surjective.Definition
import LRA.VolumeI.Map.Bijective.Definition

namespace LRA.Map.Composition

open LRA.Map.Typed

universe u v w

/--
**[Definition — CompositeInjectiveSecondNotInjective]**

The composite can be injective while its second leg is not.

Logical form:

```lean
def CompositeInjectiveSecondNotInjective
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (first : TypedMap Domain Middle)
    (second : TypedMap Middle Codomain) : Prop
```
-/
def CompositeInjectiveSecondNotInjective
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (first : TypedMap Domain Middle)
    (second : TypedMap Middle Codomain) : Prop :=
  LRA.Map.Injective.Injective (Composition second first) /\
    ¬ LRA.Map.Injective.Injective second

/--
**[Definition — CompositeSurjectiveFirstNotSurjective]**

The composite can be surjective while its first leg is not.

Logical form:

```lean
def CompositeSurjectiveFirstNotSurjective
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (first : TypedMap Domain Middle)
    (second : TypedMap Middle Codomain) : Prop
```
-/
def CompositeSurjectiveFirstNotSurjective
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (first : TypedMap Domain Middle)
    (second : TypedMap Middle Codomain) : Prop :=
  LRA.Map.Surjective.Surjective (Composition second first) /\
    ¬ LRA.Map.Surjective.Surjective first

/--
**[Definition — CompositeBijectiveWithSlackMiddle]**

The composite can be bijective while neither stage is forced to be bijective
in the missing direction.

Logical form:

```lean
def CompositeBijectiveWithSlackMiddle
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (first : TypedMap Domain Middle)
    (second : TypedMap Middle Codomain) : Prop
```
-/
def CompositeBijectiveWithSlackMiddle
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (first : TypedMap Domain Middle)
    (second : TypedMap Middle Codomain) : Prop :=
  LRA.Map.Bijective.Bijective (Composition second first) /\
    (¬ LRA.Map.Surjective.Surjective first \/
      ¬ LRA.Map.Injective.Injective second)

end LRA.Map.Composition
