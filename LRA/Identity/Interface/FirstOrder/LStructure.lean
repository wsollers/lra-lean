import LRA.Logic.Language.FirstOrder.Signature

namespace LRA.Identity.Interface.FirstOrder

/-- A first-order language together with the binary symbol used for identity. -/
structure LStructure where
  signature : LRA.Logic.Signature
  identitySymbol : signature.RelationSymbol
  identityArity : signature.relationArity identitySymbol = 2

end LRA.Identity.Interface.FirstOrder
