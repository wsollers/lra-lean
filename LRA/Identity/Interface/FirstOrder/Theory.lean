import LRA.Identity.Interface.FirstOrder.Model
import LRA.Identity.Interface.Logic.FOL.Theory

namespace LRA.Identity.Interface.FirstOrder

/--
`IdentityFiberFormulaDefinable` shows that fixing the right argument of the
model's distinguished identity relation gives a first-order definable unary
predicate. The two-variable assumption supplies separate object and parameter
variables for the atomic identity formula.

Logical form:

```lean
theorem IdentityFiberFormulaDefinable
    {L : LStructure} {Variable : Type} [DecidableEq Variable]
    (hasDistinctVariables : exists left right : Variable, left ≠ right)
    (M : Model L) (fixed : M.interpretation.Domain) :
    LRA.Identity.Logic.FOL.FormulaDefinable Variable M.interpretation
      (fun value => M.Identity value fixed)
```
-/
theorem IdentityFiberFormulaDefinable
    {L : LStructure} {Variable : Type} [DecidableEq Variable]
    (hasDistinctVariables : exists left right : Variable, left ≠ right)
    (M : Model L) (fixed : M.interpretation.Domain) :
    LRA.Identity.Logic.FOL.FormulaDefinable Variable M.interpretation
      (fun value => M.Identity value fixed) := by
  obtain ⟨subject, parameter, hSubjectParameter⟩ := hasDistinctVariables
  refine ⟨IdentityFormula L subject parameter, subject, (fun _ => fixed), ?_⟩
  intro value
  change M.Identity value fixed ↔ _
  rw [M.identityIsInterpretation]
  change
    M.interpretation.interpretRelation L.identitySymbol
        (BinaryArguments L value fixed) ↔
      M.interpretation.interpretRelation L.identitySymbol
        (fun index =>
          LRA.Logic.FirstOrder.evaluateTerm M.interpretation
            (LRA.Logic.updateAssignment (fun _ => fixed) subject value)
            (.var (BinaryArguments L subject parameter index)))
  have hArguments :
      BinaryArguments L value fixed =
        (fun index =>
          LRA.Logic.FirstOrder.evaluateTerm M.interpretation
            (LRA.Logic.updateAssignment (fun _ => fixed) subject value)
            (.var (BinaryArguments L subject parameter index))) := by
    funext index
    change
      Fin.cases value (Fin.cases fixed Fin.elim0)
          (Fin.cast L.identityArity index) =
        LRA.Logic.updateAssignment (fun _ => fixed) subject value
          (Fin.cases subject (Fin.cases parameter Fin.elim0)
            (Fin.cast L.identityArity index))
    generalize Fin.cast L.identityArity index = position
    refine Fin.cases ?_ (fun tail => ?_) position
    · simp [LRA.Logic.updateAssignment]
    · refine Fin.cases ?_ (fun impossible => Fin.elim0 impossible) tail
      change fixed = if parameter = subject then value else fixed
      have hParameterSubject : parameter ≠ subject := Ne.symm hSubjectParameter
      simp [hParameterSubject]
  rw [hArguments]

/--
`IdentityRightFiberFormulaDefinable` shows that fixing the left argument of
the model's distinguished identity relation gives a first-order definable
unary predicate.

Logical form:

```lean
theorem IdentityRightFiberFormulaDefinable
    {L : LStructure} {Variable : Type} [DecidableEq Variable]
    (hasDistinctVariables : exists left right : Variable, left ≠ right)
    (M : Model L) (fixed : M.interpretation.Domain) :
    LRA.Identity.Logic.FOL.FormulaDefinable Variable M.interpretation
      (fun value => M.Identity fixed value)
```
-/
theorem IdentityRightFiberFormulaDefinable
    {L : LStructure} {Variable : Type} [DecidableEq Variable]
    (hasDistinctVariables : exists left right : Variable, left ≠ right)
    (M : Model L) (fixed : M.interpretation.Domain) :
    LRA.Identity.Logic.FOL.FormulaDefinable Variable M.interpretation
      (fun value => M.Identity fixed value) := by
  obtain ⟨subject, parameter, hSubjectParameter⟩ := hasDistinctVariables
  refine ⟨IdentityFormula L parameter subject, subject, (fun _ => fixed), ?_⟩
  intro value
  change M.Identity fixed value ↔ _
  rw [M.identityIsInterpretation]
  change
    M.interpretation.interpretRelation L.identitySymbol
        (BinaryArguments L fixed value) ↔
      M.interpretation.interpretRelation L.identitySymbol
        (fun index =>
          LRA.Logic.FirstOrder.evaluateTerm M.interpretation
            (LRA.Logic.updateAssignment (fun _ => fixed) subject value)
            (.var (BinaryArguments L parameter subject index)))
  have hArguments :
      BinaryArguments L fixed value =
        (fun index =>
          LRA.Logic.FirstOrder.evaluateTerm M.interpretation
            (LRA.Logic.updateAssignment (fun _ => fixed) subject value)
            (.var (BinaryArguments L parameter subject index))) := by
    funext index
    change
      Fin.cases fixed (Fin.cases value Fin.elim0)
          (Fin.cast L.identityArity index) =
        LRA.Logic.updateAssignment (fun _ => fixed) subject value
          (Fin.cases parameter (Fin.cases subject Fin.elim0)
            (Fin.cast L.identityArity index))
    generalize Fin.cast L.identityArity index = position
    refine Fin.cases ?_ (fun tail => ?_) position
    · change fixed = if parameter = subject then value else fixed
      have hParameterSubject : parameter ≠ subject := Ne.symm hSubjectParameter
      simp [hParameterSubject]
    · refine Fin.cases ?_ (fun impossible => Fin.elim0 impossible) tail
      change value = if subject = subject then value else fixed
      simp
  rw [hArguments]

/--
`Theory` TODO

Predicate logic:

  ∀ {L : LRA.Identity.Interface.FirstOrder.LStructure} {Variable : Type} [inst : DecidableEq Variable] {M : LRA.Identity.Interface.FirstOrder.Model L}, ((∀ (x : M.interpretation.Domain), M.Identity x x) ∧ LRA.Identity.Logic.FOL.LeibnizSchema (LRA.Identity.Logic.FOL.FormulaDefinable Variable M.interpretation) M.Identity)

Predicate logic (unfolded):

  ∀ {L : LRA.Identity.Interface.FirstOrder.LStructure} {Variable : Type} [inst : DecidableEq Variable] {M : LRA.Identity.Interface.FirstOrder.Model L}, ((∀ (x : M.interpretation.Domain), M.Identity x x) ∧ (∀ (x y : M.interpretation.Domain), M.Identity x y → ∀ (P : M.interpretation.Domain → Prop), (∃ formula, ∃ distinguished, ∃ assignment, ∀ (value : M.interpretation.Domain), P value ↔ LRA.Logic.FirstOrder.Satisfies M.interpretation (LRA.Logic.updateAssignment assignment distinguished value) formula) → P x → P y))

Logical form (Lean):

```lean
structure Theory (L : LStructure) (Variable : Type) [DecidableEq Variable]
    (M : Model L) : Prop where
  reflexivity : forall x, M.Identity x x
  leibniz : LRA.Identity.Logic.FOL.LeibnizSchema
    (LRA.Identity.Logic.FOL.FormulaDefinable Variable M.interpretation)
    M.Identity
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure Theory (L : LStructure) (Variable : Type) [DecidableEq Variable]
    (M : Model L) : Prop where
  reflexivity : forall x, M.Identity x x
  leibniz : LRA.Identity.Logic.FOL.LeibnizSchema
    (LRA.Identity.Logic.FOL.FormulaDefinable Variable M.interpretation)
    M.Identity

end LRA.Identity.Interface.FirstOrder
