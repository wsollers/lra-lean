import LRA.VolumeI.Set.Public.Interface

universe u v

namespace LRA.VolumeI.Set.Models

/-!
Model-theoretic language for generic set objects.

At this level the language is represented by the public set interface. A later
pass can lower this into the project's first-order syntax when we want a fully
syntactic set theory.
-/

/-- The semantic language of generic set operations. -/
abbrev Language := LRA.VolumeI.Set.SetInterface.{u, v}

end LRA.VolumeI.Set.Models
