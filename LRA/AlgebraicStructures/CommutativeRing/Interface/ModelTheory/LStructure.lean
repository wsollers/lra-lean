import LRA.AlgebraicStructures.Ring.Interface.ModelTheory.Model
import LRA.AlgebraicStructures.CommutativeRing.Interface.Signature.Definition

namespace LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures.CommutativeRing.Interface.Signature

/--
`CommutativeRingSignature` TODO

Predicate logic:

  abbrev CommutativeRingSignature :=
  LRA.AlgebraicStructures.RingConceptSignature

Predicate logic (unfolded):

  abbrev CommutativeRingSignature :=
  LRA.AlgebraicStructures.RingConceptSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev CommutativeRingSignature :=
  LRA.AlgebraicStructures.RingConceptSignature
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
abbrev CommutativeRingSignature :=
  LRA.AlgebraicStructures.RingConceptSignature

/--
`BuildCommutativeRingModel` TODO

Predicate logic:

  def BuildCommutativeRingModel
    (signature : CommutativeRingSignature) :
    LRA.Logic.FirstOrder.Model CommutativeRingFirstOrderSignature :=
  LRA.AlgebraicStructures.Ring.Interface.ModelTheory.BuildRingModel signature

Predicate logic (unfolded):

  def BuildCommutativeRingModel
    (signature : CommutativeRingSignature) :
    LRA.Logic.FirstOrder.Model CommutativeRingFirstOrderSignature :=
  LRA.AlgebraicStructures.Ring.Interface.ModelTheory.BuildRingModel signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildCommutativeRingModel
    (signature : CommutativeRingSignature) :
    LRA.Logic.FirstOrder.Model CommutativeRingFirstOrderSignature :=
  LRA.AlgebraicStructures.Ring.Interface.ModelTheory.BuildRingModel signature
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
def BuildCommutativeRingModel
    (signature : CommutativeRingSignature) :
    LRA.Logic.FirstOrder.Model CommutativeRingFirstOrderSignature :=
  LRA.AlgebraicStructures.Ring.Interface.ModelTheory.BuildRingModel signature

/--
`commutativeRingFirstOrderModel` TODO

Predicate logic:

  def commutativeRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model CommutativeRingFirstOrderSignature :=
  LRA.AlgebraicStructures.Ring.Interface.ModelTheory.ringFirstOrderModel R

Predicate logic (unfolded):

  def commutativeRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model CommutativeRingFirstOrderSignature :=
  LRA.AlgebraicStructures.Ring.Interface.ModelTheory.ringFirstOrderModel R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def commutativeRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model CommutativeRingFirstOrderSignature :=
  LRA.AlgebraicStructures.Ring.Interface.ModelTheory.ringFirstOrderModel R
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
def commutativeRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model CommutativeRingFirstOrderSignature :=
  LRA.AlgebraicStructures.Ring.Interface.ModelTheory.ringFirstOrderModel R

end LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory
