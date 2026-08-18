import LRA.VolumeI.Function.Fiber.Theorems
import LRA.VolumeI.Function.Fiber.Definition
import LRA.VolumeI.Function.Injective.Definition
import LRA.VolumeI.Function.Surjective.Definition

namespace LRA.Function.Fiber

open LRA.Function

universe u v

/--
**[Theorem — FiberMembership]**

Membership in the predicate fiber is equality to the selected output.

Logical form:

```lean
theorem FiberMembership
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain)
    (output : Codomain)
    (input : Domain) :
    Fiber map output input <-> map input = output
```
-/
theorem FiberMembership
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain)
    (output : Codomain)
    (input : Domain) :
    Fiber map output input <-> map input = output := by
  sorry
/--
**[Theorem — InjectiveIffFibersSubsingleton]**

A map is injective exactly when every predicate fiber has at most one member.

Logical form:

```lean
theorem InjectiveIffFibersSubsingleton
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    LRA.Function.Injective.Injective map <->
      forall output input₁ input₂,
        Fiber map output input₁ ->
        Fiber map output input₂ ->
        input₁ = input₂
```
-/
theorem InjectiveIffFibersSubsingleton
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    LRA.Function.Injective.Injective map <->
      forall output input₁ input₂,
        Fiber map output input₁ ->
        Fiber map output input₂ ->
        input₁ = input₂ := by
  sorry
/--
**[Theorem — SurjectiveIffEveryFiberNonempty]**

A map is surjective exactly when every predicate fiber is nonempty.

Logical form:

```lean
theorem SurjectiveIffEveryFiberNonempty
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    LRA.Function.Surjective.Surjective map <->
      forall output, exists input, Fiber map output input
```
-/
theorem SurjectiveIffEveryFiberNonempty
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    LRA.Function.Surjective.Surjective map <->
      forall output, exists input, Fiber map output input := by
  sorry
end LRA.Function.Fiber
