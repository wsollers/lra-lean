import LRA.VolumeI.Map.Restriction.Definition
import LRA.VolumeI.Map.Composition.Definition
import LRA.VolumeI.Map.Injective.Definition
import LRA.VolumeI.Map.Surjective.Definition

namespace LRA.Map.Restriction

open LRA.Map.Typed

universe u v w

section Restriction

variable {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}

/--
**[Theorem — RestrictionRestrictsTo]**

The constructed restriction satisfies the restriction predicate.

Logical form:

```lean
theorem RestrictionRestrictsTo
    (original : TypedMap Domain Codomain)
    (inclusion : TypedMap Subdomain Domain) :
    RestrictsTo (Restriction original inclusion) original inclusion
```
-/
theorem RestrictionRestrictsTo
    (original : TypedMap Domain Codomain)
    (inclusion : TypedMap Subdomain Domain) :
    RestrictsTo (Restriction original inclusion) original inclusion := by
  sorry

/--
**[Theorem — RestrictionEqualsComposition]**

Restriction along an inclusion-like map is composition with that inclusion.

Logical form:

```lean
theorem RestrictionEqualsComposition
    (original : TypedMap Domain Codomain)
    (inclusion : TypedMap Subdomain Domain) :
    Restriction original inclusion =
      LRA.Map.Composition.Compose original inclusion
```
-/
theorem RestrictionEqualsComposition
    (original : TypedMap Domain Codomain)
    (inclusion : TypedMap Subdomain Domain) :
    Restriction original inclusion =
      LRA.Map.Composition.Compose original inclusion := by
  sorry

/--
**[Theorem — RestrictionInjective]**

Restricting an injective map along an injective inclusion-like map is
injective.

Logical form:

```lean
theorem RestrictionInjective
    (original : TypedMap Domain Codomain)
    (inclusion : TypedMap Subdomain Domain)
    (originalInjective : LRA.Map.Injective.Injective original)
    (inclusionInjective : LRA.Map.Injective.Injective inclusion) :
    LRA.Map.Injective.Injective (Restriction original inclusion)
```
-/
theorem RestrictionInjective
    (original : TypedMap Domain Codomain)
    (inclusion : TypedMap Subdomain Domain)
    (originalInjective : LRA.Map.Injective.Injective original)
    (inclusionInjective : LRA.Map.Injective.Injective inclusion) :
    LRA.Map.Injective.Injective (Restriction original inclusion) := by
  sorry

/--
**[Theorem — RestrictionSurjectiveOfSurjective]**

If the original map is surjective and the inclusion-like map is surjective
onto the original domain, the restriction is surjective onto the same
codomain.

Logical form:

```lean
theorem RestrictionSurjectiveOfSurjective
    (original : TypedMap Domain Codomain)
    (inclusion : TypedMap Subdomain Domain)
    (originalSurjective : LRA.Map.Surjective.Surjective original)
    (inclusionSurjective : LRA.Map.Surjective.Surjective inclusion) :
    LRA.Map.Surjective.Surjective (Restriction original inclusion)
```
-/
theorem RestrictionSurjectiveOfSurjective
    (original : TypedMap Domain Codomain)
    (inclusion : TypedMap Subdomain Domain)
    (originalSurjective : LRA.Map.Surjective.Surjective original)
    (inclusionSurjective : LRA.Map.Surjective.Surjective inclusion) :
    LRA.Map.Surjective.Surjective (Restriction original inclusion) := by
  sorry

end Restriction

end LRA.Map.Restriction
