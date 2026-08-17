import LRA.Set.PredicateSet.Definition

/-!
Named operations for the in-house typed predicate-set realization.

`PredicateSet Alpha := Alpha → Prop`, so each operation is total by direct
predicate construction. Existence and uniqueness obligations that are substantive
for single-sorted ZFC sets do not arise here.
-/

namespace LRA.Set.PredicateSet

universe u v

variable {Alpha : Type u}

/-- The empty predicate set. -/
def Empty (Alpha : Type u) : LRA.Set.PredicateSet Alpha := fun _ => False

theorem EmptyMembership (x : Alpha) : x ∈ Empty Alpha ↔ False := by
  sorry

/-- The singleton predicate set containing `a`. -/
def Singleton (a : Alpha) : LRA.Set.PredicateSet Alpha := fun x => x = a

theorem SingletonMembership (a x : Alpha) : x ∈ Singleton a ↔ x = a := by
  sorry

/-- Insert an element into a predicate set. -/
def Insert (a : Alpha) (A : LRA.Set.PredicateSet Alpha) : LRA.Set.PredicateSet Alpha :=
  fun x => x = a ∨ x ∈ A

theorem InsertMembership (a x : Alpha) (A : LRA.Set.PredicateSet Alpha) :
    x ∈ Insert a A ↔ x = a ∨ x ∈ A := by
  sorry

/-- The pair predicate set containing exactly `a` and `b`. -/
def Pair (a b : Alpha) : LRA.Set.PredicateSet Alpha := fun x => x = a ∨ x = b

theorem PairMembership (a b x : Alpha) : x ∈ Pair a b ↔ x = a ∨ x = b := by
  sorry

theorem PairEqualsInsertSingleton (a b : Alpha) :
    Pair a b = Insert a (Singleton b) := by
  sorry

/-- Binary union. -/
def Union (A B : LRA.Set.PredicateSet Alpha) : LRA.Set.PredicateSet Alpha :=
  fun x => x ∈ A ∨ x ∈ B

theorem UnionMembership (A B : LRA.Set.PredicateSet Alpha) (x : Alpha) :
    x ∈ Union A B ↔ x ∈ A ∨ x ∈ B := by
  sorry

/-- Binary intersection. -/
def Intersection (A B : LRA.Set.PredicateSet Alpha) : LRA.Set.PredicateSet Alpha :=
  fun x => x ∈ A ∧ x ∈ B

theorem IntersectionMembership (A B : LRA.Set.PredicateSet Alpha) (x : Alpha) :
    x ∈ Intersection A B ↔ x ∈ A ∧ x ∈ B := by
  sorry

/-- Absolute complement relative to the carrier `Alpha`. -/
def Complement (A : LRA.Set.PredicateSet Alpha) : LRA.Set.PredicateSet Alpha :=
  fun x => x ∉ A

theorem ComplementMembership (A : LRA.Set.PredicateSet Alpha) (x : Alpha) :
    x ∈ Complement A ↔ x ∉ A := by
  sorry

/-- The universal predicate set over `Alpha`. -/
def Universal (Alpha : Type u) : LRA.Set.PredicateSet Alpha := fun _ => True

theorem UniversalMembership (x : Alpha) : x ∈ Universal Alpha := by
  sorry

/-- Relative set difference. -/
def Difference (A B : LRA.Set.PredicateSet Alpha) : LRA.Set.PredicateSet Alpha :=
  fun x => x ∈ A ∧ x ∉ B

theorem DifferenceMembership (A B : LRA.Set.PredicateSet Alpha) (x : Alpha) :
    x ∈ Difference A B ↔ x ∈ A ∧ x ∉ B := by
  sorry

/-- `D` is the relative complement of `B` in `A`. -/
def IsRelativeComplementOf
    (A B D : LRA.Set.PredicateSet Alpha) : Prop :=
  ∀ x : Alpha, x ∈ D ↔ x ∈ A ∧ x ∉ B

/-- A citable synonym for difference. -/
abbrev RelativeComplement
    (A B : LRA.Set.PredicateSet Alpha) : LRA.Set.PredicateSet Alpha :=
  Difference A B

theorem RelativeComplementIsRelativeComplementOf
    (A B : LRA.Set.PredicateSet Alpha) :
    IsRelativeComplementOf A B (RelativeComplement A B) :=
  DifferenceMembership A B

theorem RelativeComplementMembership
    (A B : LRA.Set.PredicateSet Alpha) (x : Alpha) :
    x ∈ RelativeComplement A B ↔ x ∈ A ∧ x ∉ B :=
  DifferenceMembership A B x

/-- Symmetric difference. -/
def SymmetricDifference
    (A B : LRA.Set.PredicateSet Alpha) : LRA.Set.PredicateSet Alpha :=
  fun x => (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)

theorem SymmetricDifferenceMembership
    (A B : LRA.Set.PredicateSet Alpha) (x : Alpha) :
    x ∈ SymmetricDifference A B ↔
      (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A) := by
  sorry

/-- Predicate-set inclusion. -/
def Subset (A B : LRA.Set.PredicateSet Alpha) : Prop :=
  ∀ x : Alpha, x ∈ A → x ∈ B

theorem SubsetIff (A B : LRA.Set.PredicateSet Alpha) :
    Subset A B ↔ ∀ x : Alpha, x ∈ A → x ∈ B := by
  sorry

/-- Power set as a predicate set whose elements are predicate sets. -/
def PowerSet (A : LRA.Set.PredicateSet Alpha) :
    LRA.Set.PredicateSet (LRA.Set.PredicateSet Alpha) :=
  fun B => Subset B A

theorem PowerSetMembership
    (A B : LRA.Set.PredicateSet Alpha) :
    B ∈ PowerSet A ↔ Subset B A := by
  sorry

/-- Union over a predicate collection of predicate sets. -/
def CollectionUnion
    (C : LRA.Set.PredicateSet (LRA.Set.PredicateSet Alpha)) :
    LRA.Set.PredicateSet Alpha :=
  fun x => ∃ B, B ∈ C ∧ x ∈ B

theorem CollectionUnionMembership
    (C : LRA.Set.PredicateSet (LRA.Set.PredicateSet Alpha)) (x : Alpha) :
    x ∈ CollectionUnion C ↔ ∃ B, B ∈ C ∧ x ∈ B := by
  sorry

/-- Intersection over a predicate collection of predicate sets. -/
def CollectionIntersection
    (C : LRA.Set.PredicateSet (LRA.Set.PredicateSet Alpha)) :
    LRA.Set.PredicateSet Alpha :=
  fun x => ∀ B, B ∈ C → x ∈ B

theorem CollectionIntersectionMembership
    (C : LRA.Set.PredicateSet (LRA.Set.PredicateSet Alpha)) (x : Alpha) :
    x ∈ CollectionIntersection C ↔ ∀ B, B ∈ C → x ∈ B := by
  sorry

/-- Predicate-set nonemptiness. -/
def Nonempty (A : LRA.Set.PredicateSet Alpha) : Prop :=
  ∃ x : Alpha, x ∈ A

/-- Separation by a predicate. -/
def Separation
    (A : LRA.Set.PredicateSet Alpha) (property : Alpha → Prop) :
    LRA.Set.PredicateSet Alpha :=
  fun x => x ∈ A ∧ property x

theorem SeparationMembership
    (A : LRA.Set.PredicateSet Alpha) (property : Alpha → Prop) (x : Alpha) :
    x ∈ Separation A property ↔ x ∈ A ∧ property x := by
  sorry

/-- An indexed family of predicate sets. -/
def Family (Index : Type v) (Alpha : Type u) :=
  Index → LRA.Set.PredicateSet Alpha

/-- Indexed union. -/
def IndexedUnion {Index : Type v} (family : Family Index Alpha) :
    LRA.Set.PredicateSet Alpha :=
  fun x => ∃ i : Index, x ∈ family i

theorem IndexedUnionMembership
    {Index : Type v} (family : Family Index Alpha) (x : Alpha) :
    x ∈ IndexedUnion family ↔ ∃ i : Index, x ∈ family i := by
  sorry

/-- Indexed intersection. -/
def IndexedIntersection {Index : Type v} (family : Family Index Alpha) :
    LRA.Set.PredicateSet Alpha :=
  fun x => ∀ i : Index, x ∈ family i

theorem IndexedIntersectionMembership
    {Index : Type v} (family : Family Index Alpha) (x : Alpha) :
    x ∈ IndexedIntersection family ↔ ∀ i : Index, x ∈ family i := by
  sorry

end LRA.Set.PredicateSet

/-!
Compatibility exports for the pre-standardization `LRA.Set.LRASet` namespace.
Canonical code should use `LRA.Set.PredicateSet`.
-/
namespace LRA.Set.LRASet

export LRA.Set.PredicateSet
  (Empty EmptyMembership
   Singleton SingletonMembership
   Insert InsertMembership
   Pair PairMembership PairEqualsInsertSingleton
   Union UnionMembership
   Intersection IntersectionMembership
   Complement ComplementMembership
   Universal UniversalMembership
   Difference DifferenceMembership
   IsRelativeComplementOf RelativeComplement
   RelativeComplementIsRelativeComplementOf RelativeComplementMembership
   SymmetricDifference SymmetricDifferenceMembership
   Subset SubsetIff
   PowerSet PowerSetMembership
   CollectionUnion CollectionUnionMembership
   CollectionIntersection CollectionIntersectionMembership
   Nonempty Separation SeparationMembership
   Family IndexedUnion IndexedUnionMembership
   IndexedIntersection IndexedIntersectionMembership)

end LRA.Set.LRASet
