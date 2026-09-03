import LRA.ModelTheory.SecondOrderMonadic.Semantics.SOSatisfaction

open LRA.Logic

open LRA.Logic.SecondOrderMonadic

namespace LRA.ModelTheory.SecondOrderMonadic

/--
`emptySignature` TODO

Predicate logic:

  def emptySignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨Empty, Empty.elim⟩
  Constants := Empty

Predicate logic (unfolded):

  def emptySignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨Empty, Empty.elim⟩
  Constants := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def emptySignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨Empty, Empty.elim⟩
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
def emptySignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨Empty, Empty.elim⟩
  Constants := Empty

/--
`X` TODO

Predicate logic:

  def X : Nat := 0

Predicate logic (unfolded):

  def X : Nat := 0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def X : Nat := 0
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
def X : Nat := 0

/--
`henkinTestFormula` TODO

Predicate logic:

  def henkinTestFormula : SOFormula emptySignature Nat Nat :=
  SOFormula.existsSet X
    (SOFormula.and
      (SOFormula.setMember X (FirstOrder.Term.var 0))
      (SOFormula.neg (SOFormula.setMember X (FirstOrder.Term.var 1))))

Predicate logic (unfolded):

  def henkinTestFormula : SOFormula emptySignature Nat Nat :=
  SOFormula.existsSet X
    (SOFormula.and
      (SOFormula.setMember X (FirstOrder.Term.var 0))
      (SOFormula.neg (SOFormula.setMember X (FirstOrder.Term.var 1)))) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def henkinTestFormula : SOFormula emptySignature Nat Nat :=
  SOFormula.existsSet X
    (SOFormula.and
      (SOFormula.setMember X (FirstOrder.Term.var 0))
      (SOFormula.neg (SOFormula.setMember X (FirstOrder.Term.var 1))))
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
def henkinTestFormula : SOFormula emptySignature Nat Nat :=
  SOFormula.existsSet X
    (SOFormula.and
      (SOFormula.setMember X (FirstOrder.Term.var 0))
      (SOFormula.neg (SOFormula.setMember X (FirstOrder.Term.var 1))))

/--
`testElementAssignment` TODO

Predicate logic:

  def testElementAssignment : Nat -> Bool
  | 0 => true
  | _ => false

Predicate logic (unfolded):

  def testElementAssignment : Nat -> Bool
  | 0 => true
  | _ => false (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def testElementAssignment : Nat -> Bool
  | 0 => true
  | _ => false
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
def testElementAssignment : Nat -> Bool
  | 0 => true
  | _ => false

/--
`richModel` TODO

Predicate logic:

  def richModel : HenkinModel emptySignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun r => Empty.elim r
  interpretConstant := Empty.elim
  SecondOrderDomain := {∅, {true}, {true, false}}

Predicate logic (unfolded):

  def richModel : HenkinModel emptySignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun r => Empty.elim r
  interpretConstant := Empty.elim
  SecondOrderDomain := {∅, {true}, {true, false}} (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def richModel : HenkinModel emptySignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun r => Empty.elim r
  interpretConstant := Empty.elim
  SecondOrderDomain := {∅, {true}, {true, false}}
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
def richModel : HenkinModel emptySignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun r => Empty.elim r
  interpretConstant := Empty.elim
  SecondOrderDomain := {∅, {true}, {true, false}}

/--
`poorModel` TODO

Predicate logic:

  def poorModel : HenkinModel emptySignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun r => Empty.elim r
  interpretConstant := Empty.elim
  SecondOrderDomain := {∅, {true, false}}

Predicate logic (unfolded):

  def poorModel : HenkinModel emptySignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun r => Empty.elim r
  interpretConstant := Empty.elim
  SecondOrderDomain := {∅, {true, false}} (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def poorModel : HenkinModel emptySignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun r => Empty.elim r
  interpretConstant := Empty.elim
  SecondOrderDomain := {∅, {true, false}}
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
def poorModel : HenkinModel emptySignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun r => Empty.elim r
  interpretConstant := Empty.elim
  SecondOrderDomain := {∅, {true, false}}

/--
`richModel_satisfies_henkinTestFormula` TODO

Predicate logic:

  SOSatisfies richModel richAssignment henkinTestFormula

Predicate logic (unfolded):

  ∀ {richAssignment : LRA.ModelTheory.SecondOrderMonadic.SOAssignment LRA.ModelTheory.SecondOrderMonadic.richModel Nat Nat}, LRA.ModelTheory.SecondOrderMonadic.SOSatisfies LRA.ModelTheory.SecondOrderMonadic.richModel richAssignment LRA.ModelTheory.SecondOrderMonadic.henkinTestFormula

Logical form (Lean):

```lean
theorem richModel_satisfies_henkinTestFormula :
    SOSatisfies richModel
      richAssignment
      henkinTestFormula
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
theorem richModel_satisfies_henkinTestFormula :
    SOSatisfies richModel
      richAssignment
      henkinTestFormula := by
  sorry
/--
`poorModel_not_satisfies_henkinTestFormula` TODO

Predicate logic:

  ¬ SOSatisfies poorModel poorAssignment henkinTestFormula

Predicate logic (unfolded):

  ∀ {poorAssignment : LRA.ModelTheory.SecondOrderMonadic.SOAssignment LRA.ModelTheory.SecondOrderMonadic.poorModel Nat Nat}, LRA.ModelTheory.SecondOrderMonadic.SOSatisfies LRA.ModelTheory.SecondOrderMonadic.poorModel poorAssignment LRA.ModelTheory.SecondOrderMonadic.henkinTestFormula → False

Logical form (Lean):

```lean
theorem poorModel_not_satisfies_henkinTestFormula :
    ¬ SOSatisfies poorModel
        poorAssignment
        henkinTestFormula
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
theorem poorModel_not_satisfies_henkinTestFormula :
    ¬ SOSatisfies poorModel
        poorAssignment
        henkinTestFormula := by
  sorry
end LRA.ModelTheory.SecondOrderMonadic
