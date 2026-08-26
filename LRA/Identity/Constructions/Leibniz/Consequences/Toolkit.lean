import LRA.Identity.Constructions.Leibniz.Axioms
import LRA.Identity.Constructions.Leibniz.Consequences.Equality
import LRA.Identity.Constructions.Leibniz.Consequences.Substitution

namespace LRA.Identity

universe u v

/--
`EqualityReasoningByReflexivity` TODO

Predicate logic:

  (∀ x ∈ Carrier), x = x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (x : Carrier), x = x

Logical form (Lean):

```lean
theorem EqualityReasoningByReflexivity {Carrier : Type u} (x : Carrier) :
    x = x
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
theorem EqualityReasoningByReflexivity {Carrier : Type u} (x : Carrier) :
    x = x := by
  rfl

/--
`EqualityReasoningBySymmetry` TODO

Predicate logic:

  (x = y) → y = x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {x y : Carrier}, x = y → y = x

Logical form (Lean):

```lean
theorem EqualityReasoningBySymmetry {Carrier : Type u} {x y : Carrier}
    (EqualityProof : x = y) :
    y = x
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
theorem EqualityReasoningBySymmetry {Carrier : Type u} {x y : Carrier}
    (EqualityProof : x = y) :
    y = x := by
  symm
  exact EqualityProof

/--
`EqualityReasoningByTransitivity` TODO

Predicate logic:

  (x = y ∧ y = z) → x = z

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {x y z : Carrier}, (x = y ∧ y = z) → x = z

Logical form (Lean):

```lean
theorem EqualityReasoningByTransitivity {Carrier : Type u} {x y z : Carrier}
    (FirstEquality : x = y)
    (SecondEquality : y = z) :
    x = z
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
theorem EqualityReasoningByTransitivity {Carrier : Type u} {x y z : Carrier}
    (FirstEquality : x = y)
    (SecondEquality : y = z) :
    x = z := by
  rw [FirstEquality.symm] at SecondEquality
  exact SecondEquality

/--
`RewritePropertyByEquality` TODO

Predicate logic:

  (x = y) → Property x ↔ Property y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {x y : Carrier}, x = y → ∀ (Property : Carrier → Prop), Property x ↔ Property y

Logical form (Lean):

```lean
theorem RewritePropertyByEquality {Carrier : Type u} {x y : Carrier}
    (EqualityProof : x = y)
    (Property : Carrier -> Prop) :
    Property x ↔ Property y
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
theorem RewritePropertyByEquality {Carrier : Type u} {x y : Carrier}
    (EqualityProof : x = y)
    (Property : Carrier -> Prop) :
    Property x ↔ Property y := by
  rw [EqualityProof]


/--
`RewriteFunctionByEquality` TODO

Predicate logic:

  (x = y) → function x = function y

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} {x y : Domain}, x = y → ∀ (function : Domain → Codomain), function x = function y

Logical form (Lean):

```lean
theorem RewriteFunctionByEquality {Domain : Type u} {Codomain : Type v}
    {x y : Domain}
    (EqualityProof : x = y)
    (function : Domain -> Codomain) :
    function x = function y
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
theorem RewriteFunctionByEquality {Domain : Type u} {Codomain : Type v}
    {x y : Domain}
    (EqualityProof : x = y)
    (function : Domain -> Codomain) :
    function x = function y := by
  rw [EqualityProof.symm]

/--
`RewriteRelationLeftByEquality` TODO

Predicate logic:

  (x = y) → relation x z ↔ relation y z

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {x y z : Carrier}, x = y → ∀ (relation : Carrier → Carrier → Prop), relation x z ↔ relation y z

Logical form (Lean):

```lean
theorem RewriteRelationLeftByEquality {Carrier : Type u}
    {x y z : Carrier}
    (EqualityProof : x = y)
    (relation : Carrier -> Carrier -> Prop) :
    relation x z ↔ relation y z
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
theorem RewriteRelationLeftByEquality {Carrier : Type u}
    {x y z : Carrier}
    (EqualityProof : x = y)
    (relation : Carrier -> Carrier -> Prop) :
    relation x z ↔ relation y z := by
  rw [EqualityProof.symm]


end LRA.Identity
