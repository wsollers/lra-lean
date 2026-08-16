import LRA.VolumeI.Map.Identity.Definition
import LRA.VolumeI.Map.Bijective.Definition

namespace LRA.Map.Identity

open LRA.Map.Typed

universe u

/--
Evaluation of the identity map.
-/
theorem IdentityMapApply
    {Domain : Type u}
    (input : Domain) :
    IdentityMap Domain input = input :=
  rfl

/--
The identity map is injective.
-/
theorem IdentityMapInjective
    (Domain : Type u) :
    LRA.Map.Injective.Injective (IdentityMap Domain) := by
  intro first second equalValues
  exact equalValues

/--
The identity map is surjective.
-/
theorem IdentityMapSurjective
    (Domain : Type u) :
    LRA.Map.Surjective.Surjective (IdentityMap Domain) := by
  intro output
  exact ⟨output, rfl⟩

/--
The identity map is bijective.
-/
theorem IdentityMapBijective
    (Domain : Type u) :
    LRA.Map.Bijective.Bijective (IdentityMap Domain) :=
  ⟨IdentityMapInjective Domain, IdentityMapSurjective Domain⟩

end LRA.Map.Identity
