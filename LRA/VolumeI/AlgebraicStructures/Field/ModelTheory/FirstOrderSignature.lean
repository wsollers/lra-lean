import LRA.VolumeI.AlgebraicStructures.DivisionRing.ModelTheory.FirstOrderSignature

namespace LRA.AlgebraicStructures.Field.ModelTheory

/-!
First-order signature for fields.

Fields use the division-ring first-order vocabulary; fieldhood adds
commutativity as a law, not a new symbol.
-/

abbrev FieldFunctionSymbol :=
  LRA.AlgebraicStructures.DivisionRing.ModelTheory.DivisionRingFunctionSymbol

abbrev FieldRelationSymbol :=
  LRA.AlgebraicStructures.DivisionRing.ModelTheory.DivisionRingRelationSymbol

abbrev FieldConstantSymbol :=
  LRA.AlgebraicStructures.DivisionRing.ModelTheory.DivisionRingConstantSymbol

def FieldFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.DivisionRing.ModelTheory.DivisionRingFirstOrderFunctions

def FieldFirstOrderRelations : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.DivisionRing.ModelTheory.DivisionRingFirstOrderRelations

def FieldFirstOrderSignature : LRA.Logic.Signature :=
  LRA.AlgebraicStructures.DivisionRing.ModelTheory.DivisionRingFirstOrderSignature

end LRA.AlgebraicStructures.Field.ModelTheory
