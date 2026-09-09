import LRA.NumberSystems.VonNeumann.Interface.ModelTheory.Theory
import LRA.NumberSystems.VonNeumann.Definition

namespace LRA.NumberSystems.VonNeumann.Interface.ModelTheory

open LRA.AlgebraicStructures

universe u v

/--
`VonNeumannModel` TODO

Predicate logic:

  structure VonNeumannModel : Type (max u v + 1) where
    Carrier : Type u
    SetObject : Type v
    [membershipInst : Membership Carrier SetObject]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [successorInst : HasSuccessor Carrier]
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [carrierNonempty : Nonempty Carrier]
    lessThan : Carrier → Carrier → Prop
    construction :
      LRA.NumberSystems.VonNeumann.VonNeumannConstructionModel
        Carrier SetObject
    zero_eq : construction.zero = (0 : Carrier)
    one_eq : construction.one = (1 : Carrier)
    successor_eq :
      construction.successor = LRA.AlgebraicStructures.Succ
    addition_eq : construction.addition = (· + ·)
    multiplication_eq : construction.multiplication = (· * ·)
    lessThan_eq : construction.lessThan = lessThan

Predicate logic (unfolded):

  structure VonNeumannModel : Type (max u v + 1) where
    Carrier : Type u
    SetObject : Type v
    [membershipInst : Membership Carrier SetObject]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [successorInst : HasSuccessor Carrier]
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [carrierNonempty : Nonempty Carrier]
    lessThan : Carrier → Carrier → Prop
    construction :
      LRA.NumberSystems.VonNeumann.VonNeumannConstructionModel
        Carrier SetObject
    zero_eq : construction.zero = (0 : Carrier)
    one_eq : construction.one = (1 : Carrier)
    successor_eq :
      construction.successor = LRA.AlgebraicStructures.Succ
    addition_eq : construction.addition = (· + ·)
    multiplication_eq : construction.multiplication = (· * ·)
    lessThan_eq : construction.lessThan = lessThan (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure VonNeumannModel : Type (max u v + 1) where
  Carrier : Type u
  SetObject : Type v
  [membershipInst : Membership Carrier SetObject]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [successorInst : HasSuccessor Carrier]
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [carrierNonempty : Nonempty Carrier]
  lessThan : Carrier → Carrier → Prop
  construction :
    LRA.NumberSystems.VonNeumann.VonNeumannConstructionModel
      Carrier SetObject
  zero_eq : construction.zero = (0 : Carrier)
  one_eq : construction.one = (1 : Carrier)
  successor_eq :
    construction.successor = LRA.AlgebraicStructures.Succ
  addition_eq : construction.addition = (· + ·)
  multiplication_eq : construction.multiplication = (· * ·)
  lessThan_eq : construction.lessThan = lessThan
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure VonNeumannModel : Type (max u v + 1) where
  Carrier : Type u
  SetObject : Type v
  [membershipInst : Membership Carrier SetObject]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [successorInst : HasSuccessor Carrier]
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [carrierNonempty : Nonempty Carrier]
  lessThan : Carrier → Carrier → Prop
  construction :
    LRA.NumberSystems.VonNeumann.VonNeumannConstructionModel
      Carrier SetObject
  zero_eq : construction.zero = (0 : Carrier)
  one_eq : construction.one = (1 : Carrier)
  successor_eq :
    construction.successor = LRA.AlgebraicStructures.Succ
  addition_eq : construction.addition = (· + ·)
  multiplication_eq : construction.multiplication = (· * ·)
  lessThan_eq : construction.lessThan = lessThan

attribute [instance] VonNeumannModel.membershipInst
  VonNeumannModel.zeroInst
  VonNeumannModel.oneInst
  VonNeumannModel.successorInst
  VonNeumannModel.addInst
  VonNeumannModel.mulInst
  VonNeumannModel.carrierNonempty

/--
`VonNeumannModel.ofCarrier` TODO

Predicate logic:

  def VonNeumannModel.ofCarrier (R : Type u) (SetObject : Type v)
      [Membership R SetObject] [OfNat R 0] [OfNat R 1]
      [HasSuccessor R] [Add R] [Mul R] [Nonempty R]
      (lt : R → R → Prop)
      (construction :
        LRA.NumberSystems.VonNeumann.VonNeumannConstructionModel
          R SetObject)
      (zero_eq : construction.zero = (0 : R))
      (one_eq : construction.one = (1 : R))
      (successor_eq :
        construction.successor = LRA.AlgebraicStructures.Succ)
      (addition_eq : construction.addition = (· + ·))
      (multiplication_eq : construction.multiplication = (· * ·))
      (lessThan_eq : construction.lessThan = lt) :
      VonNeumannModel

Predicate logic (unfolded):

  def VonNeumannModel.ofCarrier (R : Type u) (SetObject : Type v)
      [Membership R SetObject] [OfNat R 0] [OfNat R 1]
      [HasSuccessor R] [Add R] [Mul R] [Nonempty R]
      (lt : R → R → Prop)
      (construction :
        LRA.NumberSystems.VonNeumann.VonNeumannConstructionModel
          R SetObject)
      (zero_eq : construction.zero = (0 : R))
      (one_eq : construction.one = (1 : R))
      (successor_eq :
        construction.successor = LRA.AlgebraicStructures.Succ)
      (addition_eq : construction.addition = (· + ·))
      (multiplication_eq : construction.multiplication = (· * ·))
      (lessThan_eq : construction.lessThan = lt) :
      VonNeumannModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def VonNeumannModel.ofCarrier (R : Type u) (SetObject : Type v)
    [Membership R SetObject] [OfNat R 0] [OfNat R 1]
    [HasSuccessor R] [Add R] [Mul R] [Nonempty R]
    (lt : R → R → Prop)
    (construction :
      LRA.NumberSystems.VonNeumann.VonNeumannConstructionModel
        R SetObject)
    (zero_eq : construction.zero = (0 : R))
    (one_eq : construction.one = (1 : R))
    (successor_eq :
      construction.successor = LRA.AlgebraicStructures.Succ)
    (addition_eq : construction.addition = (· + ·))
    (multiplication_eq : construction.multiplication = (· * ·))
    (lessThan_eq : construction.lessThan = lt) :
    VonNeumannModel
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def VonNeumannModel.ofCarrier (R : Type u) (SetObject : Type v)
    [Membership R SetObject] [OfNat R 0] [OfNat R 1]
    [HasSuccessor R] [Add R] [Mul R] [Nonempty R]
    (lt : R → R → Prop)
    (construction :
      LRA.NumberSystems.VonNeumann.VonNeumannConstructionModel
        R SetObject)
    (zero_eq : construction.zero = (0 : R))
    (one_eq : construction.one = (1 : R))
    (successor_eq :
      construction.successor = LRA.AlgebraicStructures.Succ)
    (addition_eq : construction.addition = (· + ·))
    (multiplication_eq : construction.multiplication = (· * ·))
    (lessThan_eq : construction.lessThan = lt) :
    VonNeumannModel :=
  { Carrier := R
    SetObject := SetObject
    lessThan := lt
    construction := construction
    zero_eq := zero_eq
    one_eq := one_eq
    successor_eq := successor_eq
    addition_eq := addition_eq
    multiplication_eq := multiplication_eq
    lessThan_eq := lessThan_eq }

/--
`VonNeumannModel.signature` TODO

Predicate logic:

  def VonNeumannModel.signature
      (M : VonNeumannModel) :
      VonNeumannSignature where
    carrier := M.Carrier
    zero := 0
    one := 1
    successor := LRA.AlgebraicStructures.Succ
    addition := (· + ·)
    multiplication := (· * ·)
    lessThan := M.lessThan

Predicate logic (unfolded):

  def VonNeumannModel.signature
      (M : VonNeumannModel) :
      VonNeumannSignature where
    carrier := M.Carrier
    zero := 0
    one := 1
    successor := LRA.AlgebraicStructures.Succ
    addition := (· + ·)
    multiplication := (· * ·)
    lessThan := M.lessThan (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def VonNeumannModel.signature
    (M : VonNeumannModel) :
    VonNeumannSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  successor := LRA.AlgebraicStructures.Succ
  addition := (· + ·)
  multiplication := (· * ·)
  lessThan := M.lessThan
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
def VonNeumannModel.signature
    (M : VonNeumannModel) :
    VonNeumannSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  successor := LRA.AlgebraicStructures.Succ
  addition := (· + ·)
  multiplication := (· * ·)
  lessThan := M.lessThan

/--
`VonNeumannModel.firstOrderModel` TODO

Predicate logic:

  def VonNeumannModel.firstOrderModel
      (M : VonNeumannModel) :
      VonNeumannLStructure :=
    BuildVonNeumannModel M.signature

Predicate logic (unfolded):

  def VonNeumannModel.firstOrderModel
      (M : VonNeumannModel) :
      VonNeumannLStructure :=
    BuildVonNeumannModel M.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def VonNeumannModel.firstOrderModel
    (M : VonNeumannModel) :
    VonNeumannLStructure :=
  BuildVonNeumannModel M.signature
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
def VonNeumannModel.firstOrderModel
    (M : VonNeumannModel) :
    VonNeumannLStructure :=
  BuildVonNeumannModel M.signature

/--
`concreteVonNeumannModel` TODO

Predicate logic:

  noncomputable def concreteVonNeumannModel : VonNeumannModel :=
    VonNeumannModel.ofCarrier
      LRA.NumberSystems.VonNeumann.Carrier
      LRA.Set.Constructions.ZFCSet
      LRA.NumberSystems.VonNeumann.lessThan
      LRA.NumberSystems.VonNeumann.concreteConstructionModel
      rfl
      rfl
      rfl
      rfl
      rfl
      rfl

Predicate logic (unfolded):

  noncomputable def concreteVonNeumannModel : VonNeumannModel :=
    VonNeumannModel.ofCarrier
      LRA.NumberSystems.VonNeumann.Carrier
      LRA.Set.Constructions.ZFCSet
      LRA.NumberSystems.VonNeumann.lessThan
      LRA.NumberSystems.VonNeumann.concreteConstructionModel
      rfl
      rfl
      rfl
      rfl
      rfl
      rfl (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def concreteVonNeumannModel : VonNeumannModel :=
  VonNeumannModel.ofCarrier
    LRA.NumberSystems.VonNeumann.Carrier
    LRA.Set.Constructions.ZFCSet
    LRA.NumberSystems.VonNeumann.lessThan
    LRA.NumberSystems.VonNeumann.concreteConstructionModel
    rfl
    rfl
    rfl
    rfl
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
noncomputable def concreteVonNeumannModel : VonNeumannModel :=
  VonNeumannModel.ofCarrier
    LRA.NumberSystems.VonNeumann.Carrier
    LRA.Set.Constructions.ZFCSet
    LRA.NumberSystems.VonNeumann.lessThan
    LRA.NumberSystems.VonNeumann.concreteConstructionModel
    rfl
    rfl
    rfl
    rfl
    rfl
    rfl

end LRA.NumberSystems.VonNeumann.Interface.ModelTheory
