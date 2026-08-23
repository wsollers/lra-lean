                                      
                                                                         
                 

import LRA.Set.Interface.RelationSets
import LRA.Set.Interface.Membership

namespace LRA.Set

universe u v

   
                                           
                                           
                                                                   
                                                                  
                

                                                                    
                                                                     
                                                                  
                                                 
                                                                
                                                                
                                               

                                                                     
                                                                      
                     
  

section RelationLaws

variable {Left Right Pair : Type u}
variable {RelationObject DomainObject RangeObject : Type v}

                                

                                                                     
                                                                  
                                   

             

       
                    
                                                                     
                                           
                                                              
   
  
theorem RelatesUnion
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Union RelationObject] [Inter RelationObject] [SDiff RelationObject]
    [EmptyCollection RelationObject] [HasSubset RelationObject]
    [MembershipLaws Pair RelationObject]
    (first second : RelationObject) (input : Left) (output : Right) :
    Relates (first ∪ second) input output ↔
      Relates first input output ∨ Relates second input output := by
  sorry

                                       

                                                                     

             

       
                           
                                                                     
                                           
                                                              
   
  
theorem RelatesIntersection
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Union RelationObject] [Inter RelationObject] [SDiff RelationObject]
    [EmptyCollection RelationObject] [HasSubset RelationObject]
    [MembershipLaws Pair RelationObject]
    (first second : RelationObject) (input : Left) (output : Right) :
    Relates (first ∩ second) input output ↔
      Relates first input output ∧ Relates second input output := by
  sorry

                                    

                                                                  
                                                     

             

       
                        
                                                              
                    
                                                   
                                                                             
   
  
theorem MemberOfDomainOf
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject] [HasSeparation Left DomainObject]
    [SeparationLaws Left DomainObject]
    (relation : RelationObject) (ambientDomain : DomainObject)
    (input : Left) :
    input ∈ DomainOf Right relation ambientDomain ↔
      input ∈ ambientDomain ∧
        ∃ output : Right, Relates relation input output := by
  sorry

                                   

                               

             

       
                       
                                                            
                      
                                                 
                                                                           
   
  
theorem MemberOfRangeOf
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Right RangeObject] [HasSeparation Right RangeObject]
    [SeparationLaws Right RangeObject]
    (relation : RelationObject) (ambientRange : RangeObject)
    (output : Right) :
    output ∈ RangeOf Left relation ambientRange ↔
      output ∈ ambientRange ∧
        ∃ input : Left, Relates relation input output := by
  sorry

                                   

                                           

             

       
                       
                                                       
                                                   
                                                   
                             
                                                                      
   
  
theorem MemberOfImageOf
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject]
    [Membership Right RangeObject] [HasSeparation Right RangeObject]
    [SeparationLaws Right RangeObject]
    (relation : RelationObject) (inputs : DomainObject)
    (ambientRange : RangeObject) (output : Right) :
    output ∈ ImageOf relation inputs ambientRange ↔
      output ∈ ambientRange ∧
        ∃ input : Left, input ∈ inputs ∧ Relates relation input output := by
  sorry

                                      

                                               

             

       
                          
                                                       
                                                   
                                                       
                             
                                                                          
   
  
theorem MemberOfPreimageOf
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Right RangeObject]
    [Membership Left DomainObject] [HasSeparation Left DomainObject]
    [SeparationLaws Left DomainObject]
    (relation : RelationObject) (outputs : RangeObject)
    (ambientDomain : DomainObject) (input : Left) :
    input ∈ PreimageOf relation outputs ambientDomain ↔
      input ∈ ambientDomain ∧
        ∃ output : Right, output ∈ outputs ∧
          Relates relation input output := by
  sorry

                                   

                                                                   
       

             

       
                       
                                                
                                                   
                                                   
                                                           
   
  
theorem MemberOfFiberOf
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject] [HasSeparation Left DomainObject]
    [SeparationLaws Left DomainObject]
    (relation : RelationObject) (output : Right)
    (ambientDomain : DomainObject) (input : Left) :
    input ∈ FiberOf relation output ambientDomain ↔
      input ∈ ambientDomain ∧ Relates relation input output := by
  sorry

                                    

                                                                  
                                                                 
                                                                      
                          

             

       
                        
                                                                  
                                     
                                                                          
                                                  
                                     
   
  
theorem RelatesInverseOf {ReversedPair : Type u}
    {ReversedObject : Type v}
    [HasPairing Left Right Pair] [HasPairing Right Left ReversedPair]
    [Membership Pair RelationObject]
    [Membership ReversedPair ReversedObject]
    [HasSeparation ReversedPair ReversedObject]
    [SeparationLaws ReversedPair ReversedObject]
    [PairingLaws Right Left ReversedPair]
    (relation : RelationObject) (ambientReversed : ReversedObject)
    (input : Left) (output : Right) :
    Relates (InverseOf Left Right relation ambientReversed)
        output input ↔
      (OrderedPair output input : ReversedPair) ∈ ambientReversed ∧
        Relates relation input output := by
  sorry

                                        

                                                                     
                            

             

       
                            
                                                       
                                     
                                                                
                                                    
   
  
theorem RelatesRestrictionOf
    [HasPairing Left Right Pair]
    [Membership Pair RelationObject] [HasSeparation Pair RelationObject]
    [SeparationLaws Pair RelationObject]
    [Membership Left DomainObject]
    [PairingLaws Left Right Pair]
    (relation : RelationObject) (inputs : DomainObject)
    (input : Left) (output : Right) :
    Relates (RestrictionOf Right relation inputs) input output ↔
      Relates relation input output ∧ input ∈ inputs := by
  sorry

                                       

                                                                
                                                     

             

       
                           
                                                         
                                                  
   
  
theorem RestrictionIsSubset
    [HasPairing Left Right Pair]
    [Membership Pair RelationObject] [HasSeparation Pair RelationObject]
    [SeparationLaws Pair RelationObject]
    [Union RelationObject] [Inter RelationObject] [SDiff RelationObject]
    [EmptyCollection RelationObject] [HasSubset RelationObject]
    [MembershipLaws Pair RelationObject]
    [Membership Left DomainObject]
    (relation : RelationObject) (inputs : DomainObject) :
    RestrictionOf Right relation inputs ⊆ relation := by
  sorry

                                                       

                                                                   
            

             

       
                                           
                                                       
                                                        
                                                                    
   
  
theorem RestrictionOfFunctionalIsFunctional
    [HasPairing Left Right Pair]
    [Membership Pair RelationObject] [HasSeparation Pair RelationObject]
    [SeparationLaws Pair RelationObject]
    [Membership Left DomainObject]
    [PairingLaws Left Right Pair]
    (relation : RelationObject) (inputs : DomainObject)
    (functional : IsFunctionalSet Left Right relation) :
    IsFunctionalSet Left Right (RestrictionOf Right relation inputs) := by
  sorry

                                                           

                                                                  
                                                                
                                                        

             

       
                                               
                                   
                                                        
                                                          
                                                                      
                                       
                                         
                                   
                                               
   
  
theorem UnionOfCompatibleFunctionalIsFunctional
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Union RelationObject] [Inter RelationObject] [SDiff RelationObject]
    [EmptyCollection RelationObject] [HasSubset RelationObject]
    [MembershipLaws Pair RelationObject]
    (first second : RelationObject)
    (firstFunctional : IsFunctionalSet Left Right first)
    (secondFunctional : IsFunctionalSet Left Right second)
    (compatible : ∀ (input : Left) (firstOutput secondOutput : Right),
      Relates first input firstOutput →
      Relates second input secondOutput →
      firstOutput = secondOutput) :
    IsFunctionalSet Left Right (first ∪ second) := by
  sorry

                                     

                                                                     
                                                        

             

       
                         
                                                        
                                     
                                                        
                                                                  
   
  
theorem RelatesGraphSetOf
    [HasPairing Left Right Pair]
    [Membership Pair RelationObject] [HasSeparation Pair RelationObject]
    [SeparationLaws Pair RelationObject]
    [PairingLaws Left Right Pair]
    (map : Left → Right) (ambientPairs : RelationObject)
    (input : Left) (output : Right) :
    Relates (GraphSetOf map ambientPairs) input output ↔
      (OrderedPair input output : Pair) ∈ ambientPairs ∧
        map input = output := by
  sorry

                                          

                                                                   
                                          

             

       
                              
                                                          
                                                            
   
  
theorem GraphSetOfIsFunctional
    [HasPairing Left Right Pair]
    [Membership Pair RelationObject] [HasSeparation Pair RelationObject]
    [SeparationLaws Pair RelationObject]
    [PairingLaws Left Right Pair]
    (map : Left → Right) (ambientPairs : RelationObject) :
    IsFunctionalSet Left Right (GraphSetOf map ambientPairs) := by
  sorry

                                   

                                                                     
                                            

             

       
                       
                               
                                                       
                                   
                                             
                                                                      
                                          
   
  
theorem AppliedToUnique
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject)
    (singleValued : IsSingleValued Left Right relation)
    (input : Left) (output : Right)
    (relates : Relates relation input output)
    (hits : ∃ someOutput : Right, Relates relation input someOutput) :
    AppliedTo relation input hits = output := by
  sorry

   
                             

                                                                           
                                                                           
                                                                              
                                                                        
                                                        

                                                                         
                                                                           
                                                                        
                                                                         
                              
  

section ImageAlgebra

variable {Left Right Pair : Type u}
variable {RelationObject DomainObject RangeObject : Type v}
variable [HasPairing Left Right Pair] [Membership Pair RelationObject]
variable [Membership Left DomainObject] [Membership Right RangeObject]
variable [HasSeparation Right RangeObject] [SeparationLaws Right RangeObject]
variable [ExtensionalityLaw Right RangeObject]

                                                       
theorem ImageOfUnion
    [Union DomainObject] [Inter DomainObject] [SDiff DomainObject]
    [EmptyCollection DomainObject] [HasSubset DomainObject]
    [Union RangeObject] [Inter RangeObject] [SDiff RangeObject]
    [EmptyCollection RangeObject] [HasSubset RangeObject]
    [MembershipLaws Left DomainObject] [MembershipLaws Right RangeObject]
    (relation : RelationObject) (left right : DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (left ∪ right) ambientRange =
      ImageOf relation left ambientRange ∪ ImageOf relation right ambientRange := by
  sorry

                                                     
theorem ImageOfEmpty
    [Union DomainObject] [Inter DomainObject] [SDiff DomainObject]
    [EmptyCollection DomainObject] [HasSubset DomainObject]
    [Union RangeObject] [Inter RangeObject] [SDiff RangeObject]
    [EmptyCollection RangeObject] [HasSubset RangeObject]
    [MembershipLaws Left DomainObject] [MembershipLaws Right RangeObject]
    (relation : RelationObject) (ambientRange : RangeObject) :
    ImageOf relation (∅ : DomainObject) ambientRange = (∅ : RangeObject) := by
  sorry

                                              
theorem ImageOfMonotone [HasSubset DomainObject] [HasSubset RangeObject]
    (relation : RelationObject) (smaller larger : DomainObject)
    (ambientRange : RangeObject) (inclusion : smaller ⊆ larger) :
    ImageOf relation smaller ambientRange ⊆ ImageOf relation larger ambientRange := by
  sorry

                                                                                
                                                                                     
theorem ImageOfIntersectionSubset
    [Inter DomainObject] [Inter RangeObject] [HasSubset RangeObject]
    (relation : RelationObject) (left right : DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (left ∩ right) ambientRange ⊆
      ImageOf relation left ambientRange ∩ ImageOf relation right ambientRange := by
  sorry

                                                                            
theorem DifferenceOfImagesSubsetImageOfDifference
    [SDiff DomainObject] [SDiff RangeObject] [HasSubset RangeObject]
    (relation : RelationObject) (left right : DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation left ambientRange \ ImageOf relation right ambientRange ⊆
      ImageOf relation (left \ right) ambientRange := by
  sorry

                                                                        
theorem ImageOfIndexedUnion {Index : Type u}
    [HasIndexedUnion DomainObject] [HasIndexedUnion RangeObject]
    (relation : RelationObject) (family : Index → DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (HasIndexedUnion.indexedUnion family) ambientRange =
      HasIndexedUnion.indexedUnion
        (fun index => ImageOf relation (family index) ambientRange) := by
  sorry

                                                                    
                              
theorem ImageOfIndexedIntersectionSubset {Index : Type u}
    [HasIndexedIntersection DomainObject] [HasIndexedIntersection RangeObject]
    [HasSubset RangeObject]
    (relation : RelationObject) (family : Index → DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (HasIndexedIntersection.indexedIntersection family) ambientRange ⊆
      HasIndexedIntersection.indexedIntersection
        (fun index => ImageOf relation (family index) ambientRange) := by
  sorry

                                                                           
theorem ImageOfCountableUnion
    [HasCountableUnion DomainObject] [HasCountableUnion RangeObject]
    (relation : RelationObject) (family : Nat → DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (HasCountableUnion.countableUnion family) ambientRange =
      HasCountableUnion.countableUnion
        (fun index => ImageOf relation (family index) ambientRange) := by
  sorry

                                                                       
                              
theorem ImageOfCountableIntersectionSubset
    [HasCountableIntersection DomainObject] [HasCountableIntersection RangeObject]
    [HasSubset RangeObject]
    (relation : RelationObject) (family : Nat → DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (HasCountableIntersection.countableIntersection family) ambientRange ⊆
      HasCountableIntersection.countableIntersection
        (fun index => ImageOf relation (family index) ambientRange) := by
  sorry

                                                              
theorem ImageOfCongrRelation
    (first second : RelationObject) (inputs : DomainObject)
    (ambientRange : RangeObject)
    (sameRelation : ∀ (input : Left) (output : Right),
      Relates first input output ↔ Relates second input output) :
    ImageOf first inputs ambientRange = ImageOf second inputs ambientRange := by
  sorry

                                              
theorem ImageOfCongrInputs
    (relation : RelationObject) (left right : DomainObject)
    (ambientRange : RangeObject)
    (sameInputs : ∀ input : Left, input ∈ left ↔ input ∈ right) :
    ImageOf relation left ambientRange = ImageOf relation right ambientRange := by
  sorry

end ImageAlgebra

section PreimageAlgebra

variable {Left Right Pair : Type u}
variable {RelationObject DomainObject RangeObject : Type v}
variable [HasPairing Left Right Pair] [Membership Pair RelationObject]
variable [Membership Left DomainObject] [Membership Right RangeObject]
variable [HasSeparation Left DomainObject] [SeparationLaws Left DomainObject]
variable [ExtensionalityLaw Left DomainObject]

                                                             
theorem PreimageOfUnion
    [Union DomainObject] [Inter DomainObject] [SDiff DomainObject]
    [EmptyCollection DomainObject] [HasSubset DomainObject]
    [Union RangeObject] [Inter RangeObject] [SDiff RangeObject]
    [EmptyCollection RangeObject] [HasSubset RangeObject]
    [MembershipLaws Left DomainObject] [MembershipLaws Right RangeObject]
    (relation : RelationObject) (left right : RangeObject)
    (ambientDomain : DomainObject) :
    PreimageOf relation (left ∪ right) ambientDomain =
      PreimageOf relation left ambientDomain ∪
        PreimageOf relation right ambientDomain := by
  sorry

                                                         
theorem PreimageOfEmpty
    [Union DomainObject] [Inter DomainObject] [SDiff DomainObject]
    [EmptyCollection DomainObject] [HasSubset DomainObject]
    [Union RangeObject] [Inter RangeObject] [SDiff RangeObject]
    [EmptyCollection RangeObject] [HasSubset RangeObject]
    [MembershipLaws Left DomainObject] [MembershipLaws Right RangeObject]
    (relation : RelationObject) (ambientDomain : DomainObject) :
    PreimageOf relation (∅ : RangeObject) ambientDomain = (∅ : DomainObject) := by
  sorry

                                                  
theorem PreimageOfMonotone [HasSubset DomainObject] [HasSubset RangeObject]
    (relation : RelationObject) (smaller larger : RangeObject)
    (ambientDomain : DomainObject) (inclusion : smaller ⊆ larger) :
    PreimageOf relation smaller ambientDomain ⊆
      PreimageOf relation larger ambientDomain := by
  sorry

                                                                           
theorem PreimageOfSubsetAmbient [HasSubset DomainObject]
    (relation : RelationObject) (outputs : RangeObject)
    (ambientDomain : DomainObject) :
    PreimageOf relation outputs ambientDomain ⊆ ambientDomain := by
  sorry

                                                                              
theorem PreimageOfIndexedUnion {Index : Type u}
    [HasIndexedUnion DomainObject] [HasIndexedUnion RangeObject]
    (relation : RelationObject) (family : Index → RangeObject)
    (ambientDomain : DomainObject) :
    PreimageOf relation (HasIndexedUnion.indexedUnion family) ambientDomain =
      HasIndexedUnion.indexedUnion
        (fun index => PreimageOf relation (family index) ambientDomain) := by
  sorry

                                                                                 
theorem PreimageOfCountableUnion
    [HasCountableUnion DomainObject] [HasCountableUnion RangeObject]
    (relation : RelationObject) (family : Nat → RangeObject)
    (ambientDomain : DomainObject) :
    PreimageOf relation (HasCountableUnion.countableUnion family) ambientDomain =
      HasCountableUnion.countableUnion
        (fun index => PreimageOf relation (family index) ambientDomain) := by
  sorry

                                                                 
theorem PreimageOfCongrRelation
    (first second : RelationObject) (outputs : RangeObject)
    (ambientDomain : DomainObject)
    (sameRelation : ∀ (input : Left) (output : Right),
      Relates first input output ↔ Relates second input output) :
    PreimageOf first outputs ambientDomain =
      PreimageOf second outputs ambientDomain := by
  sorry

                                                  
theorem PreimageOfCongrOutputs
    (relation : RelationObject) (left right : RangeObject)
    (ambientDomain : DomainObject)
    (sameOutputs : ∀ output : Right, output ∈ left ↔ output ∈ right) :
    PreimageOf relation left ambientDomain =
      PreimageOf relation right ambientDomain := by
  sorry

end PreimageAlgebra

section CompositionAndIdentity

                                                                      
theorem ImageOfCompositionOf
    {Left Mid Right : Type u} {FirstPair SecondPair CompositePair : Type u}
    {FirstObject SecondObject CompositeObject : Type v}
    {DomainObject MidObject RangeObject : Type v}
    [HasPairing Left Mid FirstPair] [HasPairing Mid Right SecondPair]
    [HasPairing Left Right CompositePair]
    [Membership FirstPair FirstObject] [Membership SecondPair SecondObject]
    [Membership CompositePair CompositeObject]
    [Membership Left DomainObject] [Membership Mid MidObject]
    [Membership Right RangeObject]
    [HasSeparation Mid MidObject] [HasSeparation Right RangeObject]
    [ExtensionalityLaw Right RangeObject]
    (first : FirstObject) (second : SecondObject) (composite : CompositeObject)
    (inputs : DomainObject) (ambientMid : MidObject) (ambientRange : RangeObject)
    (isComposite : ∀ (input : Left) (output : Right),
      Relates composite input output ↔
        ∃ middle : Mid, Relates first input middle ∧ Relates second middle output) :
    ImageOf composite inputs ambientRange =
      ImageOf second (ImageOf first inputs ambientMid) ambientRange := by
  sorry

                                                                               
theorem PreimageOfCompositionOf
    {Left Mid Right : Type u} {FirstPair SecondPair CompositePair : Type u}
    {FirstObject SecondObject CompositeObject : Type v}
    {DomainObject MidObject RangeObject : Type v}
    [HasPairing Left Mid FirstPair] [HasPairing Mid Right SecondPair]
    [HasPairing Left Right CompositePair]
    [Membership FirstPair FirstObject] [Membership SecondPair SecondObject]
    [Membership CompositePair CompositeObject]
    [Membership Left DomainObject] [Membership Mid MidObject]
    [Membership Right RangeObject]
    [HasSeparation Left DomainObject] [HasSeparation Mid MidObject]
    [ExtensionalityLaw Left DomainObject]
    (first : FirstObject) (second : SecondObject) (composite : CompositeObject)
    (outputs : RangeObject) (ambientDomain : DomainObject) (ambientMid : MidObject)
    (isComposite : ∀ (input : Left) (output : Right),
      Relates composite input output ↔
        ∃ middle : Mid, Relates first input middle ∧ Relates second middle output) :
    PreimageOf composite outputs ambientDomain =
      PreimageOf first (PreimageOf second outputs ambientMid) ambientDomain := by
  sorry

                                                                                 
theorem PreimageOfCompositionMonotone
    {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject] [Membership Right RangeObject]
    [HasSeparation Left DomainObject] [HasSubset DomainObject] [HasSubset RangeObject]
    (composite : RelationObject) (smaller larger : RangeObject)
    (ambientDomain : DomainObject) (inclusion : smaller ⊆ larger) :
    PreimageOf composite smaller ambientDomain ⊆
      PreimageOf composite larger ambientDomain := by
  sorry

                                                                        
theorem ImageOfIdentityOn
    {Left Pair : Type u} {RelationObject DomainObject : Type v}
    [HasPairing Left Left Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject]
    [HasSeparation Left DomainObject] [ExtensionalityLaw Left DomainObject]
    (identity : RelationObject) (inputs ambientDomain : DomainObject)
    (isIdentity : ∀ leftElement rightElement : Left,
      Relates identity leftElement rightElement ↔ leftElement = rightElement)
    (inputsInAmbient : ∀ input : Left, input ∈ inputs → input ∈ ambientDomain) :
    ImageOf identity inputs ambientDomain = inputs := by
  sorry

                                                                            
theorem PreimageOfIdentityOn
    {Left Pair : Type u} {RelationObject DomainObject : Type v}
    [HasPairing Left Left Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject]
    [HasSeparation Left DomainObject] [ExtensionalityLaw Left DomainObject]
    (identity : RelationObject) (outputs ambientDomain : DomainObject)
    (isIdentity : ∀ leftElement rightElement : Left,
      Relates identity leftElement rightElement ↔ leftElement = rightElement)
    (outputsInAmbient : ∀ output : Left, output ∈ outputs → output ∈ ambientDomain) :
    PreimageOf identity outputs ambientDomain = outputs := by
  sorry

                                                                            
theorem PreimageOfSingletonIsFiberOf
    {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject] [Membership Right RangeObject]
    [HasSeparation Left DomainObject] [ExtensionalityLaw Left DomainObject]
    (relation : RelationObject) (outputs : RangeObject) (output : Right)
    (ambientDomain : DomainObject)
    (isSingleton : ∀ candidate : Right, candidate ∈ outputs ↔ candidate = output) :
    PreimageOf relation outputs ambientDomain =
      FiberOf relation output ambientDomain := by
  sorry

end CompositionAndIdentity

end RelationLaws

end LRA.Set
