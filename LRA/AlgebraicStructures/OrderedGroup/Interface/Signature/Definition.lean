import LRA.AlgebraicStructures.Group.Interface.Signature.Definition

namespace LRA.AlgebraicStructures.OrderedGroup.Interface.Signature

   
                                         

                                                                          
                                 
  

abbrev OrderedGroupFunctionSymbol :=
  LRA.AlgebraicStructures.Group.Interface.Signature.GroupFunctionSymbol

inductive OrderedGroupRelationSymbol where
  | lt

abbrev OrderedGroupConstantSymbol :=
  LRA.AlgebraicStructures.Group.Interface.Signature.GroupConstantSymbol

def OrderedGroupFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Group.Interface.Signature.GroupFirstOrderFunctions

def OrderedGroupFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedGroupRelationSymbol
  arity
    | .lt => 2

def OrderedGroupFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedGroupFirstOrderFunctions
  Relations := OrderedGroupFirstOrderRelations
  Constants := OrderedGroupConstantSymbol

end LRA.AlgebraicStructures.OrderedGroup.Interface.Signature
