namespace LRA.Identity

universe u

/--
`FirstOrderLeibnizAxiom` TODO

Predicate logic:

  ∀ {Carrier : Type u} (Admissible : (Carrier → Prop) → Prop) (R : Carrier → Carrier → Prop) (x y : Carrier), R x y → ∀ (P : Carrier → Prop), (Admissible P ∧ P x) → P y

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    R x y → ∀ (P : Carrier → Prop), (Admissible P ∧ P x) → P y

Logical form (Lean):

```lean
def FirstOrderLeibnizAxiom {Carrier : Type u}
    (Admissible : (Carrier → Prop) → Prop)
    (R : Carrier → Carrier → Prop) : Prop :=
  ∀ x y, R x y → ∀ P : Carrier → Prop, Admissible P → P x → P y
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
def FirstOrderLeibnizAxiom {Carrier : Type u}
    (Admissible : (Carrier → Prop) → Prop)
    (R : Carrier → Carrier → Prop) : Prop :=
  ∀ x y, R x y → ∀ P : Carrier → Prop, Admissible P → P x → P y

end LRA.Identity
