import LRA.AlgebraicStructures.Ring.Interface.Definitions.Signature
import LRA.AlgebraicStructures.Ring.Interface.Definitions.ConceptSignature
import LRA.Operation

namespace LRA.AlgebraicStructures.Ring.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures.Ring.Interface.Signature

/--
`BuildRingModel` TODO

Predicate logic:

  def BuildRingModel
    (signature : LRA.AlgebraicStructures.RingConceptSignature) :
    LRA.ModelTheory.FirstOrder.Model RingFirstOrderSignature where
  Domain

Predicate logic (unfolded):

  def BuildRingModel
    (signature : LRA.AlgebraicStructures.RingConceptSignature) :
    LRA.ModelTheory.FirstOrder.Model RingFirstOrderSignature where
  Domain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildRingModel
    (signature : LRA.AlgebraicStructures.RingConceptSignature) :
    LRA.ModelTheory.FirstOrder.Model RingFirstOrderSignature where
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
def BuildRingModel
    (signature : LRA.AlgebraicStructures.RingConceptSignature) :
    LRA.ModelTheory.FirstOrder.Model RingFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.neg (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

/--
`ringFirstOrderModel` TODO

Predicate logic:

  def ringFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.ModelTheory.FirstOrder.Model RingFirstOrderSignature :=
  BuildRingModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·) }

Predicate logic (unfolded):

  def ringFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.ModelTheory.FirstOrder.Model RingFirstOrderSignature :=
  BuildRingModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·) } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ringFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.ModelTheory.FirstOrder.Model RingFirstOrderSignature :=
  BuildRingModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·) }
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
def ringFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.ModelTheory.FirstOrder.Model RingFirstOrderSignature :=
  BuildRingModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·) }

end LRA.AlgebraicStructures.Ring.Interface.ModelTheory
