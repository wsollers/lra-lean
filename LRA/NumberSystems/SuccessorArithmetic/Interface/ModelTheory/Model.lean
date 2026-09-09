import LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory.Theory
import LRA.NumberSystems.SuccessorArithmetic.Definition

namespace LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

open LRA.AlgebraicStructures

universe u

/--
`SuccessorArithmeticModel` TODO

Predicate logic:

  structure SuccessorArithmeticModel : Type (u + 1) where
    Carrier : Type u
    [zeroInst : OfNat Carrier 0]
    [successorInst : HasSuccessor Carrier]
    [carrierNonempty : Nonempty Carrier]
    peanoSystem :
      LRA.NumberSystems.PeanoSystem.PeanoSystem Carrier (Set Carrier)
    zero_eq_base : peanoSystem.base = (0 : Carrier)
    successor_eq :
      peanoSystem.successor = LRA.AlgebraicStructures.Succ

Predicate logic (unfolded):

  structure SuccessorArithmeticModel : Type (u + 1) where
    Carrier : Type u
    [zeroInst : OfNat Carrier 0]
    [successorInst : HasSuccessor Carrier]
    [carrierNonempty : Nonempty Carrier]
    peanoSystem :
      LRA.NumberSystems.PeanoSystem.PeanoSystem Carrier (Set Carrier)
    zero_eq_base : peanoSystem.base = (0 : Carrier)
    successor_eq :
      peanoSystem.successor = LRA.AlgebraicStructures.Succ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure SuccessorArithmeticModel : Type (u + 1) where
  Carrier : Type u
  [zeroInst : OfNat Carrier 0]
  [successorInst : HasSuccessor Carrier]
  [carrierNonempty : Nonempty Carrier]
  peanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem Carrier (Set Carrier)
  zero_eq_base : peanoSystem.base = (0 : Carrier)
  successor_eq :
    peanoSystem.successor = LRA.AlgebraicStructures.Succ
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
structure SuccessorArithmeticModel : Type (u + 1) where
  Carrier : Type u
  [zeroInst : OfNat Carrier 0]
  [successorInst : HasSuccessor Carrier]
  [carrierNonempty : Nonempty Carrier]
  peanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem Carrier (Set Carrier)
  zero_eq_base : peanoSystem.base = (0 : Carrier)
  successor_eq :
    peanoSystem.successor = LRA.AlgebraicStructures.Succ

attribute [instance] SuccessorArithmeticModel.zeroInst
  SuccessorArithmeticModel.successorInst
  SuccessorArithmeticModel.carrierNonempty

/--
`SuccessorArithmeticModel.ofCarrier` TODO

Predicate logic:

  def SuccessorArithmeticModel.ofCarrier (R : Type u)
      [OfNat R 0] [HasSuccessor R] [Nonempty R]
      (peanoSystem :
        LRA.NumberSystems.PeanoSystem.PeanoSystem R (Set R))
      (zero_eq_base : peanoSystem.base = (0 : R))
      (successor_eq : peanoSystem.successor = LRA.AlgebraicStructures.Succ) :
      SuccessorArithmeticModel :=
    { Carrier := R
      peanoSystem := peanoSystem
      zero_eq_base := zero_eq_base
      successor_eq := successor_eq }

Predicate logic (unfolded):

  def SuccessorArithmeticModel.ofCarrier (R : Type u)
      [OfNat R 0] [HasSuccessor R] [Nonempty R]
      (peanoSystem :
        LRA.NumberSystems.PeanoSystem.PeanoSystem R (Set R))
      (zero_eq_base : peanoSystem.base = (0 : R))
      (successor_eq : peanoSystem.successor = LRA.AlgebraicStructures.Succ) :
      SuccessorArithmeticModel :=
    { Carrier := R
      peanoSystem := peanoSystem
      zero_eq_base := zero_eq_base
      successor_eq := successor_eq } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SuccessorArithmeticModel.ofCarrier (R : Type u)
    [OfNat R 0] [HasSuccessor R] [Nonempty R]
    (peanoSystem :
      LRA.NumberSystems.PeanoSystem.PeanoSystem R (Set R))
    (zero_eq_base : peanoSystem.base = (0 : R))
    (successor_eq : peanoSystem.successor = LRA.AlgebraicStructures.Succ) :
    SuccessorArithmeticModel :=
  { Carrier := R
    peanoSystem := peanoSystem
    zero_eq_base := zero_eq_base
    successor_eq := successor_eq }
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
def SuccessorArithmeticModel.ofCarrier (R : Type u)
    [OfNat R 0] [HasSuccessor R] [Nonempty R]
    (peanoSystem :
      LRA.NumberSystems.PeanoSystem.PeanoSystem R (Set R))
    (zero_eq_base : peanoSystem.base = (0 : R))
    (successor_eq : peanoSystem.successor = LRA.AlgebraicStructures.Succ) :
    SuccessorArithmeticModel :=
  { Carrier := R
    peanoSystem := peanoSystem
    zero_eq_base := zero_eq_base
    successor_eq := successor_eq }

/--
`SuccessorArithmeticModel.signature` TODO

Predicate logic:

  def SuccessorArithmeticModel.signature
      (M : SuccessorArithmeticModel) :
      SuccessorArithmeticSignature where
    carrier := M.Carrier
    zero := 0
    successor := LRA.AlgebraicStructures.Succ

Predicate logic (unfolded):

  def SuccessorArithmeticModel.signature
      (M : SuccessorArithmeticModel) :
      SuccessorArithmeticSignature where
    carrier := M.Carrier
    zero := 0
    successor := LRA.AlgebraicStructures.Succ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SuccessorArithmeticModel.signature
    (M : SuccessorArithmeticModel) :
    SuccessorArithmeticSignature where
  carrier := M.Carrier
  zero := 0
  successor := LRA.AlgebraicStructures.Succ
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
def SuccessorArithmeticModel.signature
    (M : SuccessorArithmeticModel) :
    SuccessorArithmeticSignature where
  carrier := M.Carrier
  zero := 0
  successor := LRA.AlgebraicStructures.Succ

/--
`SuccessorArithmeticModel.firstOrderModel` TODO

Predicate logic:

  def SuccessorArithmeticModel.firstOrderModel
      (M : SuccessorArithmeticModel) :
      SuccessorArithmeticLStructure :=
    BuildSuccessorArithmeticModel M.signature

Predicate logic (unfolded):

  def SuccessorArithmeticModel.firstOrderModel
      (M : SuccessorArithmeticModel) :
      SuccessorArithmeticLStructure :=
    BuildSuccessorArithmeticModel M.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SuccessorArithmeticModel.firstOrderModel
    (M : SuccessorArithmeticModel) :
    SuccessorArithmeticLStructure :=
  BuildSuccessorArithmeticModel M.signature
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
def SuccessorArithmeticModel.firstOrderModel
    (M : SuccessorArithmeticModel) :
    SuccessorArithmeticLStructure :=
  BuildSuccessorArithmeticModel M.signature

/--
`mathlibSuccessorArithmeticModel` TODO

Predicate logic:

  def mathlibSuccessorArithmeticModel : SuccessorArithmeticModel :=
    SuccessorArithmeticModel.ofCarrier
      LRA.NumberSystems.SuccessorArithmetic.Carrier
      LRA.NumberSystems.SuccessorArithmetic.concretePeanoSystem
      rfl
      rfl

Predicate logic (unfolded):

  def mathlibSuccessorArithmeticModel : SuccessorArithmeticModel :=
    SuccessorArithmeticModel.ofCarrier
      LRA.NumberSystems.SuccessorArithmetic.Carrier
      LRA.NumberSystems.SuccessorArithmetic.concretePeanoSystem
      rfl
      rfl (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def mathlibSuccessorArithmeticModel : SuccessorArithmeticModel :=
  SuccessorArithmeticModel.ofCarrier
    LRA.NumberSystems.SuccessorArithmetic.Carrier
    LRA.NumberSystems.SuccessorArithmetic.concretePeanoSystem
    rfl
    rfl
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
def mathlibSuccessorArithmeticModel : SuccessorArithmeticModel :=
  SuccessorArithmeticModel.ofCarrier
    LRA.NumberSystems.SuccessorArithmetic.Carrier
    LRA.NumberSystems.SuccessorArithmetic.concretePeanoSystem
    rfl
    rfl

end LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory
