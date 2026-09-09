import LRA.Identity.Constructions.Axiomatic.Axioms.ZeroOrder.Definitions
import LRA.Identity.Interface.ZeroOrder

namespace LRA.Identity.Constructions.Axiomatic.ZeroOrder

/--
`Ax_Reflexivity` TODO

Predicate logic:

  ∀ {Formula : Type} (formula : Formula), LRA.Identity.Constructions.Axiomatic.ZeroOrder.SyntacticIdentity formula formula

Predicate logic (unfolded):

  ∀ {Formula : Type} (formula : Formula), formula = formula

Logical form (Lean):

```lean
axiom Ax_Reflexivity {Formula : Type} (formula : Formula) :
  SyntacticIdentity formula formula
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
axiom Ax_Reflexivity {Formula : Type} (formula : Formula) :
  SyntacticIdentity formula formula

/--
`Ax_Substitution` TODO

Predicate logic:

  ∀ {L : LRA.Identity.Interface.ZeroOrder.LStructure} (M : LRA.Identity.Interface.ZeroOrder.Model L) {left right : L.Formula}, LRA.Identity.Constructions.Axiomatic.ZeroOrder.SyntacticIdentity left right → M.Holds left ↔ M.Holds right

Predicate logic (unfolded):

  ∀ {L : LRA.Identity.Interface.ZeroOrder.LStructure} (M : LRA.Identity.Interface.ZeroOrder.Model L) {left right : L.Formula}, left = right → M.Holds left ↔ M.Holds right

Logical form (Lean):

```lean
axiom Ax_Substitution
    {L : LRA.Identity.Interface.ZeroOrder.LStructure}
    (M : LRA.Identity.Interface.ZeroOrder.Model L)
    {left right : L.Formula} (h : SyntacticIdentity left right) :
    M.Holds left <-> M.Holds right
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
axiom Ax_Substitution
    {L : LRA.Identity.Interface.ZeroOrder.LStructure}
    (M : LRA.Identity.Interface.ZeroOrder.Model L)
    {left right : L.Formula} (h : SyntacticIdentity left right) :
    M.Holds left <-> M.Holds right

end LRA.Identity.Constructions.Axiomatic.ZeroOrder
