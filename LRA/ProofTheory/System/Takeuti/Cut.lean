import LRA.ProofTheory.System.Derivation
import LRA.ProofTheory.System.Takeuti.LK
import LRA.ProofTheory.System.Takeuti.LJ

namespace LRA.ProofTheory.System.Takeuti

/--
`IsCutRuleShape` TODO

Predicate logic:

  ∀ {L : LRA.ProofTheory.System.Takeuti.Alphabet} (uppers : List (LRA.ProofTheory.System.Takeuti.Judgement L)) (lower : LRA.ProofTheory.System.Takeuti.Judgement L), Exists fun A => Exists fun leftAntecedent => Exists fun leftSuccedent => Exists fun rightAntecedent => Exists fun rightSuccedent => (uppers = List.cons { antecedent := leftAntecedent, succedent := instHAppendOfAppend.hAppend leftSuccedent (List.cons A List.nil) } (List.cons { antecedent := List.cons A rightAntecedent, succedent := rightSuccedent } List.nil) ∧ lower = { antecedent := instHAppendOfAppend.hAppend leftAntecedent rightAntecedent, succedent := instHAppendOfAppend.hAppend leftSuccedent rightSuccedent })

Predicate logic (unfolded):

  ∀ {L : LRA.ProofTheory.System.Takeuti.Alphabet} (uppers : List (LRA.ProofTheory.System.Takeuti.Judgement L)) (lower : LRA.ProofTheory.System.Takeuti.Judgement L), Exists fun A => Exists fun leftAntecedent => Exists fun leftSuccedent => Exists fun rightAntecedent => Exists fun rightSuccedent => (uppers = List.cons { antecedent := leftAntecedent, succedent := instHAppendOfAppend.1 leftSuccedent (List.cons A List.nil) } (List.cons { antecedent := List.cons A rightAntecedent, succedent := rightSuccedent } List.nil) ∧ lower = { antecedent := instHAppendOfAppend.1 leftAntecedent rightAntecedent, succedent := instHAppendOfAppend.1 leftSuccedent rightSuccedent })

Logical form (Lean):

```lean
def IsCutRuleShape {L : Alphabet}
    (uppers : List (Judgement L)) (lower : Judgement L) : Prop :=
  exists (A : Formula L)
      (leftAntecedent leftSuccedent rightAntecedent rightSuccedent :
        List (Formula L)),
    uppers =
        [⟨leftAntecedent, leftSuccedent ++ [A]⟩,
          ⟨A :: rightAntecedent, rightSuccedent⟩] /\
      lower =
        ⟨leftAntecedent ++ rightAntecedent, leftSuccedent ++ rightSuccedent⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def IsCutRuleShape {L : Alphabet}
    (uppers : List (Judgement L)) (lower : Judgement L) : Prop :=
  exists (A : Formula L)
      (leftAntecedent leftSuccedent rightAntecedent rightSuccedent :
        List (Formula L)),
    uppers =
        [⟨leftAntecedent, leftSuccedent ++ [A]⟩,
          ⟨A :: rightAntecedent, rightSuccedent⟩] /\
      lower =
        ⟨leftAntecedent ++ rightAntecedent, leftSuccedent ++ rightSuccedent⟩

end LRA.ProofTheory.System.Takeuti
