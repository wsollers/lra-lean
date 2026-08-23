namespace LRA.Identity

universe u

                                                               
def Unique {Carrier : Type u} (predicate : Carrier -> Prop) : Prop :=
  ∀ left right, predicate left -> predicate right -> left = right

end LRA.Identity
