import LRA.Identity.Constructions.Mathlib.Primitives
import LRA.Relation.Interface.Structures.Equivalence.Definition

namespace LRA.Identity.Constructions.Mathlib.Laws

universe u

/--
`Reflexivity` TODO

Predicate logic:

  ∀ {Carrier : Type u} (x : Carrier), LRA.Identity.Constructions.Mathlib.NativeIdentity x x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (x : Carrier), x = x

Logical form (Lean):

```lean
theorem Reflexivity {Carrier : Type u} (x : Carrier) : NativeIdentity x x
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
theorem Reflexivity {Carrier : Type u} (x : Carrier) : NativeIdentity x x := by
  sorry

/--
`Symmetry` TODO

Predicate logic:

  ∀ {Carrier : Type u} {x y : Carrier}, LRA.Identity.Constructions.Mathlib.NativeIdentity x y → LRA.Identity.Constructions.Mathlib.NativeIdentity y x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {x y : Carrier}, x = y → y = x

Logical form (Lean):

```lean
theorem Symmetry {Carrier : Type u} {x y : Carrier}
    (h : NativeIdentity x y) : NativeIdentity y x
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
theorem Symmetry {Carrier : Type u} {x y : Carrier}
    (h : NativeIdentity x y) : NativeIdentity y x := by
  sorry

/--
`Transitivity` TODO

Predicate logic:

  ∀ {Carrier : Type u} {x y z : Carrier}, (LRA.Identity.Constructions.Mathlib.NativeIdentity x y ∧ LRA.Identity.Constructions.Mathlib.NativeIdentity y z) → LRA.Identity.Constructions.Mathlib.NativeIdentity x z

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {x y z : Carrier}, (x = y ∧ y = z) → x = z

Logical form (Lean):

```lean
theorem Transitivity {Carrier : Type u} {x y z : Carrier}
    (hxy : NativeIdentity x y) (hyz : NativeIdentity y z) :
    NativeIdentity x z
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
theorem Transitivity {Carrier : Type u} {x y z : Carrier}
    (hxy : NativeIdentity x y) (hyz : NativeIdentity y z) :
    NativeIdentity x z := by
  sorry

/--
`IndiscernibilityOfIdenticals` TODO

Predicate logic:

  ∀ {Carrier : Type u} {x y : Carrier}, LRA.Identity.Constructions.Mathlib.NativeIdentity x y → ∀ (P : Carrier → Prop), P x ↔ P y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {x y : Carrier}, x = y → ∀ (P : Carrier → Prop), P x ↔ P y

Logical form (Lean):

```lean
theorem IndiscernibilityOfIdenticals {Carrier : Type u} {x y : Carrier}
    (h : NativeIdentity x y) : forall P : Carrier -> Prop, P x <-> P y
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
theorem IndiscernibilityOfIdenticals {Carrier : Type u} {x y : Carrier}
    (h : NativeIdentity x y) : forall P : Carrier -> Prop, P x <-> P y := by
  sorry

/--
`IdentityOfIndiscernibles` TODO

Predicate logic:

  ∀ {Carrier : Type u} {x y : Carrier}, (∀ (P : Carrier → Prop), P x ↔ P y) → LRA.Identity.Constructions.Mathlib.NativeIdentity x y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {x y : Carrier}, (∀ (P : Carrier → Prop), P x ↔ P y) → x = y

Logical form (Lean):

```lean
theorem IdentityOfIndiscernibles {Carrier : Type u} {x y : Carrier}
    (h : forall P : Carrier -> Prop, P x <-> P y) : NativeIdentity x y
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
theorem IdentityOfIndiscernibles {Carrier : Type u} {x y : Carrier}
    (h : forall P : Carrier -> Prop, P x <-> P y) : NativeIdentity x y := by
  sorry

/--
`LeibnizIff` TODO

Predicate logic:

  ∀ {Carrier : Type u} {x y : Carrier}, LRA.Identity.Constructions.Mathlib.NativeIdentity x y ↔ ∀ (P : Carrier → Prop), P x ↔ P y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {x y : Carrier}, x = y ↔ ∀ (P : Carrier → Prop), P x ↔ P y

Logical form (Lean):

```lean
theorem LeibnizIff {Carrier : Type u} {x y : Carrier} :
    NativeIdentity x y <-> forall P : Carrier -> Prop, P x <-> P y
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
theorem LeibnizIff {Carrier : Type u} {x y : Carrier} :
    NativeIdentity x y <-> forall P : Carrier -> Prop, P x <-> P y := by
  sorry

/--
`Equivalence` TODO

Predicate logic:

  ∀ {Carrier : Type u}, LRA.Relation.EquivalenceRelation LRA.Identity.Constructions.Mathlib.NativeIdentity

Predicate logic (unfolded):

  ∀ {Carrier : Type u}, ((∀ (x : Carrier), x = x) ∧ ((∀ (x y : Carrier), x = y → y = x) ∧ (∀ (x y z : Carrier), x = y → y = z → x = z)))

Logical form (Lean):

```lean
theorem Equivalence {Carrier : Type u} :
    LRA.Relation.EquivalenceRelation
      (NativeIdentity : Carrier -> Carrier -> Prop)
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
theorem Equivalence {Carrier : Type u} :
    LRA.Relation.EquivalenceRelation
      (NativeIdentity : Carrier -> Carrier -> Prop) := by
  sorry

/--
`Congruence` TODO

Predicate logic:

  ∀ {Carrier Codomain : Type u} {x y : Carrier}, LRA.Identity.Constructions.Mathlib.NativeIdentity x y → ∀ (f : Carrier → Codomain), LRA.Identity.Constructions.Mathlib.NativeIdentity (f x) (f y)

Predicate logic (unfolded):

  ∀ {Carrier Codomain : Type u} {x y : Carrier}, x = y → ∀ (f : Carrier → Codomain), f x = f y

Logical form (Lean):

```lean
theorem Congruence {Carrier Codomain : Type u} {x y : Carrier}
    (h : NativeIdentity x y) (f : Carrier -> Codomain) :
    NativeIdentity (f x) (f y)
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
theorem Congruence {Carrier Codomain : Type u} {x y : Carrier}
    (h : NativeIdentity x y) (f : Carrier -> Codomain) :
    NativeIdentity (f x) (f y) := by
  sorry

end LRA.Identity.Constructions.Mathlib.Laws
