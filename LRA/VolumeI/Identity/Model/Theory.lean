import LRA.VolumeI.Identity.Axioms.Axioms
import LRA.VolumeI.Identity.Model.Structures

namespace LRA.Identity

universe u

/-!
Theory card for axiomatic equality.

The primitive theory consists of reflexivity and Leibniz substitution. The
usual laws that make equality usable in predicate logic and algebra are derived
from those principles and exposed by the existing public theorem names.
-/

/--
The two primitive equality principles over a carrier.

Logical form:

```lean
structure EqualityTheory (Carrier : Type u) : Prop where
  reflexivity : ∀ x : Carrier, x = x
  leibniz :
    ∀ x y : Carrier,
      x = y ->
        ∀ property : Carrier -> Prop, property x ↔ property y
```
-/
structure EqualityTheory (Carrier : Type u) : Prop where
  reflexivity : ∀ x : Carrier, x = x
  leibniz :
    ∀ x y : Carrier,
      x = y ->
        ∀ property : Carrier -> Prop, property x ↔ property y

/--
Lean's native equality satisfies the axiomatic equality theory.

Logical form:

```lean
theorem NativeEqualitySatisfiesEqualityTheory (Carrier : Type u) :
    EqualityTheory Carrier
```
-/
theorem NativeEqualitySatisfiesEqualityTheory (Carrier : Type u) :
    EqualityTheory Carrier := by
  constructor
  · intro x
    exact EqualityReflexivity x
  · intro x y equalityWitness property
    exact LeibnizLaw equalityWitness property

/--
Distinctness is negated equality.

Logical form:

```lean
def Distinct {Carrier : Type u} (left right : Carrier) : Prop :=
  ¬ left = right
```
-/
def Distinct {Carrier : Type u} (left right : Carrier) : Prop :=
  ¬ left = right

/--
Existence for a predicate on a carrier.

Logical form:

```lean
def Exists {Carrier : Type u} (predicate : Carrier -> Prop) : Prop :=
  ∃ x, predicate x
```
-/
def Exists {Carrier : Type u} (predicate : Carrier -> Prop) : Prop :=
  ∃ x, predicate x

/--
Uniqueness for a predicate on a carrier: any two witnesses are equal.

Logical form:

```lean
def Unique {Carrier : Type u} (predicate : Carrier -> Prop) : Prop :=
  ∀ left right, predicate left -> predicate right -> left = right
```
-/
def Unique {Carrier : Type u} (predicate : Carrier -> Prop) : Prop :=
  ∀ left right, predicate left -> predicate right -> left = right

/--
Existence and uniqueness for a predicate, built from the separate existence
and uniqueness predicates.

Logical form:

```lean
(∃ witness : Carrier, predicate witness) ∧
  ∀ left right : Carrier, predicate left → predicate right → left = right
```
-/
def ExistsAndUnique {Carrier : Type u} (predicate : Carrier -> Prop) : Prop :=
  Exists predicate ∧ Unique predicate

/--
At least two elements can be expressed in the pure language of equality.

Logical form:

```lean
def AtLeastTwo (Carrier : Type u) : Prop :=
  ∃ x y : Carrier, Distinct x y
```
-/
def AtLeastTwo (Carrier : Type u) : Prop :=
  ∃ x y : Carrier, Distinct x y

/--
At most two elements can be expressed in the pure language of equality.

Logical form:

```lean
def AtMostTwo (Carrier : Type u) : Prop :=
  ∀ x y z : Carrier, x = y ∨ y = z ∨ x = z
```
-/
def AtMostTwo (Carrier : Type u) : Prop :=
  ∀ x y z : Carrier, x = y ∨ y = z ∨ x = z

end LRA.Identity
