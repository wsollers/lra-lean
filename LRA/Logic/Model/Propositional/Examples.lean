import LRA.Logic.Model.Propositional.PropositionalModel

namespace LRA.Logic.Propositional

/--
`TestAtom` TODO

Predicate logic:

  inductive TestAtom where
  | A
  | B

Predicate logic (unfolded):

  inductive TestAtom where
  | A
  | B (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive TestAtom where
  | A
  | B
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
inductive TestAtom where
  | A
  | B

/--
`testLanguage` TODO

Predicate logic:

  def testLanguage : PropositionalLanguage where
  Atoms := TestAtom

Predicate logic (unfolded):

  def testLanguage : PropositionalLanguage where
  Atoms := TestAtom (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def testLanguage : PropositionalLanguage where
  Atoms := TestAtom
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
def testLanguage : PropositionalLanguage where
  Atoms := TestAtom

/--
`testFormula` TODO

Predicate logic:

  def testFormula : Formula testLanguage :=
  Formula.and (Formula.atom .A) (Formula.atom .B)

Predicate logic (unfolded):

  def testFormula : Formula testLanguage :=
  Formula.and (Formula.atom .A) (Formula.atom .B) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def testFormula : Formula testLanguage :=
  Formula.and (Formula.atom .A) (Formula.atom .B)
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
def testFormula : Formula testLanguage :=
  Formula.and (Formula.atom .A) (Formula.atom .B)

/--
`testModel` TODO

Predicate logic:

  def testModel : PropositionalModel testLanguage where
  valuation
    | .A => true
    | .B => true

Predicate logic (unfolded):

  def testModel : PropositionalModel testLanguage where
  valuation
    | .A => true
    | .B => true (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def testModel : PropositionalModel testLanguage where
  valuation
    | .A => true
    | .B => true
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
def testModel : PropositionalModel testLanguage where
  valuation
    | .A => true
    | .B => true

/--
`testModel_satisfies_aAndB` TODO

Predicate logic:

  testModel.satisfies testFormula

Predicate logic (unfolded):

  LRA.Logic.Propositional.evaluate LRA.Logic.Propositional.testModel.1 LRA.Logic.Propositional.testFormula = Bool.true

Logical form (Lean):

```lean
theorem testModel_satisfies_aAndB :
    testModel.satisfies testFormula
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
theorem testModel_satisfies_aAndB :
    testModel.satisfies testFormula := by
  show evaluate testModel.valuation (Formula.and (Formula.atom .A) (Formula.atom .B)) = true
  rw [Formula.and_evaluatesToConjunction]
  rfl

end LRA.Logic.Propositional
