import LRA.UniversalAlgebra.Embedding.Definition

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u v

/-!
Volume I label: universal-algebra-isomorphism
Lean module: LRA.UniversalAlgebra.Isomorphism
Verification status: definitions checked; inverse-homomorphism proof
pending

An isomorphism of algebras: a surjective embedding. The pending
theorem — that the set-level inverse of an isomorphism is itself a
homomorphism — is what makes "isomorphic" a symmetric relation, and
is the first of the classical isomorphism-theorem cluster that
`KernelCongruence`/`QuotientStructure` set up.
-/

/-- An isomorphism: a surjective embedding.

Logical form:

```lean
structure Isomorphism {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) extends Embedding M N where
  surjective : ∀ target : N.Domain, ∃ source, map source = target
```
-/
structure Isomorphism {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) extends Embedding M N where
  surjective : ∀ target : N.Domain, ∃ source, map source = target

/-- The identity isomorphism.

Logical form:

```lean
def Isomorphism.id {S : Signature} (M : Model.{u} S) : Isomorphism M M where
  toEmbedding := Embedding.id M
  surjective := fun target => ⟨target, rfl⟩
```
-/
def Isomorphism.id {S : Signature} (M : Model.{u} S) : Isomorphism M M where
  toEmbedding := Embedding.id M
  surjective := fun target => ⟨target, rfl⟩

/-- Two algebras are isomorphic when an isomorphism exists between
them.

Logical form:

```lean
def Isomorphic {S : Signature} (M : Model.{u} S) (N : Model.{v} S) : Prop :=
  Nonempty (Isomorphism M N)
```
-/
def Isomorphic {S : Signature} (M : Model.{u} S) (N : Model.{v} S) : Prop :=
  Nonempty (Isomorphism M N)

/-- The set-level inverse of an isomorphism is a homomorphism (hence,
with injectivity and surjectivity inherited, an isomorphism):
isomorphy is symmetric.

Logical form:

```lean
theorem isomorphic_symm {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S} :
    Isomorphic M N → Isomorphic N M
```
-/
theorem isomorphic_symm {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S} :
    Isomorphic M N → Isomorphic N M := by
  sorry

end LRA.UniversalAlgebra
