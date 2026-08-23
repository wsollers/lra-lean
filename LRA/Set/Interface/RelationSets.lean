                                      
                                                                           

import LRA.Set.Interface.Pairing
import LRA.Set.Interface.Operations

namespace LRA.Set

universe u v

   
                                           
                                           
                                        

                                                                      
                                                                      
                                                                   
                                                                     
                                          

                                                 

                                                                  
                                                                       
                                        
                                                                
                                                            
                                                                     
                                                                      
                                                                      
                                                               
          
                                                               
                                                                    
                                                                 
  

section Vocabulary

variable {Left Right Mid Pair ReversedPair CompositePair : Type u}
variable {RelationObject : Type v} {DomainObject : Type v}
variable {RangeObject : Type v} {ReversedObject : Type v}
variable {CompositeObject : Type v}

                              

                                                                
                                                                    
                                                         

             

       
                                                                         
                                                                         
                                     
   
  
def Relates [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) (input : Left) (output : Right) : Prop :=
  OrderedPair input output ∈ relation

                                 

                                                                     
                                                                
                                                                  
          

             

       
                                    
                                                                 
                                         
                                      
                                                                        
   
  
def IsPairwise (Left Right : Type u) {Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) : Prop :=
  ∀ member : Pair, member ∈ relation →
    ∃ (input : Left) (output : Right), member = OrderedPair input output

                                     

                                                                      
                    

             

       
                                                                              
                                                      
                                        
                                         
                              
   
  
def IsSingleValued (Left Right : Type u) {Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) : Prop :=
  ∀ (input : Left) (firstOutput secondOutput : Right),
    Relates relation input firstOutput →
    Relates relation input secondOutput →
    firstOutput = secondOutput

                                      

                                                                   
                                                                       
                                         

             

       
                                                                               
                                                                     
   
  
def IsFunctionalSet (Left Right : Type u) {Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) : Prop :=
  IsPairwise Left Right relation ∧ IsSingleValued Left Right relation

                                

                                                              

             

       
                                                          
                                     
                                  
                                                   
   
  
def IsTotalOn (Right : Type u) {Left Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject]
    (relation : RelationObject) (domain : DomainObject) : Prop :=
  ∀ input : Left, input ∈ domain →
    ∃ output : Right, Relates relation input output

                               

                                                                     
                                              

             

       
                                                         
                                                    
                                        
                                                                  
   
  
def DomainOf (Right : Type u) {Left Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [HasSeparation Left DomainObject]
    (relation : RelationObject) (ambientDomain : DomainObject) :
    DomainObject :=
  HasSeparation.separation ambientDomain
    (fun input => ∃ output : Right, Relates relation input output)

                              

                                                                     
                                        

             

       
                                                       
                                                 
                                       
                                                                 
   
  
def RangeOf (Left : Type u) {Right Pair : Type u}
    {RelationObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [HasSeparation Right RangeObject]
    (relation : RelationObject) (ambientRange : RangeObject) :
    RangeObject :=
  HasSeparation.separation ambientRange
    (fun output => ∃ input : Left, Relates relation input output)

                              

                                                                   
                       

             

       
                                                               
                                                 
                                       
                                                   
                                    
   
  
def ImageOf {Left Right Pair : Type u}
    {RelationObject DomainObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject] [HasSeparation Right RangeObject]
    (relation : RelationObject) (inputs : DomainObject)
    (ambientRange : RangeObject) : RangeObject :=
  HasSeparation.separation ambientRange
    (fun output => ∃ input : Left, input ∈ inputs ∧
      Relates relation input output)

                                 

                                                                    
                         

             

       
                                                                  
                                                    
                                        
                                                      
                                    
   
  
def PreimageOf {Left Right Pair : Type u}
    {RelationObject DomainObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Right RangeObject] [HasSeparation Left DomainObject]
    (relation : RelationObject) (outputs : RangeObject)
    (ambientDomain : DomainObject) : DomainObject :=
  HasSeparation.separation ambientDomain
    (fun input => ∃ output : Right, output ∈ outputs ∧
      Relates relation input output)

                              

                                                                     
                                                                   

             

       
                                                        
                                                    
                                        
                                                
   
  
def FiberOf {Left Right Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [HasSeparation Left DomainObject]
    (relation : RelationObject) (output : Right)
    (ambientDomain : DomainObject) : DomainObject :=
  HasSeparation.separation ambientDomain
    (fun input => Relates relation input output)

                                

                                                                
                                                                 
                                                   

             

       
                                                               
                                                          
                                          
                                                       
                                                                          
   
  
def InverseOf (Left Right : Type u) {Pair ReversedPair : Type u}
    {RelationObject ReversedObject : Type v}
    [HasPairing Left Right Pair] [HasPairing Right Left ReversedPair]
    [Membership Pair RelationObject]
    [HasSeparation ReversedPair ReversedObject]
    (relation : RelationObject) (ambientReversed : ReversedObject) :
    ReversedObject :=
  HasSeparation.separation ambientReversed
    (fun reversed => ∃ (input : Left) (output : Right),
      reversed = OrderedPair output input ∧ Relates relation input output)

                                    

                                                                      
                                                                
                   

             

       
                                                              
                                               
                                   
                                                     
                                                         
   
  
def RestrictionOf (Right : Type u) {Left Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [HasSeparation Pair RelationObject]
    [Membership Left DomainObject]
    (relation : RelationObject) (inputs : DomainObject) :
    RelationObject :=
  HasSeparation.separation relation
    (fun member => ∃ (input : Left) (output : Right),
      member = OrderedPair input output ∧ input ∈ inputs)

                                    

                                                                   
                                                                  
                      

             

       
                                                                 
                      
   
  
def IsExtensionOf {RelationObject : Type v} [HasSubset RelationObject]
    (extension relation : RelationObject) : Prop :=
  relation ⊆ extension

                                 

                                                                    
                                                                     
      

             

       
                                   
                                                       
                                       
                                                                          
   
  
def GraphSetOf {Left Right Pair : Type u} {RelationObject : Type v}
    [HasPairing Left Right Pair] [HasSeparation Pair RelationObject]
    (map : Left → Right) (ambientPairs : RelationObject) :
    RelationObject :=
  HasSeparation.separation ambientPairs
    (fun member => ∃ input : Left, member = OrderedPair input (map input))

                                 

                                                                      
         

             

       
                                      
                                                       
                                       
                                  
                                                        
   
  
def IdentityOn {Left Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Left Pair] [HasSeparation Pair RelationObject]
    [Membership Left DomainObject]
    (inputs : DomainObject) (ambientPairs : RelationObject) :
    RelationObject :=
  HasSeparation.separation ambientPairs
    (fun member => ∃ input : Left,
      input ∈ inputs ∧ member = OrderedPair input input)

                                    

                                                                    
                                                                 
                                                                   
       

             

       
                                                      
                                                 
                                                       
                                                                     
                                         
                                      
                                        
                                                 
                                                 
                                                             
                                           
                                                                    
                                         
                                                                
   
  
def CompositionOf (Mid : Type u) {Left Right : Type u}
    {FirstPair SecondPair CompositePair : Type u}
    {FirstObject SecondObject CompositeObject : Type v}
    [HasPairing Left Mid FirstPair] [HasPairing Mid Right SecondPair]
    [HasPairing Left Right CompositePair]
    [Membership FirstPair FirstObject]
    [Membership SecondPair SecondObject]
    [HasSeparation CompositePair CompositeObject]
    (second : SecondObject) (first : FirstObject)
    (ambientComposite : CompositeObject) : CompositeObject :=
  HasSeparation.separation ambientComposite
    (fun member => ∃ (input : Left) (middle : Mid) (output : Right),
      member = OrderedPair input output ∧
      Relates first input middle ∧ Relates second middle output)

                                

                                                                    
                                                                  
                                                         
                                                          
                                                                 

             

       
                                                                      
                                                                       
                       
   
  
noncomputable def AppliedTo {Left Right Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) (input : Left)
    (hits : ∃ output : Right, Relates relation input output) : Right :=
  Classical.choose hits

                                    

                                                                    
                                                           

             

       
                                                                   
                                                              
                                                          
   
  
theorem AppliedToRelates {Left Right Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) (input : Left)
    (hits : ∃ output : Right, Relates relation input output) :
    Relates relation input (AppliedTo relation input hits) := by
  sorry

end Vocabulary

end LRA.Set
