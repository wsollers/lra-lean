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

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = Γ : LRA.ModelTheory.FirstOrder.Theory S Variable (a : LRA.ModelTheory.FirstOrder.Model S) (assignment : Variable → a.Domain) (sentence : LRA.Logic.FirstOrder.Sentence S Variable), sentence ∈ Γ → LRA.Logic.FirstOrder.Satisfies a assignment sentence.val

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    sentence ∈ Γ → LRA.Logic.FirstOrder.Satisfies a assignment sentence.1

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

Related proof moves: unfold

-/
abbrev TarskiStructuresOfTheory {Variable : Type} [DecidableEq Variable]
    (Γ : TarskiTheory Variable) :
    Set TarskiStructure :=
  LRA.ModelTheory.FirstOrder.ModelsOfTheory Γ

/--
`IsTarskiModelOf` TODO

Predicate logic:

  ∀ {Variable : Type} [inst : DecidableVariable] = M : LRA.EuclideanSpace.TarskiStructure (Γ : LRA.EuclideanSpace.TarskiTheory Variable) (assignment : Variable → M.Domain) (sentence : LRA.Logic.FirstOrder.Sentence LRA.EuclideanSpace.TarskiFirstOrderSignature Variable), sentence ∈ Γ → LRA.Logic.FirstOrder.Satisfies M assignment sentence.val

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    sentence ∈ Γ → LRA.Logic.FirstOrder.Satisfies M assignment sentence.1

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
