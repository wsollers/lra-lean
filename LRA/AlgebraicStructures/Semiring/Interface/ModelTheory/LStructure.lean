import LRA.AlgebraicStructures.Semiring.Interface.Signature.Definition
import LRA.AlgebraicStructures.Semiring.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures.Semiring.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures.Semiring.Interface.Signature

/--
`BuildSemiringModel` TODO

Predicate logic:

  def BuildSemiringModel
    (signature : LRA.AlgebraicStructures.SemiringConceptSignature) :
    LRA.Logic.FirstOrder.Model SemiringFirstOrderSignature where
  Domain

Predicate logic (unfolded):

  def BuildSemiringModel
    (signature : LRA.AlgebraicStructures.SemiringConceptSignature) :
    LRA.Logic.FirstOrder.Model SemiringFirstOrderSignature where
  Domain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildSemiringModel
    (signature : LRA.AlgebraicStructures.SemiringConceptSignature) :
    LRA.Logic.FirstOrder.Model SemiringFirstOrderSignature where
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
def BuildSemiringModel
    (signature : LRA.AlgebraicStructures.SemiringConceptSignature) :
    LRA.Logic.FirstOrder.Model SemiringFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

/--
`semiringFirstOrderModel` TODO

Predicate logic:

  def semiringFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model SemiringFirstOrderSignature :=
  BuildSemiringModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      multiply := (· * ·) }

Predicate logic (unfolded):

  def semiringFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model SemiringFirstOrderSignature :=
  BuildSemiringModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      multiply := (· * ·) } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def semiringFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model SemiringFirstOrderSignature :=
  BuildSemiringModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      multiply := (· * ·) }
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
def semiringFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model SemiringFirstOrderSignature :=
  BuildSemiringModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      multiply := (· * ·) }

end LRA.AlgebraicStructures.Semiring.Interface.ModelTheory
