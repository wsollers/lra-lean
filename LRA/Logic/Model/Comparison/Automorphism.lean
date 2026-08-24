import LRA.Logic.Model.Comparison.ModelIsomorphism

namespace LRA.Logic.FirstOrder

/--
`Automorphism` TODO

Predicate logic:

  abbrev Automorphism {S : Signature} (M : Model S) : Type :=
  ModelIsomorphism M M

Predicate logic (unfolded):

  abbrev Automorphism {S : Signature} (M : Model S) : Type :=
  ModelIsomorphism M M (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Automorphism {S : Signature} (M : Model S) : Type :=
  ModelIsomorphism M M
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
abbrev Automorphism {S : Signature} (M : Model S) : Type :=
  ModelIsomorphism M M

/--
`Automorphism.identity` TODO

Predicate logic:

  def Automorphism.identity {S : Signature} (M : Model S) : Automorphism M where
  toFun := id
  injective := Function.injective_id
  preservesFunction _ _ := rfl
  preservesConstant _ := rfl
  preservesRelation _ _ := Iff.rfl
  surjective := Function.surjective_id

Predicate logic (unfolded):

  def Automorphism.identity {S : Signature} (M : Model S) : Automorphism M where
  toFun := id
  injective := Function.injective_id
  preservesFunction _ _ := rfl
  preservesConstant _ := rfl
  preservesRelation _ _ := Iff.rfl
  surjective := Function.surjective_id (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Automorphism.identity {S : Signature} (M : Model S) : Automorphism M where
  toFun := id
  injective := Function.injective_id
  preservesFunction _ _ := rfl
  preservesConstant _ := rfl
  preservesRelation _ _ := Iff.rfl
  surjective := Function.surjective_id
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
def Automorphism.identity {S : Signature} (M : Model S) : Automorphism M where
  toFun := id
  injective := Function.injective_id
  preservesFunction _ _ := rfl
  preservesConstant _ := rfl
  preservesRelation _ _ := Iff.rfl
  surjective := Function.surjective_id

end LRA.Logic.FirstOrder
