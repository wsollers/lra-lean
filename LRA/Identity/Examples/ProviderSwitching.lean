import LRA.Identity.Interop.Providers

namespace LRA.Identity.Examples.ProviderSwitching

universe u

open LRA.Identity

/--
`ProviderIdentitySymmetryStatement` is the provider-polymorphic assertion that
the active identity relation on a carrier is symmetric.

Logical form:

```lean
def ProviderIdentitySymmetryStatement
    (Carrier : Type u) [IdentityRelation Carrier] : Prop :=
  ∀ ⦃x y : Carrier⦄, Ident x y → Ident y x
```
-/
def ProviderIdentitySymmetryStatement
    (Carrier : Type u) [IdentityRelation Carrier] : Prop :=
  ∀ ⦃x y : Carrier⦄, Ident x y → Ident y x

/--
`ProviderIdentitySymmetric` proves identity symmetry once for every scoped
provider implementing `IdentityRelation`.

Logical form:

```lean
theorem ProviderIdentitySymmetric
    (Carrier : Type u) [IdentityRelation Carrier] :
    ProviderIdentitySymmetryStatement Carrier
```
-/
theorem ProviderIdentitySymmetric
    (Carrier : Type u) [IdentityRelation Carrier] :
    ProviderIdentitySymmetryStatement Carrier := by
  intro x y hxy
  exact IdentLeibniz hxy (fun value => Ident value x) (IdentReflexive x)

section DefaultProvider

open scoped LRA.Identity.Interop.Providers.Default

example : ProviderIdentitySymmetryStatement Bool :=
  ProviderIdentitySymmetric Bool

end DefaultProvider

section MathlibProvider

open scoped LRA.Identity.Interop.Providers.Mathlib

example : ProviderIdentitySymmetryStatement Bool :=
  ProviderIdentitySymmetric Bool

end MathlibProvider

section AxiomaticProvider

open scoped LRA.Identity.Interop.Providers.LRA

example : ProviderIdentitySymmetryStatement Bool :=
  ProviderIdentitySymmetric Bool

end AxiomaticProvider

end LRA.Identity.Examples.ProviderSwitching
