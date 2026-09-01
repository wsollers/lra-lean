import LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.Signature.Definition
import LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.Definitions.ConceptSignature
import LRA.Operation

namespace LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.Signature

/--
`BuildCommutativeSemiringWithoutZeroModel` TODO

Predicate logic:

  def BuildCommutativeSemiringWithoutZeroModel
    (signature : LRA.AlgebraicStructures.CommutativeSemiringWithoutZeroConceptSignature) :
    LRA.Logic.FirstOrder.Model CommutativeSemiringWithoutZeroFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one

Predicate logic (unfolded):

  def BuildCommutativeSemiringWithoutZeroModel
    (signature : LRA.AlgebraicStructures.CommutativeSemiringWithoutZeroConceptSignature) :
    LRA.Logic.FirstOrder.Model CommutativeSemiringWithoutZeroFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildCommutativeSemiringWithoutZeroModel
    (signature : LRA.AlgebraicStructures.CommutativeSemiringWithoutZeroConceptSignature) :
    LRA.Logic.FirstOrder.Model CommutativeSemiringWithoutZeroFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
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
def BuildCommutativeSemiringWithoutZeroModel
    (signature : LRA.AlgebraicStructures.CommutativeSemiringWithoutZeroConceptSignature) :
    LRA.Logic.FirstOrder.Model CommutativeSemiringWithoutZeroFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one

/--
`commutativeSemiringWithoutZeroFirstOrderModel` TODO

Predicate logic:

  def commutativeSemiringWithoutZeroFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model CommutativeSemiringWithoutZeroFirstOrderSignature :=
  BuildCommutativeSemiringWithoutZeroModel
    { carrier := R, one := 1, add := (· + ·), multiply := (· * ·) }

Predicate logic (unfolded):

  def commutativeSemiringWithoutZeroFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model CommutativeSemiringWithoutZeroFirstOrderSignature :=
  BuildCommutativeSemiringWithoutZeroModel
    { carrier := R, one := 1, add := (· + ·), multiply := (· * ·) } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def commutativeSemiringWithoutZeroFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model CommutativeSemiringWithoutZeroFirstOrderSignature :=
  BuildCommutativeSemiringWithoutZeroModel
    { carrier := R, one := 1, add := (· + ·), multiply := (· * ·) }
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
def commutativeSemiringWithoutZeroFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model CommutativeSemiringWithoutZeroFirstOrderSignature :=
  BuildCommutativeSemiringWithoutZeroModel
    { carrier := R, one := 1, add := (· + ·), multiply := (· * ·) }

end LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.ModelTheory
