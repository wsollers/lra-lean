import LRA.VolumeI.Functions.Composition
import LRA.VolumeI.Functions.IdentityFunction
import LRA.VolumeI.Set.Operations.Comprehension

namespace LRA.VolumeI.Functions

universe u

open LRA.VolumeI.Set.Operations

/-- Preimage of a generic set under a function. -/
def Preimage
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (map : Function domainOperations.Element codomainOperations.Element)
    (subset : codomainOperations.SetObject) :
    domainOperations.SetObject :=
  domainOperations.separation domainOperations.universal
    (fun input => codomainOperations.member (map input) subset)

/-- Alias emphasizing inverse image notation. -/
def InverseImage
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (map : Function domainOperations.Element codomainOperations.Element)
    (subset : codomainOperations.SetObject) :
    domainOperations.SetObject :=
  Preimage domainOperations codomainOperations map subset

/-- The preimage of the whole codomain is the whole domain. -/
theorem PreimageUniversal
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (map : Function domainOperations.Element codomainOperations.Element) :
    Preimage domainOperations codomainOperations map codomainOperations.universal =
      domainOperations.universal := by
  sorry

/-- The preimage of the empty set is empty. -/
theorem PreimageEmpty
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (map : Function domainOperations.Element codomainOperations.Element) :
    Preimage domainOperations codomainOperations map codomainOperations.empty =
      domainOperations.empty := by
  sorry

/-- Preimage preserves binary union. -/
theorem PreimageUnion
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (map : Function domainOperations.Element codomainOperations.Element)
    (Left Right : codomainOperations.SetObject) :
    Preimage domainOperations codomainOperations map
      (codomainOperations.union Left Right) =
      domainOperations.union
        (Preimage domainOperations codomainOperations map Left)
        (Preimage domainOperations codomainOperations map Right) := by
  sorry

/-- Preimage preserves binary intersection. -/
theorem PreimageIntersection
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (map : Function domainOperations.Element codomainOperations.Element)
    (Left Right : codomainOperations.SetObject) :
    Preimage domainOperations codomainOperations map
      (codomainOperations.intersection Left Right) =
      domainOperations.intersection
        (Preimage domainOperations codomainOperations map Left)
        (Preimage domainOperations codomainOperations map Right) := by
  sorry

/-- Preimage preserves set difference. -/
theorem PreimageDifference
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (map : Function domainOperations.Element codomainOperations.Element)
    (Left Right : codomainOperations.SetObject) :
    Preimage domainOperations codomainOperations map
      (codomainOperations.difference Left Right) =
      domainOperations.difference
        (Preimage domainOperations codomainOperations map Left)
        (Preimage domainOperations codomainOperations map Right) := by
  sorry

/-- Preimage preserves complement. -/
theorem PreimageComplement
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (map : Function domainOperations.Element codomainOperations.Element)
    (Target : codomainOperations.SetObject) :
    Preimage domainOperations codomainOperations map
      (codomainOperations.complement Target) =
      domainOperations.complement
        (Preimage domainOperations codomainOperations map Target) := by
  sorry

/-- Preimage preserves symmetric difference. -/
theorem PreimageSymmetricDifference
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (map : Function domainOperations.Element codomainOperations.Element)
    (Left Right : codomainOperations.SetObject) :
    Preimage domainOperations codomainOperations map
      (codomainOperations.symmetricDifference Left Right) =
      domainOperations.symmetricDifference
        (Preimage domainOperations codomainOperations map Left)
        (Preimage domainOperations codomainOperations map Right) := by
  sorry

/-- Preimage under the identity function is the original set. -/
theorem PreimageIdentity
    (operations : BooleanComprehensionSetOperations.{u, u})
    (Subset : operations.SetObject) :
    Preimage operations operations (IdentityFunction operations.Element) Subset =
      Subset := by
  sorry

/-- Pulling back along a composite is the same as pulling back in two steps. -/
theorem PreimageComposition
    (firstOperations secondOperations thirdOperations :
      BooleanComprehensionSetOperations.{u, u})
    (secondMap : Function secondOperations.Element thirdOperations.Element)
    (firstMap : Function firstOperations.Element secondOperations.Element)
    (Target : thirdOperations.SetObject) :
    Preimage firstOperations thirdOperations
      (Composition secondMap firstMap) Target =
      Preimage firstOperations secondOperations firstMap
        (Preimage secondOperations thirdOperations secondMap Target) := by
  sorry

/-- A preimage is a subset of the domain universe. -/
theorem PreimageSubsetUniversal
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (map : Function domainOperations.Element codomainOperations.Element)
    (Target : codomainOperations.SetObject) :
    domainOperations.subset
      (Preimage domainOperations codomainOperations map Target)
      domainOperations.universal := by
  sorry

/-- Preimage is monotone with respect to subset inclusion. -/
theorem PreimageMonotone
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (map : Function domainOperations.Element codomainOperations.Element)
    (Left Right : codomainOperations.SetObject)
    (LeftSubsetRight : codomainOperations.subset Left Right) :
    domainOperations.subset
      (Preimage domainOperations codomainOperations map Left)
      (Preimage domainOperations codomainOperations map Right) := by
  sorry

/-- Pointwise equal functions have equal preimages of every target set. -/
theorem PreimageCongrFunction
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (leftMap rightMap :
      Function domainOperations.Element codomainOperations.Element)
    (Target : codomainOperations.SetObject)
    (sameValues : ∀ input, leftMap input = rightMap input) :
    Preimage domainOperations codomainOperations leftMap Target =
      Preimage domainOperations codomainOperations rightMap Target := by
  sorry

/-- Equal target sets have equal preimages. -/
theorem PreimageCongrSet
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (map : Function domainOperations.Element codomainOperations.Element)
    (Left Right : codomainOperations.SetObject)
    (sameSet : Left = Right) :
    Preimage domainOperations codomainOperations map Left =
      Preimage domainOperations codomainOperations map Right := by
  sorry

/-- Preimage under a composite is monotone with respect to the target set. -/
theorem PreimageCompositionMonotone
    (firstOperations secondOperations thirdOperations :
      BooleanComprehensionSetOperations.{u, u})
    (secondMap : Function secondOperations.Element thirdOperations.Element)
    (firstMap : Function firstOperations.Element secondOperations.Element)
    (Left Right : thirdOperations.SetObject)
    (LeftSubsetRight : thirdOperations.subset Left Right) :
    firstOperations.subset
      (Preimage firstOperations thirdOperations
        (Composition secondMap firstMap) Left)
      (Preimage firstOperations thirdOperations
        (Composition secondMap firstMap) Right) := by
  sorry

/-- A mixed preimage drill combining difference and union. -/
theorem PreimageDifferenceUnion
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (map : Function domainOperations.Element codomainOperations.Element)
    (Left Middle Right : codomainOperations.SetObject) :
    Preimage domainOperations codomainOperations map
      (codomainOperations.difference Left
        (codomainOperations.union Middle Right)) =
      domainOperations.difference
        (Preimage domainOperations codomainOperations map Left)
        (domainOperations.union
          (Preimage domainOperations codomainOperations map Middle)
          (Preimage domainOperations codomainOperations map Right)) := by
  sorry

end LRA.VolumeI.Functions
