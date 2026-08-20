import LRA.UniversalAlgebra.Algebra.Definition
import Mathlib.Order.SetNotation

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u

/-!
Volume I label: universal-algebra-satisfaction
Lean module: LRA.UniversalAlgebra.Satisfaction
Verification status: checked definitions

Equational logic as the fragment of first-order logic the algebra
chapter actually lives in: an *equation* is a pair of terms, an
algebra *satisfies* it when both sides evaluate equally under every
assignment (implicit universal closure), and a *variety* is a model
class carved out by equations. Birkhoff's HSP theorem — a class is a
variety iff it is closed under homomorphic images, subalgebras, and
products — is the summit this chapter climbs toward; its three
closure operations are exactly the contents of `Homomorphism`,
`Substructure`, and `ProductStructure`.
-/

/-- An equation over a signature: a pair of terms, read as
`lhs ≈ rhs` under implicit universal closure.

Logical form:

```lean
structure Equation (S : Signature) (Variable : Type) where
  lhs : Term S Variable
  rhs : Term S Variable
```
-/
structure Equation (S : Signature) (Variable : Type) where
  lhs : Term S Variable
  rhs : Term S Variable

/-- An algebra satisfies an equation when both sides evaluate equally
under every assignment.

Logical form:

```lean
def SatisfiesEquation {S : Signature} {Variable : Type}
    (M : Model.{u} S) (equation : Equation S Variable) : Prop :=
  ∀ assignment : Variable → M.Domain,
    evaluateTerm M assignment equation.lhs =
      evaluateTerm M assignment equation.rhs
```
-/
def SatisfiesEquation {S : Signature} {Variable : Type}
    (M : Model.{u} S) (equation : Equation S Variable) : Prop :=
  ∀ assignment : Variable → M.Domain,
    evaluateTerm M assignment equation.lhs =
      evaluateTerm M assignment equation.rhs

/-- An equational theory: a set of equations in a fixed signature.

Logical form:

```lean
abbrev EquationalTheory (S : Signature) (Variable : Type) :=
  Set (Equation S Variable)
```
-/
abbrev EquationalTheory (S : Signature) (Variable : Type) :=
  Set (Equation S Variable)

/-- The models of an equational theory.

Logical form:

```lean
def ModelsOfEquationalTheory {S : Signature} {Variable : Type}
    (theory : EquationalTheory S Variable) : Set (Model.{u} S) :=
  fun M => ∀ equation ∈ theory, SatisfiesEquation M equation
```
-/
def ModelsOfEquationalTheory {S : Signature} {Variable : Type}
    (theory : EquationalTheory S Variable) : Set (Model.{u} S) :=
  fun M => ∀ equation ∈ theory, SatisfiesEquation M equation

/-- The equational theory of a class of algebras: the equations true
in every member.

Logical form:

```lean
def EquationalTheoryOfClass {S : Signature} {Variable : Type}
    (class_ : Set (Model.{u} S)) : EquationalTheory S Variable :=
  fun equation => ∀ M ∈ class_, SatisfiesEquation M equation
```
-/
def EquationalTheoryOfClass {S : Signature} {Variable : Type}
    (class_ : Set (Model.{u} S)) : EquationalTheory S Variable :=
  fun equation => ∀ M ∈ class_, SatisfiesEquation M equation

/-- A class of algebras is a variety when it is exactly the model
class of some equational theory (with countably many variables).

Logical form:

```lean
def IsVariety {S : Signature} (class_ : Set (Model.{u} S)) : Prop :=
  ∃ theory : EquationalTheory S Nat,
    class_ = ModelsOfEquationalTheory theory
```
-/
def IsVariety {S : Signature} (class_ : Set (Model.{u} S)) : Prop :=
  ∃ theory : EquationalTheory S Nat,
    class_ = ModelsOfEquationalTheory theory

/-- Every model class of an equational theory is a variety.

Logical form:

```lean
theorem modelsOfEquationalTheoryIsVariety {S : Signature}
    (theory : EquationalTheory S Nat) :
    IsVariety (ModelsOfEquationalTheory.{u} theory)
```
-/
theorem modelsOfEquationalTheoryIsVariety {S : Signature}
    (theory : EquationalTheory S Nat) :
    IsVariety (ModelsOfEquationalTheory.{u} theory) := by
  sorry

end LRA.UniversalAlgebra
