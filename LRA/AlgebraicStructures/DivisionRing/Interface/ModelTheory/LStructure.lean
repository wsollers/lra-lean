import LRA.AlgebraicStructures.DivisionRing.Interface.Definitions.ConceptSignature
import LRA.AlgebraicStructures.DivisionRing.Interface.Definitions.Signature
import LRA.Operation

namespace LRA.AlgebraicStructures.DivisionRing.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures.DivisionRing.Interface.Signature

/--
`BuildDivisionRingModel` TODO

Predicate logic:

  def BuildDivisionRingModel
    (signature : LRA.AlgebraicStructures.DivisionRingConceptSignature) :
    LRA.ModelTheory.FirstOrder.Model DivisionRingFirstOrderSignature where
  Domain

Predicate logic (unfolded):

  def BuildDivisionRingModel
    (signature : LRA.AlgebraicStructures.DivisionRingConceptSignature) :
    LRA.ModelTheory.FirstOrder.Model DivisionRingFirstOrderSignature where
  Domain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildDivisionRingModel
    (signature : LRA.AlgebraicStructures.DivisionRingConceptSignature) :
    LRA.ModelTheory.FirstOrder.Model DivisionRingFirstOrderSignature where
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
def BuildDivisionRingModel
    (signature : LRA.AlgebraicStructures.DivisionRingConceptSignature) :
    LRA.ModelTheory.FirstOrder.Model DivisionRingFirstOrderSignature where
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
`divisionRingFirstOrderModel` TODO

Predicate logic:

  def divisionRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.ModelTheory.FirstOrder.Model DivisionRingFirstOrderSignature :=
  BuildDivisionRingModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·), inv := (·⁻¹) }

Predicate logic (unfolded):

  def divisionRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.ModelTheory.FirstOrder.Model DivisionRingFirstOrderSignature :=
  BuildDivisionRingModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·), inv := (·⁻¹) } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def divisionRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.ModelTheory.FirstOrder.Model DivisionRingFirstOrderSignature :=
  BuildDivisionRingModel
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
def divisionRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.ModelTheory.FirstOrder.Model DivisionRingFirstOrderSignature :=
  BuildDivisionRingModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·), inv := (·⁻¹) }

end LRA.AlgebraicStructures.DivisionRing.Interface.ModelTheory
