import LRA.Logic.Syntax.FirstOrder.FreeVariables

namespace LRA.Logic.FirstOrder

/--
`IsClosedFormula` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = formula : LRA.Logic.FirstOrder.Formula S Variable, LRA.Logic.FirstOrder.freeVariables formula = Finset.instEmptyCollection.emptyCollection

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)] (formula : LRA.Logic.FirstOrder.Formula S Variable), LRA.Logic.FirstOrder.freeVariables formula = Finset.instEmptyCollection.1

Logical form (Lean):

```lean
def IsClosedFormula
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (formula : Formula S Variable) : Prop :=
  freeVariables formula = ∅
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def IsClosedFormula
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (formula : Formula S Variable) : Prop :=
  freeVariables formula = ∅

/--
`Sentence` TODO

Predicate logic:

  abbrev Sentence (S : Signature) (Variable : Type) [DecidableEq Variable] :=
  { formula : Formula S Variable // IsClosedFormula formula }

Predicate logic (unfolded):

  abbrev Sentence (S : Signature) (Variable : Type) [DecidableEq Variable] :=
  { formula : Formula S Variable // IsClosedFormula formula } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Sentence (S : Signature) (Variable : Type) [DecidableEq Variable] :=
  { formula : Formula S Variable // IsClosedFormula formula }
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev Sentence (S : Signature) (Variable : Type) [DecidableEq Variable] :=
  { formula : Formula S Variable // IsClosedFormula formula }

/--
`sentence_hasNoFreeVariables` TODO

Predicate logic:

  freeVariables sentence.val = ∅

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)] (sentence : Subtype fun formula => LRA.Logic.FirstOrder.freeVariables formula = Finset.instEmptyCollection.1), LRA.Logic.FirstOrder.freeVariables sentence.1 = Finset.instEmptyCollection.1

Logical form (Lean):

```lean
theorem sentence_hasNoFreeVariables
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (sentence : Sentence S Variable) :
    freeVariables sentence.val = ∅
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem sentence_hasNoFreeVariables
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (sentence : Sentence S Variable) :
    freeVariables sentence.val = ∅ :=
  sentence.property

end LRA.Logic.FirstOrder
