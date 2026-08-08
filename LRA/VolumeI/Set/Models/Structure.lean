import LRA.VolumeI.Set.Models.Language

universe u v

namespace LRA.VolumeI.Set.Models

/-!
Structures interpreting the generic set language.
-/

/-- A structure interpreting the generic set language. -/
abbrev Structure := Language.{u, v}

/-- A structure together with the public law package it satisfies. -/
structure Model where
  languageModel : Structure.{u, v}
  laws : LRA.VolumeI.Set.SetInterfaceLaws languageModel

end LRA.VolumeI.Set.Models
