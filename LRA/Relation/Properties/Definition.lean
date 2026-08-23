import LRA.Relation.Definition

namespace LRA.Relation
universe u v

                   
def Reflexive {α : Type u} (R : Endorelation α) : Prop := ∀ x, R x x
                     
def Irreflexive {α : Type u} (R : Endorelation α) : Prop := ∀ x, ¬ R x x
                
def Symmetric {α : Type u} (R : Endorelation α) : Prop := ∀ x y, R x y → R y x
                    
def Antisymmetric {α : Type u} (R : Endorelation α) : Prop := ∀ x y, R x y → R y x → x = y
                 
def Asymmetric {α : Type u} (R : Endorelation α) : Prop := ∀ x y, R x y → ¬ R y x
                    
def Transitive {α : Type u} (R : Endorelation α) : Prop := ∀ x y z, R x y → R y z → R x z
                                                           
def Connex {α : Type u} (R : Endorelation α) : Prop := ∀ x y, R x y ∨ R y x
                                                                         
def Total {α : Type u} (R : Endorelation α) : Prop := Connex R
                                                            
def Trichotomous {α : Type u} (R : Endorelation α) : Prop := ∀ x y, R x y ∨ x = y ∨ R y x
                                               
def ExactlyOneOfThree (P Q S : Prop) : Prop :=
  (P ∧ ¬ Q ∧ ¬ S) ∨ (Q ∧ ¬ P ∧ ¬ S) ∨ (S ∧ ¬ P ∧ ¬ Q)
                                                                      
def ExactlyTrichotomous {α : Type u} (R : Endorelation α) : Prop :=
  ∀ x y, ExactlyOneOfThree (R x y) (x = y) (R y x)
                               
def LeftEuclidean {α : Type u} (R : Endorelation α) : Prop :=
  ∀ z x y, R x z → R y z → R x y
                                
def RightEuclidean {α : Type u} (R : Endorelation α) : Prop :=
  ∀ z x y, R z x → R z y → R x y
                             
def Dense {α : Type u} (R : Endorelation α) : Prop :=
  ∀ x y, R x y → ∃ z, R x z ∧ R z y

                                                              

                                                                                 
def LeftTotal {α : Type u} {β : Type v}
    (R : HeterogeneousBinaryRelation α β) : Prop :=
  ∀ x, ∃ y, R x y

                                                                                   
def RightTotal {α : Type u} {β : Type v}
    (R : HeterogeneousBinaryRelation α β) : Prop :=
  ∀ y, ∃ x, R x y

                                                                               
def RightUnique {α : Type u} {β : Type v}
    (R : HeterogeneousBinaryRelation α β) : Prop :=
  ∀ x y₁ y₂, R x y₁ → R x y₂ → y₁ = y₂

                                                                                 
def LeftUnique {α : Type u} {β : Type v}
    (R : HeterogeneousBinaryRelation α β) : Prop :=
  ∀ y x₁ x₂, R x₁ y → R x₂ y → x₁ = x₂

                                                                                 
def MinimalElement {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : Endorelation Element)
    (subset : SetObject)
    (minimum : Element) : Prop :=
  minimum ∈ subset ∧
    ∀ element, element ∈ subset → ¬ relation element minimum

                                                                                 
def MaximalElement {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : Endorelation Element)
    (subset : SetObject)
    (maximum : Element) : Prop :=
  maximum ∈ subset ∧
    ∀ element, element ∈ subset → ¬ relation maximum element

end LRA.Relation
