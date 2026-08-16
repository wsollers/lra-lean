import LRA.VolumeI.Map.Fiber.Theorems
import LRA.VolumeI.Map.Fiber.Definition
import LRA.VolumeI.Map.Injective.Definition
import LRA.VolumeI.Map.Surjective.Definition

namespace LRA.Map.Fiber

open LRA.Map.Typed

universe u v

/--
Membership in the predicate fiber is equality to the selected output.
-/
theorem FiberMembership
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (output : Codomain)
    (input : Domain) :
    Fiber map output input <-> map input = output :=
  Iff.rfl

/--
A map is injective exactly when every predicate fiber has at most one member.
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
  · intro injective output input₁ input₂ firstInFiber secondInFiber
    exact injective input₁ input₂ (firstInFiber.trans secondInFiber.symm)
  · intro fibersSubsingleton input₁ input₂ equalValues
    exact fibersSubsingleton (map input₁) input₁ input₂ rfl equalValues.symm

/--
A map is surjective exactly when every predicate fiber is nonempty.
-/
theorem SurjectiveIffEveryFiberNonempty
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    LRA.Map.Surjective.Surjective map <->
      forall output, exists input, Fiber map output input := by
  constructor
  · intro surjective output
    exact surjective output
  · intro everyFiberNonempty output
    exact everyFiberNonempty output

end LRA.Map.Fiber
