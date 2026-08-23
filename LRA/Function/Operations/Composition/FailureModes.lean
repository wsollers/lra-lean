import LRA.Function.Operations.Composition.Definition
import LRA.Function.Properties.Definition

   
                                                                              
                                                                              
                                                                            
           
  

namespace LRA.Function

universe u v w

variable {Domain : Type u} {Middle : Type v} {Codomain : Type w}

                                                                
def ComposeInjectiveOuterNotInjective
    (inner : LRA.Function Domain Middle)
    (outer : LRA.Function Middle Codomain) : Prop :=
  Injective (Compose outer inner) ∧ ¬ Injective outer

                                                                 
def ComposeSurjectiveInnerNotSurjective
    (inner : LRA.Function Domain Middle)
    (outer : LRA.Function Middle Codomain) : Prop :=
  Surjective (Compose outer inner) ∧ ¬ Surjective inner

                                                                          
def ComposeBijectiveWithSlackMiddle
    (inner : LRA.Function Domain Middle)
    (outer : LRA.Function Middle Codomain) : Prop :=
  Bijective (Compose outer inner) ∧
    (¬ Surjective inner ∨ ¬ Injective outer)

end LRA.Function
