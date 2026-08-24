import LRA.UniversalAlgebra.Homomorphism.Definition

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u

/--
`Congruence` TODO

Predicate logic:

  structure Congruence {S : Signature} (M : Model.{u} S) where
  rel : M.Domain → M.Domain → Prop
  iseqv : Equivalence rel
  compatible :
    ∀ (functionSymbol : S.FunctionSymbol)
      (leftArguments rightArguments :
        Fin (S.functionArity functionSymbol) → M.Domain),
      (∀ i, rel (leftArguments i) (rightArguments i)) →
        rel (M.interpretFunction functionSymbol leftArguments)
          (M.interpretFunction functionSymbol rightArguments)

Predicate logic (unfolded):

  structure Congruence {S : Signature} (M : Model.{u} S) where
  rel : M.Domain → M.Domain → Prop
  iseqv : Equivalence rel
  compatible :
    ∀ (functionSymbol : S.FunctionSymbol)
      (leftArguments rightArguments :
        Fin (S.functionArity functionSymbol) → M.Domain),
      (∀ i, rel (leftArguments i) (rightArguments i)) →
        rel (M.interpretFunction functionSymbol leftArguments)
          (M.interpretFunction functionSymbol rightArguments) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Congruence {S : Signature} (M : Model.{u} S) where
  rel : M.Domain → M.Domain → Prop
  iseqv : Equivalence rel
  compatible :
    ∀ (functionSymbol : S.FunctionSymbol)
      (leftArguments rightArguments :
        Fin (S.functionArity functionSymbol) → M.Domain),
      (∀ i, rel (leftArguments i) (rightArguments i)) →
        rel (M.interpretFunction functionSymbol leftArguments)
          (M.interpretFunction functionSymbol rightArguments)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure Congruence {S : Signature} (M : Model.{u} S) where
  rel : M.Domain → M.Domain → Prop
  iseqv : Equivalence rel
  compatible :
    ∀ (functionSymbol : S.FunctionSymbol)
      (leftArguments rightArguments :
        Fin (S.functionArity functionSymbol) → M.Domain),
      (∀ i, rel (leftArguments i) (rightArguments i)) →
        rel (M.interpretFunction functionSymbol leftArguments)
          (M.interpretFunction functionSymbol rightArguments)

/--
`quotientModel` TODO

Predicate logic:

  noncomputable def quotientModel {S : Signature} {M : Model.{u} S}
    (congruence : Congruence M) : Model.{u} S where
  Domain := Quot congruence.rel
  domainNonempty := ⟨Quot.mk _ (Classical.arbitrary M.Domain)⟩
  interpretFunction := fun functionSymbol arguments =>
    Quot.mk _ (M.interpretFunction functionSymbol
      (fun i => Classical.choose (Quot.exists_rep (arguments i))))
  interpretRelation := fun relationSymbol arguments =>
    M.interpretRelation relationSymbol
      (fun i => Classical.choose (Quot.exists_rep (arguments i)))
  interpretConstant := fun constantSymbol =>
    Quot.mk _ (M.interpretConstant constantSymbol)

Predicate logic (unfolded):

  noncomputable def quotientModel {S : Signature} {M : Model.{u} S}
    (congruence : Congruence M) : Model.{u} S where
  Domain := Quot congruence.rel
  domainNonempty := ⟨Quot.mk _ (Classical.arbitrary M.Domain)⟩
  interpretFunction := fun functionSymbol arguments =>
    Quot.mk _ (M.interpretFunction functionSymbol
      (fun i => Classical.choose (Quot.exists_rep (arguments i))))
  interpretRelation := fun relationSymbol arguments =>
    M.interpretRelation relationSymbol
      (fun i => Classical.choose (Quot.exists_rep (arguments i)))
  interpretConstant := fun constantSymbol =>
    Quot.mk _ (M.interpretConstant constantSymbol) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotientModel {S : Signature} {M : Model.{u} S}
    (congruence : Congruence M) : Model.{u} S where
  Domain := Quot congruence.rel
  domainNonempty := ⟨Quot.mk _ (Classical.arbitrary M.Domain)⟩
  interpretFunction := fun functionSymbol arguments =>
    Quot.mk _ (M.interpretFunction functionSymbol
      (fun i => Classical.choose (Quot.exists_rep (arguments i))))
  interpretRelation := fun relationSymbol arguments =>
    M.interpretRelation relationSymbol
      (fun i => Classical.choose (Quot.exists_rep (arguments i)))
  interpretConstant := fun constantSymbol =>
    Quot.mk _ (M.interpretConstant constantSymbol)
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
noncomputable def quotientModel {S : Signature} {M : Model.{u} S}
    (congruence : Congruence M) : Model.{u} S where
  Domain := Quot congruence.rel
  domainNonempty := ⟨Quot.mk _ (Classical.arbitrary M.Domain)⟩
  interpretFunction := fun functionSymbol arguments =>
    Quot.mk _ (M.interpretFunction functionSymbol
      (fun i => Classical.choose (Quot.exists_rep (arguments i))))
  interpretRelation := fun relationSymbol arguments =>
    M.interpretRelation relationSymbol
      (fun i => Classical.choose (Quot.exists_rep (arguments i)))
  interpretConstant := fun constantSymbol =>
    Quot.mk _ (M.interpretConstant constantSymbol)

/--
`quotientProjectionIsHomomorphism` TODO

Predicate logic:

  ∃ projection ∈ Homomorphism M (quotientModel congruence), ∀ element, projection.map element = Quot.mk _ element

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {M : LRA.Logic.FirstOrder.Model S} (congruence : LRA.UniversalAlgebra.Congruence M), Exists fun projection => ∀ (element : M.1), projection.1 element = Quot.mk congruence.1 element

Logical form (Lean):

```lean
theorem quotientProjectionIsHomomorphism {S : Signature}
    {M : Model.{u} S} (congruence : Congruence M) :
    ∃ projection : Homomorphism M (quotientModel congruence),
      ∀ element, projection.map element = Quot.mk _ element
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem quotientProjectionIsHomomorphism {S : Signature}
    {M : Model.{u} S} (congruence : Congruence M) :
    ∃ projection : Homomorphism M (quotientModel congruence),
      ∀ element, projection.map element = Quot.mk _ element := by
  sorry

end LRA.UniversalAlgebra
