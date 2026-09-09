import LRA.Identity.Interface.FirstOrder
import LRA.Identity.Interface.SecondOrder

namespace LRA.Identity.Laws.LogicalLevels

universe u

/--
`FirstOrderReflexivity` TODO

Predicate logic:

  ∀ {L : LRA.Identity.Interface.FirstOrder.LStructure} {Variable : Type} [inst : DecidableEq Variable] {M : LRA.Identity.Interface.FirstOrder.Model L}, LRA.Identity.Interface.FirstOrder.Theory L Variable M → ∀ (x : M.interpretation.Domain), M.Identity x x

Predicate logic (unfolded):

  ∀ {L : LRA.Identity.Interface.FirstOrder.LStructure} {Variable : Type} [inst : DecidableEq Variable] {M : LRA.Identity.Interface.FirstOrder.Model L}, ((∀ (x : M.interpretation.Domain), M.Identity x x) ∧ (∀ (x y : M.interpretation.Domain), M.Identity x y → ∀ (P : M.interpretation.Domain → Prop), (∃ formula, ∃ distinguished, ∃ assignment, ∀ (value : M.interpretation.Domain), P value ↔ LRA.Logic.FirstOrder.Satisfies M.interpretation (LRA.Logic.updateAssignment assignment distinguished value) formula) → P x → P y)) → ∀ (x : M.interpretation.Domain), M.Identity x x

Logical form (Lean):

```lean
theorem FirstOrderReflexivity
    {L : LRA.Identity.Interface.FirstOrder.LStructure}
    {Variable : Type} [DecidableEq Variable]
    {M : LRA.Identity.Interface.FirstOrder.Model L}
    (T : LRA.Identity.Interface.FirstOrder.Theory L Variable M) (x : M.interpretation.Domain) :
    M.Identity x x
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
theorem FirstOrderReflexivity
    {L : LRA.Identity.Interface.FirstOrder.LStructure}
    {Variable : Type} [DecidableEq Variable]
    {M : LRA.Identity.Interface.FirstOrder.Model L}
    (T : LRA.Identity.Interface.FirstOrder.Theory L Variable M) (x : M.interpretation.Domain) :
    M.Identity x x := by
  sorry

/--
`FirstOrderIndiscernibilityOfIdenticals` TODO

Predicate logic:

  ∀ {L : LRA.Identity.Interface.FirstOrder.LStructure} {Variable : Type} [inst : DecidableEq Variable] {M : LRA.Identity.Interface.FirstOrder.Model L}, LRA.Identity.Interface.FirstOrder.Theory L Variable M → ∀ {x y : M.interpretation.Domain}, M.Identity x y → ∀ (P : M.interpretation.Domain → Prop), (LRA.Identity.Logic.FOL.FormulaDefinable Variable M.interpretation P ∧ P x) → P y

Predicate logic (unfolded):

  ∀ {L : LRA.Identity.Interface.FirstOrder.LStructure} {Variable : Type} [inst : DecidableEq Variable] {M : LRA.Identity.Interface.FirstOrder.Model L}, ((∀ (x : M.interpretation.Domain), M.Identity x x) ∧ (∀ (x y : M.interpretation.Domain), M.Identity x y → ∀ (P : M.interpretation.Domain → Prop), (∃ formula, ∃ distinguished, ∃ assignment, ∀ (value : M.interpretation.Domain), P value ↔ LRA.Logic.FirstOrder.Satisfies M.interpretation (LRA.Logic.updateAssignment assignment distinguished value) formula) → P x → P y)) → ∀ {x y : M.interpretation.Domain}, M.Identity x y → ∀ (P : M.interpretation.Domain → Prop), ((∃ formula, ∃ distinguished, ∃ assignment, ∀ (value : M.interpretation.Domain), P value ↔ LRA.Logic.FirstOrder.Satisfies M.interpretation (LRA.Logic.updateAssignment assignment distinguished value) formula) ∧ P x) → P y

Logical form (Lean):

```lean
theorem FirstOrderIndiscernibilityOfIdenticals
    {L : LRA.Identity.Interface.FirstOrder.LStructure}
    {Variable : Type} [DecidableEq Variable]
    {M : LRA.Identity.Interface.FirstOrder.Model L}
    (T : LRA.Identity.Interface.FirstOrder.Theory L Variable M)
    {x y : M.interpretation.Domain} (h : M.Identity x y) :
    forall P, LRA.Identity.Logic.FOL.FormulaDefinable Variable M.interpretation P ->
      P x -> P y
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
theorem FirstOrderIndiscernibilityOfIdenticals
    {L : LRA.Identity.Interface.FirstOrder.LStructure}
    {Variable : Type} [DecidableEq Variable]
    {M : LRA.Identity.Interface.FirstOrder.Model L}
    (T : LRA.Identity.Interface.FirstOrder.Theory L Variable M)
    {x y : M.interpretation.Domain} (h : M.Identity x y) :
    forall P, LRA.Identity.Logic.FOL.FormulaDefinable Variable M.interpretation P ->
      P x -> P y := by
  sorry

/--
`FullToHenkin` TODO

Predicate logic:

  ∀ {Carrier : Type u} {R : Carrier → Carrier → Prop} (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier), LRA.Identity.Logic.SOL.FullIdentityTheory R → LRA.Identity.Logic.SOL.HenkinIdentityTheory domain R

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {R : Carrier → Carrier → Prop} (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier), ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), True → P x → P y)) → ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), domain.Admissible P → P x → P y))

Logical form (Lean):

```lean
theorem FullToHenkin
    {Carrier : Type u} {R : Carrier -> Carrier -> Prop}
    (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier)
    (h : LRA.Identity.Logic.SOL.FullIdentityTheory R) :
    LRA.Identity.Logic.SOL.HenkinIdentityTheory domain R
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
theorem FullToHenkin
    {Carrier : Type u} {R : Carrier -> Carrier -> Prop}
    (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier)
    (h : LRA.Identity.Logic.SOL.FullIdentityTheory R) :
    LRA.Identity.Logic.SOL.HenkinIdentityTheory domain R := by
  sorry

/--
`HenkinToFullOfAllPredicates` TODO

Predicate logic:

  ∀ {Carrier : Type u} {R : Carrier → Carrier → Prop} {domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier}, (LRA.Identity.Logic.SOL.HenkinIdentityTheory domain R ∧ (∀ (P : Carrier → Prop), domain.Admissible P)) → LRA.Identity.Logic.SOL.FullIdentityTheory R

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {R : Carrier → Carrier → Prop} {domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier}, (((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), domain.Admissible P → P x → P y)) ∧ (∀ (P : Carrier → Prop), domain.Admissible P)) → ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), True → P x → P y))

Logical form (Lean):

```lean
theorem HenkinToFullOfAllPredicates
    {Carrier : Type u} {R : Carrier -> Carrier -> Prop}
    {domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier}
    (h : LRA.Identity.Logic.SOL.HenkinIdentityTheory domain R)
    (hAll : forall P, domain.Admissible P) :
    LRA.Identity.Logic.SOL.FullIdentityTheory R
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
theorem HenkinToFullOfAllPredicates
    {Carrier : Type u} {R : Carrier -> Carrier -> Prop}
    {domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier}
    (h : LRA.Identity.Logic.SOL.HenkinIdentityTheory domain R)
    (hAll : forall P, domain.Admissible P) :
    LRA.Identity.Logic.SOL.FullIdentityTheory R := by
  sorry

/--
`FullToFirstOrder` TODO

Predicate logic:

  ∀ {Carrier : Type u} {R : Carrier → Carrier → Prop} (Expressible : (Carrier → Prop) → Prop), LRA.Identity.Logic.SOL.FullIdentityTheory R → LRA.Identity.Logic.FOL.IdentityTheoryFor Expressible R

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {R : Carrier → Carrier → Prop} (Expressible : (Carrier → Prop) → Prop), ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), True → P x → P y)) → ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), Expressible P → P x → P y))

Logical form (Lean):

```lean
theorem FullToFirstOrder
    {Carrier : Type u} {R : Carrier -> Carrier -> Prop}
    (Expressible : (Carrier -> Prop) -> Prop)
    (h : LRA.Identity.Logic.SOL.FullIdentityTheory R) :
    LRA.Identity.Logic.FOL.IdentityTheoryFor Expressible R
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
theorem FullToFirstOrder
    {Carrier : Type u} {R : Carrier -> Carrier -> Prop}
    (Expressible : (Carrier -> Prop) -> Prop)
    (h : LRA.Identity.Logic.SOL.FullIdentityTheory R) :
    LRA.Identity.Logic.FOL.IdentityTheoryFor Expressible R := by
  sorry

end LRA.Identity.Laws.LogicalLevels
