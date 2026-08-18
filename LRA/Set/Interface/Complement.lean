import LRA.Set.Interface.Operations

namespace LRA.Set

universe u

/-!
The absolute-complement and universal-set law family as a law-carrying
typeclass. Same design as `UnionLaws` (see `Interface/Union.lean`).

This is the capability boundary doing its job. The certificate requires
`HasComplement` and `HasUniversal` (`Interface/Operations.lean`), which
only a backend with an ambient carrier can register: `LRASet` (and,
later, a Mathlib-backed `Set`) can; Enderton structurally cannot -- an
absolute complement or universal set of ZFC sets is impossible by
Russell's paradox. For Enderton, nothing here is "missing a proof":
`Aᶜ` and `𝒰` do not even elaborate at `LRA.Set.ZFCSet`, so these theorems
are unavailable at the parse level rather than falsely promised.

`DifferenceUniversal` and `UniversalDifference` are difference laws by
spelling, but they mention `𝒰`, so they live here, not in
`Interface/Difference.lean` -- each family's certificate requires exactly
the operation classes its laws mention.
-/
/--
`ComplementLaws` exposes this formal declaration.

Logical form:

```lean
class ComplementLaws (α : Type u)
    [HasComplement α] [HasUniversal α] [Union α] [Inter α] [SDiff α]
    [EmptyCollection α] : Prop where
  DoubleComplement : ∀ A : α, Aᶜᶜ = A
  ComplementEmpty : (∅ : α)ᶜ = (𝒰 : α)
  ComplementUniversal : (𝒰 : α)ᶜ = (∅ : α)
  UnionComplement : ∀ A : α, A ∪ Aᶜ = (𝒰 : α)
  IntersectionComplement : ∀ A : α, A ∩ Aᶜ = (∅ : α)
  DeMorganUnion : ∀ A B : α, (A ∪ B)ᶜ = Aᶜ ∩ Bᶜ
  DeMorganIntersection : ∀ A B : α, (A ∩ B)ᶜ = Aᶜ ∪ Bᶜ
  DifferenceAsIntersectionComplement : ∀ A B : α, A \ B = A ∩ Bᶜ
  DifferenceUniversal : ∀ A : α, A \ (𝒰 : α) = (∅ : α)
  UniversalDifference : ∀ A : α, (𝒰 : α) \ A = Aᶜ
```
-/

class ComplementLaws (α : Type u)
    [HasComplement α] [HasUniversal α] [Union α] [Inter α] [SDiff α]
    [EmptyCollection α] : Prop where
  DoubleComplement : ∀ A : α, Aᶜᶜ = A
  ComplementEmpty : (∅ : α)ᶜ = (𝒰 : α)
  ComplementUniversal : (𝒰 : α)ᶜ = (∅ : α)
  UnionComplement : ∀ A : α, A ∪ Aᶜ = (𝒰 : α)
  IntersectionComplement : ∀ A : α, A ∩ Aᶜ = (∅ : α)
  DeMorganUnion : ∀ A B : α, (A ∪ B)ᶜ = Aᶜ ∩ Bᶜ
  DeMorganIntersection : ∀ A B : α, (A ∩ B)ᶜ = Aᶜ ∪ Bᶜ
  DifferenceAsIntersectionComplement : ∀ A B : α, A \ B = A ∩ Bᶜ
  DifferenceUniversal : ∀ A : α, A \ (𝒰 : α) = (∅ : α)
  UniversalDifference : ∀ A : α, (𝒰 : α) \ A = Aᶜ

variable {α : Type u}
variable [HasComplement α] [HasUniversal α] [Union α] [Inter α]
variable [SDiff α] [EmptyCollection α]
variable [ComplementLaws α]
/--
Complement is an involution: `Aᶜᶜ = A`.

Logical form:

```lean
theorem DoubleComplement : ∀ A : α, Aᶜᶜ = A
```
-/
theorem DoubleComplement : ∀ A : α, Aᶜᶜ = A :=
  ComplementLaws.DoubleComplement
/--
The complement of the empty set is the universal set.

Logical form:

```lean
theorem ComplementEmpty : (∅ : α)ᶜ = (𝒰 : α)
```
-/
theorem ComplementEmpty : (∅ : α)ᶜ = (𝒰 : α) :=
  ComplementLaws.ComplementEmpty
/--
The complement of the universal set is the empty set.

Logical form:

```lean
theorem ComplementUniversal : (𝒰 : α)ᶜ = (∅ : α)
```
-/
theorem ComplementUniversal : (𝒰 : α)ᶜ = (∅ : α) :=
  ComplementLaws.ComplementUniversal
/--
Excluded middle for sets: `A ∪ Aᶜ = 𝒰`.

Logical form:

```lean
theorem UnionComplement : ∀ A : α, A ∪ Aᶜ = (𝒰 : α)
```
-/
theorem UnionComplement : ∀ A : α, A ∪ Aᶜ = (𝒰 : α) :=
  ComplementLaws.UnionComplement
/--
Non-contradiction for sets: `A ∩ Aᶜ = ∅`.

Logical form:

```lean
theorem IntersectionComplement : ∀ A : α, A ∩ Aᶜ = (∅ : α)
```
-/
theorem IntersectionComplement : ∀ A : α, A ∩ Aᶜ = (∅ : α) :=
  ComplementLaws.IntersectionComplement
/--
De Morgan: `(A ∪ B)ᶜ = Aᶜ ∩ Bᶜ`.

Logical form:

```lean
theorem DeMorganUnion : ∀ A B : α, (A ∪ B)ᶜ = Aᶜ ∩ Bᶜ
```
-/
theorem DeMorganUnion : ∀ A B : α, (A ∪ B)ᶜ = Aᶜ ∩ Bᶜ :=
  ComplementLaws.DeMorganUnion
/--
De Morgan: `(A ∩ B)ᶜ = Aᶜ ∪ Bᶜ`.

Logical form:

```lean
theorem DeMorganIntersection : ∀ A B : α, (A ∩ B)ᶜ = Aᶜ ∪ Bᶜ
```
-/
theorem DeMorganIntersection : ∀ A B : α, (A ∩ B)ᶜ = Aᶜ ∪ Bᶜ :=
  ComplementLaws.DeMorganIntersection
/--
Difference is intersection with the complement: `A \ B = A ∩ Bᶜ`.

Logical form:

```lean
theorem DifferenceAsIntersectionComplement :
    ∀ A B : α, A \ B = A ∩ Bᶜ
```
-/
theorem DifferenceAsIntersectionComplement :
    ∀ A B : α, A \ B = A ∩ Bᶜ :=
  ComplementLaws.DifferenceAsIntersectionComplement
/--
Removing everything leaves nothing: `A \ 𝒰 = ∅`.

Logical form:

```lean
theorem DifferenceUniversal : ∀ A : α, A \ (𝒰 : α) = (∅ : α)
```
-/
theorem DifferenceUniversal : ∀ A : α, A \ (𝒰 : α) = (∅ : α) :=
  ComplementLaws.DifferenceUniversal
/--
Removing `A` from everything is the complement: `𝒰 \ A = Aᶜ`.

Logical form:

```lean
theorem UniversalDifference : ∀ A : α, (𝒰 : α) \ A = Aᶜ
```
-/
theorem UniversalDifference : ∀ A : α, (𝒰 : α) \ A = Aᶜ :=
  ComplementLaws.UniversalDifference

end LRA.Set
