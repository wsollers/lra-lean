namespace LRA.VolumeI.Set

/-!
Russell's paradox, stated once, generically.

This is not a fact about ZFC specifically -- it is a fact about *any*
membership-shaped structure with a self-referential membership relation
and a Separation-like closure operation. Any concrete backend (`ZFCSet`,
later `ZFCTreeSet`) that can exhibit such an operation gets "no universal
object" as a one-line corollary of the theorem here, rather than needing
to re-run the Russell argument from scratch each time.

Backends whose membership relation is typed so that self-membership isn't
even expressible (`LRASet`, `MathlibSet`) are outside the scope of this
file entirely -- the hypothesis below can't even be *stated* for them,
since their membership relation relates two different types (an element
and a predicate-set), never a carrier to itself. That absence is the
formal echo of the earlier discussion: those backends aren't susceptible
to this paradox because they dodge a proof, but because the question
"is this set a member of itself" isn't well-formed for them at all.
-/

/-- A carrier `Carrier` with a self-referential membership relation
`Member` admits Separation when, for any source object and any predicate,
there is an object whose members are exactly the source's members
satisfying the predicate. -/
def AdmitsSeparation
    {Carrier : Type u} (Member : Carrier → Carrier → Prop) : Prop :=
  ∀ (source : Carrier) (property : Carrier → Prop),
    ∃ result : Carrier,
      ∀ element : Carrier,
        Member element result ↔ Member element source ∧ property element

/-- Russell's theorem, generically: any carrier admitting Separation over
a self-referential membership relation has no universal object -- no
single object that every object is a member of.

Proof idea (this is the actual Russell's-paradox argument, not just its
name): suppose toward a contradiction that some `universalObject` really
does have every object as a member. Apply `separation` to it with the
property `fun element => ¬ Member element element`, producing a `result`
whose members are exactly the objects of `universalObject` that are not
members of themselves. Since `universalObject` was assumed to contain
*everything*, `result` itself is one of its members, so the question
`Member result result` is legitimate to ask. Case on it:

* If `Member result result`, then `result` satisfies `result`'s own
  defining property, namely `¬ Member result result` -- contradiction.
* If `¬ Member result result`, then `result` fails the one condition
  that would have excluded it from `result`'s membership, so it
  satisfies `Member result source ∧ ¬ Member result result` after all,
  giving `Member result result` -- contradiction again.

Either way, contradiction, from nothing more than `separation` and the
assumption that `universalObject` exists. That forces the assumption
false: no universal object can exist. -/
theorem noUniversalObject_of_admitsSeparation
    {Carrier : Type u} {Member : Carrier → Carrier → Prop}
    (separation : AdmitsSeparation Member) :
    ¬ ∃ universalObject : Carrier,
        ∀ element : Carrier, Member element universalObject := by
  sorry

end LRA.VolumeI.Set
