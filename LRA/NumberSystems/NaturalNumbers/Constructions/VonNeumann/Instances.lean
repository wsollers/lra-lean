import LRA.AlgebraicStructures
import LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.Operations

namespace LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann

open LRA.AlgebraicStructures

/--
`VonNeumannZeroOn` TODO

Predicate logic:

  noncomputable abbrev VonNeumannZeroOn : OfNat NaturalElement 0 :=
    ⟨NaturalZero⟩

Predicate logic (unfolded):

  noncomputable abbrev VonNeumannZeroOn : OfNat NaturalElement 0 :=
    ⟨NaturalZero⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable abbrev VonNeumannZeroOn : OfNat NaturalElement 0 :=
  ⟨NaturalZero⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable abbrev VonNeumannZeroOn : OfNat NaturalElement 0 :=
  ⟨NaturalZero⟩

/--
`VonNeumannOneOn` TODO

Predicate logic:

  noncomputable abbrev VonNeumannOneOn : OfNat NaturalElement 1 :=
    ⟨NaturalOne⟩

Predicate logic (unfolded):

  noncomputable abbrev VonNeumannOneOn : OfNat NaturalElement 1 :=
    ⟨NaturalOne⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable abbrev VonNeumannOneOn : OfNat NaturalElement 1 :=
  ⟨NaturalOne⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable abbrev VonNeumannOneOn : OfNat NaturalElement 1 :=
  ⟨NaturalOne⟩

/--
`VonNeumannSuccOn` TODO

Predicate logic:

  noncomputable abbrev VonNeumannSuccOn : HasSuccessor NaturalElement :=
    ⟨NaturalSuccessor⟩

Predicate logic (unfolded):

  noncomputable abbrev VonNeumannSuccOn : HasSuccessor NaturalElement :=
    ⟨NaturalSuccessor⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable abbrev VonNeumannSuccOn : HasSuccessor NaturalElement :=
  ⟨NaturalSuccessor⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable abbrev VonNeumannSuccOn : HasSuccessor NaturalElement :=
  ⟨NaturalSuccessor⟩

/--
`VonNeumannNonemptyOn` TODO

Predicate logic:

  Nonempty LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Nonempty LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Logical form (Lean):

```lean
theorem VonNeumannNonemptyOn :
    Nonempty NaturalElement
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
theorem VonNeumannNonemptyOn :
    Nonempty NaturalElement := by
  sorry
/--
`VonNeumannAddOn` TODO

Predicate logic:

  noncomputable abbrev VonNeumannAddOn : Add NaturalElement :=
    ⟨VonNeumannAddition⟩

Predicate logic (unfolded):

  noncomputable abbrev VonNeumannAddOn : Add NaturalElement :=
    ⟨VonNeumannAddition⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable abbrev VonNeumannAddOn : Add NaturalElement :=
  ⟨VonNeumannAddition⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable abbrev VonNeumannAddOn : Add NaturalElement :=
  ⟨VonNeumannAddition⟩

/--
`VonNeumannMulOn` TODO

Predicate logic:

  noncomputable abbrev VonNeumannMulOn : Mul NaturalElement :=
    ⟨VonNeumannMultiplication⟩

Predicate logic (unfolded):

  noncomputable abbrev VonNeumannMulOn : Mul NaturalElement :=
    ⟨VonNeumannMultiplication⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable abbrev VonNeumannMulOn : Mul NaturalElement :=
  ⟨VonNeumannMultiplication⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable abbrev VonNeumannMulOn : Mul NaturalElement :=
  ⟨VonNeumannMultiplication⟩

/--
`VonNeumannAdditiveSemigroupLawsOn` TODO

Predicate logic:

  have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannAddOn; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannNonemptyOn; LRA.AlgebraicStructures.AdditiveSemigroupLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannAddOn; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannNonemptyOn; LRA.AlgebraicStructures.AdditiveSemigroupLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Logical form (Lean):

```lean
theorem VonNeumannAdditiveSemigroupLawsOn :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    AdditiveSemigroupLaws NaturalElement
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
theorem VonNeumannAdditiveSemigroupLawsOn :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    AdditiveSemigroupLaws NaturalElement := by
  sorry
/--
`VonNeumannAdditiveIdentityLawsOn` TODO

Predicate logic:

  have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannAddOn; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannZeroOn; LRA.AlgebraicStructures.AdditiveIdentityLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannAddOn; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannZeroOn; LRA.AlgebraicStructures.AdditiveIdentityLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Logical form (Lean):

```lean
theorem VonNeumannAdditiveIdentityLawsOn :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : OfNat NaturalElement 0 := VonNeumannZeroOn
    AdditiveIdentityLaws NaturalElement
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
theorem VonNeumannAdditiveIdentityLawsOn :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : OfNat NaturalElement 0 := VonNeumannZeroOn
    AdditiveIdentityLaws NaturalElement := by
  sorry
/--
`VonNeumannAdditiveCommutativeLawsOn` TODO

Predicate logic:

  have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannAddOn; LRA.AlgebraicStructures.AdditiveCommutativeLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannAddOn; LRA.AlgebraicStructures.AdditiveCommutativeLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Logical form (Lean):

```lean
theorem VonNeumannAdditiveCommutativeLawsOn :
    let _ : Add NaturalElement := VonNeumannAddOn
    AdditiveCommutativeLaws NaturalElement
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
theorem VonNeumannAdditiveCommutativeLawsOn :
    let _ : Add NaturalElement := VonNeumannAddOn
    AdditiveCommutativeLaws NaturalElement := by
  sorry
/--
`VonNeumannAdditiveMonoidLawsOn` TODO

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
theorem VonNeumannAdditiveMonoidLawsOn :
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
theorem VonNeumannAdditiveMonoidLawsOn :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : OfNat NaturalElement 0 := VonNeumannZeroOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    AdditiveMonoidLaws NaturalElement := by
  sorry
/--
`VonNeumannMultiplicativeSemigroupLawsOn` TODO

Predicate logic:

  have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannMulOn; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannNonemptyOn; LRA.AlgebraicStructures.MultiplicativeSemigroupLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannMulOn; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannNonemptyOn; LRA.AlgebraicStructures.MultiplicativeSemigroupLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Logical form (Lean):

```lean
theorem VonNeumannMultiplicativeSemigroupLawsOn :
    let _ : Mul NaturalElement := VonNeumannMulOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    MultiplicativeSemigroupLaws NaturalElement
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
theorem VonNeumannMultiplicativeSemigroupLawsOn :
    let _ : Mul NaturalElement := VonNeumannMulOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    MultiplicativeSemigroupLaws NaturalElement := by
  sorry
/--
`VonNeumannMultiplicativeIdentityLawsOn` TODO

Predicate logic:

  have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannMulOn; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannOneOn; LRA.AlgebraicStructures.MultiplicativeIdentityLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannMulOn; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannOneOn; LRA.AlgebraicStructures.MultiplicativeIdentityLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Logical form (Lean):

```lean
theorem VonNeumannMultiplicativeIdentityLawsOn :
    let _ : Mul NaturalElement := VonNeumannMulOn
    let _ : OfNat NaturalElement 1 := VonNeumannOneOn
    MultiplicativeIdentityLaws NaturalElement
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
theorem VonNeumannMultiplicativeIdentityLawsOn :
    let _ : Mul NaturalElement := VonNeumannMulOn
    let _ : OfNat NaturalElement 1 := VonNeumannOneOn
    MultiplicativeIdentityLaws NaturalElement := by
  sorry
/--
`VonNeumannMultiplicativeCommutativeLawsOn` TODO

Predicate logic:

  have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannMulOn; LRA.AlgebraicStructures.MultiplicativeCommutativeLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannMulOn; LRA.AlgebraicStructures.MultiplicativeCommutativeLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Logical form (Lean):

```lean
theorem VonNeumannMultiplicativeCommutativeLawsOn :
    let _ : Mul NaturalElement := VonNeumannMulOn
    MultiplicativeCommutativeLaws NaturalElement
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
theorem VonNeumannMultiplicativeCommutativeLawsOn :
    let _ : Mul NaturalElement := VonNeumannMulOn
    MultiplicativeCommutativeLaws NaturalElement := by
  sorry
/--
`VonNeumannDistributiveLawsOn` TODO

Predicate logic:

  have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannAddOn; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannMulOn; LRA.AlgebraicStructures.DistributiveLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannAddOn; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.VonNeumannMulOn; LRA.AlgebraicStructures.DistributiveLaws LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Logical form (Lean):

```lean
theorem VonNeumannDistributiveLawsOn :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : Mul NaturalElement := VonNeumannMulOn
    DistributiveLaws NaturalElement
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
theorem VonNeumannDistributiveLawsOn :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : Mul NaturalElement := VonNeumannMulOn
    DistributiveLaws NaturalElement := by
  sorry
/--
`VonNeumannSemiringLawsOn` TODO

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
theorem VonNeumannSemiringLawsOn :
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
theorem VonNeumannSemiringLawsOn :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : Mul NaturalElement := VonNeumannMulOn
    let _ : OfNat NaturalElement 0 := VonNeumannZeroOn
    let _ : OfNat NaturalElement 1 := VonNeumannOneOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    SemiringLaws NaturalElement := by
  sorry
/--
`VonNeumannCommutativeSemiringLawsOn` TODO

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
theorem VonNeumannCommutativeSemiringLawsOn :
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
theorem VonNeumannCommutativeSemiringLawsOn :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : Mul NaturalElement := VonNeumannMulOn
    let _ : OfNat NaturalElement 0 := VonNeumannZeroOn
    let _ : OfNat NaturalElement 1 := VonNeumannOneOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    CommutativeSemiringLaws NaturalElement := by
  sorry
end LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann
