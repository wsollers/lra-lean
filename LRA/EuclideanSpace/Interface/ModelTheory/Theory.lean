import LRA.EuclideanSpace.Interface.ModelTheory.LStructure
import LRA.ModelTheory.Theory

namespace LRA.EuclideanSpace

/--
`TarskiFormulaTheory` TODO

Predicate logic:

  abbrev TarskiFormulaTheory (Variable : Type) :=
  LRA.ModelTheory.FirstOrder.FormulaTheory TarskiFirstOrderSignature Variable

Predicate logic (unfolded):

  abbrev TarskiFormulaTheory (Variable : Type) :=
  LRA.ModelTheory.FirstOrder.FormulaTheory TarskiFirstOrderSignature Variable (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev TarskiFormulaTheory (Variable : Type) :=
  LRA.ModelTheory.FirstOrder.FormulaTheory TarskiFirstOrderSignature Variable
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
abbrev TarskiFormulaTheory (Variable : Type) :=
  LRA.ModelTheory.FirstOrder.FormulaTheory TarskiFirstOrderSignature Variable

/--
`TarskiTheory` TODO

Predicate logic:

  abbrev TarskiTheory (Variable : Type) [DecidableEq Variable] :=
  LRA.ModelTheory.FirstOrder.Theory TarskiFirstOrderSignature Variable

Predicate logic (unfolded):

  abbrev TarskiTheory (Variable : Type) [DecidableEq Variable] :=
  LRA.ModelTheory.FirstOrder.Theory TarskiFirstOrderSignature Variable (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev TarskiTheory (Variable : Type) [DecidableEq Variable] :=
  LRA.ModelTheory.FirstOrder.Theory TarskiFirstOrderSignature Variable
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
abbrev TarskiTheory (Variable : Type) [DecidableEq Variable] :=
  LRA.ModelTheory.FirstOrder.Theory TarskiFirstOrderSignature Variable

/--
`TarskiStructuresOfTheory` TODO

Predicate logic:

  ∀ {Variable : Type} [inst : DecidableVariable] = Γ : LRA.EuclideanSpace.TarskiTheory Variable (a : LRA.EuclideanSpace.TarskiStructure) (assignment : Variable → a.Domain) (sentence : LRA.Logic.FirstOrder.Sentence LRA.EuclideanSpace.TarskiFirstOrderSignature Variable), Set.instMembership.mem Γ sentence → LRA.Logic.FirstOrder.Satisfies a assignment sentence.val

Predicate logic (unfolded):

  ∀ {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)] (Γ : (Subtype fun formula => LRA.Logic.FirstOrder.freeVariables formula = Finset.instEmptyCollection.1) → Prop) (a : LRA.EuclideanSpace.TarskiStructure) (assignment : Variable → a.1) (sentence : Subtype fun formula => LRA.Logic.FirstOrder.freeVariables formula = Finset.instEmptyCollection.1), Set.instMembership.1 Γ sentence → LRA.Logic.FirstOrder.Satisfies a assignment sentence.1

Logical form (Lean):

```lean
abbrev TarskiStructuresOfTheory {Variable : Type} [DecidableEq Variable]
    (Γ : TarskiTheory Variable) :
    Set TarskiStructure :=
  LRA.ModelTheory.FirstOrder.ModelsOfTheory Γ
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
abbrev TarskiStructuresOfTheory {Variable : Type} [DecidableEq Variable]
    (Γ : TarskiTheory Variable) :
    Set TarskiStructure :=
  LRA.ModelTheory.FirstOrder.ModelsOfTheory Γ

/--
`IsTarskiModelOf` TODO

Predicate logic:

  ∀ {Variable : Type} [inst : DecidableVariable] = M : LRA.EuclideanSpace.TarskiStructure (Γ : LRA.EuclideanSpace.TarskiTheory Variable) (assignment : Variable → M.Domain) (sentence : LRA.Logic.FirstOrder.Sentence LRA.EuclideanSpace.TarskiFirstOrderSignature Variable), Set.instMembership.mem Γ sentence → LRA.Logic.FirstOrder.Satisfies M assignment sentence.val

Predicate logic (unfolded):

  ∀ {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)](M : LRA.EuclideanSpace.TarskiStructure) (Γ : (Subtype fun formula => LRA.Logic.FirstOrder.freeVariables formula = Finset.instEmptyCollection.1) → Prop) (assignment : Variable → M.1) (sentence : Subtype fun formula => LRA.Logic.FirstOrder.freeVariables formula = Finset.instEmptyCollection.1), Set.instMembership.1 Γ sentence → LRA.Logic.FirstOrder.Satisfies M assignment sentence.1

Logical form (Lean):

```lean
def IsTarskiModelOf {Variable : Type} [DecidableEq Variable]
    (M : TarskiStructure) (Γ : TarskiTheory Variable) : Prop :=
  M ∈ TarskiStructuresOfTheory Γ
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
def IsTarskiModelOf {Variable : Type} [DecidableEq Variable]
    (M : TarskiStructure) (Γ : TarskiTheory Variable) : Prop :=
  M ∈ TarskiStructuresOfTheory Γ

/--
`TarskiModelOf` TODO

Predicate logic:

  structure TarskiModelOf {Variable : Type} [DecidableEq Variable]
    (Γ : TarskiTheory Variable) where
  toStructure : TarskiStructure
  isModel : IsTarskiModelOf toStructure Γ

Predicate logic (unfolded):

  structure TarskiModelOf {Variable : Type} [DecidableEq Variable]
    (Γ : TarskiTheory Variable) where
  toStructure : TarskiStructure
  isModel : IsTarskiModelOf toStructure Γ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure TarskiModelOf {Variable : Type} [DecidableEq Variable]
    (Γ : TarskiTheory Variable) where
  toStructure : TarskiStructure
  isModel : IsTarskiModelOf toStructure Γ
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
structure TarskiModelOf {Variable : Type} [DecidableEq Variable]
    (Γ : TarskiTheory Variable) where
  toStructure : TarskiStructure
  isModel : IsTarskiModelOf toStructure Γ

end LRA.EuclideanSpace
