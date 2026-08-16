namespace LRA.AlgebraicStructures

universe u

/-!
Distributivity: the one mixin that mentions both `+` and `*`, and
therefore the law that makes a ring more than a pair of monoids.
-/

/--
`DistributiveLaws` packages the class contract for distributive laws.

Logical form:

```lean
class DistributiveLaws (R : Type u) [Add R] [Mul R] : Prop where
  LeftDistributive : ∀ a b c : R, a * (b + c) = a * b + a * c
  RightDistributive : ∀ a b c : R, (a + b) * c = a * c + b * c
```
-/
class DistributiveLaws (R : Type u) [Add R] [Mul R] : Prop where
  LeftDistributive : ∀ a b c : R, a * (b + c) = a * b + a * c
  RightDistributive : ∀ a b c : R, (a + b) * c = a * c + b * c

section Wrappers

variable {R : Type u} [Add R] [Mul R] [DistributiveLaws R]

/-- Multiplication distributes over addition from the left.

Logical form:

```lean
theorem LeftDistributive : ∀ a b c : R, a * (b + c) = a * b + a * c
```
-/
theorem LeftDistributive : ∀ a b c : R, a * (b + c) = a * b + a * c :=
  DistributiveLaws.LeftDistributive

/-- Multiplication distributes over addition from the right.

Logical form:

```lean
theorem RightDistributive : ∀ a b c : R, (a + b) * c = a * c + b * c
```
-/
theorem RightDistributive : ∀ a b c : R, (a + b) * c = a * c + b * c :=
  DistributiveLaws.RightDistributive

end Wrappers

end LRA.AlgebraicStructures
