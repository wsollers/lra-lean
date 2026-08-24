import LRA.Logic.Model.Comparison.ModelEmbedding

namespace LRA.Logic.FirstOrder

/--
`ModelIsomorphism` TODO

Predicate logic:

  structure ModelIsomorphism {S : Signature} (M₁ M₂ : Model S) extends
    ModelEmbedding M₁ M₂ where
  surjective : Function.Surjective toFun

Predicate logic (unfolded):

  structure ModelIsomorphism {S : Signature} (M₁ M₂ : Model S) extends
    ModelEmbedding M₁ M₂ where
  surjective : Function.Surjective toFun (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure ModelIsomorphism {S : Signature} (M₁ M₂ : Model S) extends
    ModelEmbedding M₁ M₂ where
  surjective : Function.Surjective toFun
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
structure ModelIsomorphism {S : Signature} (M₁ M₂ : Model S) extends
    ModelEmbedding M₁ M₂ where
  surjective : Function.Surjective toFun

/--
`ModelIsomorphism.bijective` TODO

Predicate logic:

  Function.Bijective iso.toFun

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {M₁ : LRA.Logic.FirstOrder.Model S} {M₂ : LRA.Logic.FirstOrder.Model S} (iso : LRA.Logic.FirstOrder.ModelIsomorphism M₁ M₂), (∀ ⦃a₁ a₂ : M₁.1⦄, iso.toModelEmbedding.1 a₁ = iso.toModelEmbedding.1 a₂ → a₁ = a₂ ∧ ∀ (b : M₂.1), Exists fun a => iso.toModelEmbedding.1 a = b)

Logical form (Lean):

```lean
theorem ModelIsomorphism.bijective
    {S : Signature} {M₁ M₂ : Model S} (iso : ModelIsomorphism M₁ M₂) :
    Function.Bijective iso.toFun
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
theorem ModelIsomorphism.bijective
    {S : Signature} {M₁ M₂ : Model S} (iso : ModelIsomorphism M₁ M₂) :
    Function.Bijective iso.toFun :=
  ⟨iso.injective, iso.surjective⟩

end LRA.Logic.FirstOrder
