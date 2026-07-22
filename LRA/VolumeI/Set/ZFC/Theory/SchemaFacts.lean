import LRA.VolumeI.Set.ZFC.Theory.Schemas

namespace LRA.VolumeI.Set.ZFC

/-!
Small infrastructure facts for ZFC schema constructors.

The schema constructors compute their auxiliary bound variables internally.
These definitions name the same computations so later correctness proofs can
refer to the freshness guarantees directly.
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

theorem replacementOutputVariablePrime_not_mem_allVariables
    (inputVariable outputVariable : ZFCVariable) (predicate : ZFCFormula) :
    replacementOutputVariablePrime inputVariable outputVariable predicate ∉
      allVariablesInZFCFormula predicate := by
  intro hmem
  exact
    freshVariableForFinset_ne_of_mem
      (used :=
        {replacementImageSet inputVariable outputVariable predicate} ∪
          {replacementSourceSet inputVariable outputVariable predicate} ∪
          replacementBaseUsed inputVariable outputVariable predicate)
      (v := replacementOutputVariablePrime inputVariable outputVariable predicate)
      (by
        simp [replacementBaseUsed, hmem])
      rfl

theorem replacementOutputVariablePrime_ne_input
    (inputVariable outputVariable : ZFCVariable) (predicate : ZFCFormula) :
    replacementOutputVariablePrime inputVariable outputVariable predicate ≠
      inputVariable := by
  exact
    freshVariableForFinset_ne_of_mem
      (used :=
        {replacementImageSet inputVariable outputVariable predicate} ∪
          {replacementSourceSet inputVariable outputVariable predicate} ∪
          replacementBaseUsed inputVariable outputVariable predicate)
      (v := inputVariable)
      (by simp [replacementBaseUsed])

theorem replacementOutputVariablePrime_ne_output
    (inputVariable outputVariable : ZFCVariable) (predicate : ZFCFormula) :
    replacementOutputVariablePrime inputVariable outputVariable predicate ≠
      outputVariable := by
  exact
    freshVariableForFinset_ne_of_mem
      (used :=
        {replacementImageSet inputVariable outputVariable predicate} ∪
          {replacementSourceSet inputVariable outputVariable predicate} ∪
          replacementBaseUsed inputVariable outputVariable predicate)
      (v := outputVariable)
      (by simp [replacementBaseUsed])

theorem replacementImageSet_ne_sourceSet
    (inputVariable outputVariable : ZFCVariable) (predicate : ZFCFormula) :
    replacementImageSet inputVariable outputVariable predicate ≠
      replacementSourceSet inputVariable outputVariable predicate := by
  exact
    freshVariableForFinset_ne_of_mem
      (used :=
        {replacementSourceSet inputVariable outputVariable predicate} ∪
          replacementBaseUsed inputVariable outputVariable predicate)
      (v := replacementSourceSet inputVariable outputVariable predicate)
      (by simp)

theorem separationSubsetSet_ne_sourceSet
    (elementVariable : ZFCVariable) (predicate : ZFCFormula) :
    separationSubsetSet elementVariable predicate ≠
      separationSourceSet elementVariable predicate := by
  exact
    freshVariableForFinset_ne_of_mem
      (used :=
        {separationSourceSet elementVariable predicate} ∪
          {elementVariable} ∪
          freeVariablesInZFCFormula predicate)
      (v := separationSourceSet elementVariable predicate)
      (by simp)

end SchemaFacts

end LRA.VolumeI.Set.ZFC
