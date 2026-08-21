import LRA.Relation.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- `dominated` is dominated by `dominating` when every element of
`dominated` is beaten, with respect to `relation`, by some element of
`dominating` -- the pointwise-domination hypothesis already used
inline by `SupremaCompareUnderPointwiseDomination`, named so it can be
reused and reasoned about on its own.

Its own converse gives the infimum-side form for free:
`Dominated (LRA.Relation.Converse relation) dominated dominating` says
every element of `dominated` has some element of `dominating` beneath
it, matching `InfimaCompareUnderPointwiseDomination`'s hypothesis
without restating it. -/
def Dominated
    (relation : LRA.Relation.Endorelation Element)
    (dominated dominating : SetObject) : Prop :=
  forall element, element ∈ dominated ->
    exists other, other ∈ dominating /\ relation element other

end LRA.Order
