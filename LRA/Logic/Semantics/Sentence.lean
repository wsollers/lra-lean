import LRA.Logic.Semantics.Substitution
import LRA.Logic.Syntax.FirstOrder.Sentence

namespace LRA.Logic.FirstOrder

/--
`satisfies_iff_of_isClosedFormula` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = M : LRA.Logic.FirstOrder.Interpretation S {leftAssignment rightAssignment : Variable → M.Domain} (formula : LRA.Logic.FirstOrder.Formula S Variable), LRA.Logic.FirstOrder.IsClosedFormula formula → LRA.Logic.FirstOrder.Satisfies M leftAssignment formula ↔ LRA.Logic.FirstOrder.Satisfies M rightAssignment formula

Predicate logic (unfolded):

  Ambient
    (Variable)
  Objects
    S : Signature
    M : Interpretation S
    leftAssignment rightAssignment : Variable -> M.Domain
    formula : Formula S Variable
  Prove
    LRA.Logic.FirstOrder.IsClosedFormula formula → LRA.Logic.FirstOrder.Satisfies M leftAssignment formula ↔ LRA.Logic.FirstOrder.Satisfies M rightAssignment formula

Logical form (Lean):

```lean
theorem satisfies_iff_of_isClosedFormula
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Interpretation S)
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
    (M : Interpretation S)
    {leftAssignment rightAssignment : Variable -> M.Domain}
    (formula : Formula S Variable)
    (closedFormula : IsClosedFormula formula) :
    Satisfies M leftAssignment formula ↔
      Satisfies M rightAssignment formula := by
  sorry
/--
`satisfies_sentence_iff` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = M : LRA.Logic.FirstOrder.Interpretation S {leftAssignment rightAssignment : Variable → M.Domain} (sentence : LRA.Logic.FirstOrder.Sentence S Variable), LRA.Logic.FirstOrder.Satisfies M leftAssignment sentence.val ↔ LRA.Logic.FirstOrder.Satisfies M rightAssignment sentence.val

Predicate logic (unfolded):

  Ambient
    (Variable)
  Objects
    S : Signature
    M : Interpretation S
    leftAssignment rightAssignment : Variable -> M.Domain
    sentence : Sentence S Variable
  Prove
    LRA.Logic.FirstOrder.Satisfies M leftAssignment sentence.val ↔ LRA.Logic.FirstOrder.Satisfies M rightAssignment sentence.val

Logical form (Lean):

```lean
theorem satisfies_sentence_iff
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Interpretation S)
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
    (M : Interpretation S)
    {leftAssignment rightAssignment : Variable -> M.Domain}
    (sentence : Sentence S Variable) :
    Satisfies M leftAssignment sentence.val ↔
      Satisfies M rightAssignment sentence.val := by
  sorry
end LRA.Logic.FirstOrder
