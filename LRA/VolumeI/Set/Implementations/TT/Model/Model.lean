import LRA.VolumeI.Set.Models
import LRA.VolumeI.Set.Implementations.TT.Public

namespace LRA.VolumeI.Set.TTSet

/-!
Model-theory-facing interpretation of the public set language in predicate
sets.
-/

/-- Predicate sets as a two-sorted model of the public set language. -/
def setModel (Alpha : LRA.VolumeI.Set.TTCarrier) :
    LRA.VolumeI.Set.Models.Model where
  languageModel := publicOperations Alpha
  laws := by
    sorry

end LRA.VolumeI.Set.TTSet
