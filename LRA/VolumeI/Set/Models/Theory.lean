import LRA.VolumeI.Set.Models.Structure
import LRA.VolumeI.Set.Theory

universe u v

namespace LRA.VolumeI.Set.Models

/-!
Theory package for generic set models.
-/

/-- The generic set theory is the public law package for a set structure. -/
abbrev Theory (setStructure : Structure.{u, v}) : Prop :=
  LRA.VolumeI.Set.SetInterfaceLaws setStructure

/-- A model satisfies generic set theory exactly when it carries the law witness. -/
theorem ModelSatisfiesTheory (model : Model.{u, v}) :
    Theory model.languageModel := by
  exact model.laws

end LRA.VolumeI.Set.Models
