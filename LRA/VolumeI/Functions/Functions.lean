import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.VolumeI.Functions

universe u v

/-- A function from one carrier to another. -/
abbrev Function (Domain Codomain : Type u) := Domain -> Codomain

end LRA.VolumeI.Functions
