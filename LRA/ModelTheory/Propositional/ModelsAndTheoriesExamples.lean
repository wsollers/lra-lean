import LRA.ModelTheory.Propositional.PropositionalModel
import LRA.ModelTheory.Propositional.ModelsAndTheories
import LRA.ModelTheory.Propositional.Examples

open LRA.Logic

open LRA.Logic.Propositional

namespace LRA.ModelTheory.Propositional

/--
`modelAA` TODO

Predicate logic:

  def modelAA : PropositionalModel testLanguage where
    valuation
      | .A => true
      | .B => true

Predicate logic (unfolded):

  def modelAA : PropositionalModel testLanguage where
    valuation
      | .A => true
      | .B => true (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def modelAA : PropositionalModel testLanguage where
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
def modelAA : PropositionalModel testLanguage where
  valuation
    | .A => true
    | .B => true

/--
`modelTF` TODO

Predicate logic:

  def modelTF : PropositionalModel testLanguage where
    valuation
      | .A => true
      | .B => false

Predicate logic (unfolded):

  def modelTF : PropositionalModel testLanguage where
    valuation
      | .A => true
      | .B => false (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def modelTF : PropositionalModel testLanguage where
  valuation
    | .A => true
    | .B => false
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
def modelTF : PropositionalModel testLanguage where
  valuation
    | .A => true
    | .B => false

/--
`modelFT` TODO

Predicate logic:

  def modelFT : PropositionalModel testLanguage where
    valuation
      | .A => false
      | .B => true

Predicate logic (unfolded):

  def modelFT : PropositionalModel testLanguage where
    valuation
      | .A => false
      | .B => true (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def modelFT : PropositionalModel testLanguage where
  valuation
    | .A => false
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
def modelFT : PropositionalModel testLanguage where
  valuation
    | .A => false
    | .B => true

/--
`modelFF` TODO

Predicate logic:

  def modelFF : PropositionalModel testLanguage where
    valuation
      | .A => false
      | .B => false

Predicate logic (unfolded):

  def modelFF : PropositionalModel testLanguage where
    valuation
      | .A => false
      | .B => false (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def modelFF : PropositionalModel testLanguage where
  valuation
    | .A => false
    | .B => false
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
def modelFF : PropositionalModel testLanguage where
  valuation
    | .A => false
    | .B => false

/--
`modelAA_mem_modelClass_A` TODO

Predicate logic:

  LRA.ModelTheory.Propositional.modelAA ∈ LRA.ModelTheory.Propositional.modelClass (LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.ModelTheory.Propositional.modelAA ∈ fun M => LRA.Logic.Propositional.evaluate M.1 (LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A) = Bool.true

Logical form (Lean):

```lean
theorem modelAA_mem_modelClass_A :
    modelAA ∈ modelClass (Formula.atom TestAtom.A)
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
theorem modelAA_mem_modelClass_A :
    modelAA ∈ modelClass (Formula.atom TestAtom.A) := by
  sorry
/--
`modelFF_not_mem_modelClass_A` TODO

Predicate logic:

  ¬ LRA.ModelTheory.Propositional.modelFF ∈ LRA.ModelTheory.Propositional.modelClass (LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.ModelTheory.Propositional.modelFF ∈ fun M => LRA.Logic.Propositional.evaluate M.1 (LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A) = Bool.true → False

Logical form (Lean):

```lean
theorem modelFF_not_mem_modelClass_A :
    modelFF ∉ modelClass (Formula.atom TestAtom.A)
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
theorem modelFF_not_mem_modelClass_A :
    modelFF ∉ modelClass (Formula.atom TestAtom.A) := by
  sorry
/--
`excludedMiddle_isValid` TODO

Predicate logic:

  LRA.ModelTheory.Propositional.IsValid ((LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A).or (LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A).neg)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Logic.Propositional.evaluate M.1 ((LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A).neg.impl (LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A).neg) = Bool.true

Logical form (Lean):

```lean
theorem excludedMiddle_isValid :
    IsValid (Formula.or (Formula.atom TestAtom.A) (Formula.neg (Formula.atom TestAtom.A)))
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
theorem excludedMiddle_isValid :
    IsValid (Formula.or (Formula.atom TestAtom.A) (Formula.neg (Formula.atom TestAtom.A))) := by
  sorry
/--
`theory_AB_isSatisfiable` TODO

Predicate logic:

  LRA.ModelTheory.Propositional.IsSatisfiable (Set.instInsert.insert (LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A) (Set.instSingletonSet.singleton (LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.B)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun x => x ∈ fun M => ∀ (φ : LRA.Logic.Propositional.Formula LRA.ModelTheory.Propositional.testLanguage), φ ∈ Set.instInsert.insert (LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A) (Set.instSingletonSet.singleton (LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.B)) → LRA.Logic.Propositional.evaluate M.valuation φ = Bool.true

Logical form (Lean):

```lean
theorem theory_AB_isSatisfiable :
    IsSatisfiable ({Formula.atom TestAtom.A, Formula.atom TestAtom.B} : Set (Formula testLanguage))
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
theorem theory_AB_isSatisfiable :
    IsSatisfiable ({Formula.atom TestAtom.A, Formula.atom TestAtom.B} : Set (Formula testLanguage)) := by
  sorry
/--
`theory_AAndNotA_not_isSatisfiable` TODO

Predicate logic:

  ¬ LRA.ModelTheory.Propositional.IsSatisfiable (Set.instInsert.insert (LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A) (Set.instSingletonSet.singleton (LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A).neg))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun x => x) ∈ fun M => ∀ (φ : LRA.Logic.Propositional.Formula LRA.ModelTheory.Propositional.testLanguage), φ ∈ Set.instInsert.insert (LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A) (Set.instSingletonSet.singleton (LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A).neg) → M.satisfies φ → False

Logical form (Lean):

```lean
theorem theory_AAndNotA_not_isSatisfiable :
    ¬ IsSatisfiable
        ({Formula.atom TestAtom.A, Formula.neg (Formula.atom TestAtom.A)} : Set (Formula testLanguage))
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
theorem theory_AAndNotA_not_isSatisfiable :
    ¬ IsSatisfiable
        ({Formula.atom TestAtom.A, Formula.neg (Formula.atom TestAtom.A)} : Set (Formula testLanguage)) := by
  sorry
/--
`AAndB_semanticConsequence_A` TODO

Predicate logic:

  LRA.ModelTheory.Propositional.SemanticConsequence (Set.instSingletonSet.singleton ((LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A).and (LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.B))) (LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    { le := fun s₁ s₂ => ∀ ⦃a : LRA.ModelTheory.Propositional.PropositionalModel LRA.ModelTheory.Propositional.testLanguage⦄, a ∈ s₁ → a ∈ s₂}.le (fun M => ∀ (φ : LRA.Logic.Propositional.Formula LRA.ModelTheory.Propositional.testLanguage), φ ∈ Set.instSingletonSet.1 ((LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A).impl (LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.B).neg).neg → LRA.Logic.Propositional.evaluate M.1 φ = Bool.true) fun M => LRA.Logic.Propositional.evaluate M.1 (LRA.Logic.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A) = Bool.true

Logical form (Lean):

```lean
theorem AAndB_semanticConsequence_A :
    ({Formula.and (Formula.atom TestAtom.A) (Formula.atom TestAtom.B)} : Set (Formula testLanguage))
      ⊨ₜ (Formula.atom TestAtom.A)
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
theorem AAndB_semanticConsequence_A :
    ({Formula.and (Formula.atom TestAtom.A) (Formula.atom TestAtom.B)} : Set (Formula testLanguage))
      ⊨ₜ (Formula.atom TestAtom.A) := by
  sorry
end LRA.ModelTheory.Propositional
