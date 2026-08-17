import LRA.VolumeI.UniversalAlgebra.KernelCongruence.KernelRelation.Definition
import LRA.VolumeI.UniversalAlgebra.Quotient.Definition
import LRA.VolumeI.UniversalAlgebra.Isomorphism.Definition

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u v

/-!
Volume I label: universal-algebra-kernel-congruence
Lean module: LRA.UniversalAlgebra.KernelCongruence
Verification status: kernel congruence constructed (no sorry); first
isomorphism theorem pending

The kernel of a homomorphism is not merely an equivalence — it is a
*congruence*: the homomorphism law is exactly what makes
identification compatible with every operation. The pending first
isomorphism theorem (image ≅ quotient by kernel) is the classical
payoff, and the bridge from Volume II's concrete quotient
constructions to this abstract layer.
-/

/-- The kernel of a homomorphism as a congruence: compatibility is the
homomorphism law read backwards.

Logical form:

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

/-- First isomorphism theorem: the image of a homomorphism is
isomorphic to the quotient of the source by the kernel congruence.

Logical form:

```lean
theorem firstIsomorphismTheorem {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N)
    (surjective :
      ∀ target : N.Domain, ∃ source, homomorphism.map source = target) :
    Isomorphic (quotientModel (kernelCongruence homomorphism)) N
```
-/
theorem firstIsomorphismTheorem {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N)
    (surjective :
      ∀ target : N.Domain, ∃ source, homomorphism.map source = target) :
    Isomorphic (quotientModel (kernelCongruence homomorphism)) N := by
  sorry

end LRA.UniversalAlgebra
