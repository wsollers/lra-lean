import LRA.Identity.Interface.Logic.FOL.Theory

namespace LRA.Identity.Logic.FOL

universe u

/--
`IdentityTheoryFor.LeibnizSchemaOfTheory` TODO

Predicate logic:

  ∀ {Carrier : Type u} {Expressible : (Carrier → Prop) → Prop} {R : Carrier → Carrier → Prop}, LRA.Identity.Logic.FOL.IdentityTheoryFor Expressible R → LRA.Identity.Logic.FOL.LeibnizSchema Expressible R

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {Expressible : (Carrier → Prop) → Prop} {R : Carrier → Carrier → Prop}, ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), Expressible P → P x → P y)) → ∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), (Expressible P ∧ P x) → P y

Logical form (Lean):

```lean
theorem IdentityTheoryFor.LeibnizSchemaOfTheory {Carrier : Type u}
    {Expressible : (Carrier -> Prop) -> Prop}
    {R : Carrier -> Carrier -> Prop}
    (h : IdentityTheoryFor Expressible R) :
    LeibnizSchema Expressible R
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
theorem IdentityTheoryFor.LeibnizSchemaOfTheory {Carrier : Type u}
    {Expressible : (Carrier -> Prop) -> Prop}
    {R : Carrier -> Carrier -> Prop}
    (h : IdentityTheoryFor Expressible R) :
    LeibnizSchema Expressible R := by
  sorry

end LRA.Identity.Logic.FOL
