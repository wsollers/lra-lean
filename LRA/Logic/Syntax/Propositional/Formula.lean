import LRA.Logic.Language.Propositional.PropositionalLanguage

namespace LRA.Logic.Propositional

/--
`Formula` TODO

Predicate logic:

  inductive Formula (L : PropositionalLanguage) where
  | atom : L.Atoms -> Formula L
  | neg : Formula L -> Formula L
  | impl : Formula L -> Formula L -> Formula L

Predicate logic (unfolded):

  inductive Formula (L : PropositionalLanguage) where
  | atom : L.Atoms -> Formula L
  | neg : Formula L -> Formula L
  | impl : Formula L -> Formula L -> Formula L (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive Formula (L : PropositionalLanguage) where
  | atom : L.Atoms -> Formula L
  | neg : Formula L -> Formula L
  | impl : Formula L -> Formula L -> Formula L
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
inductive Formula (L : PropositionalLanguage) where
  | atom : L.Atoms -> Formula L
  | neg : Formula L -> Formula L
  | impl : Formula L -> Formula L -> Formula L

/--
`evaluate` TODO

Predicate logic:

  def evaluate {L : PropositionalLanguage} (valuation : L.Atoms -> Bool) :
    Formula L -> Bool
  | .atom a => valuation a
  | .neg φ => !(evaluate valuation φ)
  | .impl φ ψ => !(evaluate valuation φ) || evaluate valuation ψ

Predicate logic (unfolded):

  def evaluate {L : PropositionalLanguage} (valuation : L.Atoms -> Bool) :
    Formula L -> Bool
  | .atom a => valuation a
  | .neg φ => !(evaluate valuation φ)
  | .impl φ ψ => !(evaluate valuation φ) || evaluate valuation ψ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def evaluate {L : PropositionalLanguage} (valuation : L.Atoms -> Bool) :
    Formula L -> Bool
  | .atom a => valuation a
  | .neg φ => !(evaluate valuation φ)
  | .impl φ ψ => !(evaluate valuation φ) || evaluate valuation ψ
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
def evaluate {L : PropositionalLanguage} (valuation : L.Atoms -> Bool) :
    Formula L -> Bool
  | .atom a => valuation a
  | .neg φ => !(evaluate valuation φ)
  | .impl φ ψ => !(evaluate valuation φ) || evaluate valuation ψ

/--
`Formula.and` TODO

Predicate logic:

  def Formula.and {L : PropositionalLanguage} (φ ψ : Formula L) : Formula L :=
  Formula.neg (Formula.impl φ (Formula.neg ψ))

Predicate logic (unfolded):

  def Formula.and {L : PropositionalLanguage} (φ ψ : Formula L) : Formula L :=
  Formula.neg (Formula.impl φ (Formula.neg ψ)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Formula.and {L : PropositionalLanguage} (φ ψ : Formula L) : Formula L :=
  Formula.neg (Formula.impl φ (Formula.neg ψ))
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
def Formula.and {L : PropositionalLanguage} (φ ψ : Formula L) : Formula L :=
  Formula.neg (Formula.impl φ (Formula.neg ψ))

/--
`Formula.or` TODO

Predicate logic:

  def Formula.or {L : PropositionalLanguage} (φ ψ : Formula L) : Formula L :=
  Formula.impl (Formula.neg φ) ψ

Predicate logic (unfolded):

  def Formula.or {L : PropositionalLanguage} (φ ψ : Formula L) : Formula L :=
  Formula.impl (Formula.neg φ) ψ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Formula.or {L : PropositionalLanguage} (φ ψ : Formula L) : Formula L :=
  Formula.impl (Formula.neg φ) ψ
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
def Formula.or {L : PropositionalLanguage} (φ ψ : Formula L) : Formula L :=
  Formula.impl (Formula.neg φ) ψ

/--
`Formula.iff` TODO

Predicate logic:

  def Formula.iff {L : PropositionalLanguage} (φ ψ : Formula L) : Formula L :=
  Formula.and (Formula.impl φ ψ) (Formula.impl ψ φ)

Predicate logic (unfolded):

  def Formula.iff {L : PropositionalLanguage} (φ ψ : Formula L) : Formula L :=
  Formula.and (Formula.impl φ ψ) (Formula.impl ψ φ) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Formula.iff {L : PropositionalLanguage} (φ ψ : Formula L) : Formula L :=
  Formula.and (Formula.impl φ ψ) (Formula.impl ψ φ)
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
def Formula.iff {L : PropositionalLanguage} (φ ψ : Formula L) : Formula L :=
  Formula.and (Formula.impl φ ψ) (Formula.impl ψ φ)

/--
`Formula.and_evaluatesToConjunction` TODO

Predicate logic:

  evaluate valuation (Formula.and φ ψ) = (evaluate valuation φ && evaluate valuation ψ)

Predicate logic (unfolded):

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (valuation : L.1 → Bool) (φ ψ : LRA.Logic.Propositional.Formula L), LRA.Logic.Propositional.evaluate valuation (φ.impl ψ.neg).neg = Bool.rec ((fun _ => Bool.false) Unit.unit) ((fun _ => LRA.Logic.Propositional.evaluate valuation ψ) Unit.unit) (LRA.Logic.Propositional.evaluate valuation φ)

Logical form (Lean):

```lean
theorem Formula.and_evaluatesToConjunction
    {L : PropositionalLanguage} (valuation : L.Atoms -> Bool) (φ ψ : Formula L) :
    evaluate valuation (Formula.and φ ψ) =
      (evaluate valuation φ && evaluate valuation ψ)
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
theorem Formula.and_evaluatesToConjunction
    {L : PropositionalLanguage} (valuation : L.Atoms -> Bool) (φ ψ : Formula L) :
    evaluate valuation (Formula.and φ ψ) =
      (evaluate valuation φ && evaluate valuation ψ) := by
  sorry
/--
`Formula.or_evaluatesToDisjunction` TODO

Predicate logic:

  evaluate valuation (Formula.or φ ψ) = (evaluate valuation φ || evaluate valuation ψ)

Predicate logic (unfolded):

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (valuation : L.1 → Bool) (φ ψ : LRA.Logic.Propositional.Formula L), LRA.Logic.Propositional.evaluate valuation (φ.neg.impl ψ) = Bool.rec ((fun _ => LRA.Logic.Propositional.evaluate valuation ψ) Unit.unit) ((fun _ => Bool.true) Unit.unit) (LRA.Logic.Propositional.evaluate valuation φ)

Logical form (Lean):

```lean
theorem Formula.or_evaluatesToDisjunction
    {L : PropositionalLanguage} (valuation : L.Atoms -> Bool) (φ ψ : Formula L) :
    evaluate valuation (Formula.or φ ψ) =
      (evaluate valuation φ || evaluate valuation ψ)
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
theorem Formula.or_evaluatesToDisjunction
    {L : PropositionalLanguage} (valuation : L.Atoms -> Bool) (φ ψ : Formula L) :
    evaluate valuation (Formula.or φ ψ) =
      (evaluate valuation φ || evaluate valuation ψ) := by
  sorry
/--
`Formula.iff_evaluatesToBiconditional` TODO

Predicate logic:

  evaluate valuation (Formula.iff φ ψ) = (evaluate valuation φ == evaluate valuation ψ)

Predicate logic (unfolded):

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (valuation : L.1 → Bool) (φ ψ : LRA.Logic.Propositional.Formula L), LRA.Logic.Propositional.evaluate valuation ((φ.impl ψ).impl (ψ.impl φ).neg).neg = instBEqOfDecidable.1 = LRA.Logic.Propositional.evaluate valuation φ (LRA.Logic.Propositional.evaluate valuation ψ)

Logical form (Lean):

```lean
theorem Formula.iff_evaluatesToBiconditional
    {L : PropositionalLanguage} (valuation : L.Atoms -> Bool) (φ ψ : Formula L) :
    evaluate valuation (Formula.iff φ ψ) =
      (evaluate valuation φ == evaluate valuation ψ)
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
theorem Formula.iff_evaluatesToBiconditional
    {L : PropositionalLanguage} (valuation : L.Atoms -> Bool) (φ ψ : Formula L) :
    evaluate valuation (Formula.iff φ ψ) =
      (evaluate valuation φ == evaluate valuation ψ) := by
  sorry
end LRA.Logic.Propositional
