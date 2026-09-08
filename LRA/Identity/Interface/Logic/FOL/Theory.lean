import LRA.Identity.Interface.Identity
import LRA.Identity.Interface.Logic.FOL.Syntax
import LRA.Logic.Semantics.Satisfaction

namespace LRA.Identity.Logic.FOL

universe u

/-- A first-order identity theory is explicitly relative to the predicates
expressible in the selected first-order language and context.

Logical form: `IdentityTheory Expressible R`.
-/
abbrev IdentityTheoryFor {Carrier : Type u}
    (Expressible : (Carrier -> Prop) -> Prop)
    (R : Carrier -> Carrier -> Prop) : Prop :=
  LRA.Identity.IdentityTheory Expressible R

/-- Predicate-relative Leibniz substitution at the FOL model level.

This is a semantic schema indexed by predicates expressible in the selected
first-order language; it is not second-order quantification in the object
language.

Logical form:
`forall x y, R x y -> forall P, Expressible P -> P x -> P y`.
-/
def LeibnizSchema {Carrier : Type u}
    (Expressible : (Carrier -> Prop) -> Prop)
    (R : Carrier -> Carrier -> Prop) : Prop :=
  forall x y, R x y -> forall P, Expressible P -> P x -> P y

/-- `DefinesUnaryPredicate` states that a formula, distinguished variable, and
background assignment define a unary predicate in a specified FOL model.

Logical form:
```lean
forall value, P value <->
  Satisfies M (updateAssignment assignment variable value) formula
```
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

/-- `FormulaDefinable` is the predicate policy consisting exactly of unary
predicates definable by a formula with parameters in a specified FOL model.

Logical form:
```lean
exists formula variable assignment,
  DefinesUnaryPredicate M formula variable assignment P
```
-/
def FormulaDefinable
    {S : LRA.Logic.Signature} (Variable : Type) [DecidableEq Variable]
    (M : LRA.Logic.FirstOrder.Interpretation S) :
    (M.Domain -> Prop) -> Prop :=
  fun P => exists (formula : LRA.Logic.FirstOrder.Formula S Variable)
    (distinguished : Variable) (assignment : Variable -> M.Domain),
    DefinesUnaryPredicate M formula distinguished assignment P

/-- `ModelIdentityTheory` states first-order Leibniz substitution relative to
the predicates definable in the selected model and variable language.

Logical form:
```lean
IdentityTheory (FormulaDefinable Variable M) R
```
-/
abbrev ModelIdentityTheory
    {S : LRA.Logic.Signature} (Variable : Type) [DecidableEq Variable]
    (M : LRA.Logic.FirstOrder.Interpretation S)
    (R : M.Domain -> M.Domain -> Prop) : Prop :=
  LRA.Identity.IdentityTheory (FormulaDefinable Variable M) R

end LRA.Identity.Logic.FOL

namespace LRA.Identity

/-- Compatibility name for the original FOL-relative identity contract. -/
abbrev EqualityFirstOrderTheory {Carrier : Type _}
    (Expressible : (Carrier -> Prop) -> Prop)
    (R : Carrier -> Carrier -> Prop) : Prop :=
  Logic.FOL.IdentityTheoryFor Expressible R

/-- Compatibility name for the original predicate-relative Leibniz schema. -/
abbrev FirstOrderLeibnizAxiom {Carrier : Type _}
    (Expressible : (Carrier -> Prop) -> Prop)
    (R : Carrier -> Carrier -> Prop) : Prop :=
  Logic.FOL.LeibnizSchema Expressible R

end LRA.Identity
