import LRA.Identity.Interface.ModelTheory.LStructure
import LRA.Identity.Axioms
import LRA.Identity.Distinctness
import LRA.Identity.Uniqueness
import LRA.Identity.ExistenceAndUniqueness

namespace LRA.Identity

universe u

/--
`EqualityTheory` TODO

Predicate logic:

  structure EqualityTheory (Carrier : Type u) : Prop where
  reflexivity : ∀ x : Carrier, x = x
  leibniz :
    ∀ x y : Carrier,
      x = y ->
        ∀ property : Carrier -> Prop, property x ↔ property y

Predicate logic (unfolded):

  structure EqualityTheory (Carrier : Type u) : Prop where
  reflexivity : ∀ x : Carrier, x = x
  leibniz :
    ∀ x y : Carrier,
      x = y ->
        ∀ property : Carrier -> Prop, property x ↔ property y (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure EqualityTheory (Carrier : Type u) : Prop where
  reflexivity : ∀ x : Carrier, x = x
  leibniz :
    ∀ x y : Carrier,
      x = y ->
        ∀ property : Carrier -> Prop, property x ↔ property y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
structure EqualityTheory (Carrier : Type u) : Prop where
  reflexivity : ∀ x : Carrier, x = x
  leibniz :
    ∀ x y : Carrier,
      x = y ->
        ∀ property : Carrier -> Prop, property x ↔ property y

/--
`Exists` TODO

Predicate logic:

  ∀ {Carrier : Type u} (predicate : Carrier → Prop), Exists fun x => predicate x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (predicate : Carrier → Prop), Exists fun x => predicate x

Logical form (Lean):

```lean
def Exists {Carrier : Type u} (predicate : Carrier -> Prop) : Prop :=
  ∃ x, predicate x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def Exists {Carrier : Type u} (predicate : Carrier -> Prop) : Prop :=
  ∃ x, predicate x

/--
`AtLeastTwo` TODO

Predicate logic:

  ∀ (Carrier : Type u), Exists fun x => Exists fun y => LRA.Identity.Distinct x y

Predicate logic (unfolded):

  ∀ (Carrier : Type u), Exists fun x => Exists fun y => x = y → False

Logical form (Lean):

```lean
def AtLeastTwo (Carrier : Type u) : Prop :=
  ∃ x y : Carrier, Distinct x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def AtLeastTwo (Carrier : Type u) : Prop :=
  ∃ x y : Carrier, Distinct x y

/--
`AtMostTwo` TODO

Predicate logic:

  ∀ (Carrier : Type u) (x y z : Carrier), Or (x = y)(Or (y = z)(x = z))

Predicate logic (unfolded):

  ∀ (Carrier : Type u) (x y z : Carrier), Or (x = y)(Or (y = z)(x = z))

Logical form (Lean):

```lean
def AtMostTwo (Carrier : Type u) : Prop :=
  ∀ x y z : Carrier, x = y ∨ y = z ∨ x = z
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases, unfold

-/
def AtMostTwo (Carrier : Type u) : Prop :=
  ∀ x y z : Carrier, x = y ∨ y = z ∨ x = z

end LRA.Identity
