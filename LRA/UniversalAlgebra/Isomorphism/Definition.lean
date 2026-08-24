import LRA.UniversalAlgebra.Embedding.Definition

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u v

/--
`Isomorphism` TODO

Predicate logic:

  structure Isomorphism {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) extends Embedding M N where
  surjective : ∀ target : N.Domain, ∃ source, map source = target

Predicate logic (unfolded):

  structure Isomorphism {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) extends Embedding M N where
  surjective : ∀ target : N.Domain, ∃ source, map source = target (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Isomorphism {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) extends Embedding M N where
  surjective : ∀ target : N.Domain, ∃ source, map source = target
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
structure Isomorphism {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) extends Embedding M N where
  surjective : ∀ target : N.Domain, ∃ source, map source = target

/--
`Isomorphism.id` TODO

Predicate logic:

  def Isomorphism.id {S : Signature} (M : Model.{u} S) : Isomorphism M M where
  toEmbedding := Embedding.id M
  surjective := fun target => ⟨target, rfl⟩

Predicate logic (unfolded):

  def Isomorphism.id {S : Signature} (M : Model.{u} S) : Isomorphism M M where
  toEmbedding := Embedding.id M
  surjective := fun target => ⟨target, rfl⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Isomorphism.id {S : Signature} (M : Model.{u} S) : Isomorphism M M where
  toEmbedding := Embedding.id M
  surjective := fun target => ⟨target, rfl⟩
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
def Isomorphism.id {S : Signature} (M : Model.{u} S) : Isomorphism M M where
  toEmbedding := Embedding.id M
  surjective := fun target => ⟨target, rfl⟩

/--
`Isomorphic` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} (M : LRA.Logic.FirstOrder.Model S) (N : LRA.Logic.FirstOrder.Model S), Nonempty (LRA.UniversalAlgebra.Isomorphism M N)

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} (M : LRA.Logic.FirstOrder.Model S) (N : LRA.Logic.FirstOrder.Model S), Nonempty (LRA.UniversalAlgebra.Isomorphism M N)

Logical form (Lean):

```lean
def Isomorphic {S : Signature} (M : Model.{u} S) (N : Model.{v} S) : Prop :=
  Nonempty (Isomorphism M N)
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
def Isomorphic {S : Signature} (M : Model.{u} S) (N : Model.{v} S) : Prop :=
  Nonempty (Isomorphism M N)

/--
`isomorphic_symm` TODO

Predicate logic:

  Isomorphic M N → Isomorphic N M

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {M : LRA.Logic.FirstOrder.Model S} {N : LRA.Logic.FirstOrder.Model S}, Nonempty (LRA.UniversalAlgebra.Isomorphism M N) → Nonempty (LRA.UniversalAlgebra.Isomorphism N M)

Logical form (Lean):

```lean
theorem isomorphic_symm {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S} :
    Isomorphic M N → Isomorphic N M
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
theorem isomorphic_symm {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S} :
    Isomorphic M N → Isomorphic N M := by
  sorry

end LRA.UniversalAlgebra
