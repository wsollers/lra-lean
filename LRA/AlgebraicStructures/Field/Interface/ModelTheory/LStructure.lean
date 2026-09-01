import LRA.AlgebraicStructures.Field.Interface.Definitions.Signature
import LRA.AlgebraicStructures.Field.Interface.Definitions.ConceptSignature
import LRA.Operation

namespace LRA.AlgebraicStructures.Field.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures.Field.Interface.Signature

/--
`BuildFieldModel` TODO

Predicate logic:

  def BuildFieldModel
    (signature : LRA.AlgebraicStructures.FieldConceptSignature) :
    LRA.Logic.FirstOrder.Model FieldFirstOrderSignature where
  Domain

Predicate logic (unfolded):

  def BuildFieldModel
    (signature : LRA.AlgebraicStructures.FieldConceptSignature) :
    LRA.Logic.FirstOrder.Model FieldFirstOrderSignature where
  Domain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildFieldModel
    (signature : LRA.AlgebraicStructures.FieldConceptSignature) :
    LRA.Logic.FirstOrder.Model FieldFirstOrderSignature where
  Domain
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
def BuildFieldModel
    (signature : LRA.AlgebraicStructures.FieldConceptSignature) :
    LRA.Logic.FirstOrder.Model FieldFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.neg (args ⟨0, by decide⟩)
    | .inv, args => signature.inv (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

/--
`fieldFirstOrderModel` TODO

Predicate logic:

  def fieldFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model FieldFirstOrderSignature :=
  BuildFieldModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·), inv := (·⁻¹) }

Predicate logic (unfolded):

  def fieldFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model FieldFirstOrderSignature :=
  BuildFieldModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·), inv := (·⁻¹) } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def fieldFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model FieldFirstOrderSignature :=
  BuildFieldModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·), inv := (·⁻¹) }
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
def fieldFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model FieldFirstOrderSignature :=
  BuildFieldModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·), inv := (·⁻¹) }

end LRA.AlgebraicStructures.Field.Interface.ModelTheory
