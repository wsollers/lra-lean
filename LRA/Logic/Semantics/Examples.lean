import LRA.Logic.Semantics.Sentence

namespace LRA.Logic.FirstOrder

/--
`TestRelationSymbol` TODO

Predicate logic:

  inductive TestRelationSymbol where
  | A
  | B

Predicate logic (unfolded):

  inductive TestRelationSymbol where
  | A
  | B (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive TestRelationSymbol where
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
inductive TestRelationSymbol where
  | A
  | B

/--
`testFOLSignature` TODO

Predicate logic:

  def testFOLSignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨TestRelationSymbol, fun _ => 0⟩
  Constants := Empty

Predicate logic (unfolded):

  def testFOLSignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨TestRelationSymbol, fun _ => 0⟩
  Constants := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def testFOLSignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨TestRelationSymbol, fun _ => 0⟩
  Constants := Empty
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
def testFOLSignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨TestRelationSymbol, fun _ => 0⟩
  Constants := Empty

/--
`testFOLModel` TODO

Predicate logic:

  def testFOLModel : Model testFOLSignature where
  Domain := Unit
  domainNonempty := ⟨()⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun _ _ => True
  interpretConstant := Empty.elim

Predicate logic (unfolded):

  def testFOLModel : Model testFOLSignature where
  Domain := Unit
  domainNonempty := ⟨()⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun _ _ => True
  interpretConstant := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def testFOLModel : Model testFOLSignature where
  Domain := Unit
  domainNonempty := ⟨()⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun _ _ => True
  interpretConstant := Empty.elim
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
def testFOLModel : Model testFOLSignature where
  Domain := Unit
  domainNonempty := ⟨()⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun _ _ => True
  interpretConstant := Empty.elim

/--
`testFOLFormula` TODO

Predicate logic:

  def testFOLFormula : Formula testFOLSignature Nat :=
  Formula.and
    (Formula.relation .A Fin.elim0)
    (Formula.relation .B Fin.elim0)

Predicate logic (unfolded):

  def testFOLFormula : Formula testFOLSignature Nat :=
  Formula.and
    (Formula.relation .A Fin.elim0)
    (Formula.relation .B Fin.elim0) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def testFOLFormula : Formula testFOLSignature Nat :=
  Formula.and
    (Formula.relation .A Fin.elim0)
    (Formula.relation .B Fin.elim0)
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
def testFOLFormula : Formula testFOLSignature Nat :=
  Formula.and
    (Formula.relation .A Fin.elim0)
    (Formula.relation .B Fin.elim0)

/--
`testFOLSentence` TODO

Predicate logic:

  def testFOLSentence : Sentence testFOLSignature Nat :=
  ⟨testFOLFormula, by rfl⟩

Predicate logic (unfolded):

  def testFOLSentence : Sentence testFOLSignature Nat :=
  ⟨testFOLFormula, by rfl⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def testFOLSentence : Sentence testFOLSignature Nat :=
  ⟨testFOLFormula, by rfl⟩
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
def testFOLSentence : Sentence testFOLSignature Nat :=
  ⟨testFOLFormula, by rfl⟩

/--
`testFOLModel_satisfies_aAndB` TODO

Predicate logic:

  Satisfies testFOLModel assignment testFOLFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Logic.FirstOrder.testFOLModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Logic.FirstOrder.testFOLModel assignment LRA.Logic.FirstOrder.testFOLFormula

Logical form (Lean):

```lean
theorem testFOLModel_satisfies_aAndB (assignment : Nat -> testFOLModel.Domain) :
    Satisfies testFOLModel assignment testFOLFormula
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
theorem testFOLModel_satisfies_aAndB (assignment : Nat -> testFOLModel.Domain) :
    Satisfies testFOLModel assignment testFOLFormula := by
  show Satisfies testFOLModel assignment
    (Formula.and
      (Formula.relation .A Fin.elim0)
      (Formula.relation .B Fin.elim0))
  rw [satisfiesAndIffSatisfiesBoth]
  refine ⟨?_, ?_⟩
  · trivial
  · trivial

example
    (leftAssignment rightAssignment : Nat -> testFOLModel.Domain) :
    Satisfies testFOLModel leftAssignment testFOLSentence.val ↔
      Satisfies testFOLModel rightAssignment testFOLSentence.val :=
  satisfies_sentence_iff testFOLModel testFOLSentence

/--
`QuantifierRelationSymbol` TODO

Predicate logic:

  inductive QuantifierRelationSymbol where
  | R

Predicate logic (unfolded):

  inductive QuantifierRelationSymbol where
  | R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive QuantifierRelationSymbol where
  | R
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
inductive QuantifierRelationSymbol where
  | R

/--
`quantifierSignature` TODO

Predicate logic:

  def quantifierSignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨QuantifierRelationSymbol, fun _ => 1⟩
  Constants := Empty

Predicate logic (unfolded):

  def quantifierSignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨QuantifierRelationSymbol, fun _ => 1⟩
  Constants := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def quantifierSignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨QuantifierRelationSymbol, fun _ => 1⟩
  Constants := Empty
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
def quantifierSignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨QuantifierRelationSymbol, fun _ => 1⟩
  Constants := Empty

/--
`alwaysTrueModel` TODO

Predicate logic:

  def alwaysTrueModel : Model quantifierSignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun _ _ => True
  interpretConstant := Empty.elim

Predicate logic (unfolded):

  def alwaysTrueModel : Model quantifierSignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun _ _ => True
  interpretConstant := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def alwaysTrueModel : Model quantifierSignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun _ _ => True
  interpretConstant := Empty.elim
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
def alwaysTrueModel : Model quantifierSignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun _ _ => True
  interpretConstant := Empty.elim

/--
`sometimesFalseModel` TODO

Predicate logic:

  def sometimesFalseModel : Model quantifierSignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation
    | .R, args => args ⟨0, by decide⟩ = true
  interpretConstant := Empty.elim

Predicate logic (unfolded):

  def sometimesFalseModel : Model quantifierSignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation
    | .R, args => args ⟨0, by decide⟩ = true
  interpretConstant := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def sometimesFalseModel : Model quantifierSignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation
    | .R, args => args ⟨0, by decide⟩ = true
  interpretConstant := Empty.elim
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
def sometimesFalseModel : Model quantifierSignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation
    | .R, args => args ⟨0, by decide⟩ = true
  interpretConstant := Empty.elim

/--
`x` TODO

Predicate logic:

  def x : Nat := 0

Predicate logic (unfolded):

  def x : Nat := 0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def x : Nat := 0
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
def x : Nat := 0

/--
`forallRFormula` TODO

Predicate logic:

  def forallRFormula : Formula quantifierSignature Nat :=
  Formula.forallQ x (Formula.relation .R (fun _ => Term.var x))

Predicate logic (unfolded):

  def forallRFormula : Formula quantifierSignature Nat :=
  Formula.forallQ x (Formula.relation .R (fun _ => Term.var x)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def forallRFormula : Formula quantifierSignature Nat :=
  Formula.forallQ x (Formula.relation .R (fun _ => Term.var x))
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
def forallRFormula : Formula quantifierSignature Nat :=
  Formula.forallQ x (Formula.relation .R (fun _ => Term.var x))

/--
`existsRFormula` TODO

Predicate logic:

  def existsRFormula : Formula quantifierSignature Nat :=
  Formula.existsQ x (Formula.relation .R (fun _ => Term.var x))

Predicate logic (unfolded):

  def existsRFormula : Formula quantifierSignature Nat :=
  Formula.existsQ x (Formula.relation .R (fun _ => Term.var x)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def existsRFormula : Formula quantifierSignature Nat :=
  Formula.existsQ x (Formula.relation .R (fun _ => Term.var x))
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
def existsRFormula : Formula quantifierSignature Nat :=
  Formula.existsQ x (Formula.relation .R (fun _ => Term.var x))

/--
`alwaysTrueModel_satisfies_forallR` TODO

Predicate logic:

  Satisfies alwaysTrueModel assignment forallRFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Logic.FirstOrder.alwaysTrueModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Logic.FirstOrder.alwaysTrueModel assignment LRA.Logic.FirstOrder.forallRFormula

Logical form (Lean):

```lean
theorem alwaysTrueModel_satisfies_forallR (assignment : Nat -> alwaysTrueModel.Domain) :
    Satisfies alwaysTrueModel assignment forallRFormula
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
theorem alwaysTrueModel_satisfies_forallR (assignment : Nat -> alwaysTrueModel.Domain) :
    Satisfies alwaysTrueModel assignment forallRFormula := by
  show ∀ a : Bool, Satisfies alwaysTrueModel (updateAssignment assignment x a)
    (Formula.relation .R (fun _ => Term.var x))
  intro a
  show alwaysTrueModel.interpretRelation .R
    (fun i => evaluateTerm alwaysTrueModel (updateAssignment assignment x a) (Term.var x))
  trivial

/--
`alwaysTrueModel_satisfies_existsR` TODO

Predicate logic:

  Satisfies alwaysTrueModel assignment existsRFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Logic.FirstOrder.alwaysTrueModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Logic.FirstOrder.alwaysTrueModel assignment LRA.Logic.FirstOrder.existsRFormula

Logical form (Lean):

```lean
theorem alwaysTrueModel_satisfies_existsR (assignment : Nat -> alwaysTrueModel.Domain) :
    Satisfies alwaysTrueModel assignment existsRFormula
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
theorem alwaysTrueModel_satisfies_existsR (assignment : Nat -> alwaysTrueModel.Domain) :
    Satisfies alwaysTrueModel assignment existsRFormula := by
  show Satisfies alwaysTrueModel assignment
    (Formula.existsQ x (Formula.relation .R (fun _ => Term.var x)))
  rw [satisfiesExistsIffSomeWitness]
  refine ⟨true, ?_⟩
  show alwaysTrueModel.interpretRelation .R
    (fun i => evaluateTerm alwaysTrueModel (updateAssignment assignment x true) (Term.var x))
  trivial

/--
`sometimesFalseModel_not_satisfies_forallR` TODO

Predicate logic:

  ¬ Satisfies sometimesFalseModel assignment forallRFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Logic.FirstOrder.sometimesFalseModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Logic.FirstOrder.sometimesFalseModel assignment LRA.Logic.FirstOrder.forallRFormula → False

Logical form (Lean):

```lean
theorem sometimesFalseModel_not_satisfies_forallR
    (assignment : Nat -> sometimesFalseModel.Domain) :
    ¬ Satisfies sometimesFalseModel assignment forallRFormula := by
  show ¬ ∀ a : Bool, Satisfies sometimesFalseModel (updateAssignment assignment x a)
    (Formula.relation .R (fun _ => Term.var x))
  intro h
  have hfalse : sometimesFalseModel.interpretRelation .R
      (fun i => evaluateTerm sometimesFalseModel (updateAssignment assignment x false) (Term.var x))
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
theorem sometimesFalseModel_not_satisfies_forallR
    (assignment : Nat -> sometimesFalseModel.Domain) :
    ¬ Satisfies sometimesFalseModel assignment forallRFormula := by
  show ¬ ∀ a : Bool, Satisfies sometimesFalseModel (updateAssignment assignment x a)
    (Formula.relation .R (fun _ => Term.var x))
  intro h
  have hfalse : sometimesFalseModel.interpretRelation .R
      (fun i => evaluateTerm sometimesFalseModel (updateAssignment assignment x false) (Term.var x)) :=
    h false
  simp [sometimesFalseModel, evaluateTerm, updateAssignment] at hfalse

/--
`sometimesFalseModel_satisfies_existsR` TODO

Predicate logic:

  Satisfies sometimesFalseModel assignment existsRFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Logic.FirstOrder.sometimesFalseModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Logic.FirstOrder.sometimesFalseModel assignment LRA.Logic.FirstOrder.existsRFormula

Logical form (Lean):

```lean
theorem sometimesFalseModel_satisfies_existsR
    (assignment : Nat -> sometimesFalseModel.Domain) :
    Satisfies sometimesFalseModel assignment existsRFormula
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
theorem sometimesFalseModel_satisfies_existsR
    (assignment : Nat -> sometimesFalseModel.Domain) :
    Satisfies sometimesFalseModel assignment existsRFormula := by
  show Satisfies sometimesFalseModel assignment
    (Formula.existsQ x (Formula.relation .R (fun _ => Term.var x)))
  rw [satisfiesExistsIffSomeWitness]
  refine ⟨true, ?_⟩
  show sometimesFalseModel.interpretRelation .R
    (fun i => evaluateTerm sometimesFalseModel (updateAssignment assignment x true) (Term.var x))
  simp [sometimesFalseModel, evaluateTerm, updateAssignment]

end LRA.Logic.FirstOrder
