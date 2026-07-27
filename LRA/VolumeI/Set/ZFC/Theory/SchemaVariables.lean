import LRA.VolumeI.Set.ZFC.Syntax.FreeVariables
import LRA.VolumeI.Set.ZFC.Syntax.Vocabulary

namespace LRA.VolumeI.Set.ZFC

/-!
Named auxiliary variables for ZFC schema constructors.

The schema formulas, free-variable proofs, and semantic correctness proofs all
need to refer to the same fresh-variable choices. These definitions are kept
below the schema constructors in the import graph so the constructors can use
the names directly.
-/

namespace SchemaFacts

def separationSourceSet
    (elementVariable : ZFCVariable) (predicate : ZFCFormula) :
    ZFCVariable :=
  freshVariableForFinset ({elementVariable} ∪ freeVariablesInZFCFormula predicate)

def separationSubsetSet
    (elementVariable : ZFCVariable) (predicate : ZFCFormula) :
    ZFCVariable :=
  freshVariableForFinset
    ({separationSourceSet elementVariable predicate} ∪
      {elementVariable} ∪
      freeVariablesInZFCFormula predicate)

def replacementBaseUsed
    (inputVariable outputVariable : ZFCVariable) (predicate : ZFCFormula) :
    Finset ZFCVariable :=
  {inputVariable} ∪ {outputVariable} ∪ allVariablesInZFCFormula predicate

def replacementSourceSet
    (inputVariable outputVariable : ZFCVariable) (predicate : ZFCFormula) :
    ZFCVariable :=
  freshVariableForFinset
    (replacementBaseUsed inputVariable outputVariable predicate)

def replacementImageSet
    (inputVariable outputVariable : ZFCVariable) (predicate : ZFCFormula) :
    ZFCVariable :=
  freshVariableForFinset
    ({replacementSourceSet inputVariable outputVariable predicate} ∪
      replacementBaseUsed inputVariable outputVariable predicate)

def replacementOutputVariablePrime
    (inputVariable outputVariable : ZFCVariable) (predicate : ZFCFormula) :
    ZFCVariable :=
  freshVariableForFinset
    ({replacementImageSet inputVariable outputVariable predicate} ∪
      {replacementSourceSet inputVariable outputVariable predicate} ∪
      replacementBaseUsed inputVariable outputVariable predicate)

end SchemaFacts

end LRA.VolumeI.Set.ZFC
