namespace LRA.Set

universe u

/-!
Distributivity and absorption laws as a law-carrying typeclass. Same
design as `UnionLaws` (see `Interface/Union.lean`). Note the constraint
list: these laws mention only `∪` and `∩`, so only `Union` and `Inter`
are required -- the certificate demands exactly the machines its laws
talk about, nothing more.
-/
/--
`DistributivityLaws` exposes this formal declaration.

Logical form:

```lean
class DistributivityLaws (α : Type u) [Union α] [Inter α] : Prop where
  IntersectionDistributesOverUnion :
    ∀ A B C : α, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
  UnionDistributesOverIntersection :
    ∀ A B C : α, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
  AbsorptionUnionIntersection : ∀ A B : α, A ∪ (A ∩ B) = A
  AbsorptionIntersectionUnion : ∀ A B : α, A ∩ (A ∪ B) = A
```
-/

class DistributivityLaws (α : Type u) [Union α] [Inter α] : Prop where
  IntersectionDistributesOverUnion :
    ∀ A B C : α, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
  UnionDistributesOverIntersection :
    ∀ A B C : α, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
  AbsorptionUnionIntersection : ∀ A B : α, A ∪ (A ∩ B) = A
  AbsorptionIntersectionUnion : ∀ A B : α, A ∩ (A ∪ B) = A

variable {α : Type u} [Union α] [Inter α] [DistributivityLaws α]
/--
Intersection distributes over union.

Logical form:

```lean
theorem IntersectionDistributesOverUnion :
    ∀ A B C : α, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
```
-/
theorem IntersectionDistributesOverUnion :
    ∀ A B C : α, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C) := by
  sorry

/--
Union distributes over intersection.

Logical form:

```lean
theorem UnionDistributesOverIntersection :
    ∀ A B C : α, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
```
-/
theorem UnionDistributesOverIntersection :
    ∀ A B C : α, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C) := by
  sorry

/--
Absorption: `A ∪ (A ∩ B) = A`.

Logical form:

```lean
theorem AbsorptionUnionIntersection : ∀ A B : α, A ∪ (A ∩ B) = A
```
-/
theorem AbsorptionUnionIntersection : ∀ A B : α, A ∪ (A ∩ B) = A := by
  sorry

/--
Absorption: `A ∩ (A ∪ B) = A`.

Logical form:

```lean
theorem AbsorptionIntersectionUnion : ∀ A B : α, A ∩ (A ∪ B) = A
```
-/
theorem AbsorptionIntersectionUnion : ∀ A B : α, A ∩ (A ∪ B) = A := by
  sorry

end LRA.Set
