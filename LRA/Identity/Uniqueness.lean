namespace LRA.Identity

universe u

/-- Uniqueness for a predicate: any two witnesses are equal. -/
def Unique {Carrier : Type u} (predicate : Carrier -> Prop) : Prop :=
  ∀ left right, predicate left -> predicate right -> left = right

end LRA.Identity
