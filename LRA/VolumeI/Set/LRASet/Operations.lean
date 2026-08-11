import LRA.VolumeI.Set.LRASet.LRASet

/-!
The predicate-set operation vocabulary: named, textbook-citable operations on
`LRASet`, each total by construction (no existence question, unlike the
Enderton axioms) with a membership theorem recording its intended reading.
-/

namespace LRA.VolumeI.Set.LRASet

universe u v

variable {Alpha : Type u}
/--
The empty predicate set: nothing satisfies it.

Logical form:

```lean
def Empty (Alpha : Type u) : LRASet Alpha := fun _ => False
```
-/
def Empty (Alpha : Type u) : LRASet Alpha := fun _ => False
/--
`EmptyMembership` exposes this formal declaration.

Logical form:

```lean
theorem EmptyMembership (x : Alpha) : x ∈ Empty Alpha ↔ False
```
-/

theorem EmptyMembership (x : Alpha) : x ∈ Empty Alpha ↔ False := by
  sorry
/--
The singleton predicate set of `a`: exactly the elements equal to `a`.

Logical form:

```lean
def Singleton (a : Alpha) : LRASet Alpha := fun x => x = a
```
-/
def Singleton (a : Alpha) : LRASet Alpha := fun x => x = a
/--
`SingletonMembership` exposes this formal declaration.

Logical form:

```lean
theorem SingletonMembership (a x : Alpha) : x ∈ Singleton a ↔ x = a
```
-/

theorem SingletonMembership (a x : Alpha) : x ∈ Singleton a ↔ x = a := by
  sorry

/-- Insert `a` into `A`: the members of `A` together with `a`. General enough
to build `Pair` as a special case (`Pair a b = Insert a (Singleton b)`), and
useful on its own for building up finite sets one element at a time.

Logical form:

```lean
def Insert (a : Alpha) (A : LRASet Alpha) : LRASet Alpha := fun x => x = a ∨ x ∈ A
```
-/
def Insert (a : Alpha) (A : LRASet Alpha) : LRASet Alpha := fun x => x = a ∨ x ∈ A
/--
`InsertMembership` exposes this formal declaration.

Logical form:

```lean
theorem InsertMembership (a x : Alpha) (A : LRASet Alpha) :
    x ∈ Insert a A ↔ x = a ∨ x ∈ A
```
-/

theorem InsertMembership (a x : Alpha) (A : LRASet Alpha) :
    x ∈ Insert a A ↔ x = a ∨ x ∈ A := by
  sorry

/-- The pair predicate set of `a` and `b`: exactly the elements equal to `a`
or to `b`. Equal to `Insert a (Singleton b)`; stated directly here so it can
be cited on its own, the same way `Set.Enderton.Theorems.Pairing.PairSet` is.

Logical form:

```lean
def Pair (a b : Alpha) : LRASet Alpha := fun x => x = a ∨ x = b
```
-/
def Pair (a b : Alpha) : LRASet Alpha := fun x => x = a ∨ x = b
/--
`PairMembership` exposes this formal declaration.

Logical form:

```lean
theorem PairMembership (a b x : Alpha) : x ∈ Pair a b ↔ x = a ∨ x = b
```
-/

theorem PairMembership (a b x : Alpha) : x ∈ Pair a b ↔ x = a ∨ x = b := by
  sorry
/--
`PairEqualsInsertSingleton` exposes this formal declaration.

Logical form:

```lean
theorem PairEqualsInsertSingleton (a b : Alpha) :
    Pair a b = Insert a (Singleton b)
```
-/

theorem PairEqualsInsertSingleton (a b : Alpha) :
    Pair a b = Insert a (Singleton b) := by
  sorry
/--
Union of two predicate sets.

Logical form:

```lean
def Union (A B : LRASet Alpha) : LRASet Alpha := fun x => x ∈ A ∨ x ∈ B
```
-/
def Union (A B : LRASet Alpha) : LRASet Alpha := fun x => x ∈ A ∨ x ∈ B
/--
`UnionMembership` exposes this formal declaration.

Logical form:

```lean
theorem UnionMembership (A B : LRASet Alpha) (x : Alpha) :
    x ∈ Union A B ↔ x ∈ A ∨ x ∈ B
```
-/

theorem UnionMembership (A B : LRASet Alpha) (x : Alpha) :
    x ∈ Union A B ↔ x ∈ A ∨ x ∈ B := by
  sorry
/--
Intersection of two predicate sets.

Logical form:

```lean
def Intersection (A B : LRASet Alpha) : LRASet Alpha := fun x => x ∈ A ∧ x ∈ B
```
-/
def Intersection (A B : LRASet Alpha) : LRASet Alpha := fun x => x ∈ A ∧ x ∈ B
/--
`IntersectionMembership` exposes this formal declaration.

Logical form:

```lean
theorem IntersectionMembership (A B : LRASet Alpha) (x : Alpha) :
    x ∈ Intersection A B ↔ x ∈ A ∧ x ∈ B
```
-/

theorem IntersectionMembership (A B : LRASet Alpha) (x : Alpha) :
    x ∈ Intersection A B ↔ x ∈ A ∧ x ∈ B := by
  sorry

/-- Absolute complement of a predicate set, relative to the whole carrier
type `Alpha`.

This has no Enderton counterpart, and cannot get one: ZFC has no universal
set (Russell's paradox), so "the complement of a set" is only meaningful once
there is a fixed ambient carrier to complement against, which is exactly what
a typed predicate set has and an Enderton set does not. This is a concrete
example of an operation that is backend-specific by nature, not just by
current scope -- it should never end up in a shared/generic interface.

Logical form:

```lean
def Complement (A : LRASet Alpha) : LRASet Alpha := fun x => x ∉ A
```
-/
def Complement (A : LRASet Alpha) : LRASet Alpha := fun x => x ∉ A
/--
`ComplementMembership` exposes this formal declaration.

Logical form:

```lean
theorem ComplementMembership (A : LRASet Alpha) (x : Alpha) :
    x ∈ Complement A ↔ x ∉ A
```
-/

theorem ComplementMembership (A : LRASet Alpha) (x : Alpha) :
    x ∈ Complement A ↔ x ∉ A := by
  sorry

/-- The universal predicate set over `Alpha`: every element of the carrier
satisfies it.

The mirror image of `Complement`, and impossible for Enderton sets for the
same Russell's-paradox reason: "the set of everything" is only meaningful
relative to a fixed ambient carrier type, which a typed predicate set has
and a ZFC set does not. Registered as `HasUniversal` (notation `𝒰`) in
`Instances.lean`.

Logical form:

```lean
def Universal (Alpha : Type u) : LRASet Alpha := fun _ => True
```
-/
def Universal (Alpha : Type u) : LRASet Alpha := fun _ => True
/--
`UniversalMembership` exposes this formal declaration.

Logical form:

```lean
theorem UniversalMembership (x : Alpha) : x ∈ Universal Alpha
```
-/

theorem UniversalMembership (x : Alpha) : x ∈ Universal Alpha := by
  sorry
/--
Set difference.

Logical form:

```lean
def Difference (A B : LRASet Alpha) : LRASet Alpha := fun x => x ∈ A ∧ x ∉ B
```
-/
def Difference (A B : LRASet Alpha) : LRASet Alpha := fun x => x ∈ A ∧ x ∉ B
/--
`DifferenceMembership` exposes this formal declaration.

Logical form:

```lean
theorem DifferenceMembership (A B : LRASet Alpha) (x : Alpha) :
    x ∈ Difference A B ↔ x ∈ A ∧ x ∉ B
```
-/

theorem DifferenceMembership (A B : LRASet Alpha) (x : Alpha) :
    x ∈ Difference A B ↔ x ∈ A ∧ x ∉ B := by
  sorry

/-- `D` is the relative complement of `B` in `A`: its members are exactly the
members of `A` that are not members of `B`.

Named to match `Set.Enderton.Definitions.IsRelativeComplementOf` for the
identical concept -- both backends can state "D is the relative complement of
B in A" under the same predicate name, even though only Enderton needs an
axiom (via Separation) to get there; here it is just `Difference` restated.

Logical form:

```lean
def IsRelativeComplementOf (A B D : LRASet Alpha) : Prop :=
  ∀ x : Alpha, x ∈ D ↔ x ∈ A ∧ x ∉ B
```
-/
def IsRelativeComplementOf (A B D : LRASet Alpha) : Prop :=
  ∀ x : Alpha, x ∈ D ↔ x ∈ A ∧ x ∉ B

/-- The relative complement of `B` in `A`.

Definitionally the same operation as `Difference` -- an `abbrev`, not a new
`def`, so there is exactly one operation here under two citable names, not
two operations that happen to agree. `Instances.lean`'s `SDiff` instance
already covers this under the `\` notation regardless of which name a proof
cites.

Logical form:

```lean
abbrev RelativeComplement (A B : LRASet Alpha) : LRASet Alpha := Difference A B
```
-/
abbrev RelativeComplement (A B : LRASet Alpha) : LRASet Alpha := Difference A B
/--
`RelativeComplementIsRelativeComplementOf` exposes this formal declaration.

Logical form:

```lean
theorem RelativeComplementIsRelativeComplementOf (A B : LRASet Alpha) :
    IsRelativeComplementOf A B (RelativeComplement A B)
```
-/

theorem RelativeComplementIsRelativeComplementOf (A B : LRASet Alpha) :
    IsRelativeComplementOf A B (RelativeComplement A B) :=
  DifferenceMembership A B
/--
`RelativeComplementMembership` exposes this formal declaration.

Logical form:

```lean
theorem RelativeComplementMembership (A B : LRASet Alpha) (x : Alpha) :
    x ∈ RelativeComplement A B ↔ x ∈ A ∧ x ∉ B
```
-/

theorem RelativeComplementMembership (A B : LRASet Alpha) (x : Alpha) :
    x ∈ RelativeComplement A B ↔ x ∈ A ∧ x ∉ B :=
  DifferenceMembership A B x
/--
Symmetric difference.

Logical form:

```lean
def SymmetricDifference (A B : LRASet Alpha) : LRASet Alpha :=
  fun x => (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)
```
-/
def SymmetricDifference (A B : LRASet Alpha) : LRASet Alpha :=
  fun x => (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)
/--
`SymmetricDifferenceMembership` exposes this formal declaration.

Logical form:

```lean
theorem SymmetricDifferenceMembership (A B : LRASet Alpha) (x : Alpha) :
    x ∈ SymmetricDifference A B ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)
```
-/

theorem SymmetricDifferenceMembership (A B : LRASet Alpha) (x : Alpha) :
    x ∈ SymmetricDifference A B ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A) := by
  sorry
/--
`A` is a subset of `B`: every member of `A` is a member of `B`.

Logical form:

```lean
def Subset (A B : LRASet Alpha) : Prop := ∀ x : Alpha, x ∈ A → x ∈ B
```
-/
def Subset (A B : LRASet Alpha) : Prop := ∀ x : Alpha, x ∈ A → x ∈ B
/--
`SubsetIff` exposes this formal declaration.

Logical form:

```lean
theorem SubsetIff (A B : LRASet Alpha) :
    Subset A B ↔ ∀ x : Alpha, x ∈ A → x ∈ B
```
-/

theorem SubsetIff (A B : LRASet Alpha) :
    Subset A B ↔ ∀ x : Alpha, x ∈ A → x ∈ B := by
  sorry

/--
The power set of `A`: the predicate set, over the carrier `LRASet Alpha`, of
all subsets of `A`.

One level up the typed tower: elements of `PowerSet A` are themselves
predicate sets over `Alpha`. No embedding is needed -- where Enderton's
`ThePowerSet` requires the Power Set axiom, here the collection is just a
predicate on `LRASet Alpha`.

Logical form:

```lean
def PowerSet (A : LRASet Alpha) : LRASet (LRASet Alpha) := fun B => Subset B A
```
-/
def PowerSet (A : LRASet Alpha) : LRASet (LRASet Alpha) := fun B => Subset B A

theorem PowerSetMembership (A B : LRASet Alpha) :
    B ∈ PowerSet A ↔ Subset B A := by
  sorry

/--
Union over a collection of predicate sets: the elements belonging to some
member of the collection.

Logical form:

```lean
def CollectionUnion (C : LRASet (LRASet Alpha)) : LRASet Alpha := fun x => ∃ B, B ∈ C ∧ x ∈ B
```
-/
def CollectionUnion (C : LRASet (LRASet Alpha)) : LRASet Alpha :=
  fun x => ∃ B, B ∈ C ∧ x ∈ B

theorem CollectionUnionMembership (C : LRASet (LRASet Alpha)) (x : Alpha) :
    x ∈ CollectionUnion C ↔ ∃ B, B ∈ C ∧ x ∈ B := by
  sorry

/--
Intersection over a collection of predicate sets: the elements belonging
to every member of the collection. Total, with `⋂₀ ∅ = Universal Alpha` --
the typed carrier makes the empty-collection case unproblematic, unlike
for ZF-style backends.

Logical form:

```lean
def CollectionIntersection (C : LRASet (LRASet Alpha)) : LRASet Alpha := fun x => ∀ B, B ∈ C → x ∈ B
```
-/
def CollectionIntersection (C : LRASet (LRASet Alpha)) : LRASet Alpha :=
  fun x => ∀ B, B ∈ C → x ∈ B

theorem CollectionIntersectionMembership
    (C : LRASet (LRASet Alpha)) (x : Alpha) :
    x ∈ CollectionIntersection C ↔ ∀ B, B ∈ C → x ∈ B := by
  sorry
/--
`A` is nonempty: it has at least one member.

Logical form:

```lean
def Nonempty (A : LRASet Alpha) : Prop := ∃ x : Alpha, x ∈ A
```
-/
def Nonempty (A : LRASet Alpha) : Prop := ∃ x : Alpha, x ∈ A

/-- Separation: the subset of `A` whose members satisfy `property`.

Unlike `Set.Enderton.Axioms.Separation`, this needs no axiom and no schema --
it is exactly `Intersection A property`, spelled out directly, because a
predicate set can always test an arbitrary Lean predicate against its
elements without any existence question.

Logical form:

```lean
def Separation (A : LRASet Alpha) (property : Alpha -> Prop) : LRASet Alpha :=
  fun x => x ∈ A ∧ property x
```
-/
def Separation (A : LRASet Alpha) (property : Alpha -> Prop) : LRASet Alpha :=
  fun x => x ∈ A ∧ property x
/--
`SeparationMembership` exposes this formal declaration.

Logical form:

```lean
theorem SeparationMembership
    (A : LRASet Alpha) (property : Alpha -> Prop) (x : Alpha) :
    x ∈ Separation A property ↔ x ∈ A ∧ property x
```
-/

theorem SeparationMembership
    (A : LRASet Alpha) (property : Alpha -> Prop) (x : Alpha) :
    x ∈ Separation A property ↔ x ∈ A ∧ property x := by
  sorry
/--
An indexed family of predicate sets over `Alpha`.

Logical form:

```lean
def Family (Index : Type v) (Alpha : Type u) := Index -> LRASet Alpha
```
-/
def Family (Index : Type v) (Alpha : Type u) := Index -> LRASet Alpha
/--
Union over an indexed family.

Logical form:

```lean
def IndexedUnion {Index : Type v} (family : Family Index Alpha) : LRASet Alpha :=
  fun x => ∃ i : Index, x ∈ family i
```
-/
def IndexedUnion {Index : Type v} (family : Family Index Alpha) : LRASet Alpha :=
  fun x => ∃ i : Index, x ∈ family i
/--
`IndexedUnionMembership` exposes this formal declaration.

Logical form:

```lean
theorem IndexedUnionMembership
    {Index : Type v} (family : Family Index Alpha) (x : Alpha) :
    x ∈ IndexedUnion family ↔ ∃ i : Index, x ∈ family i
```
-/

theorem IndexedUnionMembership
    {Index : Type v} (family : Family Index Alpha) (x : Alpha) :
    x ∈ IndexedUnion family ↔ ∃ i : Index, x ∈ family i := by
  sorry
/--
Intersection over an indexed family.

Logical form:

```lean
def IndexedIntersection {Index : Type v} (family : Family Index Alpha) : LRASet Alpha :=
  fun x => ∀ i : Index, x ∈ family i
```
-/
def IndexedIntersection {Index : Type v} (family : Family Index Alpha) : LRASet Alpha :=
  fun x => ∀ i : Index, x ∈ family i
/--
`IndexedIntersectionMembership` exposes this formal declaration.

Logical form:

```lean
theorem IndexedIntersectionMembership
    {Index : Type v} (family : Family Index Alpha) (x : Alpha) :
    x ∈ IndexedIntersection family ↔ ∀ i : Index, x ∈ family i
```
-/

theorem IndexedIntersectionMembership
    {Index : Type v} (family : Family Index Alpha) (x : Alpha) :
    x ∈ IndexedIntersection family ↔ ∀ i : Index, x ∈ family i := by
  sorry

end LRA.VolumeI.Set.LRASet
