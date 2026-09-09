import LRA.Identity.Interface.Identity
import LRA.Identity.Interface.Logic.FOL.Syntax
import LRA.Logic.Semantics.Satisfaction

namespace LRA.Identity.Logic.FOL

universe u

/--
`IdentityTheoryFor` TODO

Predicate logic:

  ∀ {Carrier : Type u} {Admissible : (Carrier → Prop) → Prop} {R : Carrier → Carrier → Prop}, ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), Admissible P → P x → P y))

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {Admissible : (Carrier → Prop) → Prop} {R : Carrier → Carrier → Prop}, ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), Admissible P → P x → P y))

Logical form (Lean):

```lean
structure IdentityTheory {Carrier : Type u}
    (Admissible : (Carrier → Prop) → Prop)
    (R : Carrier → Carrier → Prop) : Prop where
  reflexive : ∀ x, R x x
  leibniz : ∀ x y, R x y →
    ∀ P : Carrier → Prop, Admissible P → P x → P y
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
abbrev IdentityTheoryFor {Carrier : Type u}
    (Expressible : (Carrier -> Prop) -> Prop)
    (R : Carrier -> Carrier -> Prop) : Prop :=
  LRA.Identity.IdentityTheory Expressible R

/--
`LeibnizSchema` TODO

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
def LeibnizSchema {Carrier : Type u}
    (Expressible : (Carrier -> Prop) -> Prop)
    (R : Carrier -> Carrier -> Prop) : Prop :=
  forall x y, R x y -> forall P, Expressible P -> P x -> P y

/--
`DefinesUnaryPredicate` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableEq Variable] (M : LRA.Logic.FirstOrder.Interpretation S) (formula : LRA.Logic.FirstOrder.Formula S Variable) (distinguished : Variable) (assignment : Variable → M.Domain) (P : M.Domain → Prop) (value : M.Domain), P value ↔ LRA.Logic.FirstOrder.Satisfies M (LRA.Logic.updateAssignment assignment distinguished value) formula

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableEq Variable] (M : LRA.Logic.FirstOrder.Interpretation S) (formula : LRA.Logic.FirstOrder.Formula S Variable) (distinguished : Variable) (assignment : Variable → M.Domain) (P : M.Domain → Prop) (value : M.Domain), P value ↔ LRA.Logic.FirstOrder.Satisfies M (LRA.Logic.updateAssignment assignment distinguished value) formula

Logical form (Lean):

```lean
def DefinesUnaryPredicate
    {S : LRA.Logic.Signature} {Variable : Type} [DecidableEq Variable]
    (M : LRA.Logic.FirstOrder.Interpretation S)
    (formula : LRA.Logic.FirstOrder.Formula S Variable)
    (distinguished : Variable) (assignment : Variable -> M.Domain)
    (P : M.Domain -> Prop) : Prop :=
  forall value, P value <->
    LRA.Logic.FirstOrder.Satisfies M
      (LRA.Logic.updateAssignment assignment distinguished value) formula
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def DefinesUnaryPredicate
    {S : LRA.Logic.Signature} {Variable : Type} [DecidableEq Variable]
    (M : LRA.Logic.FirstOrder.Interpretation S)
    (formula : LRA.Logic.FirstOrder.Formula S Variable)
    (distinguished : Variable) (assignment : Variable -> M.Domain)
    (P : M.Domain -> Prop) : Prop :=
  forall value, P value <->
    LRA.Logic.FirstOrder.Satisfies M
      (LRA.Logic.updateAssignment assignment distinguished value) formula

/--
`FormulaDefinable` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} (Variable : Type) [inst : DecidableEq Variable] (M : LRA.Logic.FirstOrder.Interpretation S) (a : M.Domain → Prop), ∃ formula, ∃ distinguished, ∃ assignment, LRA.Identity.Logic.FOL.DefinesUnaryPredicate M formula distinguished assignment a

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} (Variable : Type) [inst : DecidableEq Variable] (M : LRA.Logic.FirstOrder.Interpretation S) (a : M.Domain → Prop), ∃ formula, ∃ distinguished, ∃ assignment, ∀ (value : M.Domain), a value ↔ LRA.Logic.FirstOrder.Satisfies M (LRA.Logic.updateAssignment assignment distinguished value) formula

Logical form (Lean):

```lean
def FormulaDefinable
    {S : LRA.Logic.Signature} (Variable : Type) [DecidableEq Variable]
    (M : LRA.Logic.FirstOrder.Interpretation S) :
    (M.Domain -> Prop) -> Prop :=
  fun P => exists (formula : LRA.Logic.FirstOrder.Formula S Variable)
    (distinguished : Variable) (assignment : Variable -> M.Domain),
    DefinesUnaryPredicate M formula distinguished assignment P
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def FormulaDefinable
    {S : LRA.Logic.Signature} (Variable : Type) [DecidableEq Variable]
    (M : LRA.Logic.FirstOrder.Interpretation S) :
    (M.Domain -> Prop) -> Prop :=
  fun P => exists (formula : LRA.Logic.FirstOrder.Formula S Variable)
    (distinguished : Variable) (assignment : Variable -> M.Domain),
    DefinesUnaryPredicate M formula distinguished assignment P

/--
`ModelIdentityTheory` TODO

Predicate logic:

  ∀ {Carrier : Type u} {Admissible : (Carrier → Prop) → Prop} {R : Carrier → Carrier → Prop}, ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), Admissible P → P x → P y))

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {Admissible : (Carrier → Prop) → Prop} {R : Carrier → Carrier → Prop}, ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), Admissible P → P x → P y))

Logical form (Lean):

```lean
structure IdentityTheory {Carrier : Type u}
    (Admissible : (Carrier → Prop) → Prop)
    (R : Carrier → Carrier → Prop) : Prop where
  reflexive : ∀ x, R x x
  leibniz : ∀ x y, R x y →
    ∀ P : Carrier → Prop, Admissible P → P x → P y
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
abbrev ModelIdentityTheory
    {S : LRA.Logic.Signature} (Variable : Type) [DecidableEq Variable]
    (M : LRA.Logic.FirstOrder.Interpretation S)
    (R : M.Domain -> M.Domain -> Prop) : Prop :=
  LRA.Identity.IdentityTheory (FormulaDefinable Variable M) R

end LRA.Identity.Logic.FOL

namespace LRA.Identity

/--
`EqualityFirstOrderTheory` TODO

Predicate logic:

  ∀ {Carrier : Type u_1} (Expressible : (Carrier → Prop) → Prop) (R : Carrier → Carrier → Prop), LRA.Identity.IdentityTheory Expressible R

Predicate logic (unfolded):

  ∀ {Carrier : Type u_1} (Expressible : (Carrier → Prop) → Prop) (R : Carrier → Carrier → Prop), ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), Expressible P → P x → P y))

Logical form (Lean):

```lean
abbrev EqualityFirstOrderTheory {Carrier : Type _}
    (Expressible : (Carrier -> Prop) -> Prop)
    (R : Carrier -> Carrier -> Prop) : Prop :=
  Logic.FOL.IdentityTheoryFor Expressible R
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
abbrev EqualityFirstOrderTheory {Carrier : Type _}
    (Expressible : (Carrier -> Prop) -> Prop)
    (R : Carrier -> Carrier -> Prop) : Prop :=
  Logic.FOL.IdentityTheoryFor Expressible R

/--
`FirstOrderLeibnizAxiom` TODO

Predicate logic:

  ∀ {Carrier : Type u_1} (Expressible : (Carrier → Prop) → Prop) (R : Carrier → Carrier → Prop) (x y : Carrier), R x y → ∀ (P : Carrier → Prop), (Expressible P ∧ P x) → P y

Predicate logic (unfolded):

  ∀ {Carrier : Type u_1} (Expressible : (Carrier → Prop) → Prop) (R : Carrier → Carrier → Prop) (x y : Carrier), R x y → ∀ (P : Carrier → Prop), (Expressible P ∧ P x) → P y

Logical form (Lean):

```lean
abbrev FirstOrderLeibnizAxiom {Carrier : Type _}
    (Expressible : (Carrier -> Prop) -> Prop)
    (R : Carrier -> Carrier -> Prop) : Prop :=
  Logic.FOL.LeibnizSchema Expressible R
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
abbrev FirstOrderLeibnizAxiom {Carrier : Type _}
    (Expressible : (Carrier -> Prop) -> Prop)
    (R : Carrier -> Carrier -> Prop) : Prop :=
  Logic.FOL.LeibnizSchema Expressible R

end LRA.Identity
