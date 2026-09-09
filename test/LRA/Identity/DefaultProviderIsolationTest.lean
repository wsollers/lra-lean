import LRA.Identity.Interop.Providers.Default

namespace LRA.Identity.Tests.DefaultProviderIsolation

open LRA.Identity
open scoped LRA.Identity.Interop.Providers.Default

universe u

/-- Importing and opening only the default provider supplies native identity. -/
example {Carrier : Type u} (element : Carrier) : Ident element element :=
  IdentReflexive element

end LRA.Identity.Tests.DefaultProviderIsolation
