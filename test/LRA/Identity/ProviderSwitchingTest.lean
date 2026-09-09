import LRA.Identity.Examples.ProviderSwitching

namespace LRA.Identity.Tests.ProviderSwitching

open LRA.Identity
open LRA.Identity.Examples.ProviderSwitching

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

end LRA.Identity.Tests.ProviderSwitching
