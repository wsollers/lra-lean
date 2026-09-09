import LRA.Set.Constructions.ZFCSet.Primitives
import LRA.Identity.Laws.Witnesses
import LRA.Identity.Constructions.Mathlib

namespace LRA.Set.Constructions.ZFCSet.Axioms

open scoped LRA.Identity.Constructions.Mathlib

/--
`Set` TODO

Predicate logic:

  Type

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Type

Logical form (Lean):

```lean
axiom ZFCSet : Type
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
abbrev Set := LRA.Set.Constructions.ZFCSet

/--
`ExistsAndUnique` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] (P : Carrier → Prop), (LRA.Identity.HasWitness P ∧ LRA.Identity.AtMostOne P)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun x => P x ∧ (∀ (left right : Carrier), P left → P right → inst.Ident left right))

Logical form (Lean):

```lean
def ExactlyOne (P : Carrier → Prop) : Prop :=
  HasWitness P ∧ AtMostOne P
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
abbrev ExistsAndUnique (property : Set → Prop) : Prop :=
  LRA.Identity.ExactlyOne property

end LRA.Set.Constructions.ZFCSet.Axioms
