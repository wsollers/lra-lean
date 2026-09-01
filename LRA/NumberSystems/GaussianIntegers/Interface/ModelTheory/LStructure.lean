import LRA.AlgebraicStructures.IntegralDomain.Interface.ModelTheory
import LRA.NumberSystems.GaussianIntegers.Interface.Signature.Definition
import LRA.NumberSystems.Integers.Constructions.Polish
import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

namespace LRA.NumberSystems.GaussianIntegers.Interface.ModelTheory

open LRA.NumberSystems.GaussianIntegers.Interface.Signature
open LRA.AlgebraicStructures
open LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

universe u

/--
`ActiveGaussianInteger` TODO

Predicate logic:

  abbrev ActiveGaussianInteger := GaussianInteger LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z

Predicate logic (unfolded):

  abbrev ActiveGaussianInteger := GaussianInteger LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev ActiveGaussianInteger := GaussianInteger LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z
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
abbrev ActiveGaussianInteger := GaussianInteger LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z

/--
`gaussianArithmeticRingModel` TODO

Predicate logic:

  def gaussianArithmeticRingModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model GaussianIntegersFirstOrderSignature :=
  LRA.AlgebraicStructures.IntegralDomain.Interface.ModelTheory.integralDomainFirstOrderModel
    (GaussianInteger R)

Predicate logic (unfolded):

  def gaussianArithmeticRingModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model GaussianIntegersFirstOrderSignature :=
  LRA.AlgebraicStructures.IntegralDomain.Interface.ModelTheory.integralDomainFirstOrderModel
    (GaussianInteger R) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def gaussianArithmeticRingModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model GaussianIntegersFirstOrderSignature :=
  LRA.AlgebraicStructures.IntegralDomain.Interface.ModelTheory.integralDomainFirstOrderModel
    (GaussianInteger R)
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
def gaussianArithmeticRingModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model GaussianIntegersFirstOrderSignature :=
  LRA.AlgebraicStructures.IntegralDomain.Interface.ModelTheory.integralDomainFirstOrderModel
    (GaussianInteger R)

/--
`GaussianArithmeticRingModel` TODO

Predicate logic:

  def GaussianArithmeticRingModel :
    LRA.Logic.FirstOrder.Model GaussianIntegersFirstOrderSignature :=
  gaussianArithmeticRingModel LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z

Predicate logic (unfolded):

  def GaussianArithmeticRingModel :
    LRA.Logic.FirstOrder.Model GaussianIntegersFirstOrderSignature :=
  gaussianArithmeticRingModel LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def GaussianArithmeticRingModel :
    LRA.Logic.FirstOrder.Model GaussianIntegersFirstOrderSignature :=
  gaussianArithmeticRingModel LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z
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
def GaussianArithmeticRingModel :
    LRA.Logic.FirstOrder.Model GaussianIntegersFirstOrderSignature :=
  gaussianArithmeticRingModel LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z

example : CommutativeRingLaws ActiveGaussianInteger := inferInstance

example (a b : ActiveGaussianInteger) : a + b = b + a :=
  AddCommutative a b

end LRA.NumberSystems.GaussianIntegers.Interface.ModelTheory
