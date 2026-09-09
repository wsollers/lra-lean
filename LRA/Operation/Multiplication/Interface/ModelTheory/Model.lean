import LRA.Operation.Multiplication.Interface.ModelTheory.Theory
import LRA.Operation.Multiplication.Interface.ModelTheory.LStructure
import LRA.Operation.Multiplication.Realization

namespace LRA.Operation.Multiplication.Interface.ModelTheory

universe u

/--
`MultiplicationModel` A promoted multiplication package exposing one carrier's generic multiplication artifact.

Predicate logic:

  structure MultiplicationModel (Carrier : Type u) where
    instMul : Mul Carrier
    carrierNonempty : Nonempty Carrier
    realization : LRA.Operation.Multiplication.Realization Carrier
    realizesAmbientMul : realization.spec.mul = (· * ·)
    existence : LRA.Operation.Multiplication.ExistsOn Carrier
    uniqueness : LRA.Operation.Multiplication.UniqueOn Carrier

Predicate logic (unfolded):

  structure MultiplicationModel (Carrier : Type u) where
    instMul : Mul Carrier
    carrierNonempty : Nonempty Carrier
    realization : LRA.Operation.Multiplication.Realization Carrier
    realizesAmbientMul : realization.spec.mul = (· * ·)
    existence : LRA.Operation.Multiplication.ExistsOn Carrier
    uniqueness : LRA.Operation.Multiplication.UniqueOn Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure MultiplicationModel (Carrier : Type u) where
  instMul : Mul Carrier
  carrierNonempty : Nonempty Carrier
  realization : LRA.Operation.Multiplication.Realization Carrier
  realizesAmbientMul : realization.spec.mul = (· * ·)
  existence : LRA.Operation.Multiplication.ExistsOn Carrier
  uniqueness : LRA.Operation.Multiplication.UniqueOn Carrier
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
structure MultiplicationModel (Carrier : Type u) where
  instMul : Mul Carrier
  carrierNonempty : Nonempty Carrier
  realization : LRA.Operation.Multiplication.Realization Carrier
  realizesAmbientMul : realization.spec.mul = (· * ·)
  existence : LRA.Operation.Multiplication.ExistsOn Carrier
  uniqueness : LRA.Operation.Multiplication.UniqueOn Carrier

/--
`MultiplicationModel.ofCarrier` Promote the ambient multiplication operation on a carrier into the generic multiplication interface.

Predicate logic:

  def MultiplicationModel.ofCarrier (Carrier : Type u) [Mul Carrier] [Nonempty Carrier] :
      MultiplicationModel Carrier

Predicate logic (unfolded):

  def MultiplicationModel.ofCarrier (Carrier : Type u) [Mul Carrier] [Nonempty Carrier] :
      MultiplicationModel Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def MultiplicationModel.ofCarrier (Carrier : Type u) [Mul Carrier] [Nonempty Carrier] :
    MultiplicationModel Carrier
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
def MultiplicationModel.ofCarrier (Carrier : Type u) [Mul Carrier] [Nonempty Carrier] :
    MultiplicationModel Carrier := by
  refine
    { instMul := inferInstance
      carrierNonempty := inferInstance
      realization := { spec := { mul := (· * ·) }, instMul := inferInstance }
      realizesAmbientMul := rfl
      existence := ⟨{ mul := (· * ·) }⟩
      uniqueness := ?_ }
  sorry

/--
`MultiplicationModel.signature` The subject-facing signature induced by a promoted multiplication model.

Predicate logic:

  def MultiplicationModel.signature {Carrier : Type u}
      (model : MultiplicationModel Carrier) :
      LRA.Operation.Multiplication.Interface.Signature.MultiplicationConceptSignature where
    carrier := Carrier
    carrierNonempty := model.carrierNonempty
    multiply := model.realization.spec.mul

Predicate logic (unfolded):

  def MultiplicationModel.signature {Carrier : Type u}
      (model : MultiplicationModel Carrier) :
      LRA.Operation.Multiplication.Interface.Signature.MultiplicationConceptSignature where
    carrier := Carrier
    carrierNonempty := model.carrierNonempty
    multiply := model.realization.spec.mul (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def MultiplicationModel.signature {Carrier : Type u}
    (model : MultiplicationModel Carrier) :
    LRA.Operation.Multiplication.Interface.Signature.MultiplicationConceptSignature where
  carrier := Carrier
  carrierNonempty := model.carrierNonempty
  multiply := model.realization.spec.mul
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
def MultiplicationModel.signature {Carrier : Type u}
    (model : MultiplicationModel Carrier) :
    LRA.Operation.Multiplication.Interface.Signature.MultiplicationConceptSignature where
  carrier := Carrier
  carrierNonempty := model.carrierNonempty
  multiply := model.realization.spec.mul

/--
`MultiplicationModel.firstOrderModel` The first-order model induced by a promoted multiplication model.

Predicate logic:

  def MultiplicationModel.firstOrderModel {Carrier : Type u}
      (model : MultiplicationModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model MultiplicationFirstOrderSignature :=
    BuildMultiplicationModel model.signature

Predicate logic (unfolded):

  def MultiplicationModel.firstOrderModel {Carrier : Type u}
      (model : MultiplicationModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model MultiplicationFirstOrderSignature :=
    BuildMultiplicationModel model.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def MultiplicationModel.firstOrderModel {Carrier : Type u}
    (model : MultiplicationModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model MultiplicationFirstOrderSignature :=
  BuildMultiplicationModel model.signature
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
def MultiplicationModel.firstOrderModel {Carrier : Type u}
    (model : MultiplicationModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model MultiplicationFirstOrderSignature :=
  BuildMultiplicationModel model.signature

end LRA.Operation.Multiplication.Interface.ModelTheory
