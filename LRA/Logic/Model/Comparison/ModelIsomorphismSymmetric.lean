import Mathlib.Logic.Equiv.Basic
import LRA.Logic.Model.Comparison.ModelIsomorphism

namespace LRA.Logic.FirstOrder

/--
`ModelIsomorphism.toEquiv` TODO

Predicate logic:

  noncomputable def ModelIsomorphism.toEquiv
    {S : Signature} {M₁ M₂ : Model S} (iso : ModelIsomorphism M₁ M₂) :
    M₁.Domain ≃ M₂.Domain :=
  Equiv.ofBijective iso.toFun iso.bijective

Predicate logic (unfolded):

  noncomputable def ModelIsomorphism.toEquiv
    {S : Signature} {M₁ M₂ : Model S} (iso : ModelIsomorphism M₁ M₂) :
    M₁.Domain ≃ M₂.Domain :=
  Equiv.ofBijective iso.toFun iso.bijective (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def ModelIsomorphism.toEquiv
    {S : Signature} {M₁ M₂ : Model S} (iso : ModelIsomorphism M₁ M₂) :
    M₁.Domain ≃ M₂.Domain :=
  Equiv.ofBijective iso.toFun iso.bijective
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable def ModelIsomorphism.toEquiv
    {S : Signature} {M₁ M₂ : Model S} (iso : ModelIsomorphism M₁ M₂) :
    M₁.Domain ≃ M₂.Domain :=
  Equiv.ofBijective iso.toFun iso.bijective

/--
`ModelIsomorphism.toEquiv_apply` TODO

Predicate logic:

  (∀ x ∈ M₁.Domain), iso.toEquiv x = iso.toFun x

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {M₁ : LRA.Logic.FirstOrder.Model S} {M₂ : LRA.Logic.FirstOrder.Model S} (iso : LRA.Logic.FirstOrder.ModelIsomorphism M₁ M₂) (x : M₁.1), EquivLike.toFunLike.1 { toFun := iso.toModelEmbedding.1, invFun := fun b => (Classical.indefiniteDescription (fun x => iso.toFun x = b)⋯).1, left_inv := ⋯, right_inv := ⋯ } x = iso.toModelEmbedding.1 x

Logical form (Lean):

```lean
theorem ModelIsomorphism.toEquiv_apply
    {S : Signature} {M₁ M₂ : Model S} (iso : ModelIsomorphism M₁ M₂) (x : M₁.Domain) :
    iso.toEquiv x = iso.toFun x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem ModelIsomorphism.toEquiv_apply
    {S : Signature} {M₁ M₂ : Model S} (iso : ModelIsomorphism M₁ M₂) (x : M₁.Domain) :
    iso.toEquiv x = iso.toFun x := by
  sorry
/--
`ModelIsomorphism.inverseEmbedding` TODO

Predicate logic:

  noncomputable def ModelIsomorphism.inverseEmbedding
    {S : Signature} {M₁ M₂ : Model S} (iso : ModelIsomorphism M₁ M₂) :
    ModelEmbedding M₂ M₁ where
  toFun

Predicate logic (unfolded):

  noncomputable def ModelIsomorphism.inverseEmbedding
    {S : Signature} {M₁ M₂ : Model S} (iso : ModelIsomorphism M₁ M₂) :
    ModelEmbedding M₂ M₁ where
  toFun (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def ModelIsomorphism.inverseEmbedding
    {S : Signature} {M₁ M₂ : Model S} (iso : ModelIsomorphism M₁ M₂) :
    ModelEmbedding M₂ M₁ where
  toFun
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
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

    rw [← iso.toEquiv_apply] at h

    have heq := congrArg iso.toEquiv.symm h
    rw [iso.toEquiv.symm_apply_apply] at heq

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

end LRA.Logic.FirstOrder
