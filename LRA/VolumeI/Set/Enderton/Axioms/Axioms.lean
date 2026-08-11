import LRA.VolumeI.Set.Enderton.Primitives

/-! The axioms of Enderton-style textbook set theory. -/

namespace LRA.VolumeI.Set.Enderton

/-- TeX label: `ax:extensionality`.
Sets with the same members are equal.

Logical form:

```lean
axiom Extensionality (A B : Set) :
    (∀ x : Set, x ∈ A ↔ x ∈ B) → A = B
```
-/
axiom Extensionality (A B : Set) :
    (∀ x : Set, x ∈ A ↔ x ∈ B) → A = B

/-- TeX label: `ax:empty-set`.
There exists a set with no members.

Logical form:

```lean
axiom EmptySet :
    ∃ A : Set, ∀ x : Set, x ∉ A
```
-/
axiom EmptySet :
    ∃ A : Set, ∀ x : Set, x ∉ A

/-- TeX label: `ax:pairing`.
For any two sets, there exists a set containing exactly those two sets.

Logical form:

```lean
axiom Pairing (A B : Set) :
    ∃ C : Set,
      ∀ x : Set, x ∈ C ↔ x = A ∨ x = B
```
-/
axiom Pairing (A B : Set) :
    ∃ C : Set,
      ∀ x : Set, x ∈ C ↔ x = A ∨ x = B

/-- TeX label: `ax:union`.

For any set of sets, there exists a set containing exactly the members of its
members.

Logical form:

```lean
axiom Union (A : Set) :
    ∃ U : Set,
      ∀ x : Set,
        x ∈ U ↔ ∃ B : Set, B ∈ A ∧ x ∈ B
```
-/
axiom Union (A : Set) :
    ∃ U : Set,
      ∀ x : Set,
        x ∈ U ↔ ∃ B : Set, B ∈ A ∧ x ∈ B

/-- TeX label: `ax:power-set`.
For any set, there exists a set whose members are exactly its subsets.

Logical form:

```lean
axiom PowerSet (A : Set) :
    ∃ P : Set,
      ∀ x : Set,
        x ∈ P ↔ ∀ y : Set, y ∈ x → y ∈ A
```
-/
axiom PowerSet (A : Set) :
    ∃ P : Set,
      ∀ x : Set,
        x ∈ P ↔ ∀ y : Set, y ∈ x → y ∈ A

/-- TeX label: `ax:infinity`.

There exists a set containing an empty set and, with each member, a successor
whose members are exactly that member's members together with the member
itself.

Logical form:

```lean
axiom Infinity :
    ∃ A : Set,
      (∃ empty : Set,
        empty ∈ A ∧ ∀ w : Set, w ∉ empty) ∧
      ∀ x : Set, x ∈ A →
        ∃ successor : Set,
          successor ∈ A ∧
          ∀ w : Set, w ∈ successor ↔ w ∈ x ∨ w = x
```
-/
axiom Infinity :
    ∃ A : Set,
      (∃ empty : Set,
        empty ∈ A ∧ ∀ w : Set, w ∉ empty) ∧
      ∀ x : Set, x ∈ A →
        ∃ successor : Set,
          successor ∈ A ∧
          ∀ w : Set, w ∈ successor ↔ w ∈ x ∨ w = x

/-- TeX label: `ax:separation`.

For each property and set, there exists a subset containing exactly the
members that satisfy the property. The predicate parameter represents the
axiom schema in Lean.

Logical form:

```lean
axiom Separation (property : Set -> Prop) (A : Set) :
    ∃ B : Set,
      ∀ x : Set, x ∈ B ↔ x ∈ A ∧ property x
```
-/
axiom Separation (property : Set -> Prop) (A : Set) :
    ∃ B : Set,
      ∀ x : Set, x ∈ B ↔ x ∈ A ∧ property x

/-- TeX label: `ax:replacement`.

If a relation assigns exactly one output to each member of a set, those outputs
form a set. The relation parameter represents the axiom schema in Lean.

Logical form:

```lean
axiom Replacement (relation : Set -> Set -> Prop) (A : Set) :
    (∀ x : Set, x ∈ A →
      ∃ y : Set,
        relation x y ∧
        ∀ other : Set, relation x other → other = y) →
      ∃ B : Set,
        ∀ y : Set,
          y ∈ B ↔ ∃ x : Set, x ∈ A ∧ relation x y
```
-/
axiom Replacement (relation : Set -> Set -> Prop) (A : Set) :
    (∀ x : Set, x ∈ A →
      ∃ y : Set,
        relation x y ∧
        ∀ other : Set, relation x other → other = y) →
      ∃ B : Set,
        ∀ y : Set,
          y ∈ B ↔ ∃ x : Set, x ∈ A ∧ relation x y

/-- TeX label: `ax:foundation`.
Every nonempty set has a member disjoint from it.

Logical form:

```lean
axiom Foundation (A : Set) :
    (∃ w : Set, w ∈ A) →
      ∃ x : Set,
        x ∈ A ∧ ∀ y : Set, y ∈ x → y ∉ A
```
-/
axiom Foundation (A : Set) :
    (∃ w : Set, w ∈ A) →
      ∃ x : Set,
        x ∈ A ∧ ∀ y : Set, y ∈ x → y ∉ A

/-- TeX label: `ax:choice`.

Every pairwise-disjoint family of nonempty sets has a set containing exactly
one member of each set in the family. This membership-only formulation is
equivalent to the usual choice-function statement and does not presuppose a
construction of functions as sets.

Logical form:

```lean
axiom Choice (A : Set) :
    (∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B) →
    (∀ B C : Set,
      B ∈ A → C ∈ A → B ≠ C →
        ∀ x : Set, x ∈ B → x ∉ C) →
      ∃ choiceSet : Set,
        ∀ B : Set, B ∈ A →
          ∃ x : Set,
            (x ∈ B ∧ x ∈ choiceSet) ∧
            ∀ other : Set,
              (other ∈ B ∧ other ∈ choiceSet) → other = x
```
-/
axiom Choice (A : Set) :
    (∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B) →
    (∀ B C : Set,
      B ∈ A → C ∈ A → B ≠ C →
        ∀ x : Set, x ∈ B → x ∉ C) →
      ∃ choiceSet : Set,
        ∀ B : Set, B ∈ A →
          ∃ x : Set,
            (x ∈ B ∧ x ∈ choiceSet) ∧
            ∀ other : Set,
              (other ∈ B ∧ other ∈ choiceSet) → other = x

end LRA.VolumeI.Set.Enderton
