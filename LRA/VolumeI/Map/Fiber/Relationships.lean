import LRA.VolumeI.Map.Fiber.Theorems
import LRA.VolumeI.Map.Fiber.Definition
import LRA.VolumeI.Map.Injective.Definition
import LRA.VolumeI.Map.Surjective.Definition

namespace LRA.Map.Fiber

open LRA.Map.Typed

universe u v

/--
**[Theorem — FiberMembership]**

Membership in the predicate fiber is equality to the selected output.

Logical form:

```lean
theorem FiberMembership
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (output : Codomain)
    (input : Domain) :
    Fiber map output input <-> map input = output
```
-/
theorem FiberMembership
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (output : Codomain)
    (input : Domain) :
    Fiber map output input <-> map input = output := by
  rfl
/--
**[Theorem — InjectiveIffFibersSubsingleton]**

A map is injective exactly when every predicate fiber has at most one member.

Logical form:

```lean
theorem InjectiveIffFibersSubsingleton
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    LRA.Map.Injective.Injective map <->
      forall output input₁ input₂,
        Fiber map output input₁ ->
        Fiber map output input₂ ->
        input₁ = input₂
```
-/
theorem InjectiveIffFibersSubsingleton
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    LRA.Map.Injective.Injective map <->
      forall output input₁ input₂,
        Fiber map output input₁ ->
        Fiber map output input₂ ->
        input₁ = input₂ := by
  constructor
  · intro mapIsInjective output input₁ input₂ input₁InFiber input₂InFiber
    exact mapIsInjective input₁ input₂ (input₁InFiber.trans input₂InFiber.symm)
  · intro fibersSubsingleton input₁ input₂ sameOutput
    exact fibersSubsingleton (map input₂) input₁ input₂ sameOutput rfl
/--
**[Theorem — SurjectiveIffEveryFiberNonempty]**

A map is surjective exactly when every predicate fiber is nonempty.

Logical form:

```lean
theorem SurjectiveIffEveryFiberNonempty
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    LRA.Map.Surjective.Surjective map <->
      forall output, exists input, Fiber map output input
```
-/
theorem SurjectiveIffEveryFiberNonempty
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    LRA.Map.Surjective.Surjective map <->
      forall output, exists input, Fiber map output input := by
  rfl
end LRA.Map.Fiber
