import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.Set.Constructions.ZFCSet.Interface.UniversalAlgebra

inductive SetOperationSymbol where
  | union
  | inter
  | difference
  | symmDiff
  | powerSet
  | collectionUnion
  | collectionIntersection

def setOperationArity : SetOperationSymbol → Nat
  | .union => 2
  | .inter => 2
  | .difference => 2
  | .symmDiff => 2
  | .powerSet => 1
  | .collectionUnion => 1
  | .collectionIntersection => 1

inductive SetConstantSymbol where
  | emptySet

abbrev SetAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := SetOperationSymbol
  arity := setOperationArity
  ConstantSymbol := SetConstantSymbol

end LRA.Set.Constructions.ZFCSet.Interface.UniversalAlgebra
