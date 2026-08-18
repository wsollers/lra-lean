import LRA.AlgebraicStructures.Ring.ModelTheory.FirstOrderSignature

namespace LRA.AlgebraicStructures.CommutativeRing.ModelTheory

/-! Commutative rings use the ordinary ring first-order vocabulary. -/

abbrev CommutativeRingFunctionSymbol :=
  LRA.AlgebraicStructures.Ring.ModelTheory.RingFunctionSymbol

abbrev CommutativeRingRelationSymbol :=
  LRA.AlgebraicStructures.Ring.ModelTheory.RingRelationSymbol

abbrev CommutativeRingConstantSymbol :=
  LRA.AlgebraicStructures.Ring.ModelTheory.RingConstantSymbol

def CommutativeRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Ring.ModelTheory.RingFirstOrderFunctions

def CommutativeRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Ring.ModelTheory.RingFirstOrderRelations

def CommutativeRingFirstOrderSignature : LRA.Logic.Signature :=
  LRA.AlgebraicStructures.Ring.ModelTheory.RingFirstOrderSignature

end LRA.AlgebraicStructures.CommutativeRing.ModelTheory
