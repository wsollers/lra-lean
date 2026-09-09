import LRA.Logic.Syntax.Propositional.Formula
import LRA.Logic.Syntax.FirstOrder.Sentence
import LRA.Logic.Semantics.Satisfaction

namespace LRA.Logic.Propositional

/--
`LogicallyEquivalent` Two propositional formulas are logically equivalent when they have the same truth value under every truth assignment.

Predicate logic:

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (φ ψ : LRA.Logic.Propositional.Formula L) (valuation : L.Atoms → Bool), LRA.Logic.Propositional.evaluate valuation φ = LRA.Logic.Propositional.evaluate valuation ψ

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Logic.Propositional.evaluate valuation φ = LRA.Logic.Propositional.evaluate valuation ψ

Logical form (Lean):

```lean
def LogicallyEquivalent {L : PropositionalLanguage} (φ ψ : Formula L) : Prop :=
  ∀ valuation : L.Atoms -> Bool, evaluate valuation φ = evaluate valuation ψ
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
def LogicallyEquivalent {L : PropositionalLanguage} (φ ψ : Formula L) : Prop :=
  ∀ valuation : L.Atoms -> Bool, evaluate valuation φ = evaluate valuation ψ

/--
`logicallyEquivalent_refl` TODO

Predicate logic:

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (φ : LRA.Logic.Propositional.Formula L), LRA.Logic.Propositional.LogicallyEquivalent φ φ

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    L : PropositionalLanguage
    φ : Formula L
  Prove
    LRA.Logic.Propositional.evaluate valuation φ = LRA.Logic.Propositional.evaluate valuation φ

Logical form (Lean):

```lean
theorem logicallyEquivalent_refl {L : PropositionalLanguage} (φ : Formula L) :
    LogicallyEquivalent φ φ
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
theorem logicallyEquivalent_refl {L : PropositionalLanguage} (φ : Formula L) :
    LogicallyEquivalent φ φ := by
  intro valuation
  rfl

/--
`logicallyEquivalent_symm` TODO

Predicate logic:

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} {φ ψ : LRA.Logic.Propositional.Formula L}, LRA.Logic.Propositional.LogicallyEquivalent φ ψ → LRA.Logic.Propositional.LogicallyEquivalent ψ φ

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    L : PropositionalLanguage
    φ ψ : Formula L
    h : LogicallyEquivalent φ ψ
  Prove
    (∀ (valuation : L.1 → Bool), LRA.Logic.Propositional.evaluate valuation φ = LRA.Logic.Propositional.evaluate valuation ψ) → ∀ (valuation : L.1 → Bool), LRA.Logic.Propositional.evaluate valuation ψ = LRA.Logic.Propositional.evaluate valuation φ

Logical form (Lean):

```lean
theorem logicallyEquivalent_symm {L : PropositionalLanguage} {φ ψ : Formula L}
    (h : LogicallyEquivalent φ ψ) : LogicallyEquivalent ψ φ
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
theorem logicallyEquivalent_symm {L : PropositionalLanguage} {φ ψ : Formula L}
    (h : LogicallyEquivalent φ ψ) : LogicallyEquivalent ψ φ := by
  intro valuation
  exact (h valuation).symm

/--
`logicallyEquivalent_trans` TODO

Predicate logic:

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} {φ ψ χ : LRA.Logic.Propositional.Formula L}, (LRA.Logic.Propositional.LogicallyEquivalent φ ψ ∧ LRA.Logic.Propositional.LogicallyEquivalent ψ χ) → LRA.Logic.Propositional.LogicallyEquivalent φ χ

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    L : PropositionalLanguage
    φ ψ χ : Formula L
    hφψ : LogicallyEquivalent φ ψ
    hψχ : LogicallyEquivalent ψ χ
  Prove
    ((∀ (valuation : L.1 → Bool), LRA.Logic.Propositional.evaluate valuation φ = LRA.Logic.Propositional.evaluate valuation ψ) ∧ (∀ (valuation : L.1 → Bool), LRA.Logic.Propositional.evaluate valuation ψ = LRA.Logic.Propositional.evaluate valuation χ)) → ∀ (valuation : L.1 → Bool), LRA.Logic.Propositional.evaluate valuation φ = LRA.Logic.Propositional.evaluate valuation χ

Logical form (Lean):

```lean
theorem logicallyEquivalent_trans {L : PropositionalLanguage} {φ ψ χ : Formula L}
    (hφψ : LogicallyEquivalent φ ψ) (hψχ : LogicallyEquivalent ψ χ) :
    LogicallyEquivalent φ χ
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
theorem logicallyEquivalent_trans {L : PropositionalLanguage} {φ ψ χ : Formula L}
    (hφψ : LogicallyEquivalent φ ψ) (hψχ : LogicallyEquivalent ψ χ) :
    LogicallyEquivalent φ χ := by
  intro valuation
  exact Eq.trans (hφψ valuation) (hψχ valuation)

/--
`logicalEquivalenceSetoid` TODO

Predicate logic:

  def logicalEquivalenceSetoid (L : PropositionalLanguage) : Setoid (Formula L) where
    r := LogicallyEquivalent
    iseqv :=
      ⟨fun φ => logicallyEquivalent_refl φ,
        fun h => logicallyEquivalent_symm h,
        fun hφψ hψχ => logicallyEquivalent_trans hφψ hψχ⟩

Predicate logic (unfolded):

  def logicalEquivalenceSetoid (L : PropositionalLanguage) : Setoid (Formula L) where
    r := LogicallyEquivalent
    iseqv :=
      ⟨fun φ => logicallyEquivalent_refl φ,
        fun h => logicallyEquivalent_symm h,
        fun hφψ hψχ => logicallyEquivalent_trans hφψ hψχ⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def logicalEquivalenceSetoid (L : PropositionalLanguage) : Setoid (Formula L) where
  r := LogicallyEquivalent
  iseqv :=
    ⟨fun φ => logicallyEquivalent_refl φ,
      fun h => logicallyEquivalent_symm h,
      fun hφψ hψχ => logicallyEquivalent_trans hφψ hψχ⟩
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
def logicalEquivalenceSetoid (L : PropositionalLanguage) : Setoid (Formula L) where
  r := LogicallyEquivalent
  iseqv :=
    ⟨fun φ => logicallyEquivalent_refl φ,
      fun h => logicallyEquivalent_symm h,
      fun hφψ hψχ => logicallyEquivalent_trans hφψ hψχ⟩

/--
`LogicalEquivalenceClass` The semantic equivalence class of a propositional formula.

Predicate logic:

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (φ a : LRA.Logic.Propositional.Formula L) (valuation : L.Atoms → Bool), LRA.Logic.Propositional.evaluate valuation a = LRA.Logic.Propositional.evaluate valuation φ

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Logic.Propositional.evaluate valuation a = LRA.Logic.Propositional.evaluate valuation φ

Logical form (Lean):

```lean
def LogicalEquivalenceClass {L : PropositionalLanguage} (φ : Formula L) :
    Set (Formula L) :=
  { ψ | LogicallyEquivalent ψ φ }
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
def LogicalEquivalenceClass {L : PropositionalLanguage} (φ : Formula L) :
    Set (Formula L) :=
  { ψ | LogicallyEquivalent ψ φ }

/--
`SemanticQuotient` The quotient of propositional formulas by semantic logical equivalence.

Predicate logic:

  abbrev SemanticQuotient (L : PropositionalLanguage) :=
    Quotient (logicalEquivalenceSetoid L)

Predicate logic (unfolded):

  abbrev SemanticQuotient (L : PropositionalLanguage) :=
    Quotient (logicalEquivalenceSetoid L) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev SemanticQuotient (L : PropositionalLanguage) :=
  Quotient (logicalEquivalenceSetoid L)
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
abbrev SemanticQuotient (L : PropositionalLanguage) :=
  Quotient (logicalEquivalenceSetoid L)

end LRA.Logic.Propositional

namespace LRA.Logic.FirstOrder

universe u

/--
`SentenceLogicallyEquivalent` Two first-order sentences are logically equivalent when they have the same satisfaction behavior in every structure, equivalently under every assignment.

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = φ ψ : LRA.Logic.FirstOrder.Sentence S Variable (M : LRA.Logic.FirstOrder.Interpretation S) (assignment : Variable → M.Domain), LRA.Logic.FirstOrder.Satisfies M assignment φ.val ↔ LRA.Logic.FirstOrder.Satisfies M assignment ψ.val

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Logic.FirstOrder.Satisfies M assignment φ.val ↔ LRA.Logic.FirstOrder.Satisfies M assignment ψ.val

Logical form (Lean):

```lean
def SentenceLogicallyEquivalent
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (φ ψ : Sentence S Variable) : Prop :=
  ∀ M : Interpretation.{u} S, ∀ assignment : Variable -> M.Domain,
    Satisfies M assignment φ.val ↔ Satisfies M assignment ψ.val
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
def SentenceLogicallyEquivalent
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (φ ψ : Sentence S Variable) : Prop :=
  ∀ M : Interpretation.{u} S, ∀ assignment : Variable -> M.Domain,
    Satisfies M assignment φ.val ↔ Satisfies M assignment ψ.val

/--
`sentenceLogicallyEquivalent_refl` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = φ : LRA.Logic.FirstOrder.Sentence S Variable, LRA.Logic.FirstOrder.SentenceLogicallyEquivalent φ φ

Predicate logic (unfolded):

  Ambient
    (Variable)
  Objects
    S : Signature
    φ : Sentence S Variable
  Prove
    LRA.Logic.FirstOrder.Satisfies M assignment φ.1 ↔ LRA.Logic.FirstOrder.Satisfies M assignment φ.1

Logical form (Lean):

```lean
theorem sentenceLogicallyEquivalent_refl
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (φ : Sentence S Variable) : SentenceLogicallyEquivalent.{u} φ φ
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
theorem sentenceLogicallyEquivalent_refl
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (φ : Sentence S Variable) : SentenceLogicallyEquivalent.{u} φ φ := by
  intro M assignment
  rfl

/--
`sentenceLogicallyEquivalent_symm` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = {φ ψ : LRA.Logic.FirstOrder.Sentence S Variable}, LRA.Logic.FirstOrder.SentenceLogicallyEquivalent φ ψ → LRA.Logic.FirstOrder.SentenceLogicallyEquivalent ψ φ

Predicate logic (unfolded):

  Ambient
    (Variable)
  Objects
    S : Signature
    φ ψ : Sentence S Variable
    h : SentenceLogicallyEquivalent.{u} φ ψ
  Prove
    (∀ (M : LRA.Logic.FirstOrder.Interpretation S) (assignment : Variable → M.1), LRA.Logic.FirstOrder.Satisfies M assignment φ.1 ↔ LRA.Logic.FirstOrder.Satisfies M assignment ψ.1) → ∀ (M : LRA.Logic.FirstOrder.Interpretation S) (assignment : Variable → M.1), LRA.Logic.FirstOrder.Satisfies M assignment ψ.1 ↔ LRA.Logic.FirstOrder.Satisfies M assignment φ.1

Logical form (Lean):

```lean
theorem sentenceLogicallyEquivalent_symm
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    {φ ψ : Sentence S Variable}
    (h : SentenceLogicallyEquivalent.{u} φ ψ) :
    SentenceLogicallyEquivalent.{u} ψ φ
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
theorem sentenceLogicallyEquivalent_symm
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    {φ ψ : Sentence S Variable}
    (h : SentenceLogicallyEquivalent.{u} φ ψ) :
    SentenceLogicallyEquivalent.{u} ψ φ := by
  intro M assignment
  exact (h M assignment).symm

/--
`sentenceLogicallyEquivalent_trans` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = {φ ψ χ : LRA.Logic.FirstOrder.Sentence S Variable}, (LRA.Logic.FirstOrder.SentenceLogicallyEquivalent φ ψ ∧ LRA.Logic.FirstOrder.SentenceLogicallyEquivalent ψ χ) → LRA.Logic.FirstOrder.SentenceLogicallyEquivalent φ χ

Predicate logic (unfolded):

  Ambient
    (Variable)
  Objects
    S : Signature
    φ ψ χ : Sentence S Variable
    hφψ : SentenceLogicallyEquivalent.{u} φ ψ
    hψχ : SentenceLogicallyEquivalent.{u} ψ χ
  Prove
    ((∀ (M : LRA.Logic.FirstOrder.Interpretation S) (assignment : Variable → M.1), LRA.Logic.FirstOrder.Satisfies M assignment φ.1 ↔ LRA.Logic.FirstOrder.Satisfies M assignment ψ.1) ∧ (∀ (M : LRA.Logic.FirstOrder.Interpretation S) (assignment : Variable → M.1), LRA.Logic.FirstOrder.Satisfies M assignment ψ.1 ↔ LRA.Logic.FirstOrder.Satisfies M assignment χ.1)) → ∀ (M : LRA.Logic.FirstOrder.Interpretation S) (assignment : Variable → M.1), LRA.Logic.FirstOrder.Satisfies M assignment φ.1 ↔ LRA.Logic.FirstOrder.Satisfies M assignment χ.1

Logical form (Lean):

```lean
theorem sentenceLogicallyEquivalent_trans
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    {φ ψ χ : Sentence S Variable}
    (hφψ : SentenceLogicallyEquivalent.{u} φ ψ)
    (hψχ : SentenceLogicallyEquivalent.{u} ψ χ) :
    SentenceLogicallyEquivalent.{u} φ χ
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
theorem sentenceLogicallyEquivalent_trans
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    {φ ψ χ : Sentence S Variable}
    (hφψ : SentenceLogicallyEquivalent.{u} φ ψ)
    (hψχ : SentenceLogicallyEquivalent.{u} ψ χ) :
    SentenceLogicallyEquivalent.{u} φ χ := by
  intro M assignment
  exact Iff.trans (hφψ M assignment) (hψχ M assignment)

/--
`sentenceLogicalEquivalenceSetoid` TODO

Predicate logic:

  def sentenceLogicalEquivalenceSetoid
      (S : Signature) (Variable : Type) [DecidableEq Variable] :
      Setoid (Sentence S Variable) where
    r := SentenceLogicallyEquivalent.{u}
    iseqv :=
      ⟨fun φ => sentenceLogicallyEquivalent_refl φ,
        fun h => sentenceLogicallyEquivalent_symm h,
        fun hφψ hψχ => sentenceLogicallyEquivalent_trans hφψ hψχ⟩

Predicate logic (unfolded):

  def sentenceLogicalEquivalenceSetoid
      (S : Signature) (Variable : Type) [DecidableEq Variable] :
      Setoid (Sentence S Variable) where
    r := SentenceLogicallyEquivalent.{u}
    iseqv :=
      ⟨fun φ => sentenceLogicallyEquivalent_refl φ,
        fun h => sentenceLogicallyEquivalent_symm h,
        fun hφψ hψχ => sentenceLogicallyEquivalent_trans hφψ hψχ⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def sentenceLogicalEquivalenceSetoid
    (S : Signature) (Variable : Type) [DecidableEq Variable] :
    Setoid (Sentence S Variable) where
  r := SentenceLogicallyEquivalent.{u}
  iseqv :=
    ⟨fun φ => sentenceLogicallyEquivalent_refl φ,
      fun h => sentenceLogicallyEquivalent_symm h,
      fun hφψ hψχ => sentenceLogicallyEquivalent_trans hφψ hψχ⟩
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
def sentenceLogicalEquivalenceSetoid
    (S : Signature) (Variable : Type) [DecidableEq Variable] :
    Setoid (Sentence S Variable) where
  r := SentenceLogicallyEquivalent.{u}
  iseqv :=
    ⟨fun φ => sentenceLogicallyEquivalent_refl φ,
      fun h => sentenceLogicallyEquivalent_symm h,
      fun hφψ hψχ => sentenceLogicallyEquivalent_trans hφψ hψχ⟩

/--
`SentenceLogicalEquivalenceClass` The semantic equivalence class of a first-order sentence.

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = φ a : LRA.Logic.FirstOrder.Sentence S Variable (M : LRA.Logic.FirstOrder.Interpretation S) (assignment : Variable → M.Domain), LRA.Logic.FirstOrder.Satisfies M assignment a.val ↔ LRA.Logic.FirstOrder.Satisfies M assignment φ.val

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Logic.FirstOrder.Satisfies M assignment a.val ↔ LRA.Logic.FirstOrder.Satisfies M assignment φ.val

Logical form (Lean):

```lean
def SentenceLogicalEquivalenceClass
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (φ : Sentence S Variable) : Set (Sentence S Variable) :=
  { ψ | SentenceLogicallyEquivalent.{u} ψ φ }
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
def SentenceLogicalEquivalenceClass
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (φ : Sentence S Variable) : Set (Sentence S Variable) :=
  { ψ | SentenceLogicallyEquivalent.{u} ψ φ }

/--
`SentenceSemanticQuotient` The quotient of first-order sentences by semantic logical equivalence.

Predicate logic:

  abbrev SentenceSemanticQuotient
      (S : Signature) (Variable : Type) [DecidableEq Variable] :=
    Quotient (sentenceLogicalEquivalenceSetoid.{u} S Variable)

Predicate logic (unfolded):

  abbrev SentenceSemanticQuotient
      (S : Signature) (Variable : Type) [DecidableEq Variable] :=
    Quotient (sentenceLogicalEquivalenceSetoid.{u} S Variable) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev SentenceSemanticQuotient
    (S : Signature) (Variable : Type) [DecidableEq Variable] :=
  Quotient (sentenceLogicalEquivalenceSetoid.{u} S Variable)
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
abbrev SentenceSemanticQuotient
    (S : Signature) (Variable : Type) [DecidableEq Variable] :=
  Quotient (sentenceLogicalEquivalenceSetoid.{u} S Variable)

end LRA.Logic.FirstOrder
