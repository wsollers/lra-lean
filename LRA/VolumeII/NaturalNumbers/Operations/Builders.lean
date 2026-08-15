-- LRA/VolumeII/NaturalNumbers/Operations/Builders.lean
-- Def-level machine and certificate builders for N-models.

import LRA.VolumeI.AlgebraicStructures
import LRA.VolumeII.NaturalNumbers.Operations.Addition
import LRA.VolumeII.NaturalNumbers.Operations.Multiplication

namespace LRA.NumberSystems.NaturalNumbers

open LRA.Algebra.Structure

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-!
Volume II label: natural-numbers-instance-builders
Lean module: LRA.NumberSystems.NaturalNumbers.Operations.Builders
Verification status: checked builders (certificates delegate to the
operation theorems, whose proofs remain pending)

`NAddition model` is *model*-parameterized: one `Element` type supports
many N-models, so these can NEVER be global instances — which model
`a + b` means would be undetermined. The builders below are `def`s,
activated locally per model:

```
letI := model.addOn
letI := model.additiveSemigroupLawsOn
-- now `a + b` and `AddAssociative` mean THIS model's addition
```

This is the honest boundary between model theory (many models, explicit
parameterization) and the instance world (one canonical structure per
type). The active arithmetic carrier remains `Nat`, certified through
the Mathlib bridge; these builders serve proofs *about* arbitrary
N-models.
-/

/-! ## Machine builders -/

/-- The model's distinguished element as the numeral `1`.

Logical form:

```lean
def NModel.oneOn (model : NModel Element SetObject) : OfNat Element 1 :=
  ⟨model.one⟩
```
-/
def NModel.oneOn (model : NModel Element SetObject) : OfNat Element 1 :=
  ⟨model.one⟩

/-- The model's successor as the `HasSuccessor` machine.

Logical form:

```lean
def NModel.succOn (model : NModel Element SetObject) :
    HasSuccessor Element :=
  ⟨model.successor⟩
```
-/
def NModel.succOn (model : NModel Element SetObject) :
    HasSuccessor Element :=
  ⟨model.successor⟩

/-- The model's recursion-defined addition as the `Add` machine.

Logical form:

```lean
noncomputable def NModel.addOn (model : NModel Element SetObject) :
    Add Element :=
  ⟨NAddition model⟩
```
-/
noncomputable def NModel.addOn (model : NModel Element SetObject) :
    Add Element :=
  ⟨NAddition model⟩

/-- The model's recursion-defined multiplication as the `Mul` machine.

Logical form:

```lean
noncomputable def NModel.mulOn (model : NModel Element SetObject) :
    Mul Element :=
  ⟨NMultiplication model⟩
```
-/
noncomputable def NModel.mulOn (model : NModel Element SetObject) :
    Mul Element :=
  ⟨NMultiplication model⟩

/-! ## Certificate builders (delegating to the operation theorems) -/

/--
`NModel.additiveSemigroupLawsOn` defines the displayed object for additive semigroup laws on.

Logical form:

```lean
noncomputable def NModel.additiveSemigroupLawsOn
    (model : NModel Element SetObject) :
    @AdditiveSemigroupLaws Element model.addOn :=
  @AdditiveSemigroupLaws.mk Element model.addOn
    (NAdditionIsAssociative model)
```
-/
noncomputable def NModel.additiveSemigroupLawsOn
    (model : NModel Element SetObject) :
    @AdditiveSemigroupLaws Element model.addOn :=
  @AdditiveSemigroupLaws.mk Element model.addOn
    (NAdditionIsAssociative model)

/--
`NModel.additiveCommutativeLawsOn` defines the displayed object for additive commutative laws on.

Logical form:

```lean
noncomputable def NModel.additiveCommutativeLawsOn
    (model : NModel Element SetObject) :
    @AdditiveCommutativeLaws Element model.addOn :=
  @AdditiveCommutativeLaws.mk Element model.addOn
    (NAdditionIsCommutative model)
```
-/
noncomputable def NModel.additiveCommutativeLawsOn
    (model : NModel Element SetObject) :
    @AdditiveCommutativeLaws Element model.addOn :=
  @AdditiveCommutativeLaws.mk Element model.addOn
    (NAdditionIsCommutative model)

/--
`NModel.multiplicativeSemigroupLawsOn` defines the displayed object for multiplicative semigroup laws on.

Logical form:

```lean
noncomputable def NModel.multiplicativeSemigroupLawsOn
    (model : NModel Element SetObject) :
    @MultiplicativeSemigroupLaws Element model.mulOn :=
  @MultiplicativeSemigroupLaws.mk Element model.mulOn
    (NMultiplicationIsAssociative model)
```
-/
noncomputable def NModel.multiplicativeSemigroupLawsOn
    (model : NModel Element SetObject) :
    @MultiplicativeSemigroupLaws Element model.mulOn :=
  @MultiplicativeSemigroupLaws.mk Element model.mulOn
    (NMultiplicationIsAssociative model)

/--
`NModel.multiplicativeCommutativeLawsOn` defines the displayed object for multiplicative commutative laws on.

Logical form:

```lean
noncomputable def NModel.multiplicativeCommutativeLawsOn
    (model : NModel Element SetObject) :
    @MultiplicativeCommutativeLaws Element model.mulOn :=
  @MultiplicativeCommutativeLaws.mk Element model.mulOn
    (NMultiplicationIsCommutative model)
```
-/
noncomputable def NModel.multiplicativeCommutativeLawsOn
    (model : NModel Element SetObject) :
    @MultiplicativeCommutativeLaws Element model.mulOn :=
  @MultiplicativeCommutativeLaws.mk Element model.mulOn
    (NMultiplicationIsCommutative model)

/--
`NModel.distributiveLawsOn` defines the displayed object for distributive laws on.

Logical form:

```lean
noncomputable def NModel.distributiveLawsOn
    (model : NModel Element SetObject) :
    @DistributiveLaws Element model.addOn model.mulOn :=
  @DistributiveLaws.mk Element model.addOn model.mulOn
    (NLeftDistributivityOfMultiplicationOverAddition model)
    (NMultiplicationDistributesOverAddition model)
```
-/
noncomputable def NModel.distributiveLawsOn
    (model : NModel Element SetObject) :
    @DistributiveLaws Element model.addOn model.mulOn :=
  @DistributiveLaws.mk Element model.addOn model.mulOn
    (NLeftDistributivityOfMultiplicationOverAddition model)
    (NMultiplicationDistributesOverAddition model)

/-! ## Smoke test: local activation -/

example (model : NModel Element SetObject) (a b c : Element) : True := by
  letI := model.addOn
  letI := model.additiveSemigroupLawsOn
  letI := model.additiveCommutativeLawsOn
  have associated : (a + b) + c = a + (b + c) := AddAssociative a b c
  have commuted : a + b = b + a := AddCommutative a b
  trivial

end LRA.NumberSystems.NaturalNumbers
