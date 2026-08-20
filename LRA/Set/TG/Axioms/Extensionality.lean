import LRA.Set.TGSet.Primitives

namespace LRA.Set.TG

/-- Sets with the same members are equal. -/
axiom Extensionality (A B : TGSet) :
  (forall x : TGSet, x ∈ A <-> x ∈ B) -> A = B

end LRA.Set.TG
