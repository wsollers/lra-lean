import LRA.Identity.Interface.Definitions.Witnesses

namespace LRA.Identity

universe u

theorem HasNoWitnessNotHasWitness {Carrier : Type u} {P : Carrier → Prop}
    (h : HasNoWitness P) : ¬ HasWitness P :=
  h

theorem ExactlyOneNotAtLeastTwoWitnesses {Carrier : Type u} [IdentityRelation Carrier]
    {P : Carrier → Prop} (h : ExactlyOne P) : ¬ NotAtMostOne P :=
  fun ⟨l, r, hl, hr, hd⟩ => hd (h.2 l r hl hr)

end LRA.Identity
