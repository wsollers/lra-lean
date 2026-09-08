import LRA.Identity.Interop.Providers.LRA

namespace LRA.Identity.Tests.AxiomaticProviderIsolation

open LRA.Identity
open scoped LRA.Identity.Interop.Providers.LRA

universe u

/-- Importing and opening only the axiomatic provider supplies an identity
instance without importing the Mathlib provider.

Logical form: `Ident element element`.
-/
example {Carrier : Type u} (element : Carrier) : Ident element element := by
  sorry

end LRA.Identity.Tests.AxiomaticProviderIsolation
