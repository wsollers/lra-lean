import LRA.Operation.Definition
import LRA.Function.Properties.Definition
import LRA.Operation.Laws.Associative.Definition
import LRA.Operation.Laws.Identity.Definition
import LRA.Operation.Laws.Inverse.Definition

namespace LRA.Operation

universe u v

section EndomapComposition

theorem EndomapCompositionAssociative (Carrier : Type u) :
    LRA.Operation.Laws.Associative.Associative
      (EndomapComposition Carrier) := by
  sorry

theorem EndomapCompositionIdentity (Carrier : Type u) :
    LRA.Operation.Laws.Identity.TwoSidedIdentity
      (EndomapComposition Carrier)
      (EndomapIdentity Carrier) := by
  sorry

theorem BijectiveEndomapHasCompositionInverse
    {Carrier : Type u}
    (map : Carrier → Carrier)
    (bijective : LRA.Function.Bijective map) :
    ∃ inverse : Carrier → Carrier,
      EndomapComposition Carrier inverse map = EndomapIdentity Carrier ∧
        EndomapComposition Carrier map inverse = EndomapIdentity Carrier := by
  sorry

end EndomapComposition

section PointwiseOperations

variable {Domain : Type u} {Codomain : Type v}

theorem PointwiseAssociative
    (operation : BinaryEndoOperation Codomain)
    (associative :
      LRA.Operation.Laws.Associative.Associative operation) :
    LRA.Operation.Laws.Associative.Associative
      (PointwiseBinaryOperation (Domain := Domain) operation) := by
  sorry

theorem PointwiseTwoSidedIdentity
    (operation : BinaryEndoOperation Codomain)
    (identity : Codomain)
    (identityLaw :
      LRA.Operation.Laws.Identity.TwoSidedIdentity operation identity) :
    LRA.Operation.Laws.Identity.TwoSidedIdentity
      (PointwiseBinaryOperation (Domain := Domain) operation)
      (fun _input : Domain => identity) := by
  sorry

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
