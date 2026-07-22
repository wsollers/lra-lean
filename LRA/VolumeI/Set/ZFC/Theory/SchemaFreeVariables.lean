import Mathlib.Tactic.FinCases
import LRA.VolumeI.Logic.Syntax.FirstOrder.SubstitutionFreeVariables
import LRA.VolumeI.Set.ZFC.Theory.Schemas

namespace LRA.VolumeI.Set.ZFC

open LRA.VolumeI.Logic

/-!
Free-variable bounds for ZFC schema constructors.

These theorems say that the schema builders bind their distinguished and
auxiliary variables. They are intentionally stated as subset bounds rather
than exact equalities: a predicate may not actually mention every parameter
that the schema permits it to have.
-/

theorem separationAxiomFor_freeVariables_subset_predicateParameters
    (elementVariable : ZFCVariable) (predicate : ZFCFormula) :
    freeVariablesInZFCFormula (separationAxiomFor elementVariable predicate) ⊆
      (freeVariablesInZFCFormula predicate).erase elementVariable := by
  intro candidateVariable candidateVariableIsFree
  simp [separationAxiomFor, freeVariablesInZFCFormula, forallVariable, existsVariable,
    iffFormula, andFormula, impliesFormula, notFormula, isMemberOf,
    variableTerm, LRA.VolumeI.Logic.FirstOrder.freeVariables,
    LRA.VolumeI.Logic.FirstOrder.Formula.and,
    LRA.VolumeI.Logic.FirstOrder.Formula.existsQ,
    Finset.mem_erase] at candidateVariableIsFree ⊢
  rcases candidateVariableIsFree with
    ⟨candidateIsNotSourceSet,
      candidateIsNotSubsetSet,
      candidateIsNotElementVariable,
      candidateFreeCases⟩
  refine ⟨candidateIsNotElementVariable, ?_⟩
  rcases candidateFreeCases with
    ⟨relationArgument, candidateInFirstMembershipTerm⟩ |
    candidateFreeCases
  · fin_cases relationArgument <;>
      simp [LRA.VolumeI.Logic.FirstOrder.freeVariablesInTerm]
        at candidateInFirstMembershipTerm
    · contradiction
    · contradiction
  rcases candidateFreeCases with
    ⟨relationArgument, candidateInSecondMembershipTerm⟩ |
    candidateFreeCases
  · fin_cases relationArgument <;>
      simp [LRA.VolumeI.Logic.FirstOrder.freeVariablesInTerm]
        at candidateInSecondMembershipTerm
    · contradiction
    · contradiction
  rcases candidateFreeCases with
    candidateIsFreeInPredicate |
    candidateFreeCases
  · exact candidateIsFreeInPredicate
  rcases candidateFreeCases with
    ⟨relationArgument, candidateInThirdMembershipTerm⟩ |
    candidateFreeCases
  · fin_cases relationArgument <;>
      simp [LRA.VolumeI.Logic.FirstOrder.freeVariablesInTerm]
        at candidateInThirdMembershipTerm
    · contradiction
    · contradiction
  rcases candidateFreeCases with
    candidateIsFreeInPredicate |
    candidateFreeCases
  · exact candidateIsFreeInPredicate
  rcases candidateFreeCases with
    ⟨relationArgument, candidateInFourthMembershipTerm⟩
  fin_cases relationArgument <;>
    simp [LRA.VolumeI.Logic.FirstOrder.freeVariablesInTerm]
      at candidateInFourthMembershipTerm
  · contradiction
  · contradiction

theorem replacementAxiomFor_freeVariables_subset_predicateParameters
    (inputVariable outputVariable : ZFCVariable) (predicate : ZFCFormula) :
    freeVariablesInZFCFormula
      (replacementAxiomFor inputVariable outputVariable predicate) ⊆
        ((freeVariablesInZFCFormula predicate).erase inputVariable).erase
          outputVariable := by
  intro candidateVariable candidateVariableIsFree
  simp [replacementAxiomFor, freeVariablesInZFCFormula, forallVariable, existsVariable,
    iffFormula, andFormula, impliesFormula, notFormula, isMemberOf, isEqualTo,
    variableTerm, FirstOrder.freeVariables,
    FirstOrder.Formula.and,
    FirstOrder.Formula.existsQ,
    Finset.mem_erase] at candidateVariableIsFree ⊢
  rcases candidateVariableIsFree with
    ⟨candidateIsNotSourceSet, candidateFreeCases⟩
  rcases candidateFreeCases with
    functionalityFreeCases |
    imageFreeCases
  · rcases functionalityFreeCases with
      ⟨candidateIsNotInputVariable, functionalityFreeCases⟩
    refine ⟨?_, candidateIsNotInputVariable, ?_⟩
    · intro candidateEqualsOutputVariable
      subst candidateEqualsOutputVariable
      rcases functionalityFreeCases with
        ⟨relationArgument, candidateInSourceMembershipTerm⟩ |
        functionalityFreeCases
      · fin_cases relationArgument <;>
          simp [FirstOrder.freeVariablesInTerm] at candidateInSourceMembershipTerm
        · exact candidateIsNotInputVariable candidateInSourceMembershipTerm
        · exact candidateIsNotSourceSet candidateInSourceMembershipTerm
      · rcases functionalityFreeCases with
          ⟨candidateIsNotOutputVariable, _, _⟩
        exact candidateIsNotOutputVariable rfl
    rcases functionalityFreeCases with
      ⟨relationArgument, candidateInSourceMembershipTerm⟩ |
      functionalityFreeCases
    · fin_cases relationArgument <;>
        simp [FirstOrder.freeVariablesInTerm] at candidateInSourceMembershipTerm
      · contradiction
      · contradiction
    rcases functionalityFreeCases with
      ⟨candidateIsNotOutputVariable, candidateIsNotOutputVariablePrime,
        functionalityPredicateCases⟩
    rcases functionalityPredicateCases with
      candidateIsFreeInPredicate |
      functionalityPredicateCases
    · exact candidateIsFreeInPredicate
    rcases functionalityPredicateCases with
      candidateIsFreeInRenamedPredicate |
      functionalityPredicateCases
    · let replacementBaseVariables :=
        {inputVariable} ∪ ({outputVariable} ∪ allVariablesInZFCFormula predicate)
      let replacementSourceSet := freshVariableForFinset replacementBaseVariables
      let replacementImageSet :=
        freshVariableForFinset ({replacementSourceSet} ∪ replacementBaseVariables)
      let replacementOutputVariablePrime :=
        freshVariableForFinset
          ({replacementImageSet} ∪ ({replacementSourceSet} ∪ replacementBaseVariables))
      have candidateIsFreeInPredicateOrReplacementTerm :
          candidateVariable ∈
            FirstOrder.freeVariables predicate ∪
              FirstOrder.freeVariablesInTerm
                (variableTerm replacementOutputVariablePrime) := by
        exact
          (FirstOrder.freeVariables_substitute_subset
            outputVariable
            (variableTerm replacementOutputVariablePrime)
            predicate)
            candidateIsFreeInRenamedPredicate
      simp [variableTerm, FirstOrder.freeVariablesInTerm, Finset.mem_union]
        at candidateIsFreeInPredicateOrReplacementTerm
      rcases candidateIsFreeInPredicateOrReplacementTerm with
        candidateIsFreeInPredicate |
        candidateEqualsOutputVariablePrime
      · exact candidateIsFreeInPredicate
      · exact False.elim
          (candidateIsNotOutputVariablePrime candidateEqualsOutputVariablePrime)
    rcases functionalityPredicateCases with
      candidateIsFreeInOutputVariableTerm |
      candidateIsFreeInOutputVariablePrimeTerm
    · simp [FirstOrder.freeVariablesInTerm] at candidateIsFreeInOutputVariableTerm
      contradiction
    · simp [FirstOrder.freeVariablesInTerm] at candidateIsFreeInOutputVariablePrimeTerm
      contradiction
  · rcases imageFreeCases with
      ⟨candidateIsNotImageSet, candidateIsNotOutputVariable, imageFreeCases⟩
    refine ⟨candidateIsNotOutputVariable, ?_, ?_⟩
    · intro candidateEqualsInputVariable
      subst candidateEqualsInputVariable
      rcases imageFreeCases with
        ⟨relationArgument, candidateInImageMembershipTerm⟩ |
        imageFreeCases
      · fin_cases relationArgument <;>
          simp [FirstOrder.freeVariablesInTerm] at candidateInImageMembershipTerm
        · exact candidateIsNotOutputVariable candidateInImageMembershipTerm
        · exact candidateIsNotImageSet candidateInImageMembershipTerm
      · rcases imageFreeCases with
          ⟨candidateIsNotInputVariable, _⟩ |
          ⟨relationArgument, candidateInSecondImageMembershipTerm⟩
        · exact candidateIsNotInputVariable rfl
        · fin_cases relationArgument <;>
            simp [FirstOrder.freeVariablesInTerm] at candidateInSecondImageMembershipTerm
          · exact candidateIsNotOutputVariable candidateInSecondImageMembershipTerm
          · exact candidateIsNotImageSet candidateInSecondImageMembershipTerm
    rcases imageFreeCases with
      ⟨relationArgument, candidateInImageMembershipTerm⟩ |
      imageFreeCases
    · fin_cases relationArgument <;>
        simp [FirstOrder.freeVariablesInTerm] at candidateInImageMembershipTerm
      · contradiction
      · contradiction
    rcases imageFreeCases with
      ⟨candidateIsNotInputVariable, imagePredicateCases⟩ |
      ⟨relationArgument, candidateInSecondImageMembershipTerm⟩
    · rcases imagePredicateCases with
        ⟨relationArgument, candidateInSourceMembershipTerm⟩ |
        candidateIsFreeInPredicate
      · fin_cases relationArgument <;>
          simp [FirstOrder.freeVariablesInTerm] at candidateInSourceMembershipTerm
        · contradiction
        · contradiction
      · exact candidateIsFreeInPredicate
    · fin_cases relationArgument <;>
        simp [FirstOrder.freeVariablesInTerm] at candidateInSecondImageMembershipTerm
      · contradiction
      · contradiction

end LRA.VolumeI.Set.ZFC
