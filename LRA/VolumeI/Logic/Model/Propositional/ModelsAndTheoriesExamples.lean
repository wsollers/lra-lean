import LRA.VolumeI.Logic.Model.Propositional.PropositionalModel
import LRA.VolumeI.Logic.Model.Propositional.ModelsAndTheories
import LRA.VolumeI.Logic.Model.Propositional.Examples

namespace LRA.VolumeI.Logic.Propositional

/-!
Worked examples of `ModelsAndTheories`.

The four possible valuations of `testLanguage` (`TestAtom := {A, B}`, from
`Model.Propositional.Examples`), and concrete facts about `modelClass`,
`ModelsOfTheory`, `TheoryOfModels`, `IsValid`, `IsSatisfiable`, and
`SemanticConsequence` computed against them.
-/

/-- A is true, B is true (the same valuation as `testModel`).

Logical form:

```lean
def modelAA : PropositionalModel testLanguage where
  valuation
    | .A => true
    | .B => true
```
-/
def modelAA : PropositionalModel testLanguage where
  valuation
    | .A => true
    | .B => true

/-- A is true, B is false.

Logical form:

```lean
def modelTF : PropositionalModel testLanguage where
  valuation
    | .A => true
    | .B => false
```
-/
def modelTF : PropositionalModel testLanguage where
  valuation
    | .A => true
    | .B => false

/-- A is false, B is true.

Logical form:

```lean
def modelFT : PropositionalModel testLanguage where
  valuation
    | .A => false
    | .B => true
```
-/
def modelFT : PropositionalModel testLanguage where
  valuation
    | .A => false
    | .B => true

/-- A is false, B is false.

Logical form:

```lean
def modelFF : PropositionalModel testLanguage where
  valuation
    | .A => false
    | .B => false
```
-/
def modelFF : PropositionalModel testLanguage where
  valuation
    | .A => false
    | .B => false

/-- `modelAA` belongs to the model class of `A` (it makes `A` true);
`modelClass (atom A)` is not shown equal to the full two-element set here,
since that would need `Set` extensionality plus exhausting every valuation
of `testLanguage`, more than a worked example needs -- membership in each
direction is enough to show `modelClass` computes what it should.

Logical form:

```lean
theorem modelAA_mem_modelClass_A :
    modelAA ∈ modelClass (Formula.atom TestAtom.A)
```
-/
theorem modelAA_mem_modelClass_A :
    modelAA ∈ modelClass (Formula.atom TestAtom.A) := by
  show evaluate modelAA.valuation (Formula.atom TestAtom.A) = true
  rfl

/--
`modelFF_not_mem_modelClass_A` states model ff not mem model class a.

Logical form:

```lean
theorem modelFF_not_mem_modelClass_A :
    modelFF ∉ modelClass (Formula.atom TestAtom.A)
```
-/
theorem modelFF_not_mem_modelClass_A :
    modelFF ∉ modelClass (Formula.atom TestAtom.A) := by
  show ¬ evaluate modelFF.valuation (Formula.atom TestAtom.A) = true
  simp [modelFF, evaluate]

/-- The law of excluded middle, `A ∨ ¬A`, is valid: every one of the four
valuations satisfies it.

Logical form:

```lean
theorem excludedMiddle_isValid :
    IsValid (Formula.or (Formula.atom TestAtom.A) (Formula.neg (Formula.atom TestAtom.A)))
```
-/
theorem excludedMiddle_isValid :
    IsValid (Formula.or (Formula.atom TestAtom.A) (Formula.neg (Formula.atom TestAtom.A))) := by
  intro M
  show evaluate M.valuation
    (Formula.or (Formula.atom TestAtom.A) (Formula.neg (Formula.atom TestAtom.A))) = true
  rw [Formula.or_evaluatesToDisjunction]
  simp only [evaluate]
  cases M.valuation TestAtom.A <;> simp

/-- `{A, B}`, as a theory, is satisfiable: `modelAA` is a model of both.

Logical form:

```lean
theorem theory_AB_isSatisfiable :
    IsSatisfiable ({Formula.atom TestAtom.A, Formula.atom TestAtom.B} : Set (Formula testLanguage))
```
-/
theorem theory_AB_isSatisfiable :
    IsSatisfiable ({Formula.atom TestAtom.A, Formula.atom TestAtom.B} : Set (Formula testLanguage)) := by
  refine ⟨modelAA, ?_⟩
  intro φ hφ
  rcases hφ with hφ | hφ <;> subst hφ <;> rfl

/-- `{A, ¬A}` is *not* satisfiable: no valuation can make both `A` and
`¬A` true, since they are decided oppositely by every valuation's single
value at `A`. The harder-direction test: proving something has *no*
models, not merely exhibiting one.

Logical form:

```lean
theorem theory_AAndNotA_not_isSatisfiable :
    ¬ IsSatisfiable
        ({Formula.atom TestAtom.A, Formula.neg (Formula.atom TestAtom.A)} : Set (Formula testLanguage))
```
-/
theorem theory_AAndNotA_not_isSatisfiable :
    ¬ IsSatisfiable
        ({Formula.atom TestAtom.A, Formula.neg (Formula.atom TestAtom.A)} : Set (Formula testLanguage)) := by
  rintro ⟨M, hM⟩
  have hMemA : Formula.atom TestAtom.A ∈
      ({Formula.atom TestAtom.A, Formula.neg (Formula.atom TestAtom.A)} : Set (Formula testLanguage)) :=
    Or.inl rfl
  have hMemNotA : Formula.neg (Formula.atom TestAtom.A) ∈
      ({Formula.atom TestAtom.A, Formula.neg (Formula.atom TestAtom.A)} : Set (Formula testLanguage)) :=
    Or.inr rfl
  have hA : M.satisfies (Formula.atom TestAtom.A) := hM _ hMemA
  have hNotA : M.satisfies (Formula.neg (Formula.atom TestAtom.A)) := hM _ hMemNotA
  have hAeq : evaluate M.valuation (Formula.atom TestAtom.A) = true := hA
  have hNotAeq : evaluate M.valuation (Formula.neg (Formula.atom TestAtom.A)) = true := hNotA
  simp only [evaluate] at hAeq hNotAeq
  rw [hAeq] at hNotAeq
  simp at hNotAeq

/-- Semantic consequence: `{A ∧ B} ⊨ A` -- if both `A` and `B` are true,
`A` alone follows.

Logical form:

```lean
theorem AAndB_semanticConsequence_A :
    ({Formula.and (Formula.atom TestAtom.A) (Formula.atom TestAtom.B)} : Set (Formula testLanguage))
      ⊨ₜ (Formula.atom TestAtom.A)
```
-/
theorem AAndB_semanticConsequence_A :
    ({Formula.and (Formula.atom TestAtom.A) (Formula.atom TestAtom.B)} : Set (Formula testLanguage))
      ⊨ₜ (Formula.atom TestAtom.A) := by
  intro M hM
  have hMemAB : Formula.and (Formula.atom TestAtom.A) (Formula.atom TestAtom.B) ∈
      ({Formula.and (Formula.atom TestAtom.A) (Formula.atom TestAtom.B)} : Set (Formula testLanguage)) :=
    rfl
  have hAB : M.satisfies (Formula.and (Formula.atom TestAtom.A) (Formula.atom TestAtom.B)) :=
    hM _ hMemAB
  have hABeq :
      evaluate M.valuation (Formula.and (Formula.atom TestAtom.A) (Formula.atom TestAtom.B)) = true :=
    hAB
  rw [Formula.and_evaluatesToConjunction] at hABeq
  show evaluate M.valuation (Formula.atom TestAtom.A) = true
  rcases Bool.and_eq_true_iff.mp hABeq with ⟨hAtrue, _⟩
  exact hAtrue

end LRA.VolumeI.Logic.Propositional
