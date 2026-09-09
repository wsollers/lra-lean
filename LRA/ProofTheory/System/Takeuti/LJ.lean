import LRA.ProofTheory.System.Basic
import LRA.ProofTheory.System.Takeuti.Rule

namespace LRA.ProofTheory.System.Takeuti

/--
`LJRule` TODO

Predicate logic:

  ∀ {L : LRA.ProofTheory.System.Takeuti.Alphabet} [inst : DecidableL.FreeVar] = uppers : List (LRA.ProofTheory.System.Takeuti.Judgement L) (lower : LRA.ProofTheory.System.Takeuti.Judgement L), (LRA.ProofTheory.System.Takeuti.Rule uppers lower ∧ (lower.IsIntuitionistic ∧ (∀ (upper : LRA.ProofTheory.System.Takeuti.Judgement L), List.upper ∈ uppers → upper.IsIntuitionistic)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (LRA.ProofTheory.System.Takeuti.Rule uppers lower ∧ (instLENat.le lower.2.length 1 ∧ (∀ (upper : LRA.ProofTheory.System.Takeuti.Judgement L), List.upper ∈ uppers → instLENat.le upper.2.length 1)))

Logical form (Lean):

```lean
def LJRule {L : Alphabet} [DecidableEq L.FreeVar]
    (uppers : List (Judgement L)) (lower : Judgement L) : Prop :=
  Rule uppers lower /\
    lower.IsIntuitionistic /\
    forall upper, upper ∈ uppers -> upper.IsIntuitionistic
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def LJRule {L : Alphabet} [DecidableEq L.FreeVar]
    (uppers : List (Judgement L)) (lower : Judgement L) : Prop :=
  Rule uppers lower /\
    lower.IsIntuitionistic /\
    forall upper, upper ∈ uppers -> upper.IsIntuitionistic

/--
`LJ` TODO

Predicate logic:

  def LJ (L : Alphabet) [DecidableEq L.FreeVar] :
      LRA.ProofTheory.System.ProofSystem where
    Judgement := Judgement L
    IsInitial := fun J => IsInitial J /\ J.IsIntuitionistic
    Rule := LJRule

Predicate logic (unfolded):

  def LJ (L : Alphabet) [DecidableEq L.FreeVar] :
      LRA.ProofTheory.System.ProofSystem where
    Judgement := Judgement L
    IsInitial := fun J => IsInitial J /\ J.IsIntuitionistic
    Rule := LJRule (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def LJ (L : Alphabet) [DecidableEq L.FreeVar] :
    LRA.ProofTheory.System.ProofSystem where
  Judgement := Judgement L
  IsInitial := fun J => IsInitial J /\ J.IsIntuitionistic
  Rule := LJRule
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def LJ (L : Alphabet) [DecidableEq L.FreeVar] :
    LRA.ProofTheory.System.ProofSystem where
  Judgement := Judgement L
  IsInitial := fun J => IsInitial J /\ J.IsIntuitionistic
  Rule := LJRule

end LRA.ProofTheory.System.Takeuti
