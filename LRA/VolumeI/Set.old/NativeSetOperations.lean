import LRA.VolumeI.Set.WellDefined

universe u

namespace LRA.VolumeI.Set

/-!
Native set-operation specifications, stated once, generically.

None of these compute anything, and none assert a witness exists. Each
is a specification: "if some `candidate : Carrier` satisfies this
predicate, it deserves the name empty / pair of x and y / etc." Each
backend supplies existence (`ZFCSet`, via axiom-readings and
`Classical.choose`) or construction (`ZFCTreeSet`, by direct recursion,
proved to satisfy the predicate) separately -- that's the internal
(here) / mapped (per-backend `NativeOperations.lean`) split.

`Member` itself -- the base relation every predicate below is
parameterized by -- is operation zero and isn't redefined here. Do not
confuse it with `Algebra.lean`'s `SetAlgebraSignature.IsMember`: that is
"is this *set* a member of the distinguished sub-collection (the
algebra)"; `Member` here is "is this *element* a member of this raw
set-object." Same word, two different relations, one level apart.

Two tiers, deliberately distinguished:

* Primitive specifications -- `IsEmptySet`, `IsPairSetOf`, `IsUnionOf`
  (the family/"big union" ⋃x), `IsSuccessorOf`, `IsInductiveSet`,
  `IsPowerSetOf`, `IsSeparationOf`, `IsImageOf` -- correspond one-to-one
  with actual ZFC axioms (Empty Set, Pairing, Union, Infinity, Power
  Set, Separation, Replacement). A backend needs a genuine axiom or
  construction to produce a witness for these.
* Derived specifications -- `IsSubsetOf`, `IsBinaryUnionOf`,
  `IsIntersectionOf`, `IsDifferenceOf`, `IsSymmetricDifferenceOf`,
  `IsUniversalObject`, `IsComplementOf` -- are not themselves ZFC
  primitives. In full ZFC they're *built* from the primitives above
  plus Separation. They line up with `Algebra.lean`'s
  `SetAlgebraSignature` fields, which is their actual job here.

Deliberately single-sorted: every predicate below assumes one `Carrier`
plays both the "element" and "container" role (`Member : Carrier →
Carrier → Prop`). That fits `ZFCSet`/`ZFCTreeSet`/`ZFSet`, where a set
can contain another set of the same type. It does not fit
`LRASet`/`MathlibSet`, whose membership relation is two-sorted (element
and container are different types) -- which is also exactly why those
two backends can't state Russell's paradox in the first place (see
`RussellParadox.lean`). This file is deliberately scoped to the
backends where the machinery earns its keep; `LRASet`/`MathlibSet` stay
on their own simpler, already-computable story.

Complement is absent as an independent primitive, for the same reason:
`RussellParadox.lean` rules out a universal object, so complement only
ever makes sense relative to a chosen ambient -- `IsComplementOf` is
defined via `IsDifferenceOf`, not standalone.

`IsInductiveSet` gives the raw content of the Infinity axiom -- *some*
inductive set exists. `ω` itself (the *minimal* inductive set, i.e. the
naturals) is not a primitive: it needs Separation applied across every
inductive set, a separate, later construction, not built here.
-/

/-- Convert a backend's containment relation into member-form.

`Contains set element` is often the natural implementation direction for a
backend. The native operation specifications use the mathematical member-form
`Member element set`, so this wrapper is the single place where the direction
is flipped. -/
def MemberOfContains {Carrier : Type u}
    (Contains : Carrier → Carrier → Prop) :
    Carrier → Carrier → Prop :=
  fun element set => Contains set element

/-- `candidate` has no members. -/
def IsEmptySet {Carrier : Type u} (Member : Carrier → Carrier → Prop)
    (candidate : Carrier) : Prop :=
  ∀ element : Carrier, ¬ Member element candidate

/-- `candidate`'s members are exactly `x` and `y`. Together with
`IsUnionOf`, this is how any finite set gets built. -/
def IsPairSetOf {Carrier : Type u} (Member : Carrier → Carrier → Prop)
    (candidate x y : Carrier) : Prop :=
  ∀ element : Carrier, Member element candidate ↔ element = x ∨ element = y

/-- `candidate`'s members are exactly the members of members of
`family` -- the "big union" ⋃family, matching the ZFC Union axiom
directly. Distinct from `IsBinaryUnionOf`: this unions everything
sitting *inside* one given set, not two given sets with each other. -/
def IsUnionOf {Carrier : Type u} (Member : Carrier → Carrier → Prop)
    (candidate family : Carrier) : Prop :=
  ∀ element : Carrier,
    Member element candidate ↔
      ∃ memberSet : Carrier, Member memberSet family ∧ Member element memberSet

/-- `candidate` is the successor of `original`, i.e. `original ∪
{original}`. -/
def IsSuccessorOf {Carrier : Type u} (Member : Carrier → Carrier → Prop)
    (candidate original : Carrier) : Prop :=
  ∀ element : Carrier, Member element candidate ↔ Member element original ∨ element = original

/-- `candidate` contains an empty set and is closed under successor --
the raw content of the Infinity axiom. Not itself "the naturals": *some*
inductive set is guaranteed to exist by Infinity, but the minimal one
(ω) is a separate, derived construction, not built here. -/
def IsInductiveSet {Carrier : Type u} (Member : Carrier → Carrier → Prop)
    (candidate : Carrier) : Prop :=
  (∃ empty : Carrier, Member empty candidate ∧ IsEmptySet Member empty) ∧
    ∀ element : Carrier, Member element candidate →
      ∃ successor : Carrier, Member successor candidate ∧ IsSuccessorOf Member successor element

/-- `candidate` has every object as a member. (See `RussellParadox.lean`:
for any `Carrier`/`Member` admitting Separation, nothing can actually
satisfy this.) -/
def IsUniversalObject {Carrier : Type u} (Member : Carrier → Carrier → Prop)
    (candidate : Carrier) : Prop :=
  ∀ element : Carrier, Member element candidate

/-- Every member of `left` is a member of `right`. Unlike everything
else here, this is a plain relation between two already-given objects
-- no witness, no existence claim, always definable. -/
def IsSubsetOf {Carrier : Type u} (Member : Carrier → Carrier → Prop)
    (left right : Carrier) : Prop :=
  ∀ element : Carrier, Member element left → Member element right

/-- `candidate`'s members are exactly the subsets of `source`. -/
def IsPowerSetOf {Carrier : Type u} (Member : Carrier → Carrier → Prop)
    (candidate source : Carrier) : Prop :=
  ∀ element : Carrier, Member element candidate ↔ IsSubsetOf Member element source

/-- `candidate`'s members are exactly the members of `source`
satisfying `property`. -/
def IsSeparationOf {Carrier : Type u} (Member : Carrier → Carrier → Prop)
    (candidate source : Carrier) (property : Carrier → Prop) : Prop :=
  ∀ element : Carrier, Member element candidate ↔ Member element source ∧ property element

/-- `candidate`'s members are exactly the images of members of `source`
under `image` -- generic over an arbitrary Lean function, so no separate
"is functional" side-condition is needed the way the formula-level
version requires: `image` already is one. -/
def IsImageOf {Carrier : Type u} (Member : Carrier → Carrier → Prop)
    (candidate source : Carrier) (image : Carrier → Carrier) : Prop :=
  ∀ element : Carrier,
    Member element candidate ↔
      ∃ preimage : Carrier, Member preimage source ∧ image preimage = element

/-- `candidate`'s members are exactly the members of `left` or `right`.
Derived, not primitive -- see the module doc. -/
def IsBinaryUnionOf {Carrier : Type u} (Member : Carrier → Carrier → Prop)
    (candidate left right : Carrier) : Prop :=
  ∀ element : Carrier,
    Member element candidate ↔ Member element left ∨ Member element right

/-- `candidate`'s members are exactly the members of both `left` and
`right`. -/
def IsIntersectionOf {Carrier : Type u} (Member : Carrier → Carrier → Prop)
    (candidate left right : Carrier) : Prop :=
  ∀ element : Carrier,
    Member element candidate ↔ Member element left ∧ Member element right

/-- `candidate`'s members are exactly the members of `left` that are not
members of `right`. -/
def IsDifferenceOf {Carrier : Type u} (Member : Carrier → Carrier → Prop)
    (candidate left right : Carrier) : Prop :=
  ∀ element : Carrier,
    Member element candidate ↔ Member element left ∧ ¬ Member element right

/-- `candidate`'s members are exactly the members of exactly one of
`left`, `right`. -/
def IsSymmetricDifferenceOf {Carrier : Type u} (Member : Carrier → Carrier → Prop)
    (candidate left right : Carrier) : Prop :=
  ∀ element : Carrier,
    Member element candidate ↔
      (Member element left ∧ ¬ Member element right) ∨
        (Member element right ∧ ¬ Member element left)

/-- `candidate` is the complement of `original`, relative to a chosen
`ambient` -- i.e. just `ambient \ original`. There is no absolute
complement, since there is no absolute ambient. -/
def IsComplementOf {Carrier : Type u} (Member : Carrier → Carrier → Prop)
    (ambient candidate original : Carrier) : Prop :=
  IsDifferenceOf Member candidate ambient original

/-- The callable native set-operations for a carrier with membership
`Member`. Each field is a real function -- `ops.powerset A` is how you
actually get the power set of `A`, for whichever backend `ops` belongs
to. This is the shape backends instantiate; correctness against the
`Is___Of` specifications above is a separate obligation, in
`NativeSetOperationsLaws` below. No field for a universal object, and
none for subset -- see the module doc. -/
structure NativeSetOperations {Carrier : Type u} (Member : Carrier → Carrier → Prop) where
  empty : Carrier
  pairSet : Carrier → Carrier → Carrier
  unionOf : Carrier → Carrier
  successor : Carrier → Carrier
  powerset : Carrier → Carrier
  separation : Carrier → (Carrier → Prop) → Carrier
  image : Carrier → (Carrier → Carrier) → Carrier
  binaryUnion : Carrier → Carrier → Carrier
  intersection : Carrier → Carrier → Carrier
  difference : Carrier → Carrier → Carrier
  symmetricDifference : Carrier → Carrier → Carrier
  complement : Carrier → Carrier → Carrier

/-- Every field of `ops` actually satisfies its specification. -/
structure NativeSetOperationsLaws
    {Carrier : Type u} {Member : Carrier → Carrier → Prop}
    (ops : NativeSetOperations Member) : Prop where
  emptyLaw : IsEmptySet Member ops.empty
  pairSetLaw : ∀ x y, IsPairSetOf Member (ops.pairSet x y) x y
  unionOfLaw : ∀ family, IsUnionOf Member (ops.unionOf family) family
  successorLaw : ∀ original, IsSuccessorOf Member (ops.successor original) original
  powersetLaw : ∀ source, IsPowerSetOf Member (ops.powerset source) source
  separationLaw :
    ∀ source property, IsSeparationOf Member (ops.separation source property) source property
  imageLaw : ∀ source image, IsImageOf Member (ops.image source image) source image
  binaryUnionLaw : ∀ left right, IsBinaryUnionOf Member (ops.binaryUnion left right) left right
  intersectionLaw : ∀ left right, IsIntersectionOf Member (ops.intersection left right) left right
  differenceLaw : ∀ left right, IsDifferenceOf Member (ops.difference left right) left right
  symmetricDifferenceLaw :
    ∀ left right, IsSymmetricDifferenceOf Member (ops.symmetricDifference left right) left right
  complementLaw :
    ∀ ambient original, IsComplementOf Member ambient (ops.complement ambient original) original

/-- Every operation respects the backend's chosen equivalence relation.

This is a proposition, not another bundled backend object. Each backend proves
an `Is...` theorem against this predicate. For plain Lean carriers this is
usually ordinary congruence with `Equivalent := Eq`; for quotient-style
backends this is the real representative-independence obligation. -/
def OperationsRespectEquivalence
    {Carrier : Type u} {Member : Carrier → Carrier → Prop}
    (Equivalent : Carrier → Carrier → Prop)
    (ops : NativeSetOperations Member) : Prop :=
  Equivalent ops.empty ops.empty ∧
  (∀ {x x' y y' : Carrier},
    Equivalent x x' →
    Equivalent y y' →
    Equivalent (ops.pairSet x y) (ops.pairSet x' y')) ∧
  (∀ {family family' : Carrier},
    Equivalent family family' →
    Equivalent (ops.unionOf family) (ops.unionOf family')) ∧
  (∀ {original original' : Carrier},
    Equivalent original original' →
    Equivalent (ops.successor original) (ops.successor original')) ∧
  (∀ {source source' : Carrier},
    Equivalent source source' →
    Equivalent (ops.powerset source) (ops.powerset source')) ∧
  (∀ {source source' : Carrier} {property property' : Carrier → Prop},
    Equivalent source source' →
    (∀ {element element' : Carrier},
      Equivalent element element' → (property element ↔ property' element')) →
    Equivalent (ops.separation source property) (ops.separation source' property')) ∧
  (∀ {source source' : Carrier} {image image' : Carrier → Carrier},
    Equivalent source source' →
    (∀ {element element' : Carrier},
      Equivalent element element' → Equivalent (image element) (image' element')) →
    Equivalent (ops.image source image) (ops.image source' image')) ∧
  (∀ {left left' right right' : Carrier},
    Equivalent left left' →
    Equivalent right right' →
    Equivalent (ops.binaryUnion left right) (ops.binaryUnion left' right')) ∧
  (∀ {left left' right right' : Carrier},
    Equivalent left left' →
    Equivalent right right' →
    Equivalent (ops.intersection left right) (ops.intersection left' right')) ∧
  (∀ {left left' right right' : Carrier},
    Equivalent left left' →
    Equivalent right right' →
    Equivalent (ops.difference left right) (ops.difference left' right')) ∧
  (∀ {left left' right right' : Carrier},
    Equivalent left left' →
    Equivalent right right' →
    Equivalent (ops.symmetricDifference left right)
      (ops.symmetricDifference left' right')) ∧
  (∀ {ambient ambient' original original' : Carrier},
    Equivalent ambient ambient' →
    Equivalent original original' →
    Equivalent (ops.complement ambient original) (ops.complement ambient' original'))

/-- The native-set contract as a theorem-facing predicate.

Backends do not become native set structures by being wrapped in a common
carrier object. Instead, each backend exposes its carrier, membership relation,
operations, equivalence relation, and proves an `Is...` theorem against this
predicate. -/
def IsNativeSetStructure
    {Carrier : Type u} {Member : Carrier → Carrier → Prop}
    (ops : NativeSetOperations Member)
    (Equivalent : Carrier → Carrier → Prop) : Prop :=
  NativeSetOperationsLaws ops ∧
  OperationsRespectEquivalence Equivalent ops ∧
  IsWellFounded Member

/-- The native-set contract stated against a backend containment relation.

Backends may expose `Contains set element` as their primitive API and use this
predicate as the theorem-facing contract. Internally it delegates to
`IsNativeSetStructure` through `MemberOfContains`. -/
def IsNativeSetStructureFromContains
    {Carrier : Type u}
    (Contains : Carrier → Carrier → Prop)
    (ops : NativeSetOperations (MemberOfContains Contains))
    (Equivalent : Carrier → Carrier → Prop) : Prop :=
  IsNativeSetStructure ops Equivalent

/-- A backend, bundled: its operations, plus proof they're correct. -/
structure NativeSetOperationsModel (Carrier : Type u) (Member : Carrier → Carrier → Prop) where
  ops : NativeSetOperations Member
  laws : NativeSetOperationsLaws ops

end LRA.VolumeI.Set
