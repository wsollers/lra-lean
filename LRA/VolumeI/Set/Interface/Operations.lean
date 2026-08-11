namespace LRA.VolumeI.Set

universe u v w

/-!
Operation classes for the three set operations Lean core has no notation
class for: absolute complement, universal set, and symmetric difference.

Lean core already supplies `Union`, `Inter`, `HasSubset`,
`EmptyCollection`, `SDiff`, and `Membership`; backends register against
those directly (`Enderton/Instances.lean`, `LRASet/Instances.lean`). The
three classes below fill the remaining gaps in exactly the same style:
data only, no laws. Laws about these operations live in the law classes
under `Interface/Fluent/`, which take these classes as instance
parameters -- the same machine/certificate split used everywhere else.

Naming: `HasComplement`/`HasUniversal`/`HasSymmDiff` deliberately avoid
Mathlib's names (`HasCompl`, `Top`, `symmDiff`) so a future
Mathlib-backed adapter can bridge the two without declaration collisions.
The notation tokens themselves (`ᶜ`, `∆`) do coincide with Mathlib's and
are declared `scoped` here for that reason: they are active inside the
`LRA.VolumeI.Set` namespace tree and invisible outside it.
-/

/-- Absolute complement, written `Aᶜ`.

Only a backend with a universal set can register this: `LRASet` can
(`Complement` is just pointwise negation of the predicate); Enderton
structurally cannot -- the complement of a set relative to *everything*
is never a set, by Russell's paradox.

Logical form:

```lean
class HasComplement (α : Type u) where
  complement : α → α
```
-/
class HasComplement (α : Type u) where
  complement : α → α

scoped postfix:1024 "ᶜ" => HasComplement.complement

/-- The universal set, written `𝒰`. Same registration caveat as
`HasComplement`: `LRASet` has one (the always-true predicate); Enderton
cannot.

Logical form:

```lean
class HasUniversal (α : Type u) where
  universal : α
```
-/
class HasUniversal (α : Type u) where
  universal : α

scoped notation "𝒰" => HasUniversal.universal

/-- Symmetric difference, written `A ∆ B`.

No universal set required: any backend with union and relative
complement can derive it, so both `LRASet` and (once it derives the
operation) Enderton can register this.

Logical form:

```lean
class HasSymmDiff (α : Type u) where
  symmDiff : α → α → α
```
-/
class HasSymmDiff (α : Type u) where
  symmDiff : α → α → α

scoped infixl:100 " ∆ " => HasSymmDiff.symmDiff

/-- Separation as a capability: carve out the subset of `A` whose members
satisfy `property`. Two-parameter because it is two-sorted -- `Element` is
what `property` tests, `SetObject` is what gets carved; `outParam` lets
Lean infer the element type from the set type. Both backends register it:
Enderton via `TheSeparatedSubset` (noncomputable chosen witness of the
Separation axiom schema), `LRASet` via `Separation` (a direct definition).
This is the axiom-schema-shaped operation, not unrestricted comprehension:
it always carves from an ambient set. -/
class HasSeparation (Element : outParam (Type u)) (SetObject : Type v) where
  separation : SetObject → (Element → Prop) → SetObject

/-- Power set as a capability: the collection of all subsets of `A`.

Two-sorted in the other direction from `HasSeparation`: the power set of
an `SetObject` lives one level up, in a `Collection` type whose *elements*
are set objects. For Enderton all three levels are `Set` (everything is a
set); for `LRASet` the tower is `Alpha`, `LRASet Alpha`,
`LRASet (LRASet Alpha)` -- no embedding function needed, because the
collection's members simply are the sets themselves. -/
class HasPowerset (SetObject : Type u) (Collection : outParam (Type v)) where
  powerset : SetObject → Collection

/-- Union over an arbitrary indexed family of sets. A predicate-backend
capability: for ZF-style backends an arbitrary Lean-type-indexed family
is class-sized, so neither Enderton nor `ZFSet` registers this. -/
class HasIndexedUnion (SetObject : Type v) where
  indexedUnion : {Index : Type w} → (Index → SetObject) → SetObject

/-- Intersection over an arbitrary indexed family of sets. Same capability
profile as `HasIndexedUnion`. -/
class HasIndexedIntersection (SetObject : Type v) where
  indexedIntersection : {Index : Type w} → (Index → SetObject) → SetObject

/-- Union over a countable (`Nat`-indexed) family -- the sigma-algebra
operation. Wider capability than `HasIndexedUnion`: the predicate
backends take it as `Nat`-instantiated indexed union, and `ZFSet`
registers it via `⋃₀ (range f)` (Replacement); Enderton cannot until
naturals-as-sets exist. -/
class HasCountableUnion (SetObject : Type v) where
  countableUnion : (Nat → SetObject) → SetObject

/-- Intersection over a countable family -- the delta-ring operation. -/
class HasCountableIntersection (SetObject : Type v) where
  countableIntersection : (Nat → SetObject) → SetObject

/-- Union over a collection *of sets* (`⋃₀`): one level up the membership
tower, like `HasPowerset`. Every backend registers this -- for Enderton
it is the Union axiom's own operation (`TheUnionOver`). -/
class HasCollectionUnion (SetObject : outParam (Type v)) (Collection : Type w) where
  collectionUnion : Collection → SetObject

/-- Intersection over a collection of sets (`⋂₀`). Every backend registers
it, but its membership characterization is only available for *nonempty*
collections -- `⋂₀ ∅` would otherwise be the universal set, which
ZF-style backends cannot have. See `CollectionMembershipLaws`. -/
class HasCollectionIntersection (SetObject : outParam (Type v)) (Collection : Type w) where
  collectionIntersection : Collection → SetObject

end LRA.VolumeI.Set
