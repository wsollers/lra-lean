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

  modelAA ∈ modelClass (Formula.atom TestAtom.A)

Predicate logic (unfolded):

  Set.instMembership.1 (fun M => LRA.ModelTheory.Propositional.evaluate M.1 (LRA.ModelTheory.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A) = Bool.true) LRA.ModelTheory.Propositional.modelAA

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

  modelFF ∉ modelClass (Formula.atom TestAtom.A)

Predicate logic (unfolded):

  Set.instMembership.1 (fun M => LRA.ModelTheory.Propositional.evaluate M.1 (LRA.ModelTheory.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A) = Bool.true) LRA.ModelTheory.Propositional.modelFF → False

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

  IsValid (Formula.or (Formula.atom TestAtom.A) (Formula.neg (Formula.atom TestAtom.A)))

Predicate logic (unfolded):

  ∀ (M : LRA.ModelTheory.Propositional.PropositionalModel { Atoms := LRA.ModelTheory.Propositional.TestAtom }), LRA.ModelTheory.Propositional.evaluate M.1 ((LRA.ModelTheory.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A).neg.impl (LRA.ModelTheory.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A).neg) = Bool.true

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

  IsSatisfiable {Formula.atom TestAtom.A, Formula.atom TestAtom.B} ∈ Set (Formula testLanguage)

Predicate logic (unfolded):

  Exists fun x => Set.instMembership.1 (fun M => ∀ (φ : LRA.ModelTheory.Propositional.Formula LRA.ModelTheory.Propositional.testLanguage), Set.instMembership.1 (Set.instInsert.insert (LRA.ModelTheory.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A) (Set.instSingletonSet.singleton (LRA.ModelTheory.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.B))) φ → LRA.ModelTheory.Propositional.evaluate M.valuation φ = Bool.true) x

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

  ¬ IsSatisfiable ({Formula.atom TestAtom.A, Formula.neg (Formula.atom TestAtom.A)} : Set (Formula testLanguage))

Predicate logic (unfolded):

  (Exists fun x => Set.instMembership.1 (fun M => ∀ (φ : LRA.ModelTheory.Propositional.Formula LRA.ModelTheory.Propositional.testLanguage), Set.instMembership.mem (Set.instInsert.insert (LRA.ModelTheory.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A) (Set.instSingletonSet.singleton (LRA.ModelTheory.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A).neg)) φ → M.satisfies φ) x) → False

Logical form (Lean):

```lean
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
  have hNotAeq : evaluate M.valuation (Formula.neg (Formula.atom TestAtom.A)) = true
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

  ({Formula.and (Formula.atom TestAtom.A) (Formula.atom TestAtom.B)} : Set (Formula testLanguage)) ⊨ₜ (Formula.atom TestAtom.A)

Predicate logic (unfolded):

  Set.instLE.1 (fun M => ∀ (φ : LRA.ModelTheory.Propositional.Formula LRA.ModelTheory.Propositional.testLanguage), Set.instMembership.1 (Set.instSingletonSet.1 ((LRA.ModelTheory.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A).and (LRA.ModelTheory.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.B))) φ → LRA.ModelTheory.Propositional.evaluate M.1 φ = Bool.true) fun M => LRA.ModelTheory.Propositional.evaluate M.1 (LRA.ModelTheory.Propositional.Formula.atom LRA.ModelTheory.Propositional.TestAtom.A) = Bool.true

Logical form (Lean):

```lean
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
      evaluate M.valuation (Formula.and (Formula.atom TestAtom.A) (Formula.atom TestAtom.B)) = true
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
