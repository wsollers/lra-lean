import LRA.UniversalAlgebra.Homomorphism.Definition
import LRA.Relation.Structures

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u v

/-!
Volume I label: universal-algebra-kernel-relation
Lean module: LRA.UniversalAlgebra.KernelRelation
Verification status: checked (no sorry)

The kernel of a homomorphism: two elements are related when the
homomorphism identifies them. It is an equivalence relation for the
simplest possible reason — equality is one, and the kernel is
equality pulled back along the map.
-/

/-- The kernel relation of a homomorphism: identification by the
map.

Logical form:

```lean
def kernelRelation {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N) :
    M.Domain → M.Domain → Prop :=
  fun first second => homomorphism.map first = homomorphism.map second
```
-/
def kernelRelation {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N) :
    M.Domain → M.Domain → Prop :=
  fun first second => homomorphism.map first = homomorphism.map second

/-- The kernel relation is an equivalence: equality pulled back.

Logical form:

```lean
theorem kernelRelationIsEquivalence {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N) :
    Equivalence (kernelRelation homomorphism)
```
-/
theorem kernelRelationIsEquivalence {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N) :
    Equivalence (kernelRelation homomorphism) :=
  ⟨fun _ => rfl, Eq.symm, Eq.trans⟩

end LRA.UniversalAlgebra
