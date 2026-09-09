import LRA.AlgebraicStructures
import LRA.NumberSystems.WholeNumbers.Constructions.Landau.Instances

namespace LRA.NumberSystems.WholeNumbers.Constructions.Landau

open LRA.AlgebraicStructures

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`satisfiesCommutativeSemiring` The Landau whole-number construction canonically realizes commutative semiring structure.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), have x := LRA.NumberSystems.WholeNumbers.Constructions.Landau.addOn natural_data; have x_1 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.mulOn natural_data; have x_2 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.zeroOn natural_data; have x_3 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.oneOn natural_data; have x_4 := ⋯; LRA.AlgebraicStructures.CommutativeSemiringLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    have x := LRA.NumberSystems.WholeNumbers.Constructions.Landau.addOn natural_data; have x_1 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.mulOn natural_data; have x_2 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.zeroOn natural_data; have x_3 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.oneOn natural_data; have x_4 := ⋯; LRA.AlgebraicStructures.CommutativeSemiringLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Logical form (Lean):

```lean
theorem satisfiesCommutativeSemiring
    (natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :
    let _ : Add (Carrier natural_data) := addOn natural_data
    let _ : Mul (Carrier natural_data) := mulOn natural_data
    let _ : OfNat (Carrier natural_data) 0 := zeroOn natural_data
    let _ : OfNat (Carrier natural_data) 1 := oneOn natural_data
    let _ : Nonempty (Carrier natural_data) := nonemptyOn natural_data
    CommutativeSemiringLaws (Carrier natural_data)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem satisfiesCommutativeSemiring
    (natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :
    let _ : Add (Carrier natural_data) := addOn natural_data
    let _ : Mul (Carrier natural_data) := mulOn natural_data
    let _ : OfNat (Carrier natural_data) 0 := zeroOn natural_data
    let _ : OfNat (Carrier natural_data) 1 := oneOn natural_data
    let _ : Nonempty (Carrier natural_data) := nonemptyOn natural_data
    CommutativeSemiringLaws (Carrier natural_data) := by
  sorry
/--
`satisfiesOrderedSemiring` The Landau whole-number construction canonically realizes ordered semiring structure.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), have x := LRA.NumberSystems.WholeNumbers.Constructions.Landau.addOn natural_data; have x_1 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.mulOn natural_data; have x_2 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.zeroOn natural_data; have x_3 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.oneOn natural_data; have x_4 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.leOn natural_data; have x_5 := ⋯; LRA.AlgebraicStructures.OrderedSemiringLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    have x := LRA.NumberSystems.WholeNumbers.Constructions.Landau.addOn natural_data; have x_1 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.mulOn natural_data; have x_2 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.zeroOn natural_data; have x_3 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.oneOn natural_data; have x_4 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.leOn natural_data; have x_5 := ⋯; LRA.AlgebraicStructures.OrderedSemiringLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Logical form (Lean):

```lean
theorem satisfiesOrderedSemiring
    (natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :
    let _ : Add (Carrier natural_data) := addOn natural_data
    let _ : Mul (Carrier natural_data) := mulOn natural_data
    let _ : OfNat (Carrier natural_data) 0 := zeroOn natural_data
    let _ : OfNat (Carrier natural_data) 1 := oneOn natural_data
    let _ : LE (Carrier natural_data) := leOn natural_data
    let _ : Nonempty (Carrier natural_data) := nonemptyOn natural_data
    OrderedSemiringLaws (Carrier natural_data)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem satisfiesOrderedSemiring
    (natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :
    let _ : Add (Carrier natural_data) := addOn natural_data
    let _ : Mul (Carrier natural_data) := mulOn natural_data
    let _ : OfNat (Carrier natural_data) 0 := zeroOn natural_data
    let _ : OfNat (Carrier natural_data) 1 := oneOn natural_data
    let _ : LE (Carrier natural_data) := leOn natural_data
    let _ : Nonempty (Carrier natural_data) := nonemptyOn natural_data
    OrderedSemiringLaws (Carrier natural_data) := by
  sorry
end LRA.NumberSystems.WholeNumbers.Constructions.Landau
