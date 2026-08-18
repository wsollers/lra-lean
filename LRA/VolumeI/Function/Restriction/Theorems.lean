import LRA.VolumeI.Function.Restriction.Definition
import LRA.VolumeI.Function.Composition.Definition
import LRA.VolumeI.Function.Injective.Definition
import LRA.VolumeI.Function.Surjective.Definition

namespace LRA.Function.Restriction

open LRA.Function

universe u v w

section Restriction

variable {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}

/--
**[Theorem — RestrictionRestrictsTo]**

The constructed restriction satisfies the restriction predicate.

Logical form:

```lean
theorem RestrictionRestrictsTo
    (original : Function Domain Codomain)
    (inclusion : Function Subdomain Domain) :
    RestrictsTo (Restriction original inclusion) original inclusion
```
-/
theorem RestrictionRestrictsTo
    (original : Function Domain Codomain)
    (inclusion : Function Subdomain Domain) :
    RestrictsTo (Restriction original inclusion) original inclusion := by
  sorry

/--
**[Theorem — RestrictionEqualsComposition]**

Restriction along an inclusion-like map is composition with that inclusion.

Logical form:

```lean
theorem RestrictionEqualsComposition
    (original : Function Domain Codomain)
    (inclusion : Function Subdomain Domain) :
    Restriction original inclusion =
      LRA.Function.Composition.Composition original inclusion
```
-/
theorem RestrictionEqualsComposition
    (original : Function Domain Codomain)
    (inclusion : Function Subdomain Domain) :
    Restriction original inclusion =
      LRA.Function.Composition.Composition original inclusion := by
  sorry

/--
**[Theorem — RestrictionInjective]**

Restricting an injective map along an injective inclusion-like map is
injective.

Logical form:

```lean
theorem RestrictionInjective
    (original : Function Domain Codomain)
    (inclusion : Function Subdomain Domain)
    (originalInjective : LRA.Function.Injective.Injective original)
    (inclusionInjective : LRA.Function.Injective.Injective inclusion) :
    LRA.Function.Injective.Injective (Restriction original inclusion)
```
-/
theorem RestrictionInjective
    (original : Function Domain Codomain)
    (inclusion : Function Subdomain Domain)
    (originalInjective : LRA.Function.Injective.Injective original)
    (inclusionInjective : LRA.Function.Injective.Injective inclusion) :
    LRA.Function.Injective.Injective (Restriction original inclusion) := by
  sorry

/--
**[Theorem — RestrictionSurjectiveOfSurjective]**

If the original map is surjective and the inclusion-like map is surjective
onto the original domain, the restriction is surjective onto the same
codomain.

Logical form:

```lean
theorem RestrictionSurjectiveOfSurjective
    (original : Function Domain Codomain)
    (inclusion : Function Subdomain Domain)
    (originalSurjective : LRA.Function.Surjective.Surjective original)
    (inclusionSurjective : LRA.Function.Surjective.Surjective inclusion) :
    LRA.Function.Surjective.Surjective (Restriction original inclusion)
```
-/
theorem RestrictionSurjectiveOfSurjective
    (original : Function Domain Codomain)
    (inclusion : Function Subdomain Domain)
    (originalSurjective : LRA.Function.Surjective.Surjective original)
    (inclusionSurjective : LRA.Function.Surjective.Surjective inclusion) :
    LRA.Function.Surjective.Surjective (Restriction original inclusion) := by
  sorry

end Restriction

end LRA.Function.Restriction
