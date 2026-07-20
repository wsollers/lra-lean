import LRA.VolumeI.Logic.Core

namespace LRA.VolumeI.Logic.Semantics.TheoryModels

/-!
Generic facts about when a Bool-valued object-language structure models a
theory, represented here as a list of formulas.
-/

theorem structureModelsTheoryIffEveryFormulaInTheoryIsSatisfied
    {L : LogicalLanguage}
    (M : LogicalStructure L)
    (T : LogicalTheory L) :
    StructureModelsTheory M T ↔
      forall formula, formula ∈ T -> StructureSatisfiesFormula M formula := by
  rfl

theorem structureModelsEmptyTheory
    {L : LogicalLanguage}
    (M : LogicalStructure L) :
    StructureModelsTheory M [] := by
  intro formula formulaInEmptyTheory
  cases formulaInEmptyTheory

theorem structureModelsSingletonTheoryIffItSatisfiesTheOnlyFormula
    {L : LogicalLanguage}
    (M : LogicalStructure L)
    (formula : LogicalFormula L) :
    StructureModelsTheory M [formula] ↔ StructureSatisfiesFormula M formula := by
  constructor
  · intro modelOfSingletonTheory
    exact modelOfSingletonTheory formula (List.Mem.head [])
  · intro satisfiesFormula otherFormula formulaInSingletonTheory
    cases formulaInSingletonTheory with
    | head _ =>
        exact satisfiesFormula
    | tail _ formulaInEmptyTheory =>
        cases formulaInEmptyTheory

theorem structureModelsConsTheoryIffItSatisfiesHeadAndModelsTail
    {L : LogicalLanguage}
    (M : LogicalStructure L)
    (formula : LogicalFormula L)
    (T : LogicalTheory L) :
    StructureModelsTheory M (formula :: T) ↔
      And (StructureSatisfiesFormula M formula) (StructureModelsTheory M T) := by
  constructor
  · intro modelOfConsTheory
    exact ⟨
      modelOfConsTheory formula (List.Mem.head T),
      by
        intro tailFormula tailFormulaInTheory
        exact modelOfConsTheory tailFormula (List.Mem.tail formula tailFormulaInTheory)
    ⟩
  · intro modelOfHeadAndTail candidateFormula candidateFormulaInConsTheory
    cases candidateFormulaInConsTheory with
    | head _ =>
        exact modelOfHeadAndTail.left
    | tail _ candidateFormulaInTheory =>
        exact modelOfHeadAndTail.right candidateFormula candidateFormulaInTheory

def TheoryIsSatisfiable
    {L : LogicalLanguage}
    (T : LogicalTheory L) : Prop :=
  exists M : LogicalStructure L, StructureModelsTheory M T

theorem emptyTheoryIsSatisfiable
    {L : LogicalLanguage} :
    TheoryIsSatisfiable (L := L) [] := by
  exact ⟨{
    truthValueOfAtom := fun _ => false
    truthFunctionOfUnaryConnective := fun _ _ => false
    truthFunctionOfBinaryConnective := fun _ _ _ => false
  }, structureModelsEmptyTheory _⟩

theorem modelOfStrongerTheoryIsModelOfWeakerTheory
    {L : LogicalLanguage}
    (M : LogicalStructure L)
    (weakerTheory strongerTheory : LogicalTheory L)
    (weakerTheoryIsContainedInStrongerTheory :
      forall formula, formula ∈ weakerTheory -> formula ∈ strongerTheory)
    (modelOfStrongerTheory :
      StructureModelsTheory M strongerTheory) :
    StructureModelsTheory M weakerTheory := by
  intro formula formulaInWeakerTheory
  exact modelOfStrongerTheory
    formula
    (weakerTheoryIsContainedInStrongerTheory formula formulaInWeakerTheory)

theorem extensionallyEqualTheoriesHaveSameModels
    {L : LogicalLanguage}
    (M : LogicalStructure L)
    (firstTheory secondTheory : LogicalTheory L)
    (theoriesHaveTheSameFormulas :
      forall formula, formula ∈ firstTheory ↔ formula ∈ secondTheory) :
    StructureModelsTheory M firstTheory ↔
      StructureModelsTheory M secondTheory := by
  constructor
  · intro modelOfFirstTheory formula formulaInSecondTheory
    exact modelOfFirstTheory formula
      ((theoriesHaveTheSameFormulas formula).mpr formulaInSecondTheory)
  · intro modelOfSecondTheory formula formulaInFirstTheory
    exact modelOfSecondTheory formula
      ((theoriesHaveTheSameFormulas formula).mp formulaInFirstTheory)

end LRA.VolumeI.Logic.Semantics.TheoryModels
