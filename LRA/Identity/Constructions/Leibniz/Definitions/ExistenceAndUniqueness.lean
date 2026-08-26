import LRA.Identity.Constructions.Leibniz.Definitions.Uniqueness

namespace LRA.Identity

universe u

/--
`ExistsAndUnique` TODO

Predicate logic:

  ∀ {Carrier : Type u} (predicate : Carrier → Prop), (Exists fun witness => predicate witness ∧ LRA.Identity.Unique predicate)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (predicate : Carrier → Prop), (Exists fun witness => predicate witness ∧ ∀ (left right : Carrier), predicate left → predicate right → left = right)

Logical form (Lean):

```lean
def ExistsAndUnique {Carrier : Type u} (predicate : Carrier -> Prop) : Prop :=
  (∃ witness : Carrier, predicate witness) ∧ Unique predicate
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def ExistsAndUnique {Carrier : Type u} (predicate : Carrier -> Prop) : Prop :=
  (∃ witness : Carrier, predicate witness) ∧ Unique predicate

end LRA.Identity
