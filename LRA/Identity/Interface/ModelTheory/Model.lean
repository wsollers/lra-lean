import LRA.Identity.Interface.ModelTheory.LStructure
import LRA.Identity.Interface.ModelTheory.Theory
import LRA.Logic.Model.Model

namespace LRA.Identity

open LRA.Logic

universe u

/--
`EqualityStructure.toFirstOrderModel` TODO

Predicate logic:

  def EqualityStructure.toFirstOrderModel
    (equalityStructure : EqualityStructure.{u}) :
    FirstOrder.Model pureEqualitySignature where
  Domain := equalityStructure.Carrier
  domainNonempty := equalityStructure.carrierNonempty
  interpretEquality := equalityStructure.equalityInterpretation
  equalityIsDiagonal := equalityStructure.equalityIsDiagonal
  interpretFunction := fun functionSymbol => Empty.elim functionSymbol
  interpretRelation := fun relationSymbol => Empty.elim relationSymbol
  interpretConstant := Empty.elim

Predicate logic (unfolded):

  def EqualityStructure.toFirstOrderModel
    (equalityStructure : EqualityStructure.{u}) :
    FirstOrder.Model pureEqualitySignature where
  Domain := equalityStructure.Carrier
  domainNonempty := equalityStructure.carrierNonempty
  interpretEquality := equalityStructure.equalityInterpretation
  equalityIsDiagonal := equalityStructure.equalityIsDiagonal
  interpretFunction := fun functionSymbol => Empty.elim functionSymbol
  interpretRelation := fun relationSymbol => Empty.elim relationSymbol
  interpretConstant := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def EqualityStructure.toFirstOrderModel
    (equalityStructure : EqualityStructure.{u}) :
    FirstOrder.Model pureEqualitySignature where
  Domain := equalityStructure.Carrier
  domainNonempty := equalityStructure.carrierNonempty
  interpretEquality := equalityStructure.equalityInterpretation
  equalityIsDiagonal := equalityStructure.equalityIsDiagonal
  interpretFunction := fun functionSymbol => Empty.elim functionSymbol
  interpretRelation := fun relationSymbol => Empty.elim relationSymbol
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
def EqualityStructure.toFirstOrderModel
    (equalityStructure : EqualityStructure.{u}) :
    FirstOrder.Model pureEqualitySignature where
  Domain := equalityStructure.Carrier
  domainNonempty := equalityStructure.carrierNonempty
  interpretEquality := equalityStructure.equalityInterpretation
  equalityIsDiagonal := equalityStructure.equalityIsDiagonal
  interpretFunction := fun functionSymbol => Empty.elim functionSymbol
  interpretRelation := fun relationSymbol => Empty.elim relationSymbol
  interpretConstant := Empty.elim

/--
`canonicalEqualityStructure` TODO

Predicate logic:

  def canonicalEqualityStructure (Carrier : Type u) [Nonempty Carrier] :
    EqualityStructure where
  Carrier := Carrier
  carrierNonempty := inferInstance
  equalityInterpretation := EqualityDiagonal Carrier
  equalityIsDiagonal := by
    intro left right
    rfl

Predicate logic (unfolded):

  def canonicalEqualityStructure (Carrier : Type u) [Nonempty Carrier] :
    EqualityStructure where
  Carrier := Carrier
  carrierNonempty := inferInstance
  equalityInterpretation := EqualityDiagonal Carrier
  equalityIsDiagonal := by
    intro left right
    rfl (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def canonicalEqualityStructure (Carrier : Type u) [Nonempty Carrier] :
    EqualityStructure where
  Carrier := Carrier
  carrierNonempty := inferInstance
  equalityInterpretation := EqualityDiagonal Carrier
  equalityIsDiagonal := by
    intro left right
    rfl
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
def canonicalEqualityStructure (Carrier : Type u) [Nonempty Carrier] :
    EqualityStructure where
  Carrier := Carrier
  carrierNonempty := inferInstance
  equalityInterpretation := EqualityDiagonal Carrier
  equalityIsDiagonal := by
    intro left right
    rfl

/--
`EqualityStructure.interpretsEqualityAsIdentity` TODO

Predicate logic:

  (∀ left right ∈ equalityStructure.Carrier), equalityStructure.equalityInterpretation left right ↔ left = right

Predicate logic (unfolded):

  ∀ (equalityStructure : LRA.Identity.EqualityStructure) (left right : equalityStructure.1), equalityStructure.3 left right ↔ left = right

Logical form (Lean):

```lean
theorem EqualityStructure.interpretsEqualityAsIdentity
    (equalityStructure : EqualityStructure.{u})
    (left right : equalityStructure.Carrier) :
    equalityStructure.equalityInterpretation left right ↔ left = right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem EqualityStructure.interpretsEqualityAsIdentity
    (equalityStructure : EqualityStructure.{u})
    (left right : equalityStructure.Carrier) :
    equalityStructure.equalityInterpretation left right ↔ left = right := by
  sorry

end LRA.Identity
