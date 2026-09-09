import LRA.Identity.Constructions.Axiomatic.Axioms.Common
import LRA.Identity.Interface.Logic.FOL.Theory

namespace LRA.Identity.Constructions.Axiomatic

/--
`FirstOrderLeibnizPrinciple` TODO

Predicate logic:

  ∀ {Carrier : Type u} (Expressible : (Carrier → Prop) → Prop) (R : Carrier → Carrier → Prop) (x y : Carrier), R x y → ∀ (P : Carrier → Prop), (Expressible P ∧ P x) → P y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (Expressible : (Carrier → Prop) → Prop) (R : Carrier → Carrier → Prop) (x y : Carrier), R x y → ∀ (P : Carrier → Prop), (Expressible P ∧ P x) → P y

Logical form (Lean):

```lean
def LeibnizSchema {Carrier : Type u}
    (Expressible : (Carrier -> Prop) -> Prop)
    (R : Carrier -> Carrier -> Prop) : Prop :=
  forall x y, R x y -> forall P, Expressible P -> P x -> P y
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
abbrev FirstOrderLeibnizPrinciple
    {S : LRA.Logic.Signature} (Variable : Type) [DecidableEq Variable]
    (M : LRA.Logic.FirstOrder.Interpretation S) : Prop :=
  LRA.Identity.Logic.FOL.LeibnizSchema
    (LRA.Identity.Logic.FOL.FormulaDefinable Variable M)
    (Ax_IdentityRelation : M.Domain -> M.Domain -> Prop)

end LRA.Identity.Constructions.Axiomatic
