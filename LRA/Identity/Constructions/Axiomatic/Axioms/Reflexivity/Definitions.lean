namespace LRA.Identity

universe u

/--
`IsReflexiveIdentityRelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (R : Carrier → Carrier → Prop) (x : Carrier), R x x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    R x x

Logical form (Lean):

```lean
def IsReflexiveIdentityRelation {Carrier : Type u}
    (R : Carrier → Carrier → Prop) : Prop :=
  ∀ x, R x x
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
def IsReflexiveIdentityRelation {Carrier : Type u}
    (R : Carrier → Carrier → Prop) : Prop :=
  ∀ x, R x x

end LRA.Identity
