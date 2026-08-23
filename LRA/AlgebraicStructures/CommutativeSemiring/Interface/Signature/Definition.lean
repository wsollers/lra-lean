import LRA.AlgebraicStructures.Semiring.Interface.Signature.Definition

namespace LRA.AlgebraicStructures.CommutativeSemiring.Interface.Signature

abbrev CommutativeSemiringFunctionSymbol :=
  LRA.AlgebraicStructures.Semiring.Interface.Signature.SemiringFunctionSymbol

abbrev CommutativeSemiringRelationSymbol :=
  LRA.AlgebraicStructures.Semiring.Interface.Signature.SemiringRelationSymbol

abbrev CommutativeSemiringConstantSymbol :=
  LRA.AlgebraicStructures.Semiring.Interface.Signature.SemiringConstantSymbol

def CommutativeSemiringFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Semiring.Interface.Signature.SemiringFirstOrderFunctions

def CommutativeSemiringFirstOrderRelations : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Semiring.Interface.Signature.SemiringFirstOrderRelations

def CommutativeSemiringFirstOrderSignature : LRA.Logic.Signature :=
  LRA.AlgebraicStructures.Semiring.Interface.Signature.SemiringFirstOrderSignature

end LRA.AlgebraicStructures.CommutativeSemiring.Interface.Signature
