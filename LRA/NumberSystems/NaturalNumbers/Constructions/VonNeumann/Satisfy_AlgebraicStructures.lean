import LRA.AlgebraicStructures
import LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.Instances

namespace LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann

open LRA.AlgebraicStructures

/--
`satisfiesAdditiveMonoid` The concrete von Neumann construction canonically realizes additive monoid structure.

Predicate logic:

  have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannAddOn; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannZeroOn; have x_2 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannNonemptyOn; LRA.AlgebraicStructures.AdditiveMonoidLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannAddOn; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannZeroOn; have x_2 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannNonemptyOn; LRA.AlgebraicStructures.AdditiveMonoidLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Logical form (Lean):

```lean
theorem satisfiesAdditiveMonoid :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : OfNat NaturalElement 0 := VonNeumannZeroOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    AdditiveMonoidLaws NaturalElement
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
theorem satisfiesAdditiveMonoid :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : OfNat NaturalElement 0 := VonNeumannZeroOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    AdditiveMonoidLaws NaturalElement := by
  sorry
/--
`satisfiesCommutativeMonoid` The concrete von Neumann construction canonically realizes multiplicative commutative monoid structure.

Predicate logic:

  have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannMulOn; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannOneOn; have x_2 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannNonemptyOn; LRA.AlgebraicStructures.CommutativeMonoidLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannMulOn; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannOneOn; have x_2 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannNonemptyOn; LRA.AlgebraicStructures.CommutativeMonoidLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Logical form (Lean):

```lean
theorem satisfiesCommutativeMonoid :
    let _ : Mul NaturalElement := VonNeumannMulOn
    let _ : OfNat NaturalElement 1 := VonNeumannOneOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    CommutativeMonoidLaws NaturalElement
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
theorem satisfiesCommutativeMonoid :
    let _ : Mul NaturalElement := VonNeumannMulOn
    let _ : OfNat NaturalElement 1 := VonNeumannOneOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    CommutativeMonoidLaws NaturalElement := by
  sorry
/--
`satisfiesSemiring` The concrete von Neumann construction canonically realizes semiring structure.

Predicate logic:

  have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannAddOn; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannMulOn; have x_2 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannZeroOn; have x_3 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannOneOn; have x_4 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannNonemptyOn; LRA.AlgebraicStructures.SemiringLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannAddOn; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannMulOn; have x_2 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannZeroOn; have x_3 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannOneOn; have x_4 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannNonemptyOn; LRA.AlgebraicStructures.SemiringLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Logical form (Lean):

```lean
theorem satisfiesSemiring :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : Mul NaturalElement := VonNeumannMulOn
    let _ : OfNat NaturalElement 0 := VonNeumannZeroOn
    let _ : OfNat NaturalElement 1 := VonNeumannOneOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    SemiringLaws NaturalElement
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
theorem satisfiesSemiring :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : Mul NaturalElement := VonNeumannMulOn
    let _ : OfNat NaturalElement 0 := VonNeumannZeroOn
    let _ : OfNat NaturalElement 1 := VonNeumannOneOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    SemiringLaws NaturalElement := by
  sorry
/--
`satisfiesCommutativeSemiring` The concrete von Neumann construction canonically realizes commutative semiring structure.

Predicate logic:

  have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannAddOn; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannMulOn; have x_2 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannZeroOn; have x_3 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannOneOn; have x_4 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannNonemptyOn; LRA.AlgebraicStructures.CommutativeSemiringLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannAddOn; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannMulOn; have x_2 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannZeroOn; have x_3 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannOneOn; have x_4 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannNonemptyOn; LRA.AlgebraicStructures.CommutativeSemiringLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Logical form (Lean):

```lean
theorem satisfiesCommutativeSemiring :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : Mul NaturalElement := VonNeumannMulOn
    let _ : OfNat NaturalElement 0 := VonNeumannZeroOn
    let _ : OfNat NaturalElement 1 := VonNeumannOneOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    CommutativeSemiringLaws NaturalElement
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
theorem satisfiesCommutativeSemiring :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : Mul NaturalElement := VonNeumannMulOn
    let _ : OfNat NaturalElement 0 := VonNeumannZeroOn
    let _ : OfNat NaturalElement 1 := VonNeumannOneOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    CommutativeSemiringLaws NaturalElement := by
  sorry
end LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann
