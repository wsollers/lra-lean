import LRA.AlgebraicStructures.Group.Interface.Definitions.ConceptSignature
import LRA.AlgebraicStructures.Group.Interface.Definitions.Signature
import LRA.Operation

namespace LRA.AlgebraicStructures.Group.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures.Group.Interface.Signature

/--
`BuildGroupModel` TODO

Predicate logic:

  def BuildGroupModel
    (signature : LRA.AlgebraicStructures.GroupConceptSignature) :
    LRA.ModelTheory.FirstOrder.Model GroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .inv, args => signature.inverse (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one

Predicate logic (unfolded):

  def BuildGroupModel
    (signature : LRA.AlgebraicStructures.GroupConceptSignature) :
    LRA.ModelTheory.FirstOrder.Model GroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .inv, args => signature.inverse (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildGroupModel
    (signature : LRA.AlgebraicStructures.GroupConceptSignature) :
    LRA.ModelTheory.FirstOrder.Model GroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .inv, args => signature.inverse (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one
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
def BuildGroupModel
    (signature : LRA.AlgebraicStructures.GroupConceptSignature) :
    LRA.ModelTheory.FirstOrder.Model GroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .inv, args => signature.inverse (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one

/--
`groupFirstOrderModel` TODO

Predicate logic:

  def groupFirstOrderModel (R : Type u) [Mul R] [Inv R] [OfNat R 1] :
    LRA.ModelTheory.FirstOrder.Model GroupFirstOrderSignature :=
  BuildGroupModel
    { carrier := R, one := 1, multiply := (· * ·), inverse := (·⁻¹) }

Predicate logic (unfolded):

  def groupFirstOrderModel (R : Type u) [Mul R] [Inv R] [OfNat R 1] :
    LRA.ModelTheory.FirstOrder.Model GroupFirstOrderSignature :=
  BuildGroupModel
    { carrier := R, one := 1, multiply := (· * ·), inverse := (·⁻¹) } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def groupFirstOrderModel (R : Type u) [Mul R] [Inv R] [OfNat R 1] :
    LRA.ModelTheory.FirstOrder.Model GroupFirstOrderSignature :=
  BuildGroupModel
    { carrier := R, one := 1, multiply := (· * ·), inverse := (·⁻¹) }
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
def groupFirstOrderModel (R : Type u) [Mul R] [Inv R] [OfNat R 1] :
    LRA.ModelTheory.FirstOrder.Model GroupFirstOrderSignature :=
  BuildGroupModel
    { carrier := R, one := 1, multiply := (· * ·), inverse := (·⁻¹) }

end LRA.AlgebraicStructures.Group.Interface.ModelTheory
