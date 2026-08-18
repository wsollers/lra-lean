import LRA.UniversalAlgebra.Homomorphism.Definition

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u

/-!
Volume I label: universal-algebra-quotient
Lean module: LRA.UniversalAlgebra.QuotientStructure
Verification status: definitions checked; projection-homomorphism
proof pending

Congruences and quotient algebras. A congruence is an equivalence
relation compatible with every operation — exactly the relations by
which one may divide an algebra and still have an algebra. The
quotient's operations are computed on chosen representatives
(`Classical.choose` on `Quot.exists_rep`); the *compatibility* field
is what makes the choice invisible, and the pending
`quotientProjectionIsHomomorphism` is precisely the statement that it
is. Volume II's constructions by quotient — Mendelson's integers, the
quotient-of-fractions rationals — are instances of this shape.
-/

/-- A congruence on an algebra: an equivalence relation compatible
with every operation.

Logical form:

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

/-- The quotient algebra by a congruence: elements are `Quot` classes,
operations are computed on chosen representatives. Compatibility (used
in the pending projection theorem) is what makes the choices
harmless.

Logical form:

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

/-- The canonical projection onto the quotient is a homomorphism —
the statement that representative choice is invisible, via
compatibility.

Logical form:

```lean
theorem quotientProjectionIsHomomorphism {S : Signature}
    {M : Model.{u} S} (congruence : Congruence M) :
    ∃ projection : Homomorphism M (quotientModel congruence),
      ∀ element, projection.map element = Quot.mk _ element
```
-/
theorem quotientProjectionIsHomomorphism {S : Signature}
    {M : Model.{u} S} (congruence : Congruence M) :
    ∃ projection : Homomorphism M (quotientModel congruence),
      ∀ element, projection.map element = Quot.mk _ element := by
  sorry

end LRA.UniversalAlgebra
