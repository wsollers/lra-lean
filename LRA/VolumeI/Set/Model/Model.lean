import LRA.VolumeI.Set.Operations.Public

universe u v

namespace LRA.VolumeI.Set

/-!
Generic set-language models.

This is the model-theory-facing wrapper around the public set-operation
language. It is two-sorted: `Element` is the sort of things contained, and
`SetObject` is the sort of sets containing them. ZFC specializes this by taking
both sorts to be the same type.
-/

/-- A two-sorted model of the public finite set-operation language. -/
abbrev SetLanguageModel := Operations.PublicSetOperations

/-- Laws saying the interpreted set-language symbols have their public meaning. -/
abbrev SetLanguageLaws := Operations.PublicSetOperationLaws

/-- A model bundled with the public laws it satisfies. -/
structure SetModel where
  languageModel : SetLanguageModel.{u, v}
  laws : SetLanguageLaws languageModel

end LRA.VolumeI.Set
