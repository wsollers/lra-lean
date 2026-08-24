import LRA.Logic.Semantics.Substitution
import LRA.Logic.Syntax.FirstOrder.Sentence

namespace LRA.Logic.FirstOrder

/--
`satisfies_iff_of_isClosedFormula` TODO

Predicate logic:

  (IsClosedFormula formula) → Satisfies M leftAssignment formula ↔ Satisfies M rightAssignment formula

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)] (M : LRA.Logic.FirstOrder.Model S) {leftAssignment rightAssignment : Variable → M.1} (formula : LRA.Logic.FirstOrder.Formula S Variable), LRA.Logic.FirstOrder.freeVariables formula = Finset.instEmptyCollection.1 → LRA.Logic.FirstOrder.Satisfies M leftAssignment formula ↔ LRA.Logic.FirstOrder.Satisfies M rightAssignment formula

Logical form (Lean):

```lean
theorem satisfies_iff_of_isClosedFormula
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S)
    {leftAssignment rightAssignment : Variable -> M.Domain}
    (formula : Formula S Variable)
    (closedFormula : IsClosedFormula formula) :
    Satisfies M leftAssignment formula ↔
      Satisfies M rightAssignment formula
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem satisfies_iff_of_isClosedFormula
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S)
    {leftAssignment rightAssignment : Variable -> M.Domain}
    (formula : Formula S Variable)
    (closedFormula : IsClosedFormula formula) :
    Satisfies M leftAssignment formula ↔
      Satisfies M rightAssignment formula := by
  apply satisfies_iff_of_agrees_on_freeVariables
  intro candidateVariable candidateVariableIsFree
  rw [closedFormula] at candidateVariableIsFree
  simp at candidateVariableIsFree

/--
`satisfies_sentence_iff` TODO

Predicate logic:

  Satisfies M leftAssignment sentence.val ↔ Satisfies M rightAssignment sentence.val

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)] (M : LRA.Logic.FirstOrder.Model S) {leftAssignment rightAssignment : Variable → M.1} (sentence : Subtype fun formula => LRA.Logic.FirstOrder.freeVariables formula = Finset.instEmptyCollection.1), LRA.Logic.FirstOrder.Satisfies M leftAssignment sentence.1 ↔ LRA.Logic.FirstOrder.Satisfies M rightAssignment sentence.1

Logical form (Lean):

```lean
theorem satisfies_sentence_iff
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S)
    {leftAssignment rightAssignment : Variable -> M.Domain}
    (sentence : Sentence S Variable) :
    Satisfies M leftAssignment sentence.val ↔
      Satisfies M rightAssignment sentence.val
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem satisfies_sentence_iff
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S)
    {leftAssignment rightAssignment : Variable -> M.Domain}
    (sentence : Sentence S Variable) :
    Satisfies M leftAssignment sentence.val ↔
      Satisfies M rightAssignment sentence.val :=
  satisfies_iff_of_isClosedFormula M sentence.val sentence.property

end LRA.Logic.FirstOrder
