import LRA.Function.Definition
import LRA.Relation.Calculus.Classes.Definition

namespace LRA.Function

open LRA.Set
universe u v

                                              
abbrev DomainType {Domain : Type u} {Codomain : Type v}
    (_function : LRA.Function Domain Codomain) : Type u := Domain

                                              
abbrev CodomainType {Domain : Type u} {Codomain : Type v}
    (_function : LRA.Function Domain Codomain) : Type v := Codomain

                                                                     
abbrev DomainClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : SetClass Domain :=
  LRA.Relation.DomainClass (Graph function)

                                                                    
abbrev RangeClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : SetClass Codomain :=
  LRA.Relation.RangeClass (Graph function)

                                                
abbrev PointImageClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (input : Domain) : SetClass Codomain :=
  LRA.Relation.PointImageClass (Graph function) input

                                                
abbrev ImageClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (source : SetClass Domain) : SetClass Codomain :=
  LRA.Relation.ImageClass (Graph function) source

                                                   
abbrev PreimageClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (target : SetClass Codomain) : SetClass Domain :=
  LRA.Relation.PreimageClass (Graph function) target

                                  
abbrev FiberClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (output : Codomain) : SetClass Domain :=
  LRA.Relation.FiberClass (Graph function) output

                                                                             
def KernelRelation {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    LRA.Relation.Endorelation Domain :=
  fun left right =>
    ∃ output, Graph function left output ∧ Graph function right output

                                                                                  
def SaturatedBy {Domain : Type u} {Codomain : Type v}
    (subset : SetClass Domain)
    (function : LRA.Function Domain Codomain) : Prop :=
  ∀ input fiberMate,
    subset input → KernelRelation function input fiberMate → subset fiberMate

                                                          
def MapsIntoClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) (target : SetClass Codomain) : Prop :=
  ∀ input output,
    source input → Graph function input output → target output

                                                                              
def IsImageClassOf {Domain : Type u} {Codomain : Type v}
    (image : SetClass Codomain)
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) : Prop :=
  ∀ output, image output ↔ ImageClass function source output

                                                                                 
def IsPreimageClassOf {Domain : Type u} {Codomain : Type v}
    (preimage : SetClass Domain)
    (function : LRA.Function Domain Codomain)
    (target : SetClass Codomain) : Prop :=
  ∀ input, preimage input ↔ PreimageClass function target input

                                                                 
def IsFiberClassOf {Domain : Type u} {Codomain : Type v}
    (fiber : SetClass Domain)
    (function : LRA.Function Domain Codomain)
    (output : Codomain) : Prop :=
  ∀ input, fiber input ↔ FiberClass function output input

   
                                                 

                                                                                 
                                                                             
                                                                       
  

                                                           
class HasDomain (FunctionObject : Type u) (DomainObject : outParam (Type v)) where
  domain : FunctionObject → DomainObject

                                                             
class HasCodomain (FunctionObject : Type u) (CodomainObject : outParam (Type v)) where
  codomain : FunctionObject → CodomainObject

                                                       
def DomainObjectOf {FunctionObject : Type u} {DomainObject : Type v}
    [HasDomain FunctionObject DomainObject]
    (functionObject : FunctionObject) : DomainObject :=
  HasDomain.domain functionObject

                                                         
def CodomainObjectOf {FunctionObject : Type u} {CodomainObject : Type v}
    [HasCodomain FunctionObject CodomainObject]
    (functionObject : FunctionObject) : CodomainObject :=
  HasCodomain.codomain functionObject


end LRA.Function
