import LRA.Function.Definition
import LRA.Function.Properties.Definition
import LRA.Relation.Operations.Converse.Definition
import LRA.Set.SetClass.Definition

namespace LRA.Function

universe u v

                                                                        
def LeftInverse
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain) : Prop :=
  ∀ input, inverse (function input) = input

                                                                          
def RightInverse
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain) : Prop :=
  ∀ output, function (inverse output) = output

                                                            
def TwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain) : Prop :=
  LeftInverse function inverse ∧ RightInverse function inverse

                                                           
def IsInverseFunction
    {Domain : Type u} {Codomain : Type v}
    (inverse : LRA.Function Codomain Domain)
    (function : LRA.Function Domain Codomain) : Prop :=
  TwoSidedInverse function inverse

                                            
abbrev SectionOf
    {Domain : Type u} {Codomain : Type v}
    (sectionFunction : LRA.Function Codomain Domain)
    (function : LRA.Function Domain Codomain) : Prop :=
  RightInverse function sectionFunction

                                                                             
abbrev RetractionOf
    {Small : Type u} {Large : Type v}
    (retraction : LRA.Function Large Small)
    (inclusion : LRA.Function Small Large) : Prop :=
  LeftInverse inclusion retraction

   
                                                                             
                                                                               
                                                    
  

                                                         
def LeftInverseOn
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (source : LRA.Set.SetClass Domain) : Prop :=
  ∀ input, source input → inverse (function input) = input

                                                           
def RightInverseOn
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (target : LRA.Set.SetClass Codomain) : Prop :=
  ∀ output, target output → function (inverse output) = output

                                                                          
def TwoSidedInverseOn
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (source : LRA.Set.SetClass Domain)
    (target : LRA.Set.SetClass Codomain) : Prop :=
  LeftInverseOn function inverse source ∧ RightInverseOn function inverse target


end LRA.Function
