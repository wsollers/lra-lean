-- LRA/VolumeI/Set/Enderton/Theorems/OrderedPairs.lean
-- Kuratowski ordered pairs: the Enderton backend's pairing capability.

import LRA.VolumeI.Set.Enderton.Theorems.Pairing
import LRA.VolumeI.Set.Interface.Pairing

namespace LRA.VolumeI.Set.Enderton

/-!
Volume I label: enderton-ordered-pairs
Lean module: LRA.VolumeI.Set.Enderton.Theorems.OrderedPairs
Verification status: definitions checked; Theorem 3A and its
consequences pending (proving queue)

The Kuratowski ordered pair: `⟨a, b⟩ = {{a}, {a, b}}`, built from the
Pairing axiom twice. This is the single-sorted answer to "where does
the plane live?" — the pair is itself a set, so relations and
functions are sets of sets, citizens of the same universe as their
arguments.

The interface registration at the bottom is what makes
`OrderedPair a b`, `Relates`, `DomainOf`, … resolve to THIS
construction whenever the coordinates are Enderton sets — at high
priority, so the Kuratowski pair beats the default type-level product
on this carrier. The generic vocabulary never looks inside the pair;
the theorems here about its *members* (`SingletonSet a ∈ ⟨a, b⟩`) are
backend-private facts the interface cannot even state.
-/

/-- **[Definition — SingletonSet]**

The singleton `{a} = {a, a}`, by Pairing with itself.

Logical form:

```lean
noncomputable def SingletonSet (element : Set) : Set :=
  PairSet element element
```
-/
noncomputable def SingletonSet (element : Set) : Set :=
  PairSet element element

/-- **[Definition — KuratowskiPair]**

The Kuratowski ordered pair `⟨a, b⟩ = {{a}, {a, b}}`.

Logical form:

```lean
noncomputable def KuratowskiPair (first second : Set) : Set :=
  PairSet (SingletonSet first) (PairSet first second)
```
-/
noncomputable def KuratowskiPair (first second : Set) : Set :=
  PairSet (SingletonSet first) (PairSet first second)

/-- **[Theorem — MemberOfSingletonSet]**

The singleton's only member is its element.

Logical form:

```lean
theorem MemberOfSingletonSet (element candidate : Set) :
    candidate ∈ SingletonSet element ↔ candidate = element
```
-/
theorem MemberOfSingletonSet (element candidate : Set) :
    candidate ∈ SingletonSet element ↔ candidate = element := by
  sorry

/-- **[Theorem — KuratowskiPairInjective]**

Enderton's Theorem 3A: Kuratowski pairs are equal exactly when their
coordinates are. The whole point of the `{{a}, {a, b}}` trick — the
asymmetry between the two members encodes the order.

Logical form:

```lean
theorem KuratowskiPairInjective
    (firstLeft secondLeft firstRight secondRight : Set) :
    KuratowskiPair firstLeft firstRight =
        KuratowskiPair secondLeft secondRight ↔
      firstLeft = secondLeft ∧ firstRight = secondRight
```
-/
theorem KuratowskiPairInjective
    (firstLeft secondLeft firstRight secondRight : Set) :
    KuratowskiPair firstLeft firstRight =
        KuratowskiPair secondLeft secondRight ↔
      firstLeft = secondLeft ∧ firstRight = secondRight := by
  sorry

/-- **[Theorem — SingletonMemberOfKuratowskiPair]**

Backend-private: the first coordinate's singleton is a member of the
pair — a fact about the pair's *insides* that the generic interface
cannot even state.

Logical form:

```lean
theorem SingletonMemberOfKuratowskiPair (first second : Set) :
    SingletonSet first ∈ KuratowskiPair first second
```
-/
theorem SingletonMemberOfKuratowskiPair (first second : Set) :
    SingletonSet first ∈ KuratowskiPair first second := by
  sorry

/-! ## Interface registration

High priority, so on Enderton sets the internal Kuratowski pair beats
the default type-level product. -/

/-- **[Instance — Enderton pairing]**

Logical form:

```lean
noncomputable instance (priority := high) :
    HasPairing Set Set Set :=
  ⟨KuratowskiPair⟩
```
-/
noncomputable instance (priority := high) :
    HasPairing Set Set Set :=
  ⟨KuratowskiPair⟩

/-- **[Instance — Enderton pairing laws]** (delegates to Theorem 3A).

Logical form:

```lean
instance : PairingLaws Set Set Set :=
  ⟨KuratowskiPairInjective⟩
```
-/
instance : PairingLaws Set Set Set :=
  ⟨fun firstLeft secondLeft firstRight secondRight =>
    KuratowskiPairInjective firstLeft secondLeft firstRight secondRight⟩

end LRA.VolumeI.Set.Enderton
