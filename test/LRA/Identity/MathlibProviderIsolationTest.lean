import LRA.Identity.Interop.Providers.Mathlib

namespace LRA.Identity.Tests.MathlibProviderIsolation

open LRA.Identity
open scoped LRA.Identity.Interop.Providers.Mathlib

universe u

/-- Importing and opening only the Mathlib provider supplies an identity
instance without importing the axiomatic provider.

Logical form: `Ident element element`.
-/
example {Carrier : Type u} (element : Carrier) : Ident element element := by
  exact IdentReflexive element

end LRA.Identity.Tests.MathlibProviderIsolation
