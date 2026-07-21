import Mathlib.Logic.Equiv.Basic
import LRA.VolumeI.Logic.Model.Comparison.ModelIsomorphism

namespace LRA.VolumeI.Logic.FirstOrder

/-!
Isomorphism is symmetric.

`ModelIsomorphism` is defined as a bijective `ModelEmbedding` in one
direction (`M₁ → M₂`). This file proves the reverse direction is also a
genuine `ModelEmbedding` (`M₂ → M₁`), constructed from the forward map's
inverse. Together with `ModelIsomorphism.bijective`, this recovers the
symmetric, category-theoretic picture of isomorphism -- a pair of mutually
inverse structure-preserving maps -- as a proved consequence of the
simpler, one-direction bijective-embedding definition, rather than as a
second definition to reconcile with the first.

The inverse function itself comes from `Equiv.ofBijective`, which packages
a bijective function together with a genuine two-sided inverse and the two
cancellation laws (`left_inv`, `right_inv`) needed to transport preservation
facts across the inverse. `Equiv.ofBijective` builds this inverse via
`Classical.choice` (there is no way, in general, to *compute* an inverse
from a bare bijectivity proof), so both `toEquiv` and `inverseEmbedding`
below are marked `noncomputable`.

`iso.toEquiv` and `iso.toFun` are definitionally the same function (`toEquiv`
is built as `Equiv.ofBijective iso.toFun iso.bijective`, whose own `toFun`
field is literally `iso.toFun`), but `rw`/tactics that rewrite along
`Equiv.symm_apply_apply`/`Equiv.apply_symm_apply` need the term on the page
to be syntactically `iso.toEquiv`, not merely something that reduces to it.
`toEquiv_apply` bridges this once, by name, so proofs below rewrite through
it explicitly rather than relying on defeq to paper over the mismatch.
-/

/-- The domain equivalence underlying a model isomorphism: the forward map,
together with the two-sided inverse `Equiv.ofBijective` extracts from its
bijectivity. -/
noncomputable def ModelIsomorphism.toEquiv
    {S : Signature} {M₁ M₂ : Model S} (iso : ModelIsomorphism M₁ M₂) :
    M₁.Domain ≃ M₂.Domain :=
  Equiv.ofBijective iso.toFun iso.bijective

/-- `iso.toEquiv`, applied, is the same as applying `iso.toFun` directly --
true by definition, named so proofs can rewrite one into the other
explicitly. -/
theorem ModelIsomorphism.toEquiv_apply
    {S : Signature} {M₁ M₂ : Model S} (iso : ModelIsomorphism M₁ M₂) (x : M₁.Domain) :
    iso.toEquiv x = iso.toFun x := rfl

/-- Every model isomorphism `M₁ → M₂` yields a model embedding in the
reverse direction, `M₂ → M₁`, via the inverse of the underlying domain
equivalence. This is what makes isomorphism symmetric: neither direction
is privileged, even though `ModelIsomorphism` itself is stated with one
direction as primary. -/
noncomputable def ModelIsomorphism.inverseEmbedding
    {S : Signature} {M₁ M₂ : Model S} (iso : ModelIsomorphism M₁ M₂) :
    ModelEmbedding M₂ M₁ where
  toFun := iso.toEquiv.symm
  injective := iso.toEquiv.symm.injective
  preservesFunction f args := by
    have h := iso.preservesFunction f (fun i => iso.toEquiv.symm (args i))
    have hargs : (fun i => iso.toFun (iso.toEquiv.symm (args i))) = args := by
      funext i
      exact iso.toEquiv.apply_symm_apply (args i)
    rw [hargs] at h
    -- h : iso.toFun (M₁.interpretFunction f ...) = M₂.interpretFunction f args
    rw [← iso.toEquiv_apply] at h
    -- h : iso.toEquiv (M₁.interpretFunction f ...) = M₂.interpretFunction f args
    have heq := congrArg iso.toEquiv.symm h
    rw [iso.toEquiv.symm_apply_apply] at heq
    -- heq : M₁.interpretFunction f ... = iso.toEquiv.symm (M₂.interpretFunction f args)
    -- The goal is the mirror image of `heq`.
    exact heq.symm
  preservesConstant c := by
    have h := iso.preservesConstant c
    rw [← iso.toEquiv_apply] at h
    have heq := congrArg iso.toEquiv.symm h
    rw [iso.toEquiv.symm_apply_apply] at heq
    exact heq.symm
  preservesRelation r args := by
    have h := iso.preservesRelation r (fun i => iso.toEquiv.symm (args i))
    have hargs : (fun i => iso.toFun (iso.toEquiv.symm (args i))) = args := by
      funext i
      exact iso.toEquiv.apply_symm_apply (args i)
    rw [hargs] at h
    exact h.symm

end LRA.VolumeI.Logic.FirstOrder
