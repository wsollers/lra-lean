import LRA.NumberSystems.ComplexNumbers.Interface.ModelTheory.Theory
import LRA.NumberSystems.ComplexNumbers.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures

namespace LRA.NumberSystems.ComplexNumbers.Interface.ModelTheory

open LRA.AlgebraicStructures
open LRA.AlgebraicStructures.Field.Interface.ModelTheory
open LRA.NumberSystems.ComplexNumbers.Interface.Signature

universe u

/--
`ComplexNumberModel` TODO

Predicate logic:

  structure ComplexNumberModel : Type (u + 1) where
    Carrier : Type u
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [negInst : Neg Carrier]
    [invInst : Inv Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    [laws : FieldLaws Carrier]

Predicate logic (unfolded):

  structure ComplexNumberModel : Type (u + 1) where
    Carrier : Type u
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [negInst : Neg Carrier]
    [invInst : Inv Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    [laws : FieldLaws Carrier] (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure ComplexNumberModel : Type (u + 1) where
  Carrier : Type u
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [invInst : Inv Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  [laws : FieldLaws Carrier]
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
structure ComplexNumberModel : Type (u + 1) where
  Carrier : Type u
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [invInst : Inv Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  [laws : FieldLaws Carrier]

attribute [instance] ComplexNumberModel.addInst ComplexNumberModel.mulInst
  ComplexNumberModel.negInst ComplexNumberModel.invInst
  ComplexNumberModel.zeroInst ComplexNumberModel.oneInst
  ComplexNumberModel.carrierNonempty ComplexNumberModel.laws

/--
`ComplexNumberModel.ofCarrier` TODO

Predicate logic:

  def ComplexNumberModel.ofCarrier (R : Type u)
      [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [Nonempty R]
      [FieldLaws R] : ComplexNumberModel :=
    { Carrier := R }

Predicate logic (unfolded):

  def ComplexNumberModel.ofCarrier (R : Type u)
      [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [Nonempty R]
      [FieldLaws R] : ComplexNumberModel :=
    { Carrier := R } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ComplexNumberModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [Nonempty R]
    [FieldLaws R] : ComplexNumberModel :=
  { Carrier := R }
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
def ComplexNumberModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [Nonempty R]
    [FieldLaws R] : ComplexNumberModel :=
  { Carrier := R }

/--
`ComplexNumberModel.signature` TODO

Predicate logic:

  def ComplexNumberModel.signature
      (M : ComplexNumberModel) :
      LRA.AlgebraicStructures.FieldConceptSignature where
    carrier := M.Carrier
    zero := 0
    one := 1
    add := (· + ·)
    neg := (- ·)
    multiply := (· * ·)
    inv := (·⁻¹)

Predicate logic (unfolded):

  def ComplexNumberModel.signature
      (M : ComplexNumberModel) :
      LRA.AlgebraicStructures.FieldConceptSignature where
    carrier := M.Carrier
    zero := 0
    one := 1
    add := (· + ·)
    neg := (- ·)
    multiply := (· * ·)
    inv := (·⁻¹) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ComplexNumberModel.signature
    (M : ComplexNumberModel) :
    LRA.AlgebraicStructures.FieldConceptSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  add := (· + ·)
  neg := (- ·)
  multiply := (· * ·)
  inv := (·⁻¹)
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
def ComplexNumberModel.signature
    (M : ComplexNumberModel) :
    LRA.AlgebraicStructures.FieldConceptSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  add := (· + ·)
  neg := (- ·)
  multiply := (· * ·)
  inv := (·⁻¹)

/--
`ComplexNumberModel.firstOrderModel` TODO

Predicate logic:

  def ComplexNumberModel.firstOrderModel
      (M : ComplexNumberModel) :
      LRA.ModelTheory.FirstOrder.Model ComplexNumbersFirstOrderSignature :=
    BuildFieldModel M.signature

Predicate logic (unfolded):

  def ComplexNumberModel.firstOrderModel
      (M : ComplexNumberModel) :
      LRA.ModelTheory.FirstOrder.Model ComplexNumbersFirstOrderSignature :=
    BuildFieldModel M.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ComplexNumberModel.firstOrderModel
    (M : ComplexNumberModel) :
    LRA.ModelTheory.FirstOrder.Model ComplexNumbersFirstOrderSignature :=
  BuildFieldModel M.signature
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
def ComplexNumberModel.firstOrderModel
    (M : ComplexNumberModel) :
    LRA.ModelTheory.FirstOrder.Model ComplexNumbersFirstOrderSignature :=
  BuildFieldModel M.signature

/--
`mathlibComplexNumberModel` TODO

Predicate logic:

  noncomputable def mathlibComplexNumberModel : ComplexNumberModel :=
    ComplexNumberModel.ofCarrier Complex

Predicate logic (unfolded):

  noncomputable def mathlibComplexNumberModel : ComplexNumberModel :=
    ComplexNumberModel.ofCarrier Complex (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def mathlibComplexNumberModel : ComplexNumberModel :=
  ComplexNumberModel.ofCarrier Complex
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
noncomputable def mathlibComplexNumberModel : ComplexNumberModel :=
  ComplexNumberModel.ofCarrier Complex

end LRA.NumberSystems.ComplexNumbers.Interface.ModelTheory
