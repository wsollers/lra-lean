import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.Identity

universe u v w

def CongruenceQuotient
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure signature)
    (relation : structure_.Carrier → structure_.Carrier → Prop) : Type u :=
  Quot relation

end LRA.Identity
