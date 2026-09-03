import LRA.Logic.Syntax.FirstOrder.Sentence
import LRA.Logic.Semantics.Sentence
import LRA.ModelTheory.SecondOrderMonadic.Semantics.SOSatisfaction

open LRA.Logic
open LRA.Logic.FirstOrder

open LRA.Logic.SecondOrderMonadic

namespace LRA.ModelTheory.FirstOrder

universe u

/--
`FormulaTheory` TODO

Predicate logic:

  abbrev FormulaTheory (S : Signature) (Variable : Type) :=
  Set (Formula S Variable)

Predicate logic (unfolded):

  abbrev FormulaTheory (S : Signature) (Variable : Type) :=
  Set (Formula S Variable) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev FormulaTheory (S : Signature) (Variable : Type) :=
  Set (Formula S Variable)
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
abbrev FormulaTheory (S : Signature) (Variable : Type) :=
  Set (Formula S Variable)

/--
`Theory` TODO

Predicate logic:

  abbrev Theory (S : Signature) (Variable : Type) [DecidableEq Variable] :=
  Set (Sentence S Variable)

Predicate logic (unfolded):

  abbrev Theory (S : Signature) (Variable : Type) [DecidableEq Variable] :=
  Set (Sentence S Variable) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Theory (S : Signature) (Variable : Type) [DecidableEq Variable] :=
  Set (Sentence S Variable)
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
abbrev Theory (S : Signature) (Variable : Type) [DecidableEq Variable] :=
  Set (Sentence S Variable)

/--
`ModelsOfFormulaTheory` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = Γ : LRA.ModelTheory.FirstOrder.FormulaTheory S Variable (a : LRA.ModelTheory.FirstOrder.Model S) (assignment : Variable → a.Domain) (φ : LRA.ModelTheory.FirstOrder.Formula S Variable), Set.instMembership.mem Γ φ → LRA.ModelTheory.FirstOrder.Satisfies a assignment φ

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)] (Γ : LRA.ModelTheory.FirstOrder.Formula S Variable → Prop) (a : LRA.ModelTheory.FirstOrder.Model S) (assignment : Variable → a.1) (φ : LRA.ModelTheory.FirstOrder.Formula S Variable), Set.instMembership.1 Γ φ → LRA.ModelTheory.FirstOrder.Satisfies a assignment φ

Logical form (Lean):

```lean
def ModelsOfFormulaTheory
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (Γ : FormulaTheory S Variable) :
    Set (Model S) :=
  fun M => ∀ assignment φ, φ ∈ Γ -> Satisfies M assignment φ
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
def ModelsOfFormulaTheory
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (Γ : FormulaTheory S Variable) :
    Set (Model S) :=
  fun M => ∀ assignment φ, φ ∈ Γ -> Satisfies M assignment φ

/--
`ModelsOfTheory` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = Γ : LRA.ModelTheory.FirstOrder.Theory S Variable (a : LRA.ModelTheory.FirstOrder.Model S) (assignment : Variable → a.Domain) (sentence : LRA.ModelTheory.FirstOrder.Sentence S Variable), Set.instMembership.mem Γ sentence → LRA.ModelTheory.FirstOrder.Satisfies a assignment sentence.val

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)] (Γ : (Subtype fun formula => LRA.ModelTheory.FirstOrder.freeVariables formula = Finset.instEmptyCollection.1) → Prop) (a : LRA.ModelTheory.FirstOrder.Model S) (assignment : Variable → a.1) (sentence : Subtype fun formula => LRA.ModelTheory.FirstOrder.freeVariables formula = Finset.instEmptyCollection.1), Set.instMembership.1 Γ sentence → LRA.ModelTheory.FirstOrder.Satisfies a assignment sentence.1

Logical form (Lean):

```lean
def ModelsOfTheory
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (Γ : Theory S Variable) :
    Set (Model S) :=
  fun M => ∀ assignment sentence, sentence ∈ Γ -> Satisfies M assignment sentence.val
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
def ModelsOfTheory
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (Γ : Theory S Variable) :
    Set (Model S) :=
  fun M => ∀ assignment sentence, sentence ∈ Γ -> Satisfies M assignment sentence.val

/--
`TheoryOfModels` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = K : Set (LRA.ModelTheory.FirstOrder.Model S) (a : LRA.ModelTheory.FirstOrder.Sentence S Variable) (M : LRA.ModelTheory.FirstOrder.Model S), Set.instMembership.mem K M → ∀ (assignment : Variable → M.Domain), LRA.ModelTheory.FirstOrder.Satisfies M assignment a.val

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)] (K : LRA.ModelTheory.FirstOrder.Model S → Prop) (a : Subtype fun formula => LRA.ModelTheory.FirstOrder.freeVariables formula = Finset.instEmptyCollection.1) (M : LRA.ModelTheory.FirstOrder.Model S), Set.instMembership.1 K M → ∀ (assignment : Variable → M.1), LRA.ModelTheory.FirstOrder.Satisfies M assignment a.1

Logical form (Lean):

```lean
def TheoryOfModels
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (K : Set (Model.{u} S)) :
    Theory S Variable :=
  fun sentence => ∀ M, M ∈ K -> ∀ assignment, Satisfies M assignment sentence.val
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
def TheoryOfModels
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (K : Set (Model.{u} S)) :
    Theory S Variable :=
  fun sentence => ∀ M, M ∈ K -> ∀ assignment, Satisfies M assignment sentence.val

/--
`SemanticConsequence` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable SetVariable : Type} [inst : DecidableVariable] = [inst_1 : DecidableSetVariable](Γ : LRA.ModelTheory.SecondOrderMonadic.FormulaTheory S Variable SetVariable) = φ : LRA.ModelTheory.SecondOrderMonadic.SOFormula S Variable SetVariable (M : LRA.ModelTheory.SecondOrderMonadic.HenkinModel S) (assignment : LRA.ModelTheory.SecondOrderMonadic.SOAssignment M Variable SetVariable), Set.instMembership.mem (LRA.ModelTheory.SecondOrderMonadic.ModelsOfFormulaTheory Γ) M → LRA.ModelTheory.SecondOrderMonadic.SOSatisfies M assignment φ

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable SetVariable : Type} [inst : (a b : Variable) → Decidable (a = b)] [inst_1 : (a b : SetVariable) → Decidable (a = b)] (Γ : LRA.ModelTheory.SecondOrderMonadic.SOFormula S Variable SetVariable → Prop) (φ : LRA.ModelTheory.SecondOrderMonadic.SOFormula S Variable SetVariable) (M : LRA.ModelTheory.SecondOrderMonadic.HenkinModel S) (assignment : LRA.ModelTheory.SecondOrderMonadic.SOAssignment M Variable SetVariable), Set.instMembership.1 (fun M => ∀ (assignment : LRA.ModelTheory.SecondOrderMonadic.SOAssignment M Variable SetVariable) (φ : LRA.ModelTheory.SecondOrderMonadic.SOFormula S Variable SetVariable), Set.instMembership.1 Γ φ → LRA.ModelTheory.SecondOrderMonadic.SOSatisfies M assignment φ) M → LRA.ModelTheory.SecondOrderMonadic.SOSatisfies M assignment φ

Logical form (Lean):

```lean
def SemanticConsequence
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (Γ : FormulaTheory S Variable) (φ : Formula S Variable) : Prop :=
  ∀ M : Model.{u} S, ∀ assignment,
    M ∈ ModelsOfFormulaTheory Γ -> Satisfies M assignment φ
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
def SemanticConsequence
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (Γ : FormulaTheory S Variable) (φ : Formula S Variable) : Prop :=
  ∀ M : Model.{u} S, ∀ assignment,
    M ∈ ModelsOfFormulaTheory Γ -> Satisfies M assignment φ

end LRA.ModelTheory.FirstOrder

open LRA.Logic

open LRA.Logic.SecondOrderMonadic

namespace LRA.ModelTheory.SecondOrderMonadic

universe u

/--
`FormulaTheory` TODO

Predicate logic:

  abbrev FormulaTheory (S : Signature) (Variable SetVariable : Type) :=
  Set (SOFormula S Variable SetVariable)

Predicate logic (unfolded):

  abbrev FormulaTheory (S : Signature) (Variable SetVariable : Type) :=
  Set (SOFormula S Variable SetVariable) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev FormulaTheory (S : Signature) (Variable SetVariable : Type) :=
  Set (SOFormula S Variable SetVariable)
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
abbrev FormulaTheory (S : Signature) (Variable SetVariable : Type) :=
  Set (SOFormula S Variable SetVariable)

/--
`ModelsOfFormulaTheory` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = Γ : LRA.ModelTheory.FirstOrder.FormulaTheory S Variable (a : LRA.ModelTheory.FirstOrder.Model S) (assignment : Variable → a.Domain) (φ : LRA.ModelTheory.FirstOrder.Formula S Variable), Set.instMembership.mem Γ φ → LRA.ModelTheory.FirstOrder.Satisfies a assignment φ

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)] (Γ : LRA.ModelTheory.FirstOrder.Formula S Variable → Prop) (a : LRA.ModelTheory.FirstOrder.Model S) (assignment : Variable → a.1) (φ : LRA.ModelTheory.FirstOrder.Formula S Variable), Set.instMembership.1 Γ φ → LRA.ModelTheory.FirstOrder.Satisfies a assignment φ

Logical form (Lean):

```lean
def ModelsOfFormulaTheory
    {S : Signature} {Variable SetVariable : Type}
    [DecidableEq Variable] [DecidableEq SetVariable]
    (Γ : FormulaTheory S Variable SetVariable) :
    Set (HenkinModel S) :=
  fun M => ∀ assignment φ, φ ∈ Γ -> SOSatisfies M assignment φ
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
def ModelsOfFormulaTheory
    {S : Signature} {Variable SetVariable : Type}
    [DecidableEq Variable] [DecidableEq SetVariable]
    (Γ : FormulaTheory S Variable SetVariable) :
    Set (HenkinModel S) :=
  fun M => ∀ assignment φ, φ ∈ Γ -> SOSatisfies M assignment φ

/--
`SemanticConsequence` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable SetVariable : Type} [inst : DecidableVariable] = [inst_1 : DecidableSetVariable](Γ : LRA.ModelTheory.SecondOrderMonadic.FormulaTheory S Variable SetVariable) = φ : LRA.ModelTheory.SecondOrderMonadic.SOFormula S Variable SetVariable (M : LRA.ModelTheory.SecondOrderMonadic.HenkinModel S) (assignment : LRA.ModelTheory.SecondOrderMonadic.SOAssignment M Variable SetVariable), Set.instMembership.mem (LRA.ModelTheory.SecondOrderMonadic.ModelsOfFormulaTheory Γ) M → LRA.ModelTheory.SecondOrderMonadic.SOSatisfies M assignment φ

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable SetVariable : Type} [inst : (a b : Variable) → Decidable (a = b)] [inst_1 : (a b : SetVariable) → Decidable (a = b)] (Γ : LRA.ModelTheory.SecondOrderMonadic.SOFormula S Variable SetVariable → Prop) (φ : LRA.ModelTheory.SecondOrderMonadic.SOFormula S Variable SetVariable) (M : LRA.ModelTheory.SecondOrderMonadic.HenkinModel S) (assignment : LRA.ModelTheory.SecondOrderMonadic.SOAssignment M Variable SetVariable), Set.instMembership.1 (fun M => ∀ (assignment : LRA.ModelTheory.SecondOrderMonadic.SOAssignment M Variable SetVariable) (φ : LRA.ModelTheory.SecondOrderMonadic.SOFormula S Variable SetVariable), Set.instMembership.1 Γ φ → LRA.ModelTheory.SecondOrderMonadic.SOSatisfies M assignment φ) M → LRA.ModelTheory.SecondOrderMonadic.SOSatisfies M assignment φ

Logical form (Lean):

```lean
def SemanticConsequence
    {S : Signature} {Variable SetVariable : Type}
    [DecidableEq Variable] [DecidableEq SetVariable]
    (Γ : FormulaTheory S Variable SetVariable)
    (φ : SOFormula S Variable SetVariable) : Prop :=
  ∀ M : HenkinModel.{u} S, ∀ assignment,
    M ∈ ModelsOfFormulaTheory Γ -> SOSatisfies M assignment φ
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
def SemanticConsequence
    {S : Signature} {Variable SetVariable : Type}
    [DecidableEq Variable] [DecidableEq SetVariable]
    (Γ : FormulaTheory S Variable SetVariable)
    (φ : SOFormula S Variable SetVariable) : Prop :=
  ∀ M : HenkinModel.{u} S, ∀ assignment,
    M ∈ ModelsOfFormulaTheory Γ -> SOSatisfies M assignment φ

end LRA.ModelTheory.SecondOrderMonadic
