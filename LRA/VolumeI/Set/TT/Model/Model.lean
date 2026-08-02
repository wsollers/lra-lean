import LRA.VolumeI.Set.Model
import LRA.VolumeI.Set.TT.Public

namespace LRA.VolumeI.Set.TTSet

/-!
Model-theory-facing interpretation of the public set language in predicate
sets.
-/

/-- Predicate sets as a two-sorted model of the public set language. -/
def setModel (Alpha : LRA.VolumeI.Set.LRACarrier) :
    LRA.VolumeI.Set.SetModel where
  languageModel := publicOperations Alpha
  laws := publicOperationLaws Alpha

end LRA.VolumeI.Set.TTSet
