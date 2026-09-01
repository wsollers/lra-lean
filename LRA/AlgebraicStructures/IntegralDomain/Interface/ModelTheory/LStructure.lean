import LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.Model
import LRA.AlgebraicStructures.IntegralDomain.Interface.Definitions

namespace LRA.AlgebraicStructures.IntegralDomain.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures.IntegralDomain.Interface.Signature

/--
`IntegralDomainSignature` TODO

Predicate logic:

  abbrev IntegralDomainSignature :=
  LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.CommutativeRingSignature

Predicate logic (unfolded):

  abbrev IntegralDomainSignature :=
  LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.CommutativeRingSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev IntegralDomainSignature :=
  LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.CommutativeRingSignature
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
abbrev IntegralDomainSignature :=
  LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.CommutativeRingSignature

/--
`BuildIntegralDomainModel` TODO

Predicate logic:

  def BuildIntegralDomainModel
    (signature : IntegralDomainSignature) :
    LRA.Logic.FirstOrder.Model IntegralDomainFirstOrderSignature :=
  LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.BuildCommutativeRingModel signature

Predicate logic (unfolded):

  def BuildIntegralDomainModel
    (signature : IntegralDomainSignature) :
    LRA.Logic.FirstOrder.Model IntegralDomainFirstOrderSignature :=
  LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.BuildCommutativeRingModel signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildIntegralDomainModel
    (signature : IntegralDomainSignature) :
    LRA.Logic.FirstOrder.Model IntegralDomainFirstOrderSignature :=
  LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.BuildCommutativeRingModel signature
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
def BuildIntegralDomainModel
    (signature : IntegralDomainSignature) :
    LRA.Logic.FirstOrder.Model IntegralDomainFirstOrderSignature :=
  LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.BuildCommutativeRingModel signature

/--
`integralDomainFirstOrderModel` TODO

Predicate logic:

  def integralDomainFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model IntegralDomainFirstOrderSignature :=
  LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.commutativeRingFirstOrderModel R

Predicate logic (unfolded):

  def integralDomainFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model IntegralDomainFirstOrderSignature :=
  LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.commutativeRingFirstOrderModel R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def integralDomainFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model IntegralDomainFirstOrderSignature :=
  LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.commutativeRingFirstOrderModel R
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
def integralDomainFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model IntegralDomainFirstOrderSignature :=
  LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.commutativeRingFirstOrderModel R

end LRA.AlgebraicStructures.IntegralDomain.Interface.ModelTheory
