import LRA.VolumeI.Operations.Definition
import LRA.VolumeI.Map.Bijective.Definition
import LRA.VolumeI.Operations.Laws.Associative.Definition
import LRA.VolumeI.Operations.Laws.Identity.Definition
import LRA.VolumeI.Operations.Laws.Inverse.Definition

namespace LRA.Operation

universe u v

section EndomapComposition

/--
**[Theorem — EndomapCompositionAssociative]**

Endomap composition is associative.

Logical form:

```lean
theorem EndomapCompositionAssociative (Carrier : Type u) :
    LRA.Operation.Laws.Associative.Associative
      (EndomapComposition Carrier)
```
-/
theorem EndomapCompositionAssociative (Carrier : Type u) :
    LRA.Operation.Laws.Associative.Associative
      (EndomapComposition Carrier) := by
  sorry

/--
**[Theorem — EndomapCompositionIdentity]**

The identity map is a two-sided identity for endomap composition.

Logical form:

```lean
theorem EndomapCompositionIdentity (Carrier : Type u) :
    LRA.Operation.Laws.Identity.TwoSidedIdentity
      (EndomapComposition Carrier)
      (EndomapIdentity Carrier)
```
-/
theorem EndomapCompositionIdentity (Carrier : Type u) :
    LRA.Operation.Laws.Identity.TwoSidedIdentity
      (EndomapComposition Carrier)
      (EndomapIdentity Carrier) := by
  sorry

/--
**[Theorem — BijectiveEndomapHasCompositionInverse]**

A bijective endomap has a two-sided inverse element under endomap
composition.

Logical form:

```lean
theorem BijectiveEndomapHasCompositionInverse
    {Carrier : Type u}
    (map : Carrier -> Carrier)
    (bijective : LRA.Map.Bijective.Bijective map) :
    exists inverse : Carrier -> Carrier,
      EndomapComposition Carrier inverse map = EndomapIdentity Carrier /\
        EndomapComposition Carrier map inverse = EndomapIdentity Carrier
```
-/
theorem BijectiveEndomapHasCompositionInverse
    {Carrier : Type u}
    (map : Carrier -> Carrier)
    (bijective : LRA.Map.Bijective.Bijective map) :
    exists inverse : Carrier -> Carrier,
      EndomapComposition Carrier inverse map = EndomapIdentity Carrier /\
        EndomapComposition Carrier map inverse = EndomapIdentity Carrier := by
  sorry

end EndomapComposition

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
