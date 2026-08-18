import LRA.VolumeI.Map.Fiber.Theorems
import LRA.VolumeI.Map.Fiber.Definition
import LRA.Function.Definition
import LRA.Function.Properties.Definition

namespace LRA.Map.Fiber


universe u v

/--
**[Theorem — FiberMembership]**

Membership in the predicate fiber is equality to the selected output.

Logical form:

```lean
theorem FiberMembership
    {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain)
    (output : Codomain)
    (input : Domain) :
    Fiber map output input <-> map input = output
```
-/
theorem FiberMembership
    {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain)
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
    (map : LRA.Function Domain Codomain) :
    LRA.Function.Injective map <->
      forall output input₁ input₂,
        Fiber map output input₁ ->
        Fiber map output input₂ ->
        input₁ = input₂
```
-/
theorem InjectiveIffFibersSubsingleton
    {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) :
    LRA.Function.Injective map <->
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
    (map : LRA.Function Domain Codomain) :
    LRA.Function.Surjective map <->
      forall output, exists input, Fiber map output input
```
-/
theorem SurjectiveIffEveryFiberNonempty
    {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) :
    LRA.Function.Surjective map <->
      forall output, exists input, Fiber map output input := by
  sorry
end LRA.Map.Fiber
