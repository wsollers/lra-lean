import LRA.Set.Constructions.NBGSet.Interface.UniversalAlgebra.Signature

namespace LRA.Set.Constructions.NBG.Interface.UniversalAlgebra

structure SupportsPureRelationalClassification : Prop where
  pureSignatureHasMembershipRelation :
    PureRelationalNBGSignature.RelationSymbol = PureMembershipRelationSymbol

structure SupportsNullOperationClassification : Prop where
  pureRelationalBaseHasNoOperations :
    ∀ relation : PureRelationalNBGSignature.RelationSymbol,
      PureRelationalNBGSignature.relationArity relation > 0

structure SupportsPureSignatureNonVarietyClassification : Prop where
  pureBaseHasBinaryMembership :
    PureRelationalNBGSignature.relationArity PureMembershipRelationSymbol.mem = 2

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

structure SupportsFunctionalConservativeExpansion : Prop where
  expandedSignatureHasUniversalClass :
    ExpandedClassAlgebraicSignature.ConstantSymbol = ExpandedClassConstantSymbol
  expandedSignatureHasIntersection :
    ExpandedClassAlgebraicSignature.OperationSymbol = ExpandedClassOperationSymbol

def UniversalAlgebraClassification : Prop :=
  SupportsPureRelationalClassification ∧
  SupportsNullOperationClassification ∧
  SupportsPureSignatureNonVarietyClassification ∧
  SupportsFunctionalConservativeExpansion

end LRA.Set.Constructions.NBG.Interface.UniversalAlgebra
