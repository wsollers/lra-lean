import Mathlib.Tactic.Tauto
import LRA.Identity
import LRA.Logic.Syntax.FirstOrder.Formula
import LRA.Logic.Semantics.TermEvaluation
import LRA.Logic.Semantics.Assignment

namespace LRA.Logic.FirstOrder

/--
`Satisfies` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = M : LRA.Logic.FirstOrder.Model S (assignment : Variable → M.Domain) (a : LRA.Logic.FirstOrder.Formula S Variable), (LRA.Logic.FirstOrder.Formula.brecOn.go (motive := fun x => (Variable → M.Domain) → Prop) a (LRA.Logic.FirstOrder.Satisfies._f M)).1 assignment

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)] (M : LRA.Logic.FirstOrder.Model S) (assignment : Variable → M.1) (a : LRA.Logic.FirstOrder.Formula S Variable), (LRA.Logic.FirstOrder.Formula.brecOn.go (motive := fun x => (Variable → M.Domain) → Prop) a (LRA.Logic.FirstOrder.Satisfies._f M)).1 assignment

Logical form (Lean):

```lean
def Satisfies
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S) (assignment : Variable -> M.Domain) :
    Formula S Variable -> Prop
  | .relation r args =>
      M.interpretRelation r (fun i => evaluateTerm M assignment (args i))
  | .equal t₁ t₂ =>
      M.interpretEquality
        (evaluateTerm M assignment t₁)
        (evaluateTerm M assignment t₂)
  | .neg φ =>
      ¬ Satisfies M assignment φ
  | .impl φ ψ =>
      Satisfies M assignment φ -> Satisfies M assignment ψ
  | .forallQ v φ =>
      ∀ a : M.Domain, Satisfies M (updateAssignment assignment v a) φ
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def Satisfies
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S) (assignment : Variable -> M.Domain) :
    Formula S Variable -> Prop
  | .relation r args =>
      M.interpretRelation r (fun i => evaluateTerm M assignment (args i))
  | .equal t₁ t₂ =>
      M.interpretEquality
        (evaluateTerm M assignment t₁)
        (evaluateTerm M assignment t₂)
  | .neg φ =>
      ¬ Satisfies M assignment φ
  | .impl φ ψ =>
      Satisfies M assignment φ -> Satisfies M assignment ψ
  | .forallQ v φ =>
      ∀ a : M.Domain, Satisfies M (updateAssignment assignment v a) φ

/--
`satisfiesAndIffSatisfiesBoth` TODO

Predicate logic:

  Satisfies M assignment (Formula.and φ ψ) ↔ (Satisfies M assignment φ ∧ Satisfies M assignment ψ)

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)] (M : LRA.Logic.FirstOrder.Model S) (assignment : Variable → M.1) (φ ψ : LRA.Logic.FirstOrder.Formula S Variable), LRA.Logic.FirstOrder.Satisfies M assignment (φ.impl ψ.neg).neg ↔ (LRA.Logic.FirstOrder.Satisfies M assignment φ ∧ LRA.Logic.FirstOrder.Satisfies M assignment ψ)

Logical form (Lean):

```lean
theorem satisfiesAndIffSatisfiesBoth
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S) (assignment : Variable -> M.Domain)
    (φ ψ : Formula S Variable) :
    Satisfies M assignment (Formula.and φ ψ) ↔
      (Satisfies M assignment φ ∧ Satisfies M assignment ψ)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem satisfiesAndIffSatisfiesBoth
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S) (assignment : Variable -> M.Domain)
    (φ ψ : Formula S Variable) :
    Satisfies M assignment (Formula.and φ ψ) ↔
      (Satisfies M assignment φ ∧ Satisfies M assignment ψ) := by
  simp only [Formula.and, Satisfies]
  tauto

/--
`satisfiesExistsIffSomeWitness` TODO

Predicate logic:

  (∀ v ∈ Variable), Satisfies M assignment (Formula.existsQ v φ) ↔ ∃ a ∈ M.Domain, Satisfies M (updateAssignment assignment v a) φ

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)] (M : LRA.Logic.FirstOrder.Model S) (assignment : Variable → M.1) (v : Variable) (φ : LRA.Logic.FirstOrder.Formula S Variable), LRA.Logic.FirstOrder.Satisfies M assignment (LRA.Logic.FirstOrder.Formula.forallQ v φ.neg).neg ↔ Exists fun a => LRA.Logic.FirstOrder.Satisfies M (fun v' => Decidable.rec (fun h => (fun x => assignment v') h) (fun h => (fun x => a) h) (inst v' v)) φ

Logical form (Lean):

```lean
theorem satisfiesExistsIffSomeWitness
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S) (assignment : Variable -> M.Domain)
    (v : Variable) (φ : Formula S Variable) :
    Satisfies M assignment (Formula.existsQ v φ) ↔
      ∃ a : M.Domain, Satisfies M (updateAssignment assignment v a) φ
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

-/
theorem satisfiesExistsIffSomeWitness
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S) (assignment : Variable -> M.Domain)
    (v : Variable) (φ : Formula S Variable) :
    Satisfies M assignment (Formula.existsQ v φ) ↔
      ∃ a : M.Domain, Satisfies M (updateAssignment assignment v a) φ := by
  simp only [Formula.existsQ, Satisfies]
  exact not_forall_not

end LRA.Logic.FirstOrder
