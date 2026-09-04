import LRA.Identity.Interface.ModelTheory.LStructure
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Definitions
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Theorems
import LRA.ModelTheory.Model
import LRA.ModelTheory.SecondOrder.FullModel

namespace LRA.Identity

open LRA.Logic

universe u

/--
`EqualityStructure.isDiagonal` TODO

Predicate logic:

  ∀ left right, S.equalityInterpretation left right ↔ EqualityDiagonal S.Carrier left right

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    S : EqualityStructure.{u}
  Prove
    S.equalityInterpretation left right ↔ LRA.Identity.EqualityDiagonal S.Carrier left right

Logical form (Lean):

```lean
theorem EqualityStructure.isDiagonal (S : EqualityStructure.{u}) :
    ∀ left right, S.equalityInterpretation left right ↔ EqualityDiagonal S.Carrier left right
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
theorem EqualityStructure.isDiagonal (S : EqualityStructure.{u}) :
    ∀ left right, S.equalityInterpretation left right ↔ EqualityDiagonal S.Carrier left right := by
  sorry

/--
`EqualityStructure.toFirstOrderModel` TODO

Predicate logic:

  def EqualityStructure.toFirstOrderModel
      (S : EqualityStructure.{u}) :
      ModelTheory.FirstOrder.Model pureEqualitySignature where
    Domain := S.Carrier
    domainNonempty := S.carrierNonempty
    interpretEquality := S.equalityInterpretation
    equalityIsDiagonal := S.isDiagonal
    interpretFunction := fun functionSymbol => Empty.elim functionSymbol
    interpretRelation := fun relationSymbol => Empty.elim relationSymbol
    interpretConstant := Empty.elim

Predicate logic (unfolded):

  def EqualityStructure.toFirstOrderModel
      (S : EqualityStructure.{u}) :
      ModelTheory.FirstOrder.Model pureEqualitySignature where
    Domain := S.Carrier
    domainNonempty := S.carrierNonempty
    interpretEquality := S.equalityInterpretation
    equalityIsDiagonal := S.isDiagonal
    interpretFunction := fun functionSymbol => Empty.elim functionSymbol
    interpretRelation := fun relationSymbol => Empty.elim relationSymbol
    interpretConstant := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def EqualityStructure.toFirstOrderModel
    (S : EqualityStructure.{u}) :
    ModelTheory.FirstOrder.Model pureEqualitySignature where
  Domain := S.Carrier
  domainNonempty := S.carrierNonempty
  interpretEquality := S.equalityInterpretation
  equalityIsDiagonal := S.isDiagonal
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
    (S : EqualityStructure.{u}) :
    ModelTheory.FirstOrder.Model pureEqualitySignature where
  Domain := S.Carrier
  domainNonempty := S.carrierNonempty
  interpretEquality := S.equalityInterpretation
  equalityIsDiagonal := S.isDiagonal
  interpretFunction := fun functionSymbol => Empty.elim functionSymbol
  interpretRelation := fun relationSymbol => Empty.elim relationSymbol
  interpretConstant := Empty.elim

/--
`EqualityStructure.toFullSecondOrderModel` TODO

Predicate logic:

  def EqualityStructure.toFullSecondOrderModel
      (S : EqualityStructure.{u}) :
      ModelTheory.SecondOrder.FullModel pureEqualitySignature where
    Domain := S.Carrier
    domainNonempty := S.carrierNonempty
    interpretEquality := S.equalityInterpretation
    equalityIsDiagonal := S.isDiagonal
    interpretFunction := fun functionSymbol => Empty.elim functionSymbol
    interpretRelation := fun relationSymbol => Empty.elim relationSymbol
    interpretConstant := Empty.elim

Predicate logic (unfolded):

  def EqualityStructure.toFullSecondOrderModel
      (S : EqualityStructure.{u}) :
      ModelTheory.SecondOrder.FullModel pureEqualitySignature where
    Domain := S.Carrier
    domainNonempty := S.carrierNonempty
    interpretEquality := S.equalityInterpretation
    equalityIsDiagonal := S.isDiagonal
    interpretFunction := fun functionSymbol => Empty.elim functionSymbol
    interpretRelation := fun relationSymbol => Empty.elim relationSymbol
    interpretConstant := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def EqualityStructure.toFullSecondOrderModel
    (S : EqualityStructure.{u}) :
    ModelTheory.SecondOrder.FullModel pureEqualitySignature where
  Domain := S.Carrier
  domainNonempty := S.carrierNonempty
  interpretEquality := S.equalityInterpretation
  equalityIsDiagonal := S.isDiagonal
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
def EqualityStructure.toFullSecondOrderModel
    (S : EqualityStructure.{u}) :
    ModelTheory.SecondOrder.FullModel pureEqualitySignature where
  Domain := S.Carrier
  domainNonempty := S.carrierNonempty
  interpretEquality := S.equalityInterpretation
  equalityIsDiagonal := S.isDiagonal
  interpretFunction := fun functionSymbol => Empty.elim functionSymbol
  interpretRelation := fun relationSymbol => Empty.elim relationSymbol
  interpretConstant := Empty.elim

/--
`EqualityStructure.toSecondOrderModel` TODO

Predicate logic:

  abbrev EqualityStructure.toSecondOrderModel
      (S : EqualityStructure.{u}) :
      ModelTheory.SecondOrder.FullModel pureEqualitySignature :=
    S.toFullSecondOrderModel

Predicate logic (unfolded):

  abbrev EqualityStructure.toSecondOrderModel
      (S : EqualityStructure.{u}) :
      ModelTheory.SecondOrder.FullModel pureEqualitySignature :=
    S.toFullSecondOrderModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev EqualityStructure.toSecondOrderModel
    (S : EqualityStructure.{u}) :
    ModelTheory.SecondOrder.FullModel pureEqualitySignature :=
  S.toFullSecondOrderModel
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
abbrev EqualityStructure.toSecondOrderModel
    (S : EqualityStructure.{u}) :
    ModelTheory.SecondOrder.FullModel pureEqualitySignature :=
  S.toFullSecondOrderModel

/--
`EqualityStructure.toHenkinSecondOrderModel` TODO

Predicate logic:

  abbrev EqualityStructure.toHenkinSecondOrderModel
      (S : EqualityStructure.{u}) :
      ModelTheory.SecondOrder.HenkinModel pureEqualitySignature :=
    S.toFullSecondOrderModel.toHenkinModel

Predicate logic (unfolded):

  abbrev EqualityStructure.toHenkinSecondOrderModel
      (S : EqualityStructure.{u}) :
      ModelTheory.SecondOrder.HenkinModel pureEqualitySignature :=
    S.toFullSecondOrderModel.toHenkinModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev EqualityStructure.toHenkinSecondOrderModel
    (S : EqualityStructure.{u}) :
    ModelTheory.SecondOrder.HenkinModel pureEqualitySignature :=
  S.toFullSecondOrderModel.toHenkinModel
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
abbrev EqualityStructure.toHenkinSecondOrderModel
    (S : EqualityStructure.{u}) :
    ModelTheory.SecondOrder.HenkinModel pureEqualitySignature :=
  S.toFullSecondOrderModel.toHenkinModel

/--
`EqualityStructure.toHenkinSecondOrderModel_hasFullSecondOrderSemantics` TODO

Predicate logic:

  ModelTheory.SecondOrder.HasFullSecondOrderSemantics S.toHenkinSecondOrderModel

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    S : EqualityStructure.{u}
  Prove
    ((∀ (arity : Nat) (relation_ : (Fin arity → S.toHenkinSecondOrderModel.toInterpretation.1) → Prop), relation_ ∈ S.toHenkinSecondOrderModel.2 arity) ∧ (∀ (arity : Nat) (function_ : (Fin arity → S.toHenkinSecondOrderModel.toInterpretation.1) → S.toHenkinSecondOrderModel.toInterpretation.1), function_ ∈ S.toHenkinSecondOrderModel.3 arity))

Logical form (Lean):

```lean
theorem EqualityStructure.toHenkinSecondOrderModel_hasFullSecondOrderSemantics
    (S : EqualityStructure.{u}) :
    ModelTheory.SecondOrder.HasFullSecondOrderSemantics S.toHenkinSecondOrderModel
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
theorem EqualityStructure.toHenkinSecondOrderModel_hasFullSecondOrderSemantics
    (S : EqualityStructure.{u}) :
    ModelTheory.SecondOrder.HasFullSecondOrderSemantics S.toHenkinSecondOrderModel := by
  sorry

/--
`canonicalEqualityStructure` TODO

Predicate logic:

  def canonicalEqualityStructure (Carrier : Type u) [Nonempty Carrier] :
      EqualityStructure where
    Carrier := Carrier
    carrierNonempty := inferInstance
    equalityInterpretation := EqualityDiagonal Carrier
    satisfiesIdentityTheory :=
      ⟨fun _ => rfl, fun _ _ h _ _ hp => h ▸ hp⟩

Predicate logic (unfolded):

  def canonicalEqualityStructure (Carrier : Type u) [Nonempty Carrier] :
      EqualityStructure where
    Carrier := Carrier
    carrierNonempty := inferInstance
    equalityInterpretation := EqualityDiagonal Carrier
    satisfiesIdentityTheory :=
      ⟨fun _ => rfl, fun _ _ h _ _ hp => h ▸ hp⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def canonicalEqualityStructure (Carrier : Type u) [Nonempty Carrier] :
    EqualityStructure where
  Carrier := Carrier
  carrierNonempty := inferInstance
  equalityInterpretation := EqualityDiagonal Carrier
  satisfiesIdentityTheory :=
    ⟨fun _ => rfl, fun _ _ h _ _ hp => h ▸ hp⟩
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
  satisfiesIdentityTheory :=
    ⟨fun _ => rfl, fun _ _ h _ _ hp => h ▸ hp⟩

/--
`canonicalFirstOrderEqualityModel` TODO

Predicate logic:

  abbrev canonicalFirstOrderEqualityModel (Carrier : Type u) [Nonempty Carrier] :
      ModelTheory.FirstOrder.Model pureEqualitySignature :=
    (canonicalEqualityStructure Carrier).toFirstOrderModel

Predicate logic (unfolded):

  abbrev canonicalFirstOrderEqualityModel (Carrier : Type u) [Nonempty Carrier] :
      ModelTheory.FirstOrder.Model pureEqualitySignature :=
    (canonicalEqualityStructure Carrier).toFirstOrderModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev canonicalFirstOrderEqualityModel (Carrier : Type u) [Nonempty Carrier] :
    ModelTheory.FirstOrder.Model pureEqualitySignature :=
  (canonicalEqualityStructure Carrier).toFirstOrderModel
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
abbrev canonicalFirstOrderEqualityModel (Carrier : Type u) [Nonempty Carrier] :
    ModelTheory.FirstOrder.Model pureEqualitySignature :=
  (canonicalEqualityStructure Carrier).toFirstOrderModel

/--
`canonicalSecondOrderEqualityModel` TODO

Predicate logic:

  abbrev canonicalSecondOrderEqualityModel (Carrier : Type u) [Nonempty Carrier] :
      ModelTheory.SecondOrder.FullModel pureEqualitySignature :=
    (canonicalEqualityStructure Carrier).toFullSecondOrderModel

Predicate logic (unfolded):

  abbrev canonicalSecondOrderEqualityModel (Carrier : Type u) [Nonempty Carrier] :
      ModelTheory.SecondOrder.FullModel pureEqualitySignature :=
    (canonicalEqualityStructure Carrier).toFullSecondOrderModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev canonicalSecondOrderEqualityModel (Carrier : Type u) [Nonempty Carrier] :
    ModelTheory.SecondOrder.FullModel pureEqualitySignature :=
  (canonicalEqualityStructure Carrier).toFullSecondOrderModel
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
abbrev canonicalSecondOrderEqualityModel (Carrier : Type u) [Nonempty Carrier] :
    ModelTheory.SecondOrder.FullModel pureEqualitySignature :=
  (canonicalEqualityStructure Carrier).toFullSecondOrderModel

end LRA.Identity
