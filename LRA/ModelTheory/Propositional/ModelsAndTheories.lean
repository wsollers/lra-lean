import Mathlib.Data.Set.Defs
import LRA.ModelTheory.Propositional.PropositionalModel

open LRA.Logic

open LRA.Logic.Propositional

namespace LRA.ModelTheory.Propositional

/--
`modelClass` TODO

Predicate logic:

  ∀ {L : LRA.ModelTheory.Propositional.PropositionalLanguage} (φ : LRA.ModelTheory.Propositional.Formula L) (a : LRA.ModelTheory.Propositional.PropositionalModel L), LRA.ModelTheory.Propositional.evaluate a.valuation φ = Bool.true

Predicate logic (unfolded):

  ∀ {L : LRA.ModelTheory.Propositional.PropositionalLanguage} (φ : LRA.ModelTheory.Propositional.Formula L) (a : LRA.ModelTheory.Propositional.PropositionalModel L), LRA.ModelTheory.Propositional.evaluate a.1 φ = Bool.true

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

  ∀ {L : LRA.ModelTheory.Propositional.PropositionalLanguage} (Γ : Set (LRA.ModelTheory.Propositional.Formula L)) (a : LRA.ModelTheory.Propositional.PropositionalModel L) (φ : LRA.ModelTheory.Propositional.Formula L), Set.instMembership.mem Γ φ → a.satisfies φ

Predicate logic (unfolded):

  ∀ {L : LRA.ModelTheory.Propositional.PropositionalLanguage} (Γ : LRA.ModelTheory.Propositional.Formula L → Prop) (a : LRA.ModelTheory.Propositional.PropositionalModel L) (φ : LRA.ModelTheory.Propositional.Formula L), Set.instMembership.1 Γ φ → LRA.ModelTheory.Propositional.evaluate a.1 φ = Bool.true

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

  ∀ {L : LRA.ModelTheory.Propositional.PropositionalLanguage} (K : Set (LRA.ModelTheory.Propositional.PropositionalModel L)) (a : LRA.ModelTheory.Propositional.Formula L) (M : LRA.ModelTheory.Propositional.PropositionalModel L), Set.instMembership.mem K M → M.satisfies a

Predicate logic (unfolded):

  ∀ {L : LRA.ModelTheory.Propositional.PropositionalLanguage} (K : LRA.ModelTheory.Propositional.PropositionalModel L → Prop) (a : LRA.ModelTheory.Propositional.Formula L) (M : LRA.ModelTheory.Propositional.PropositionalModel L), Set.instMembership.1 K M → LRA.ModelTheory.Propositional.evaluate M.1 a = Bool.true

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

  ∀ {L : LRA.ModelTheory.Propositional.PropositionalLanguage} (φ : LRA.ModelTheory.Propositional.Formula L) (M : LRA.ModelTheory.Propositional.PropositionalModel L), M.satisfies φ

Predicate logic (unfolded):

  ∀ {L : LRA.ModelTheory.Propositional.PropositionalLanguage} (φ : LRA.ModelTheory.Propositional.Formula L) (M : LRA.ModelTheory.Propositional.PropositionalModel L), LRA.ModelTheory.Propositional.evaluate M.1 φ = Bool.true

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

  ∀ {L : LRA.ModelTheory.Propositional.PropositionalLanguage} (Γ : Set (LRA.ModelTheory.Propositional.Formula L)), Exists fun x => Set.instMembership.mem (LRA.ModelTheory.Propositional.ModelsOfTheory Γ) x

Predicate logic (unfolded):

  ∀ {L : LRA.ModelTheory.Propositional.PropositionalLanguage} (Γ : LRA.ModelTheory.Propositional.Formula L → Prop), Exists fun x => Set.instMembership.1 (fun M => ∀ (φ : LRA.ModelTheory.Propositional.Formula L), Set.instMembership.1 Γ φ → LRA.ModelTheory.Propositional.evaluate M.1 φ = Bool.true) x

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

  ∀ {L : LRA.ModelTheory.Propositional.PropositionalLanguage} (Γ : Set (LRA.ModelTheory.Propositional.Formula L)) (φ : LRA.ModelTheory.Propositional.Formula L) ⦃a : LRA.ModelTheory.Propositional.PropositionalModel L⦄, Set.instMembership.mem (LRA.ModelTheory.Propositional.ModelsOfTheory Γ) a → Set.instMembership.mem (LRA.ModelTheory.Propositional.modelClass φ) a

Predicate logic (unfolded):

  ∀ {L : LRA.ModelTheory.Propositional.PropositionalLanguage} (Γ : LRA.ModelTheory.Propositional.Formula L → Prop) (φ : LRA.ModelTheory.Propositional.Formula L) ⦃a : LRA.ModelTheory.Propositional.PropositionalModel L⦄, Set.instMembership.1 (fun M => ∀ (φ : LRA.ModelTheory.Propositional.Formula L), Set.instMembership.1 Γ φ → LRA.ModelTheory.Propositional.evaluate M.1 φ = Bool.true) a → Set.instMembership.1 (fun M => LRA.ModelTheory.Propositional.evaluate M.1 φ = Bool.true)a

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

end LRA.ModelTheory.Propositional
