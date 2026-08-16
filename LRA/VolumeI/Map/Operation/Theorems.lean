import LRA.VolumeI.Map.Operation.Definition
import LRA.VolumeI.Map.Bijective.Definition
import LRA.VolumeI.Map.Operation.Laws.Associative.Definition
import LRA.VolumeI.Map.Operation.Laws.Identity.Definition
import LRA.VolumeI.Map.Operation.Laws.Inverse.Definition

namespace LRA.Map.Operation

universe u v

section EndomapComposition

/--
Endomap composition is associative.
-/
theorem EndomapCompositionAssociative (Carrier : Type u) :
    LRA.Map.Operation.Laws.Associative.Associative
      (EndomapComposition Carrier) := by
  sorry

/--
The identity map is a two-sided identity for endomap composition.
-/
theorem EndomapCompositionIdentity (Carrier : Type u) :
    LRA.Map.Operation.Laws.Identity.TwoSidedIdentity
      (EndomapComposition Carrier)
      (EndomapIdentity Carrier) := by
  sorry

/--
A bijective endomap has a two-sided inverse element under endomap
composition.
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
Associativity transfers pointwise to function spaces.
-/
theorem PointwiseAssociative
    (operation : BinaryEndoOperation Codomain)
    (associative :
      LRA.Map.Operation.Laws.Associative.Associative operation) :
    LRA.Map.Operation.Laws.Associative.Associative
      (PointwiseBinaryOperation (Domain := Domain) operation) := by
  sorry

/--
Two-sided identity laws transfer pointwise to function spaces.
-/
theorem PointwiseTwoSidedIdentity
    (operation : BinaryEndoOperation Codomain)
    (identity : Codomain)
    (identityLaw :
      LRA.Map.Operation.Laws.Identity.TwoSidedIdentity operation identity) :
    LRA.Map.Operation.Laws.Identity.TwoSidedIdentity
      (PointwiseBinaryOperation (Domain := Domain) operation)
      (fun _input : Domain => identity) := by
  sorry

/--
Two-sided inverse laws transfer pointwise to function spaces.
-/
theorem PointwiseTwoSidedInverse
    (operation : BinaryEndoOperation Codomain)
    (identity : Codomain)
    (inverse : UnaryEndoOperation Codomain)
    (inverseLaw :
      LRA.Map.Operation.Laws.Inverse.TwoSidedInverse
        operation identity inverse) :
    LRA.Map.Operation.Laws.Inverse.TwoSidedInverse
      (PointwiseBinaryOperation (Domain := Domain) operation)
      (fun _input : Domain => identity)
      (PointwiseUnaryOperation (Domain := Domain) inverse) := by
  sorry

end PointwiseOperations

end LRA.Map.Operation
