import LRA.UniversalAlgebra.KernelCongruence.KernelRelation.Definition
import LRA.UniversalAlgebra.Quotient.Definition
import LRA.UniversalAlgebra.Isomorphism.Definition

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u v

/--
`kernelCongruence` TODO

Predicate logic:

  def kernelCongruence {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N) : Congruence M where
  rel := kernelRelation homomorphism
  iseqv := kernelRelationIsEquivalence homomorphism
  compatible := fun functionSymbol leftArguments rightArguments related => by
    show homomorphism.map _ = homomorphism.map _
    rw [homomorphism.preservesFunction, homomorphism.preservesFunction]
    congr 1
    funext i
    exact related i

Predicate logic (unfolded):

  def kernelCongruence {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N) : Congruence M where
  rel := kernelRelation homomorphism
  iseqv := kernelRelationIsEquivalence homomorphism
  compatible := fun functionSymbol leftArguments rightArguments related => by
    show homomorphism.map _ = homomorphism.map _
    rw [homomorphism.preservesFunction, homomorphism.preservesFunction]
    congr 1
    funext i
    exact related i (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def kernelCongruence {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N) : Congruence M where
  rel := kernelRelation homomorphism
  iseqv := kernelRelationIsEquivalence homomorphism
  compatible := fun functionSymbol leftArguments rightArguments related => by
    show homomorphism.map _ = homomorphism.map _
    rw [homomorphism.preservesFunction, homomorphism.preservesFunction]
    congr 1
    funext i
    exact related i
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
def kernelCongruence {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N) : Congruence M where
  rel := kernelRelation homomorphism
  iseqv := kernelRelationIsEquivalence homomorphism
  compatible := fun functionSymbol leftArguments rightArguments related => by
    show homomorphism.map _ = homomorphism.map _
    rw [homomorphism.preservesFunction, homomorphism.preservesFunction]
    congr 1
    funext i
    exact related i

/--
`firstIsomorphismTheorem` TODO

Predicate logic:

  (∀ target : N.Domain, ∃ source, homomorphism.map source = target) → Isomorphic (quotientModel (kernelCongruence homomorphism)) N

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {M : LRA.Logic.FirstOrder.Model S} {N : LRA.Logic.FirstOrder.Model S} (homomorphism : LRA.UniversalAlgebra.Homomorphism M N), (∀ (target : N.1), Exists fun source => homomorphism.1 source = target) → Nonempty (LRA.UniversalAlgebra.Isomorphism { Domain := Quot (LRA.UniversalAlgebra.kernelCongruence homomorphism).1, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol arguments => Quot.mk (LRA.UniversalAlgebra.kernelCongruence homomorphism).1 (M.5 functionSymbol fun i => (Classical.indefiniteDescription (fun x => Quot.mk (LRA.UniversalAlgebra.kernelCongruence homomorphism).rel x = arguments i) ⋯).1), interpretRelation := fun relationSymbol arguments => M.6 relationSymbol fun i => (Classical.indefiniteDescription (fun x => Quot.mk (LRA.UniversalAlgebra.kernelCongruence homomorphism).rel x = arguments i) ⋯).1, interpretConstant := fun constantSymbol => Quot.mk (LRA.UniversalAlgebra.kernelCongruence homomorphism).1 (M.7 constantSymbol) } N)

Logical form (Lean):

```lean
theorem firstIsomorphismTheorem {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N)
    (surjective :
      ∀ target : N.Domain, ∃ source, homomorphism.map source = target) :
    Isomorphic (quotientModel (kernelCongruence homomorphism)) N
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
theorem firstIsomorphismTheorem {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N)
    (surjective :
      ∀ target : N.Domain, ∃ source, homomorphism.map source = target) :
    Isomorphic (quotientModel (kernelCongruence homomorphism)) N := by
  sorry

end LRA.UniversalAlgebra
