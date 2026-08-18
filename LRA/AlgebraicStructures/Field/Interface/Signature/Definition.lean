import LRA.AlgebraicStructures.DivisionRing.Interface.Signature.Definition

namespace LRA.AlgebraicStructures.Field.Interface.Signature

/-!
First-order signature for fields.

Fields use the division-ring first-order vocabulary; fieldhood adds
commutativity as a law, not a new symbol.
-/

abbrev FieldFunctionSymbol :=
  LRA.AlgebraicStructures.DivisionRing.Interface.Signature.DivisionRingFunctionSymbol

abbrev FieldRelationSymbol :=
  LRA.AlgebraicStructures.DivisionRing.Interface.Signature.DivisionRingRelationSymbol

abbrev FieldConstantSymbol :=
  LRA.AlgebraicStructures.DivisionRing.Interface.Signature.DivisionRingConstantSymbol

def FieldFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.DivisionRing.Interface.Signature.DivisionRingFirstOrderFunctions

def FieldFirstOrderRelations : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.DivisionRing.Interface.Signature.DivisionRingFirstOrderRelations

def FieldFirstOrderSignature : LRA.Logic.Signature :=
  LRA.AlgebraicStructures.DivisionRing.Interface.Signature.DivisionRingFirstOrderSignature

end LRA.AlgebraicStructures.Field.Interface.Signature
