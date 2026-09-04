import LRA.Identity.Constructions.Axiomatic.Axioms.FirstOrderLeibniz.Definitions

namespace LRA.Identity

universe u

/--
`EqualityFirstOrderTheory.leibnizAxiom` TODO

Predicate logic:

  FirstOrderLeibnizAxiom Admissible R

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    Admissible : (Carrier → Prop) → Prop
    R : Carrier → Carrier → Prop
    h : EqualityFirstOrderTheory Admissible R
  Prove
    LRA.Identity.IdentityTheory Admissible R → ∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), (Admissible P ∧ P x) → P y

Logical form (Lean):

```lean
theorem EqualityFirstOrderTheory.leibnizAxiom {Carrier : Type u}
    {Admissible : (Carrier → Prop) → Prop} {R : Carrier → Carrier → Prop}
    (h : EqualityFirstOrderTheory Admissible R) :
    FirstOrderLeibnizAxiom Admissible R
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
theorem EqualityFirstOrderTheory.leibnizAxiom {Carrier : Type u}
    {Admissible : (Carrier → Prop) → Prop} {R : Carrier → Carrier → Prop}
    (h : EqualityFirstOrderTheory Admissible R) :
    FirstOrderLeibnizAxiom Admissible R := by
  rcases h with ⟨_, hLeibniz⟩
  exact hLeibniz









end LRA.Identity
