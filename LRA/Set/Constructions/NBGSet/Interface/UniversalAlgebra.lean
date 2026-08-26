import LRA.Set.Constructions.NBGSet.Interface.UniversalAlgebra.Signature

namespace LRA.Set.Constructions.NBG.Interface.UniversalAlgebra

def SupportsPureRelationalClassification : Prop :=
  True

def SupportsNullOperationClassification : Prop :=
  True

def SupportsPureSignatureNonVarietyClassification : Prop :=
  True

structure RelationalHomomorphism
    (CarrierA CarrierB : Type)
    (membershipA : CarrierA → CarrierA → Prop)
    (membershipB : CarrierB → CarrierB → Prop) where
  toFun : CarrierA → CarrierB
  preservesMembership :
    ∀ {X Y : CarrierA}, membershipA X Y → membershipB (toFun X) (toFun Y)

structure RelationalSubstructure
    (Carrier : Type) where
  carrier : Carrier → Prop
  carrierNonempty : ∃ X : Carrier, carrier X

def SupportsFunctionalConservativeExpansion : Prop :=
  True

def UniversalAlgebraClassification : Prop :=
  SupportsPureRelationalClassification ∧
  SupportsNullOperationClassification ∧
  SupportsPureSignatureNonVarietyClassification ∧
  SupportsFunctionalConservativeExpansion

end LRA.Set.Constructions.NBG.Interface.UniversalAlgebra
