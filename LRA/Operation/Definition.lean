namespace LRA.Operation

universe u v w

                                                             
abbrev Operation (Domain : Type u) (Codomain : Type v) :=
  Domain → Codomain

                                                                 
abbrev NullaryOperation (Codomain : Type u) := Codomain

                                                                     
abbrev HeterogeneousUnaryOperation (Domain : Type u) (Codomain : Type v) :=
  Operation Domain Codomain

                                        
abbrev UnaryOperation (Carrier : Type u) :=
  HeterogeneousUnaryOperation Carrier Carrier

                                                          
abbrev ConstantOperation (Codomain : Type u) := NullaryOperation Codomain

                                                  
abbrev UnaryEndoOperation (Carrier : Type u) := UnaryOperation Carrier

                                                                           
abbrev HeterogeneousBinaryOperation
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  Left → Right → Codomain

                                         
abbrev BinaryOperation (Carrier : Type u) :=
  HeterogeneousBinaryOperation Carrier Carrier Carrier

                                                   
abbrev BinaryEndoOperation (Carrier : Type u) := BinaryOperation Carrier

                                                                   
abbrev ExternalBinaryOperation (Scalar : Type u) (Carrier : Type v) :=
  HeterogeneousBinaryOperation Scalar Carrier Carrier

                                                     
def EndomapComposition (Carrier : Type u) :
    BinaryEndoOperation (Carrier → Carrier) :=
  fun second first input => second (first input)

                                                    
def EndomapIdentity (Carrier : Type u) : Carrier → Carrier :=
  fun input => input

                                                                    
def PointwiseBinaryOperation {Domain : Type u} {Codomain : Type v}
    (operation : BinaryEndoOperation Codomain) :
    BinaryEndoOperation (Domain → Codomain) :=
  fun first second input => operation (first input) (second input)

                                                                   
def PointwiseUnaryOperation {Domain : Type u} {Codomain : Type v}
    (operation : UnaryEndoOperation Codomain) :
    UnaryEndoOperation (Domain → Codomain) :=
  fun map input => operation (map input)

                                              
structure PartialUnaryOperation (Carrier : Type u) where
  Domain : Carrier → Prop
  Value : ∀ input, Domain input → Carrier

                                               
structure PartialBinaryOperation (Carrier : Type u) where
  Domain : Carrier → Carrier → Prop
  Value : ∀ left right, Domain left right → Carrier

end LRA.Operation
