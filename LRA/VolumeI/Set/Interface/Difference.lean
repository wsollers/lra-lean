namespace LRA.VolumeI.Set

universe u

/-!
The difference (`\`) law family as a law-carrying typeclass. Same design
as `UnionLaws` (see `Interface/Union.lean`).

Deliberately absent: `DifferenceUniversal` (`A \ 𝒰 = ∅`) and
`UniversalDifference` (`𝒰 \ A = Aᶜ`). Both mention a universal set, so
they live in `Interface/Complement.lean`, whose certificate requires
`HasUniversal`/`HasComplement` -- capabilities a backend like Enderton
structurally cannot register. Everything below holds for any backend
with `\`, `∪`, `∩`, `∅`, and `⊆`.
-/
/--
`DifferenceLaws` exposes this formal declaration.

Logical form:

```lean
class DifferenceLaws (α : Type u)
    [SDiff α] [Union α] [Inter α] [EmptyCollection α] [HasSubset α] :
    Prop where
  DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : α, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B
  DifferenceAntitoneRight :
    ∀ A B₁ B₂ : α, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁
  DifferenceEmpty : ∀ A : α, A \ (∅ : α) = A
  EmptyDifference : ∀ A : α, (∅ : α) \ A = (∅ : α)
  DifferenceSelf : ∀ A : α, A \ A = (∅ : α)
  DifferenceUnion : ∀ A B C : α, A \ (B ∪ C) = (A \ B) ∩ (A \ C)
  DifferenceIntersection : ∀ A B C : α, A \ (B ∩ C) = (A \ B) ∪ (A \ C)
  UnionDifferenceDistributes :
    ∀ A B C : α, (A ∪ B) \ C = (A \ C) ∪ (B \ C)
  IntersectionDifferenceDistributes :
    ∀ A B C : α, (A ∩ B) \ C = (A \ C) ∩ (B \ C)
  DifferenceSubsetLeft : ∀ A B : α, A \ B ⊆ A
  DifferenceDisjointRight : ∀ A B : α, (A \ B) ∩ B = (∅ : α)
```
-/

class DifferenceLaws (α : Type u)
    [SDiff α] [Union α] [Inter α] [EmptyCollection α] [HasSubset α] :
    Prop where
  DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : α, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B
  DifferenceAntitoneRight :
    ∀ A B₁ B₂ : α, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁
  DifferenceEmpty : ∀ A : α, A \ (∅ : α) = A
  EmptyDifference : ∀ A : α, (∅ : α) \ A = (∅ : α)
  DifferenceSelf : ∀ A : α, A \ A = (∅ : α)
  DifferenceUnion : ∀ A B C : α, A \ (B ∪ C) = (A \ B) ∩ (A \ C)
  DifferenceIntersection : ∀ A B C : α, A \ (B ∩ C) = (A \ B) ∪ (A \ C)
  UnionDifferenceDistributes :
    ∀ A B C : α, (A ∪ B) \ C = (A \ C) ∪ (B \ C)
  IntersectionDifferenceDistributes :
    ∀ A B C : α, (A ∩ B) \ C = (A \ C) ∩ (B \ C)
  DifferenceSubsetLeft : ∀ A B : α, A \ B ⊆ A
  DifferenceDisjointRight : ∀ A B : α, (A \ B) ∩ B = (∅ : α)

variable {α : Type u}
variable [SDiff α] [Union α] [Inter α] [EmptyCollection α] [HasSubset α]
variable [DifferenceLaws α]
/--
Difference is monotone in its left argument.

Logical form:

```lean
theorem DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : α, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B
```
-/
theorem DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : α, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B :=
  DifferenceLaws.DifferenceMonotoneLeft
/--
Difference is antitone in its right argument.

Logical form:

```lean
theorem DifferenceAntitoneRight :
    ∀ A B₁ B₂ : α, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁
```
-/
theorem DifferenceAntitoneRight :
    ∀ A B₁ B₂ : α, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁ :=
  DifferenceLaws.DifferenceAntitoneRight
/--
Removing nothing changes nothing.

Logical form:

```lean
theorem DifferenceEmpty : ∀ A : α, A \ (∅ : α) = A
```
-/
theorem DifferenceEmpty : ∀ A : α, A \ (∅ : α) = A :=
  DifferenceLaws.DifferenceEmpty
/--
The empty set minus anything is empty.

Logical form:

```lean
theorem EmptyDifference : ∀ A : α, (∅ : α) \ A = (∅ : α)
```
-/
theorem EmptyDifference : ∀ A : α, (∅ : α) \ A = (∅ : α) :=
  DifferenceLaws.EmptyDifference
/--
Removing a set from itself leaves nothing.

Logical form:

```lean
theorem DifferenceSelf : ∀ A : α, A \ A = (∅ : α)
```
-/
theorem DifferenceSelf : ∀ A : α, A \ A = (∅ : α) :=
  DifferenceLaws.DifferenceSelf
/--
De Morgan for difference: `A \ (B ∪ C) = (A \ B) ∩ (A \ C)`.

Logical form:

```lean
theorem DifferenceUnion :
    ∀ A B C : α, A \ (B ∪ C) = (A \ B) ∩ (A \ C)
```
-/
theorem DifferenceUnion :
    ∀ A B C : α, A \ (B ∪ C) = (A \ B) ∩ (A \ C) :=
  DifferenceLaws.DifferenceUnion
/--
De Morgan for difference: `A \ (B ∩ C) = (A \ B) ∪ (A \ C)`.

Logical form:

```lean
theorem DifferenceIntersection :
    ∀ A B C : α, A \ (B ∩ C) = (A \ B) ∪ (A \ C)
```
-/
theorem DifferenceIntersection :
    ∀ A B C : α, A \ (B ∩ C) = (A \ B) ∪ (A \ C) :=
  DifferenceLaws.DifferenceIntersection
/--
Difference distributes over union on the left.

Logical form:

```lean
theorem UnionDifferenceDistributes :
    ∀ A B C : α, (A ∪ B) \ C = (A \ C) ∪ (B \ C)
```
-/
theorem UnionDifferenceDistributes :
    ∀ A B C : α, (A ∪ B) \ C = (A \ C) ∪ (B \ C) :=
  DifferenceLaws.UnionDifferenceDistributes
/--
Difference distributes over intersection on the left.

Logical form:

```lean
theorem IntersectionDifferenceDistributes :
    ∀ A B C : α, (A ∩ B) \ C = (A \ C) ∩ (B \ C)
```
-/
theorem IntersectionDifferenceDistributes :
    ∀ A B C : α, (A ∩ B) \ C = (A \ C) ∩ (B \ C) :=
  DifferenceLaws.IntersectionDifferenceDistributes
/--
`A \ B` is a subset of `A`.

Logical form:

```lean
theorem DifferenceSubsetLeft : ∀ A B : α, A \ B ⊆ A
```
-/
theorem DifferenceSubsetLeft : ∀ A B : α, A \ B ⊆ A :=
  DifferenceLaws.DifferenceSubsetLeft
/--
`A \ B` is disjoint from `B`.

Logical form:

```lean
theorem DifferenceDisjointRight :
    ∀ A B : α, (A \ B) ∩ B = (∅ : α)
```
-/
theorem DifferenceDisjointRight :
    ∀ A B : α, (A \ B) ∩ B = (∅ : α) :=
  DifferenceLaws.DifferenceDisjointRight

end LRA.VolumeI.Set
