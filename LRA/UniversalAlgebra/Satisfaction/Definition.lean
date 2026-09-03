import LRA.UniversalAlgebra.Algebra.Definition
import Mathlib.Order.SetNotation

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u

/--
`Equation` TODO

Predicate logic:

  structure Equation (S : Signature) (Variable : Type) where
  lhs : Term S Variable
  rhs : Term S Variable

Predicate logic (unfolded):

  structure Equation (S : Signature) (Variable : Type) where
  lhs : Term S Variable
  rhs : Term S Variable (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Equation (S : Signature) (Variable : Type) where
  lhs : Term S Variable
  rhs : Term S Variable
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
structure Equation (S : Signature) (Variable : Type) where
  lhs : Term S Variable
  rhs : Term S Variable

/--
`SatisfiesEquation` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} (M : LRA.ModelTheory.FirstOrder.Model S) (equation : LRA.UniversalAlgebra.Equation S Variable) (assignment : Variable → M.Domain), LRA.Logic.FirstOrder.evaluateTerm M assignment equation.lhs = LRA.Logic.FirstOrder.evaluateTerm M assignment equation.rhs

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} (M : LRA.ModelTheory.FirstOrder.Model S) (equation : LRA.UniversalAlgebra.Equation S Variable) (assignment : Variable → M.1), LRA.Logic.FirstOrder.evaluateTerm M assignment equation.1 = LRA.Logic.FirstOrder.evaluateTerm M assignment equation.2

Logical form (Lean):

```lean
def SatisfiesEquation {S : Signature} {Variable : Type}
    (M : LRA.ModelTheory.FirstOrder.Model.{u} S) (equation : Equation S Variable) : Prop :=
  ∀ assignment : Variable → M.Domain,
    evaluateTerm M assignment equation.lhs =
      evaluateTerm M assignment equation.rhs
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
def SatisfiesEquation {S : Signature} {Variable : Type}
    (M : LRA.ModelTheory.FirstOrder.Model.{u} S) (equation : Equation S Variable) : Prop :=
  ∀ assignment : Variable → M.Domain,
    evaluateTerm M assignment equation.lhs =
      evaluateTerm M assignment equation.rhs

/--
`EquationalTheory` TODO

Predicate logic:

  abbrev EquationalTheory (S : Signature) (Variable : Type) :=
  Set (Equation S Variable)

Predicate logic (unfolded):

  abbrev EquationalTheory (S : Signature) (Variable : Type) :=
  Set (Equation S Variable) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev EquationalTheory (S : Signature) (Variable : Type) :=
  Set (Equation S Variable)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev EquationalTheory (S : Signature) (Variable : Type) :=
  Set (Equation S Variable)

/--
`ModelsOfEquationalTheory` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} (theory : LRA.UniversalAlgebra.EquationalTheory S Variable) (a : LRA.ModelTheory.FirstOrder.Model S) (equation : LRA.UniversalAlgebra.Equation S Variable), Set.instMembership.mem theory equation → LRA.UniversalAlgebra.SatisfiesEquation a equation

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} (theory : LRA.UniversalAlgebra.Equation S Variable → Prop) (a : LRA.ModelTheory.FirstOrder.Model S) (equation : LRA.UniversalAlgebra.Equation S Variable), Set.instMembership.1 theory equation → ∀ (assignment : Variable → a.1), LRA.Logic.FirstOrder.evaluateTerm a assignment equation.1 = LRA.Logic.FirstOrder.evaluateTerm a assignment equation.2

Logical form (Lean):

```lean
def ModelsOfEquationalTheory {S : Signature} {Variable : Type}
    (theory : EquationalTheory S Variable) : Set (LRA.ModelTheory.FirstOrder.Model.{u} S) :=
  fun M => ∀ equation ∈ theory, SatisfiesEquation M equation
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
def ModelsOfEquationalTheory {S : Signature} {Variable : Type}
    (theory : EquationalTheory S Variable) : Set (LRA.ModelTheory.FirstOrder.Model.{u} S) :=
  fun M => ∀ equation ∈ theory, SatisfiesEquation M equation

/--
`EquationalTheoryOfClass` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} (class_ : Set (LRA.ModelTheory.FirstOrder.Model S)) (a : LRA.UniversalAlgebra.Equation S Variable) (M : LRA.ModelTheory.FirstOrder.Model S), Set.instMembership.mem class_ M → LRA.UniversalAlgebra.SatisfiesEquation M a

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} (class_ : LRA.ModelTheory.FirstOrder.Model S → Prop) (a : LRA.UniversalAlgebra.Equation S Variable) (M : LRA.ModelTheory.FirstOrder.Model S), Set.instMembership.1 class_ M → ∀ (assignment : Variable → M.1), LRA.Logic.FirstOrder.evaluateTerm M assignment a.1 = LRA.Logic.FirstOrder.evaluateTerm M assignment a.2

Logical form (Lean):

```lean
def EquationalTheoryOfClass {S : Signature} {Variable : Type}
    (class_ : Set (LRA.ModelTheory.FirstOrder.Model.{u} S)) : EquationalTheory S Variable :=
  fun equation => ∀ M ∈ class_, SatisfiesEquation M equation
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
def EquationalTheoryOfClass {S : Signature} {Variable : Type}
    (class_ : Set (LRA.ModelTheory.FirstOrder.Model.{u} S)) : EquationalTheory S Variable :=
  fun equation => ∀ M ∈ class_, SatisfiesEquation M equation

/--
`IsVariety` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} (class_ : Set (LRA.ModelTheory.FirstOrder.Model S)), Exists fun theory => class_ = LRA.UniversalAlgebra.ModelsOfEquationalTheory theory

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} (class_ : LRA.ModelTheory.FirstOrder.Model S → Prop), Exists fun theory => class_ = funM => ∀ (equation : LRA.UniversalAlgebra.Equation S Nat), Set.instMembership.1 theory equation → ∀ (assignment : Nat → M.1), LRA.Logic.FirstOrder.evaluateTerm M assignment equation.1 = LRA.Logic.FirstOrder.evaluateTerm M assignment equation.2

Logical form (Lean):

```lean
def IsVariety {S : Signature} (class_ : Set (LRA.ModelTheory.FirstOrder.Model.{u} S)) : Prop :=
  ∃ theory : EquationalTheory S Nat,
    class_ = ModelsOfEquationalTheory theory
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def IsVariety {S : Signature} (class_ : Set (LRA.ModelTheory.FirstOrder.Model.{u} S)) : Prop :=
  ∃ theory : EquationalTheory S Nat,
    class_ = ModelsOfEquationalTheory theory

/--
`modelsOfEquationalTheoryIsVariety` TODO

Predicate logic:

  IsVariety (ModelsOfEquationalTheory.{u} theory)

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} (theory : LRA.UniversalAlgebra.Equation S Nat → Prop), Exists fun theory_1 => fun M => ∀ (equation : LRA.UniversalAlgebra.Equation S Nat), Set.instMembership.1 theory equation → ∀ (assignment : Nat → M.1), LRA.Logic.FirstOrder.evaluateTerm M assignment equation.1 = LRA.Logic.FirstOrder.evaluateTerm M assignment equation.2 = funM => ∀ (equation : LRA.UniversalAlgebra.Equation S Nat), Set.instMembership.1 theory_1 equation → ∀ (assignment : Nat → M.1), LRA.Logic.FirstOrder.evaluateTerm M assignment equation.1 = LRA.Logic.FirstOrder.evaluateTerm M assignment equation.2

Logical form (Lean):

```lean
theorem modelsOfEquationalTheoryIsVariety {S : Signature}
    (theory : EquationalTheory S Nat) :
    IsVariety (ModelsOfEquationalTheory.{u} theory)
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
theorem modelsOfEquationalTheoryIsVariety {S : Signature}
    (theory : EquationalTheory S Nat) :
    IsVariety (ModelsOfEquationalTheory.{u} theory) := by
  sorry
end LRA.UniversalAlgebra
