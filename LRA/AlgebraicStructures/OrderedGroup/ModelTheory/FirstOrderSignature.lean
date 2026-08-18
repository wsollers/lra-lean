import LRA.AlgebraicStructures.Group.ModelTheory.FirstOrderSignature

namespace LRA.AlgebraicStructures.OrderedGroup.ModelTheory

/-!
First-order signature for ordered groups.

The ordered-group language enriches the multiplicative group language with
one binary strict-order relation.
-/

abbrev OrderedGroupFunctionSymbol :=
  LRA.AlgebraicStructures.Group.ModelTheory.GroupFunctionSymbol

inductive OrderedGroupRelationSymbol where
  | lt

abbrev OrderedGroupConstantSymbol :=
  LRA.AlgebraicStructures.Group.ModelTheory.GroupConstantSymbol

def OrderedGroupFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Group.ModelTheory.GroupFirstOrderFunctions

def OrderedGroupFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedGroupRelationSymbol
  arity
    | .lt => 2

def OrderedGroupFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedGroupFirstOrderFunctions
  Relations := OrderedGroupFirstOrderRelations
  Constants := OrderedGroupConstantSymbol

end LRA.AlgebraicStructures.OrderedGroup.ModelTheory
