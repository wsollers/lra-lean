namespace LRA.Set

/-- The primitive set carrier of the in-house NBG realization. -/
axiom NBGSet : Type

/-- The primitive class carrier of the in-house NBG realization. -/
axiom NBGClass : Type

/-- Primitive membership between NBG sets. -/
axiom NBGSetMembership : NBGSet -> NBGSet -> Prop

/-- Primitive membership of NBG sets in NBG classes. -/
axiom NBGClassMembership : NBGSet -> NBGClass -> Prop

/-- The class represented by an NBG set. -/
axiom NBGClassOfSet : NBGSet -> NBGClass

/-- Ordinary set membership notation for the in-house NBG set universe. -/
instance : Membership NBGSet NBGSet where
  mem containingSet element := NBGSetMembership element containingSet

/-- Ordinary class membership notation for the in-house NBG class universe. -/
instance : Membership NBGSet NBGClass where
  mem containingClass element := NBGClassMembership element containingClass

end LRA.Set
