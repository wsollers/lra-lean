import LRA.AlgebraicStructures.Ring.Interface.Signature.Definition

namespace LRA.AlgebraicStructures.CommutativeRing.Interface.Signature

                                                                      

abbrev CommutativeRingFunctionSymbol :=
  LRA.AlgebraicStructures.Ring.Interface.Signature.RingFunctionSymbol

abbrev CommutativeRingRelationSymbol :=
  LRA.AlgebraicStructures.Ring.Interface.Signature.RingRelationSymbol

abbrev CommutativeRingConstantSymbol :=
  LRA.AlgebraicStructures.Ring.Interface.Signature.RingConstantSymbol

def CommutativeRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Ring.Interface.Signature.RingFirstOrderFunctions

def CommutativeRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Ring.Interface.Signature.RingFirstOrderRelations

def CommutativeRingFirstOrderSignature : LRA.Logic.Signature :=
  LRA.AlgebraicStructures.Ring.Interface.Signature.RingFirstOrderSignature

end LRA.AlgebraicStructures.CommutativeRing.Interface.Signature
