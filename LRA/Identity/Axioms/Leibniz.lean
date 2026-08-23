namespace LRA.Identity

universe u

                                

                                                      
  
axiom LeibnizLaw {Carrier : Type u} {left right : Carrier}
    (ObjectsAreIdentical : left = right) :
    ∀ property : Carrier -> Prop, property left ↔ property right

end LRA.Identity
