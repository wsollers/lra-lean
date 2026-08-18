import LRA.VolumeI.Operations.Definition
import LRA.VolumeI.Function.Bijective.Definition
import LRA.VolumeI.Operations.Laws.Associative.Definition
import LRA.VolumeI.Operations.Laws.Identity.Definition
import LRA.VolumeI.Operations.Laws.Inverse.Definition

namespace LRA.Operation

universe u v

section EndofunctionComposition

/--
**[Theorem — EndofunctionCompositionAssociative]**

Endofunction composition is associative.

Logical form:

```lean
theorem EndofunctionCompositionAssociative (Carrier : Type u) :
    LRA.Operation.Laws.Associative.Associative
      (EndofunctionComposition Carrier)
```
-/
theorem EndofunctionCompositionAssociative (Carrier : Type u) :
    LRA.Operation.Laws.Associative.Associative
      (EndofunctionComposition Carrier) := by
  sorry

/--
**[Theorem — EndofunctionCompositionIdentity]**

The identity map is a two-sided identity for endofunction composition.

Logical form:

```lean
theorem EndofunctionCompositionIdentity (Carrier : Type u) :
    LRA.Operation.Laws.Identity.TwoSidedIdentity
      (EndofunctionComposition Carrier)
      (EndofunctionIdentity Carrier)
```
-/
theorem EndofunctionCompositionIdentity (Carrier : Type u) :
    LRA.Operation.Laws.Identity.TwoSidedIdentity
      (EndofunctionComposition Carrier)
      (EndofunctionIdentity Carrier) := by
  sorry

/--
**[Theorem — BijectiveEndofunctionHasCompositionInverse]**

A bijective endofunction has a two-sided inverse element under endofunction
composition.

Logical form:

```lean
theorem BijectiveEndofunctionHasCompositionInverse
    {Carrier : Type u}
    (map : Carrier -> Carrier)
    (bijective : LRA.Function.Bijective.Bijective map) :
    exists inverse : Carrier -> Carrier,
      EndofunctionComposition Carrier inverse map = EndofunctionIdentity Carrier /\
        EndofunctionComposition Carrier map inverse = EndofunctionIdentity Carrier
```
-/
theorem BijectiveEndofunctionHasCompositionInverse
    {Carrier : Type u}
    (map : Carrier -> Carrier)
    (bijective : LRA.Function.Bijective.Bijective map) :
    exists inverse : Carrier -> Carrier,
      EndofunctionComposition Carrier inverse map = EndofunctionIdentity Carrier /\
        EndofunctionComposition Carrier map inverse = EndofunctionIdentity Carrier := by
  sorry

end EndofunctionComposition

section PointwiseOperations

variable {Domain : Type u} {Codomain : Type v}

/--
**[Theorem — PointwiseAssociative]**

Associativity transfers pointwise to function spaces.

Logical form:

```lean
theorem PointwiseAssociative
    (operation : BinaryEndoOperation Codomain)
    (associative :
      LRA.Operation.Laws.Associative.Associative operation) :
    LRA.Operation.Laws.Associative.Associative
      (PointwiseBinaryOperation (Domain
```
-/
theorem PointwiseAssociative
    (operation : BinaryEndoOperation Codomain)
    (associative :
      LRA.Operation.Laws.Associative.Associative operation) :
    LRA.Operation.Laws.Associative.Associative
      (PointwiseBinaryOperation (Domain := Domain) operation) := by
  sorry

/--
**[Theorem — PointwiseTwoSidedIdentity]**

Two-sided identity laws transfer pointwise to function spaces.

Logical form:

```lean
theorem PointwiseTwoSidedIdentity
    (operation : BinaryEndoOperation Codomain)
    (identity : Codomain)
    (identityLaw :
      LRA.Operation.Laws.Identity.TwoSidedIdentity operation identity) :
    LRA.Operation.Laws.Identity.TwoSidedIdentity
      (PointwiseBinaryOperation (Domain
```
-/
theorem PointwiseTwoSidedIdentity
    (operation : BinaryEndoOperation Codomain)
    (identity : Codomain)
    (identityLaw :
      LRA.Operation.Laws.Identity.TwoSidedIdentity operation identity) :
    LRA.Operation.Laws.Identity.TwoSidedIdentity
      (PointwiseBinaryOperation (Domain := Domain) operation)
      (fun _input : Domain => identity) := by
  sorry

/--
**[Theorem — PointwiseTwoSidedInverse]**

Two-sided inverse laws transfer pointwise to function spaces.

Logical form:

```lean
theorem PointwiseTwoSidedInverse
    (operation : BinaryEndoOperation Codomain)
    (identity : Codomain)
    (inverse : UnaryEndoOperation Codomain)
    (inverseLaw :
      LRA.Operation.Laws.Inverse.TwoSidedInverse
        operation identity inverse) :
    LRA.Operation.Laws.Inverse.TwoSidedInverse
      (PointwiseBinaryOperation (Domain
```
-/
theorem PointwiseTwoSidedInverse
    (operation : BinaryEndoOperation Codomain)
    (identity : Codomain)
    (inverse : UnaryEndoOperation Codomain)
    (inverseLaw :
      LRA.Operation.Laws.Inverse.TwoSidedInverse
        operation identity inverse) :
    LRA.Operation.Laws.Inverse.TwoSidedInverse
      (PointwiseBinaryOperation (Domain := Domain) operation)
      (fun _input : Domain => identity)
      (PointwiseUnaryOperation (Domain := Domain) inverse) := by
  sorry

end PointwiseOperations

end LRA.Operation
