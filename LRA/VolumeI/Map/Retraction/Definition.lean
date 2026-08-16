import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Retraction

open LRA.Map.Typed

universe u v

/--
A retraction of an inclusion-like map recovers every element of the smaller
domain.
-/
def RetractionOf {Small : Type u} {Large : Type v}
    (retraction : TypedMap Large Small)
    (inclusion : TypedMap Small Large) : Prop :=
  forall input, retraction (inclusion input) = input

end LRA.Map.Retraction
