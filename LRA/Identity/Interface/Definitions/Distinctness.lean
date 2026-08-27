import LRA.Identity.Interface.Definitions.IdentityRelation

namespace LRA.Identity

universe u

def Distinct {Carrier : Type u} [IdentityRelation Carrier] (left right : Carrier) : Prop :=
  ¬ Ident left right

end LRA.Identity
