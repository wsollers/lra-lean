import LRA.Operation.Addition.Interface.ModelTheory.Theory
import LRA.Operation.Addition.Interface.ModelTheory.LStructure
import LRA.Operation.Addition.Realization

namespace LRA.Operation.Addition.Interface.ModelTheory

universe u

/--
`AdditionModel` A promoted addition package exposing one carrier's generic addition artifact.

Predicate logic:

  structure AdditionModel (Carrier : Type u) where
    instAdd : Add Carrier
    carrierNonempty : Nonempty Carrier
    realization : LRA.Operation.Addition.Realization Carrier
    realizesAmbientAdd : realization.spec.add = (· + ·)
    existence : LRA.Operation.Addition.ExistsOn Carrier
    uniqueness : LRA.Operation.Addition.UniqueOn Carrier

Predicate logic (unfolded):

  structure AdditionModel (Carrier : Type u) where
    instAdd : Add Carrier
    carrierNonempty : Nonempty Carrier
    realization : LRA.Operation.Addition.Realization Carrier
    realizesAmbientAdd : realization.spec.add = (· + ·)
    existence : LRA.Operation.Addition.ExistsOn Carrier
    uniqueness : LRA.Operation.Addition.UniqueOn Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure AdditionModel (Carrier : Type u) where
  instAdd : Add Carrier
  carrierNonempty : Nonempty Carrier
  realization : LRA.Operation.Addition.Realization Carrier
  realizesAmbientAdd : realization.spec.add = (· + ·)
  existence : LRA.Operation.Addition.ExistsOn Carrier
  uniqueness : LRA.Operation.Addition.UniqueOn Carrier
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
structure AdditionModel (Carrier : Type u) where
  instAdd : Add Carrier
  carrierNonempty : Nonempty Carrier
  realization : LRA.Operation.Addition.Realization Carrier
  realizesAmbientAdd : realization.spec.add = (· + ·)
  existence : LRA.Operation.Addition.ExistsOn Carrier
  uniqueness : LRA.Operation.Addition.UniqueOn Carrier

/--
`AdditionModel.ofCarrier` Promote the ambient addition operation on a carrier into the generic addition interface.

Predicate logic:

  def AdditionModel.ofCarrier (Carrier : Type u) [Add Carrier] [Nonempty Carrier] :
      AdditionModel Carrier

Predicate logic (unfolded):

  def AdditionModel.ofCarrier (Carrier : Type u) [Add Carrier] [Nonempty Carrier] :
      AdditionModel Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def AdditionModel.ofCarrier (Carrier : Type u) [Add Carrier] [Nonempty Carrier] :
    AdditionModel Carrier
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
def AdditionModel.ofCarrier (Carrier : Type u) [Add Carrier] [Nonempty Carrier] :
    AdditionModel Carrier := by
  refine
    { instAdd := inferInstance
      carrierNonempty := inferInstance
      realization := { spec := { add := (· + ·) }, instAdd := inferInstance }
      realizesAmbientAdd := rfl
      existence := ⟨{ add := (· + ·) }⟩
      uniqueness := ?_ }
  sorry

/--
`AdditionModel.signature` The subject-facing signature induced by a promoted addition model.

Predicate logic:

  def AdditionModel.signature {Carrier : Type u}
      (model : AdditionModel Carrier) :
      LRA.Operation.Addition.Interface.Signature.AdditionConceptSignature where
    carrier := Carrier
    carrierNonempty := model.carrierNonempty
    add := model.realization.spec.add

Predicate logic (unfolded):

  def AdditionModel.signature {Carrier : Type u}
      (model : AdditionModel Carrier) :
      LRA.Operation.Addition.Interface.Signature.AdditionConceptSignature where
    carrier := Carrier
    carrierNonempty := model.carrierNonempty
    add := model.realization.spec.add (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def AdditionModel.signature {Carrier : Type u}
    (model : AdditionModel Carrier) :
    LRA.Operation.Addition.Interface.Signature.AdditionConceptSignature where
  carrier := Carrier
  carrierNonempty := model.carrierNonempty
  add := model.realization.spec.add
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
def AdditionModel.signature {Carrier : Type u}
    (model : AdditionModel Carrier) :
    LRA.Operation.Addition.Interface.Signature.AdditionConceptSignature where
  carrier := Carrier
  carrierNonempty := model.carrierNonempty
  add := model.realization.spec.add

/--
`AdditionModel.firstOrderModel` The first-order model induced by a promoted addition model.

Predicate logic:

  def AdditionModel.firstOrderModel {Carrier : Type u}
      (model : AdditionModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model AdditionFirstOrderSignature :=
    BuildAdditionModel model.signature

Predicate logic (unfolded):

  def AdditionModel.firstOrderModel {Carrier : Type u}
      (model : AdditionModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model AdditionFirstOrderSignature :=
    BuildAdditionModel model.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def AdditionModel.firstOrderModel {Carrier : Type u}
    (model : AdditionModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model AdditionFirstOrderSignature :=
  BuildAdditionModel model.signature
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
def AdditionModel.firstOrderModel {Carrier : Type u}
    (model : AdditionModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model AdditionFirstOrderSignature :=
  BuildAdditionModel model.signature

end LRA.Operation.Addition.Interface.ModelTheory
