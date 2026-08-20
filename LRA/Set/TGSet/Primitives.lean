namespace LRA.Set

/-- The primitive single-sorted carrier of the in-house TG realization. -/
axiom TGSet : Type

/-- Primitive membership for the in-house TG set universe. -/
axiom TGMembership : TGSet -> TGSet -> Prop

/-- Ordinary membership notation for the in-house TG set universe. -/
instance : Membership TGSet TGSet where
  mem containingSet element := TGMembership element containingSet

end LRA.Set
