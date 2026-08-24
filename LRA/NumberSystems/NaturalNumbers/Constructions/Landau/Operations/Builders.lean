
import LRA.AlgebraicStructures
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations.Addition
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations.Multiplication

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.AlgebraicStructures
open LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`LandauOneOn` TODO

Predicate logic:

  def LandauOneOn (model : PeanoSystem Element SetObject) : OfNat Element 1 :=
  ⟨model.one⟩

Predicate logic (unfolded):

  def LandauOneOn (model : PeanoSystem Element SetObject) : OfNat Element 1 :=
  ⟨model.one⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def LandauOneOn (model : PeanoSystem Element SetObject) : OfNat Element 1 :=
  ⟨model.one⟩
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
def LandauOneOn (model : PeanoSystem Element SetObject) : OfNat Element 1 :=
  ⟨model.one⟩

/--
`LandauSuccOn` TODO

Predicate logic:

  def LandauSuccOn (model : PeanoSystem Element SetObject) :
    HasSuccessor Element :=
  ⟨model.successor⟩

Predicate logic (unfolded):

  def LandauSuccOn (model : PeanoSystem Element SetObject) :
    HasSuccessor Element :=
  ⟨model.successor⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def LandauSuccOn (model : PeanoSystem Element SetObject) :
    HasSuccessor Element :=
  ⟨model.successor⟩
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
def LandauSuccOn (model : PeanoSystem Element SetObject) :
    HasSuccessor Element :=
  ⟨model.successor⟩

/--
`LandauAddOn` TODO

Predicate logic:

  noncomputable def LandauAddOn (model : PeanoSystem Element SetObject) :
    Add Element :=
  ⟨LandauAddition model⟩

Predicate logic (unfolded):

  noncomputable def LandauAddOn (model : PeanoSystem Element SetObject) :
    Add Element :=
  ⟨LandauAddition model⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def LandauAddOn (model : PeanoSystem Element SetObject) :
    Add Element :=
  ⟨LandauAddition model⟩
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
noncomputable def LandauAddOn (model : PeanoSystem Element SetObject) :
    Add Element :=
  ⟨LandauAddition model⟩

/--
`LandauMulOn` TODO

Predicate logic:

  noncomputable def LandauMulOn (model : PeanoSystem Element SetObject) :
    Mul Element :=
  ⟨LandauMultiplication model⟩

Predicate logic (unfolded):

  noncomputable def LandauMulOn (model : PeanoSystem Element SetObject) :
    Mul Element :=
  ⟨LandauMultiplication model⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def LandauMulOn (model : PeanoSystem Element SetObject) :
    Mul Element :=
  ⟨LandauMultiplication model⟩
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
noncomputable def LandauMulOn (model : PeanoSystem Element SetObject) :
    Mul Element :=
  ⟨LandauMultiplication model⟩

/--
`LandauAdditiveSemigroupLawsOn` TODO

Predicate logic:

  noncomputable def LandauAdditiveSemigroupLawsOn
    (model : PeanoSystem Element SetObject) :
    @AdditiveSemigroupLaws Element (LandauAddOn model) :=
  @AdditiveSemigroupLaws.mk Element (LandauAddOn model)
    (LandauAdditionIsAssociative model)

Predicate logic (unfolded):

  noncomputable def LandauAdditiveSemigroupLawsOn
    (model : PeanoSystem Element SetObject) :
    @AdditiveSemigroupLaws Element (LandauAddOn model) :=
  @AdditiveSemigroupLaws.mk Element (LandauAddOn model)
    (LandauAdditionIsAssociative model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def LandauAdditiveSemigroupLawsOn
    (model : PeanoSystem Element SetObject) :
    @AdditiveSemigroupLaws Element (LandauAddOn model) :=
  @AdditiveSemigroupLaws.mk Element (LandauAddOn model)
    (LandauAdditionIsAssociative model)
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
noncomputable def LandauAdditiveSemigroupLawsOn
    (model : PeanoSystem Element SetObject) :
    @AdditiveSemigroupLaws Element (LandauAddOn model) :=
  @AdditiveSemigroupLaws.mk Element (LandauAddOn model)
    (LandauAdditionIsAssociative model)

/--
`LandauAdditiveCommutativeLawsOn` TODO

Predicate logic:

  noncomputable def LandauAdditiveCommutativeLawsOn
    (model : PeanoSystem Element SetObject) :
    @AdditiveCommutativeLaws Element (LandauAddOn model) :=
  @AdditiveCommutativeLaws.mk Element (LandauAddOn model)
    (LandauAdditionIsCommutative model)

Predicate logic (unfolded):

  noncomputable def LandauAdditiveCommutativeLawsOn
    (model : PeanoSystem Element SetObject) :
    @AdditiveCommutativeLaws Element (LandauAddOn model) :=
  @AdditiveCommutativeLaws.mk Element (LandauAddOn model)
    (LandauAdditionIsCommutative model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def LandauAdditiveCommutativeLawsOn
    (model : PeanoSystem Element SetObject) :
    @AdditiveCommutativeLaws Element (LandauAddOn model) :=
  @AdditiveCommutativeLaws.mk Element (LandauAddOn model)
    (LandauAdditionIsCommutative model)
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
noncomputable def LandauAdditiveCommutativeLawsOn
    (model : PeanoSystem Element SetObject) :
    @AdditiveCommutativeLaws Element (LandauAddOn model) :=
  @AdditiveCommutativeLaws.mk Element (LandauAddOn model)
    (LandauAdditionIsCommutative model)

/--
`LandauMultiplicativeSemigroupLawsOn` TODO

Predicate logic:

  noncomputable def LandauMultiplicativeSemigroupLawsOn
    (model : PeanoSystem Element SetObject) :
    @MultiplicativeSemigroupLaws Element (LandauMulOn model) :=
  @MultiplicativeSemigroupLaws.mk Element (LandauMulOn model)
    (LandauMultiplicationIsAssociative model)

Predicate logic (unfolded):

  noncomputable def LandauMultiplicativeSemigroupLawsOn
    (model : PeanoSystem Element SetObject) :
    @MultiplicativeSemigroupLaws Element (LandauMulOn model) :=
  @MultiplicativeSemigroupLaws.mk Element (LandauMulOn model)
    (LandauMultiplicationIsAssociative model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def LandauMultiplicativeSemigroupLawsOn
    (model : PeanoSystem Element SetObject) :
    @MultiplicativeSemigroupLaws Element (LandauMulOn model) :=
  @MultiplicativeSemigroupLaws.mk Element (LandauMulOn model)
    (LandauMultiplicationIsAssociative model)
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
noncomputable def LandauMultiplicativeSemigroupLawsOn
    (model : PeanoSystem Element SetObject) :
    @MultiplicativeSemigroupLaws Element (LandauMulOn model) :=
  @MultiplicativeSemigroupLaws.mk Element (LandauMulOn model)
    (LandauMultiplicationIsAssociative model)

/--
`LandauMultiplicativeCommutativeLawsOn` TODO

Predicate logic:

  noncomputable def LandauMultiplicativeCommutativeLawsOn
    (model : PeanoSystem Element SetObject) :
    @MultiplicativeCommutativeLaws Element (LandauMulOn model) :=
  @MultiplicativeCommutativeLaws.mk Element (LandauMulOn model)
    (LandauMultiplicationIsCommutative model)

Predicate logic (unfolded):

  noncomputable def LandauMultiplicativeCommutativeLawsOn
    (model : PeanoSystem Element SetObject) :
    @MultiplicativeCommutativeLaws Element (LandauMulOn model) :=
  @MultiplicativeCommutativeLaws.mk Element (LandauMulOn model)
    (LandauMultiplicationIsCommutative model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def LandauMultiplicativeCommutativeLawsOn
    (model : PeanoSystem Element SetObject) :
    @MultiplicativeCommutativeLaws Element (LandauMulOn model) :=
  @MultiplicativeCommutativeLaws.mk Element (LandauMulOn model)
    (LandauMultiplicationIsCommutative model)
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
noncomputable def LandauMultiplicativeCommutativeLawsOn
    (model : PeanoSystem Element SetObject) :
    @MultiplicativeCommutativeLaws Element (LandauMulOn model) :=
  @MultiplicativeCommutativeLaws.mk Element (LandauMulOn model)
    (LandauMultiplicationIsCommutative model)

/--
`LandauDistributiveLawsOn` TODO

Predicate logic:

  noncomputable def LandauDistributiveLawsOn
    (model : PeanoSystem Element SetObject) :
    @DistributiveLaws Element (LandauAddOn model) (LandauMulOn model) :=
  @DistributiveLaws.mk Element (LandauAddOn model) (LandauMulOn model)
    (LandauLeftDistributivityOfMultiplicationOverAddition model)
    (LandauMultiplicationDistributesOverAddition model)

Predicate logic (unfolded):

  noncomputable def LandauDistributiveLawsOn
    (model : PeanoSystem Element SetObject) :
    @DistributiveLaws Element (LandauAddOn model) (LandauMulOn model) :=
  @DistributiveLaws.mk Element (LandauAddOn model) (LandauMulOn model)
    (LandauLeftDistributivityOfMultiplicationOverAddition model)
    (LandauMultiplicationDistributesOverAddition model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def LandauDistributiveLawsOn
    (model : PeanoSystem Element SetObject) :
    @DistributiveLaws Element (LandauAddOn model) (LandauMulOn model) :=
  @DistributiveLaws.mk Element (LandauAddOn model) (LandauMulOn model)
    (LandauLeftDistributivityOfMultiplicationOverAddition model)
    (LandauMultiplicationDistributesOverAddition model)
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
noncomputable def LandauDistributiveLawsOn
    (model : PeanoSystem Element SetObject) :
    @DistributiveLaws Element (LandauAddOn model) (LandauMulOn model) :=
  @DistributiveLaws.mk Element (LandauAddOn model) (LandauMulOn model)
    (LandauLeftDistributivityOfMultiplicationOverAddition model)
    (LandauMultiplicationDistributesOverAddition model)

example (model : PeanoSystem Element SetObject) (a b c : Element) : True := by
  letI := LandauAddOn model
  letI := LandauAdditiveSemigroupLawsOn model
  letI := LandauAdditiveCommutativeLawsOn model
  have associated : (a + b) + c = a + (b + c) := AddAssociative a b c
  have commuted : a + b = b + a := AddCommutative a b
  trivial

end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
