import LRA.Set.Constructions.NBGSet.Interface.UniversalAlgebra.Signature

namespace LRA.Set.Constructions.NBG.Interface.UniversalAlgebra

structure SupportsPureRelationalClassification : Prop where
  everyRelationSymbolIsMembership :
    ∀ relation : PureRelationalNBGSignature.RelationSymbol,
      relation = PureMembershipRelationSymbol.mem

structure SupportsPositiveRelationArityClassification : Prop where
  everyRelationHasPositiveArity :
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
    ∃ constant : ExpandedClassAlgebraicSignature.ConstantSymbol,
      constant = ExpandedClassConstantSymbol.universalClass
  expandedSignatureHasIntersection :
    ∃ operation : ExpandedClassAlgebraicSignature.OperationSymbol,
      operation = ExpandedClassOperationSymbol.intersection ∧
        ExpandedClassAlgebraicSignature.arity operation = 2

def UniversalAlgebraClassification : Prop :=
  SupportsPureRelationalClassification ∧
  SupportsPositiveRelationArityClassification ∧
  SupportsPureSignatureNonVarietyClassification ∧
  SupportsFunctionalConservativeExpansion

theorem pureRelationalNBGSupportsPureRelationalClassification :
    SupportsPureRelationalClassification := by
  sorry

theorem pureRelationalNBGSupportsPositiveRelationArityClassification :
    SupportsPositiveRelationArityClassification := by
  sorry

theorem pureRelationalNBGSupportsPureSignatureNonVarietyClassification :
    SupportsPureSignatureNonVarietyClassification := by
  sorry

theorem expandedClassSignatureSupportsFunctionalConservativeExpansion :
    SupportsFunctionalConservativeExpansion := by
  sorry

theorem nbgUniversalAlgebraClassification :
    UniversalAlgebraClassification := by
  sorry

end LRA.Set.Constructions.NBG.Interface.UniversalAlgebra
