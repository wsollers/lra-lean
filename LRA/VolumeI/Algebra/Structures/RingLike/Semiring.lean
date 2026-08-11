import LRA.VolumeI.Operations

namespace LRA.VolumeI.Algebra.Structures.RingLike

/--
A semiring-like structure with addition, multiplication, zero, and one.

Logical form:

```lean
structure Semiring where
  Carrier : Type u
  Zero : Carrier
  One : Carrier
  Addition : LRA.VolumeI.Operations.BinaryOperation Carrier
  Multiplication : LRA.VolumeI.Operations.BinaryOperation Carrier
  AdditionAssociative : LRA.VolumeI.Operations.Associative Addition
  AdditionCommutative : LRA.VolumeI.Operations.Commutative Addition
  ZeroAdditionIdentity : LRA.VolumeI.Operations.Identity Addition Zero
  MultiplicationAssociative : LRA.VolumeI.Operations.Associative Multiplication
  OneMultiplicationIdentity : LRA.VolumeI.Operations.Identity Multiplication One
  MultiplicationDistributesOverAddition :
    LRA.VolumeI.Operations.Distributive Multiplication Addition
  ZeroMultiplicationAbsorbing : LRA.VolumeI.Operations.Absorbing Multiplication Zero
```
-/
structure Semiring where
  Carrier : Type u
  Zero : Carrier
  One : Carrier
  Addition : LRA.VolumeI.Operations.BinaryOperation Carrier
  Multiplication : LRA.VolumeI.Operations.BinaryOperation Carrier
  AdditionAssociative : LRA.VolumeI.Operations.Associative Addition
  AdditionCommutative : LRA.VolumeI.Operations.Commutative Addition
  ZeroAdditionIdentity : LRA.VolumeI.Operations.Identity Addition Zero
  MultiplicationAssociative : LRA.VolumeI.Operations.Associative Multiplication
  OneMultiplicationIdentity : LRA.VolumeI.Operations.Identity Multiplication One
  MultiplicationDistributesOverAddition :
    LRA.VolumeI.Operations.Distributive Multiplication Addition
  ZeroMultiplicationAbsorbing : LRA.VolumeI.Operations.Absorbing Multiplication Zero

end LRA.VolumeI.Algebra.Structures.RingLike
