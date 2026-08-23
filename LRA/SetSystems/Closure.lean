  
                                                                    
  

universe u v w

namespace LRA.SetSystems

                                              
abbrev Collection (Carrier : Type u) := Carrier → Prop

                                  
def Contains {Carrier : Type u} (collection : Collection Carrier)
    (object : Carrier) : Prop :=
  collection object

                                                                 
def ContainsPredicate {Carrier : Type u} (collection : Collection Carrier)
    (predicate : Carrier → Prop) : Prop :=
  ∀ object, predicate object → collection object

                                                   
def ClosedUnderNullary {Carrier : Type u} (collection : Collection Carrier)
    (object : Carrier) : Prop :=
  collection object

                                      
def ClosedUnderUnary {Carrier : Type u} (collection : Collection Carrier)
    (operation : Carrier → Carrier) : Prop :=
  ∀ object, collection object → collection (operation object)

                                       
def ClosedUnderBinary {Carrier : Type u} (collection : Collection Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ left right,
    collection left → collection right → collection (operation left right)

                                        
def ClosedUnderIndexed {Carrier : Type u} (collection : Collection Carrier)
    {Index : Type w} (operation : (Index → Carrier) → Carrier) : Prop :=
  ∀ family,
    (∀ index, collection (family index)) →
      collection (operation family)

                                          
def ClosedUnderCountable {Carrier : Type u} (collection : Collection Carrier)
    (operation : (Nat → Carrier) → Carrier) : Prop :=
  ClosedUnderIndexed collection operation

                                            
def ClosedUnderFinite {Carrier : Type u} (collection : Collection Carrier)
    (operation : List Carrier → Carrier) : Prop :=
  ∀ objects,
    (∀ object, object ∈ objects → collection object) →
      collection (operation objects)

end LRA.SetSystems
