import LRA.NumberSystems.NaturalNumbers.Constructions.WholeNumbers.Operations

namespace LRA.NumberSystems.NaturalNumbers.Constructions.WholeNumbers

open LRA.NumberSystems.NaturalNumbers.Constructions.Landau

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable (natural_data : NaturalArithmeticForWholeNumbers Element SetObject)

                                                                        
theorem natural_embedding_preserves_structure :
    (∀ value,
      naturalEmbedding natural_data (natural_data.model.successor value) =
        successor natural_data (naturalEmbedding natural_data value)) ∧
    (∀ first second,
      naturalEmbedding natural_data
          (LandauAddition
            natural_data.model
            first
            second) =
        addition natural_data
          (naturalEmbedding natural_data first)
          (naturalEmbedding natural_data second)) ∧
    (∀ first second,
      naturalEmbedding natural_data
          (LandauMultiplication
            natural_data.model
            first
            second) =
        multiplication natural_data
          (naturalEmbedding natural_data first)
          (naturalEmbedding natural_data second)) ∧
    (∀ first second,
      strictOrder natural_data
          (naturalEmbedding natural_data first)
          (naturalEmbedding natural_data second) ↔
        natural_data.strictOrder first second) := by
  sorry

end LRA.NumberSystems.NaturalNumbers.Constructions.WholeNumbers
