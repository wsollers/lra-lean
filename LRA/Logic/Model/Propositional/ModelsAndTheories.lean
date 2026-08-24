import Mathlib.Data.Set.Defs
import LRA.Logic.Model.Propositional.PropositionalModel

namespace LRA.Logic.Propositional

/--
`modelClass` TODO

Predicate logic:

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (φ : LRA.Logic.Propositional.Formula L) (a : LRA.Logic.Propositional.PropositionalModel L), LRA.Logic.Propositional.evaluate a.valuation φ = Bool.true

Predicate logic (unfolded):

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (φ : LRA.Logic.Propositional.Formula L) (a : LRA.Logic.Propositional.PropositionalModel L), LRA.Logic.Propositional.evaluate a.1 φ = Bool.true

Logical form (Lean):

```lean
def modelClass {L : PropositionalLanguage} (φ : Formula L) : Set (PropositionalModel L) :=
  {M | M.satisfies φ}
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
def modelClass {L : PropositionalLanguage} (φ : Formula L) : Set (PropositionalModel L) :=
  {M | M.satisfies φ}

/--
`ModelsOfTheory` TODO

Predicate logic:

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (Γ : Set (LRA.Logic.Propositional.Formula L)) (a : LRA.Logic.Propositional.PropositionalModel L) (φ : LRA.Logic.Propositional.Formula L), Set.instMembership.mem Γ φ → a.satisfies φ

Predicate logic (unfolded):

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (Γ : LRA.Logic.Propositional.Formula L → Prop) (a : LRA.Logic.Propositional.PropositionalModel L) (φ : LRA.Logic.Propositional.Formula L), Set.instMembership.1 Γ φ → LRA.Logic.Propositional.evaluate a.1 φ = Bool.true

Logical form (Lean):

```lean
def ModelsOfTheory {L : PropositionalLanguage} (Γ : Set (Formula L)) : Set (PropositionalModel L) :=
  {M | ∀ φ ∈ Γ, M.satisfies φ}
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
def ModelsOfTheory {L : PropositionalLanguage} (Γ : Set (Formula L)) : Set (PropositionalModel L) :=
  {M | ∀ φ ∈ Γ, M.satisfies φ}

/--
`TheoryOfModels` TODO

Predicate logic:

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (K : Set (LRA.Logic.Propositional.PropositionalModel L)) (a : LRA.Logic.Propositional.Formula L) (M : LRA.Logic.Propositional.PropositionalModel L), Set.instMembership.mem K M → M.satisfies a

Predicate logic (unfolded):

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (K : LRA.Logic.Propositional.PropositionalModel L → Prop) (a : LRA.Logic.Propositional.Formula L) (M : LRA.Logic.Propositional.PropositionalModel L), Set.instMembership.1 K M → LRA.Logic.Propositional.evaluate M.1 a = Bool.true

Logical form (Lean):

```lean
def TheoryOfModels {L : PropositionalLanguage} (K : Set (PropositionalModel L)) : Set (Formula L) :=
  {φ | ∀ M ∈ K, M.satisfies φ}
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
def TheoryOfModels {L : PropositionalLanguage} (K : Set (PropositionalModel L)) : Set (Formula L) :=
  {φ | ∀ M ∈ K, M.satisfies φ}

/--
`IsValid` TODO

Predicate logic:

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (φ : LRA.Logic.Propositional.Formula L) (M : LRA.Logic.Propositional.PropositionalModel L), M.satisfies φ

Predicate logic (unfolded):

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (φ : LRA.Logic.Propositional.Formula L) (M : LRA.Logic.Propositional.PropositionalModel L), LRA.Logic.Propositional.evaluate M.1 φ = Bool.true

Logical form (Lean):

```lean
def IsValid {L : PropositionalLanguage} (φ : Formula L) : Prop :=
  ∀ M : PropositionalModel L, M.satisfies φ
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
def IsValid {L : PropositionalLanguage} (φ : Formula L) : Prop :=
  ∀ M : PropositionalModel L, M.satisfies φ

/--
`IsSatisfiable` TODO

Predicate logic:

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (Γ : Set (LRA.Logic.Propositional.Formula L)), Exists fun x => Set.instMembership.mem (LRA.Logic.Propositional.ModelsOfTheory Γ) x

Predicate logic (unfolded):

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (Γ : LRA.Logic.Propositional.Formula L → Prop), Exists fun x => Set.instMembership.1 (fun M => ∀ (φ : LRA.Logic.Propositional.Formula L), Set.instMembership.1 Γ φ → LRA.Logic.Propositional.evaluate M.1 φ = Bool.true) x

Logical form (Lean):

```lean
def IsSatisfiable {L : PropositionalLanguage} (Γ : Set (Formula L)) : Prop :=
  (ModelsOfTheory Γ).Nonempty
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
def IsSatisfiable {L : PropositionalLanguage} (Γ : Set (Formula L)) : Prop :=
  (ModelsOfTheory Γ).Nonempty

/--
`SemanticConsequence` TODO

Predicate logic:

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (Γ : Set (LRA.Logic.Propositional.Formula L)) (φ : LRA.Logic.Propositional.Formula L) ⦃a : LRA.Logic.Propositional.PropositionalModel L⦄, Set.instMembership.mem (LRA.Logic.Propositional.ModelsOfTheory Γ) a → Set.instMembership.mem (LRA.Logic.Propositional.modelClass φ) a

Predicate logic (unfolded):

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (Γ : LRA.Logic.Propositional.Formula L → Prop) (φ : LRA.Logic.Propositional.Formula L) ⦃a : LRA.Logic.Propositional.PropositionalModel L⦄, Set.instMembership.1 (fun M => ∀ (φ : LRA.Logic.Propositional.Formula L), Set.instMembership.1 Γ φ → LRA.Logic.Propositional.evaluate M.1 φ = Bool.true) a → Set.instMembership.1 (fun M => LRA.Logic.Propositional.evaluate M.1 φ = Bool.true)a

Logical form (Lean):

```lean
def SemanticConsequence {L : PropositionalLanguage} (Γ : Set (Formula L)) (φ : Formula L) : Prop :=
  ModelsOfTheory Γ ⊆ modelClass φ
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
def SemanticConsequence {L : PropositionalLanguage} (Γ : Set (Formula L)) (φ : Formula L) : Prop :=
  ModelsOfTheory Γ ⊆ modelClass φ

scoped notation:50 Γ " ⊨ₜ " φ => SemanticConsequence Γ φ

end LRA.Logic.Propositional
