import LRA.VolumeI.Logic.Model.Comparison.ModelIsomorphism

namespace LRA.VolumeI.Logic.FirstOrder

/-!
Automorphisms.

An automorphism of a model `M` is a model isomorphism from `M` to itself --
a bijective structure-preserving self-map. This is not a new notion
requiring its own fields: it is the special case of `ModelIsomorphism M₁ M₂`
where `M₂` is `M₁` itself, so `Automorphism` is declared as an `abbrev`
rather than a new `structure`, keeping the identification definitional
rather than merely provable.
-/

/-- An automorphism of `M`: a model isomorphism from `M` to itself. -/
abbrev Automorphism {S : Signature} (M : Model S) : Type :=
  ModelIsomorphism M M

/-- The identity map on any model is always an automorphism: it is
trivially bijective and trivially preserves every function, constant, and
relation symbol, since it changes nothing. This is the automorphism every
model has "for free", regardless of what its domain or interpretations are
-- the analogue of every group having at least the identity automorphism. -/
def Automorphism.identity {S : Signature} (M : Model S) : Automorphism M where
  toFun := id
  injective := Function.injective_id
  preservesFunction _ _ := rfl
  preservesConstant _ := rfl
  preservesRelation _ _ := Iff.rfl
  surjective := Function.surjective_id

end LRA.VolumeI.Logic.FirstOrder
