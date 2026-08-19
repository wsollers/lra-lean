-- LRA/NumberSystems/NaturalNumbers/Constructions/Landau/Operations/Builders.lean
-- Def-level machine and certificate builders for one-based Peano models.

import LRA.AlgebraicStructures
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations.Addition
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations.Multiplication

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.AlgebraicStructures
open LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-!
Volume II label: natural-numbers-instance-builders
Verification status: checked builders (certificates delegate to the
operation theorems, whose proofs remain pending)

`LandauAddition model` is *model*-parameterized: one `Element` type supports
many one-based Peano models, so these can NEVER be global instances -- which
model `a + b` means would be undetermined. The builders below are `def`s,
activated locally per model:

```
letI := LandauAddOn model
letI := LandauAdditiveSemigroupLawsOn model
-- now `a + b` and `AddAssociative` mean THIS model's addition
```

Moved from `LRA.NumberSystems.NaturalNumbers.NModel.oneOn` etc. when `NModel`
was retired -- these were dot-notation methods on `NModel`; since `model` is
now a bare `PeanoSystem` value (not a wrapper this namespace owns), they are
plain functions here instead, taking `model` explicitly.
-/

/-! ## Machine builders -/

/-- The model's distinguished element as the numeral `1`. -/
def LandauOneOn (model : PeanoSystem Element SetObject) : OfNat Element 1 :=
  ⟨model.one⟩

/-- The model's successor as the `HasSuccessor` machine. -/
def LandauSuccOn (model : PeanoSystem Element SetObject) :
    HasSuccessor Element :=
  ⟨model.successor⟩

/-- The model's recursion-defined addition as the `Add` machine. -/
noncomputable def LandauAddOn (model : PeanoSystem Element SetObject) :
    Add Element :=
  ⟨LandauAddition model⟩

/-- The model's recursion-defined multiplication as the `Mul` machine. -/
noncomputable def LandauMulOn (model : PeanoSystem Element SetObject) :
    Mul Element :=
  ⟨LandauMultiplication model⟩

/-! ## Certificate builders (delegating to the operation theorems) -/

/-- `LandauAdditiveSemigroupLawsOn` builds the additive semigroup laws certificate. -/
noncomputable def LandauAdditiveSemigroupLawsOn
    (model : PeanoSystem Element SetObject) :
    @AdditiveSemigroupLaws Element (LandauAddOn model) :=
  @AdditiveSemigroupLaws.mk Element (LandauAddOn model)
    (LandauAdditionIsAssociative model)

/-- `LandauAdditiveCommutativeLawsOn` builds the additive commutative laws certificate. -/
noncomputable def LandauAdditiveCommutativeLawsOn
    (model : PeanoSystem Element SetObject) :
    @AdditiveCommutativeLaws Element (LandauAddOn model) :=
  @AdditiveCommutativeLaws.mk Element (LandauAddOn model)
    (LandauAdditionIsCommutative model)

/-- `LandauMultiplicativeSemigroupLawsOn` builds the multiplicative semigroup laws certificate. -/
noncomputable def LandauMultiplicativeSemigroupLawsOn
    (model : PeanoSystem Element SetObject) :
    @MultiplicativeSemigroupLaws Element (LandauMulOn model) :=
  @MultiplicativeSemigroupLaws.mk Element (LandauMulOn model)
    (LandauMultiplicationIsAssociative model)

/-- `LandauMultiplicativeCommutativeLawsOn` builds the multiplicative commutative laws certificate. -/
noncomputable def LandauMultiplicativeCommutativeLawsOn
    (model : PeanoSystem Element SetObject) :
    @MultiplicativeCommutativeLaws Element (LandauMulOn model) :=
  @MultiplicativeCommutativeLaws.mk Element (LandauMulOn model)
    (LandauMultiplicationIsCommutative model)

/-- `LandauDistributiveLawsOn` builds the distributive laws certificate. -/
noncomputable def LandauDistributiveLawsOn
    (model : PeanoSystem Element SetObject) :
    @DistributiveLaws Element (LandauAddOn model) (LandauMulOn model) :=
  @DistributiveLaws.mk Element (LandauAddOn model) (LandauMulOn model)
    (LandauLeftDistributivityOfMultiplicationOverAddition model)
    (LandauMultiplicationDistributesOverAddition model)

/-! ## Smoke test: local activation -/

example (model : PeanoSystem Element SetObject) (a b c : Element) : True := by
  letI := LandauAddOn model
  letI := LandauAdditiveSemigroupLawsOn model
  letI := LandauAdditiveCommutativeLawsOn model
  have associated : (a + b) + c = a + (b + c) := AddAssociative a b c
  have commuted : a + b = b + a := AddCommutative a b
  trivial

end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
