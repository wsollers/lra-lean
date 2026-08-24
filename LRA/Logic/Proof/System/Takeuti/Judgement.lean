import LRA.Logic.Proof.System.Takeuti.Formula

namespace LRA.Logic.Proof.System.Takeuti

/--
`Judgement` TODO

Predicate logic:

  structure Judgement (L : Alphabet) where
  antecedent : List (Formula L)
  succedent : List (Formula L)

Predicate logic (unfolded):

  structure Judgement (L : Alphabet) where
  antecedent : List (Formula L)
  succedent : List (Formula L) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Judgement (L : Alphabet) where
  antecedent : List (Formula L)
  succedent : List (Formula L)
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
structure Judgement (L : Alphabet) where
  antecedent : List (Formula L)
  succedent : List (Formula L)

/--
`Sequent` TODO

Predicate logic:

  abbrev Sequent := Judgement

Predicate logic (unfolded):

  abbrev Sequent := Judgement (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Sequent := Judgement
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
abbrev Sequent := Judgement

/--
`Judgement.FreeVarOccurs` TODO

Predicate logic:

  ∀ {L : LRA.Logic.Proof.System.Takeuti.Alphabet} (a : L.FreeVar) (J : LRA.Logic.Proof.System.Takeuti.Judgement L), Or (Exists fun A => (List.instMembership.mem J.antecedent A ∧ LRA.Logic.Proof.System.Takeuti.Formula.FreeVarOccurs a A)) (Exists fun A => (List.instMembership.mem J.succedent A ∧ LRA.Logic.Proof.System.Takeuti.Formula.FreeVarOccurs a A))

Predicate logic (unfolded):

  ∀ {L : LRA.Logic.Proof.System.Takeuti.Alphabet} (a : L.1) (J : LRA.Logic.Proof.System.Takeuti.Judgement L), Or (Exists fun A => (List.instMembership.1 J.1 A ∧ LRA.Logic.Proof.System.Takeuti.Formula.FreeVarOccurs a A)) (Exists fun A => (List.instMembership.1 J.2 A ∧ LRA.Logic.Proof.System.Takeuti.Formula.FreeVarOccurs a A))

Logical form (Lean):

```lean
def Judgement.FreeVarOccurs {L : Alphabet} (a : L.FreeVar)
    (J : Judgement L) : Prop :=
  (exists A, A ∈ J.antecedent /\ A.FreeVarOccurs a) \/
    (exists A, A ∈ J.succedent /\ A.FreeVarOccurs a)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, Or.inl, Or.inr, use, unfold

-/
def Judgement.FreeVarOccurs {L : Alphabet} (a : L.FreeVar)
    (J : Judgement L) : Prop :=
  (exists A, A ∈ J.antecedent /\ A.FreeVarOccurs a) \/
    (exists A, A ∈ J.succedent /\ A.FreeVarOccurs a)

/--
`Judgement.IsIntuitionistic` TODO

Predicate logic:

  ∀ {L : LRA.Logic.Proof.System.Takeuti.Alphabet} (J : LRA.Logic.Proof.System.Takeuti.Judgement L), J.succedent.length.le 1

Predicate logic (unfolded):

  ∀ {L : LRA.Logic.Proof.System.Takeuti.Alphabet} (J : LRA.Logic.Proof.System.Takeuti.Judgement L), J.2.length.le (instOfNatNat 1).1

Logical form (Lean):

```lean
def Judgement.IsIntuitionistic {L : Alphabet} (J : Judgement L) : Prop :=
  J.succedent.length <= 1
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
def Judgement.IsIntuitionistic {L : Alphabet} (J : Judgement L) : Prop :=
  J.succedent.length <= 1

end LRA.Logic.Proof.System.Takeuti
