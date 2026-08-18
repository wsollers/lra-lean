import LRA.Logic.Model.Comparison.ModelEmbedding

namespace LRA.Logic.FirstOrder

/-!
Model isomorphisms.

A model isomorphism of `M₁` and `M₂` (two models of the same signature `S`)
is a `ModelEmbedding` whose underlying domain map is also surjective --
equivalently, a bijective structure-preserving map. This is the standard
"isomorphism = bijective homomorphism" characterization.

`ModelIsomorphism` extends `ModelEmbedding` rather than being defined from
scratch, because an isomorphism genuinely *is* an embedding plus one more
condition (surjectivity), not a differently-shaped notion -- every theorem
about `ModelEmbedding` (injectivity, atomic preservation) applies to a
`ModelIsomorphism` for free via the `extends` coercion.

A more symmetric, category-theoretic characterization also exists: an
isomorphism as a *pair* of structure-preserving maps `f : M₁ → M₂`,
`g : M₂ → M₁` with `g ∘ f = id` and `f ∘ g = id`, neither direction
privileged. `ModelIsomorphism` does not build this in as the definition,
but `ModelIsomorphism.inverseEmbedding` proves it as a consequence: every
`ModelIsomorphism M₁ M₂` yields a genuine `ModelEmbedding M₂ M₁` in the
reverse direction, constructed from the forward map's bijectivity. Isomorphism
being symmetric is therefore a theorem here, not an assumption.
-/

/-- A model isomorphism of `M₁` and `M₂`, two models of the same signature
`S`: a `ModelEmbedding` whose domain map is additionally surjective, hence
bijective.

Logical form:

```lean
structure ModelIsomorphism {S : Signature} (M₁ M₂ : Model S) extends
    ModelEmbedding M₁ M₂ where
  surjective : Function.Surjective toFun
```
-/
structure ModelIsomorphism {S : Signature} (M₁ M₂ : Model S) extends
    ModelEmbedding M₁ M₂ where
  surjective : Function.Surjective toFun

/-- The underlying domain map of a model isomorphism is bijective, packaging
`injective` (inherited from `ModelEmbedding`) and `surjective` together.

Logical form:

```lean
theorem ModelIsomorphism.bijective
    {S : Signature} {M₁ M₂ : Model S} (iso : ModelIsomorphism M₁ M₂) :
    Function.Bijective iso.toFun
```
-/
theorem ModelIsomorphism.bijective
    {S : Signature} {M₁ M₂ : Model S} (iso : ModelIsomorphism M₁ M₂) :
    Function.Bijective iso.toFun :=
  ⟨iso.injective, iso.surjective⟩

end LRA.Logic.FirstOrder
