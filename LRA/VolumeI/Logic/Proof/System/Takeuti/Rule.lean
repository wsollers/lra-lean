import LRA.VolumeI.Logic.Proof.System.Takeuti.Judgement

namespace LRA.VolumeI.Logic.Proof.System.Takeuti

/-!
Takeuti LK rule schemata.

The relation `Rule uppers lower` reads downward: the finite list of upper
sequents licenses the lower sequent.
-/

inductive Rule {L : Alphabet} [DecidableEq L.FreeVar] :
    List (Judgement L) -> Judgement L -> Prop
  | weakeningLeft (A : Formula L) (Γ Δ : List (Formula L)) :
      Rule [⟨Γ, Δ⟩] ⟨A :: Γ, Δ⟩
  | weakeningRight (A : Formula L) (Γ Δ : List (Formula L)) :
      Rule [⟨Γ, Δ⟩] ⟨Γ, Δ ++ [A]⟩
  | contractionLeft (A : Formula L) (Γ Δ : List (Formula L)) :
      Rule [⟨A :: A :: Γ, Δ⟩] ⟨A :: Γ, Δ⟩
  | contractionRight (A : Formula L) (Γ Δ : List (Formula L)) :
      Rule [⟨Γ, Δ ++ [A, A]⟩] ⟨Γ, Δ ++ [A]⟩
  | exchangeLeft (A B : Formula L)
      (left middle right : List (Formula L)) :
      Rule [⟨left ++ [A, B] ++ middle, right⟩]
        ⟨left ++ [B, A] ++ middle, right⟩
  | exchangeRight (A B : Formula L)
      (left middle right : List (Formula L)) :
      Rule [⟨left, middle ++ [A, B] ++ right⟩]
        ⟨left, middle ++ [B, A] ++ right⟩
  | cut (A : Formula L)
      (leftAntecedent leftSuccedent rightAntecedent rightSuccedent :
        List (Formula L)) :
      Rule [⟨leftAntecedent, leftSuccedent ++ [A]⟩,
        ⟨A :: rightAntecedent, rightSuccedent⟩]
        ⟨leftAntecedent ++ rightAntecedent, leftSuccedent ++ rightSuccedent⟩
  | negLeft (A : Formula L) (Γ Δ : List (Formula L)) :
      Rule [⟨Γ, Δ ++ [A]⟩] ⟨Formula.neg A :: Γ, Δ⟩
  | negRight (A : Formula L) (Γ Δ : List (Formula L)) :
      Rule [⟨A :: Γ, Δ⟩] ⟨Γ, Δ ++ [Formula.neg A]⟩
  | conjLeftOne (A B : Formula L) (Γ Δ : List (Formula L)) :
      Rule [⟨A :: Γ, Δ⟩] ⟨Formula.conj A B :: Γ, Δ⟩
  | conjLeftTwo (A B : Formula L) (Γ Δ : List (Formula L)) :
      Rule [⟨B :: Γ, Δ⟩] ⟨Formula.conj A B :: Γ, Δ⟩
  | conjRight (A B : Formula L) (Γ Δ : List (Formula L)) :
      Rule [⟨Γ, Δ ++ [A]⟩, ⟨Γ, Δ ++ [B]⟩] ⟨Γ, Δ ++ [Formula.conj A B]⟩
  | disjLeft (A B : Formula L) (Γ Δ : List (Formula L)) :
      Rule [⟨A :: Γ, Δ⟩, ⟨B :: Γ, Δ⟩] ⟨Formula.disj A B :: Γ, Δ⟩
  | disjRightOne (A B : Formula L) (Γ Δ : List (Formula L)) :
      Rule [⟨Γ, Δ ++ [A]⟩] ⟨Γ, Δ ++ [Formula.disj A B]⟩
  | disjRightTwo (A B : Formula L) (Γ Δ : List (Formula L)) :
      Rule [⟨Γ, Δ ++ [B]⟩] ⟨Γ, Δ ++ [Formula.disj A B]⟩
  | implLeft (A B : Formula L)
      (leftAntecedent leftSuccedent rightAntecedent rightSuccedent :
        List (Formula L)) :
      Rule [⟨leftAntecedent, leftSuccedent ++ [A]⟩,
        ⟨B :: rightAntecedent, rightSuccedent⟩]
        ⟨Formula.impl A B :: leftAntecedent ++ rightAntecedent,
          leftSuccedent ++ rightSuccedent⟩
  | implRight (A B : Formula L) (Γ Δ : List (Formula L)) :
      Rule [⟨A :: Γ, Δ ++ [B]⟩] ⟨Γ, Δ ++ [Formula.impl A B]⟩
  | allLeft
      (body : Formula L) (a : L.FreeVar) (x : L.BoundVar) (t : Term L)
      (Γ Δ : List (Formula L)) :
      Rule [⟨body.substFreeByTerm a t :: Γ, Δ⟩]
        ⟨Formula.all x (body.substFreeByBound a x) :: Γ, Δ⟩
  | allRight
      (body : Formula L) (a : L.FreeVar) (x : L.BoundVar)
      (Γ Δ : List (Formula L))
      (hEigen : Not (Judgement.FreeVarOccurs a
        ⟨Γ, Δ ++ [Formula.all x (body.substFreeByBound a x)]⟩)) :
      Rule [⟨Γ, Δ ++ [body]⟩]
        ⟨Γ, Δ ++ [Formula.all x (body.substFreeByBound a x)]⟩
  | exLeft
      (body : Formula L) (a : L.FreeVar) (x : L.BoundVar)
      (Γ Δ : List (Formula L))
      (hEigen : Not (Judgement.FreeVarOccurs a
        ⟨Formula.ex x (body.substFreeByBound a x) :: Γ, Δ⟩)) :
      Rule [⟨body :: Γ, Δ⟩]
        ⟨Formula.ex x (body.substFreeByBound a x) :: Γ, Δ⟩
  | exRight
      (body : Formula L) (a : L.FreeVar) (x : L.BoundVar) (t : Term L)
      (Γ Δ : List (Formula L)) :
      Rule [⟨Γ, Δ ++ [body.substFreeByTerm a t]⟩]
        ⟨Γ, Δ ++ [Formula.ex x (body.substFreeByBound a x)]⟩

def IsInitial {L : Alphabet} (J : Judgement L) : Prop :=
  exists A : Formula L, J = ⟨[A], [A]⟩

end LRA.VolumeI.Logic.Proof.System.Takeuti
