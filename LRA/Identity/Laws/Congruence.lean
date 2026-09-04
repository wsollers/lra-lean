import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Theorems

namespace LRA.Identity

universe u

variable {Carrier : Type u} [IdentityRelation Carrier]

/--
`IdentPreservesFunctions` TODO

Predicate logic:

  Ident (f x) (f y)

Predicate logic (unfolded):

  Ambient
    (Carrier, Codomain)
  Objects
    x y : Carrier
    h : Ident x y
    f : Carrier → Codomain
  Prove
    x ≤ y → ∀ (f : Carrier → Codomain), f x ≤ f y

Logical form (Lean):

```lean
theorem IdentPreservesFunctions {Codomain : Type u} [IdentityRelation Codomain]
    {x y : Carrier} (h : Ident x y) (f : Carrier → Codomain) :
    Ident (f x) (f y)
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
theorem IdentPreservesFunctions {Codomain : Type u} [IdentityRelation Codomain]
    {x y : Carrier} (h : Ident x y) (f : Carrier → Codomain) :
    Ident (f x) (f y) := by
  sorry

/--
`IdentPreservesRelations` TODO

Predicate logic:

  R x y ↔ R x' y'

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    x x' y y' : Carrier
    hx : Ident x x'
    hy : Ident y y'
    R : Carrier → Carrier → Prop
  Prove
    (inst.Ident x x' ∧ inst.Ident y y') → ∀ (R : Carrier → Carrier → Prop), R x y ↔ R x' y'

Logical form (Lean):

```lean
theorem IdentPreservesRelations {x x' y y' : Carrier}
    (hx : Ident x x') (hy : Ident y y') (R : Carrier → Carrier → Prop) :
    R x y ↔ R x' y'
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
theorem IdentPreservesRelations {x x' y y' : Carrier}
    (hx : Ident x x') (hy : Ident y y') (R : Carrier → Carrier → Prop) :
    R x y ↔ R x' y' := by
  sorry

/--
`IdentPreservesOperations` TODO

Predicate logic:

  Ident (op x y) (op x' y')

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    x x' y y' : Carrier
    hx : Ident x x'
    hy : Ident y y'
    op : Carrier → Carrier → Carrier
  Prove
    (x ≤ x' ∧ y ≤ y') → ∀ (op : Carrier → Carrier → Carrier), op x y ≤ op x' y'

Logical form (Lean):

```lean
theorem IdentPreservesOperations {x x' y y' : Carrier}
    (hx : Ident x x') (hy : Ident y y') (op : Carrier → Carrier → Carrier) :
    Ident (op x y) (op x' y')
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
theorem IdentPreservesOperations {x x' y y' : Carrier}
    (hx : Ident x x') (hy : Ident y y') (op : Carrier → Carrier → Carrier) :
    Ident (op x y) (op x' y') := by
  sorry

end LRA.Identity
