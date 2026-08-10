import LRA.VolumeI.Relations.Basic.CoreProperties
import LRA.VolumeI.Set.Public.Interface

namespace LRA.VolumeI.Relations

universe u

/-- A minimal element of a subset with respect to an endorelation. -/
def MinimalElement (interface : LRA.VolumeI.Set.SetInterface.{u, u})
    (relation : Endorelation interface.Element)
    (subset : interface.SetObject)
    (minimum : interface.Element) : Prop :=
  interface.member minimum subset /\
    forall element,
      interface.member element subset ->
        Not (relation element minimum)

/-- Well-foundedness of an endorelation in the omnibus subset-minimal sense. -/
def WellFounded (interface : LRA.VolumeI.Set.SetInterface.{u, u})
    (relation : Endorelation interface.Element) : Prop :=
  forall subset : interface.SetObject,
    (exists element, interface.member element subset) ->
      exists minimum, MinimalElement interface relation subset minimum

end LRA.VolumeI.Relations
