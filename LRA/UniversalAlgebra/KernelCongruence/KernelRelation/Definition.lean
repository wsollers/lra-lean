import LRA.UniversalAlgebra.Homomorphism.Definition
import LRA.Relation.Interface.Structures

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u v

/--
`kernelRelation` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {M : LRA.Logic.FirstOrder.Model S} {N : LRA.Logic.FirstOrder.Model S} (homomorphism : LRA.UniversalAlgebra.Homomorphism M N) (a a_1 : M.Domain), homomorphism.map a = homomorphism.map a_1

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {M : LRA.Logic.FirstOrder.Model S} {N : LRA.Logic.FirstOrder.Model S} (homomorphism : LRA.UniversalAlgebra.Homomorphism M N) (a a_1 : M.1), homomorphism.1 a = homomorphism.1 a_1

Logical form (Lean):

```lean
def kernelRelation {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N) :
    M.Domain → M.Domain → Prop :=
  fun first second => homomorphism.map first = homomorphism.map second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def kernelRelation {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N) :
    M.Domain → M.Domain → Prop :=
  fun first second => homomorphism.map first = homomorphism.map second

/--
`kernelRelationIsEquivalence` TODO

Predicate logic:

  Equivalence (kernelRelation homomorphism)

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {M : LRA.Logic.FirstOrder.Model S} {N : LRA.Logic.FirstOrder.Model S} (homomorphism : LRA.UniversalAlgebra.Homomorphism M N), Equivalence fun first second => homomorphism.1 first = homomorphism.1 second

Logical form (Lean):

```lean
theorem kernelRelationIsEquivalence {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N) :
    Equivalence (kernelRelation homomorphism)
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
theorem kernelRelationIsEquivalence {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N) :
    Equivalence (kernelRelation homomorphism) := by
  sorry
end LRA.UniversalAlgebra
