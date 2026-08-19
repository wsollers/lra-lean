namespace LRA.Set

/-- The primitive single-sorted carrier of the in-house ZFC realization. -/
axiom ZFCSet : Type

/-- Primitive membership for the in-house ZFC set universe. -/
axiom ZFCMembership : ZFCSet → ZFCSet → Prop

/-- Ordinary membership notation for the in-house ZFC set universe. -/
instance : Membership ZFCSet ZFCSet where
  mem containingSet element := ZFCMembership element containingSet

end LRA.Set
