import LRA.Relation.Operations.Converse.Definition
import LRA.Relation.Properties.Definition
import LRA.Relation.Canonical.IdentityRelation.Definition

namespace LRA.Relation

universe u v

/--
`LeftTotalIffConverseRightTotal` TODO

Predicate logic:

  LeftTotal relation ↔ RightTotal (Converse relation)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} (relation : Alpha → Beta → Prop), ∀ (x : Alpha), Exists fun y => relation x y ↔ ∀ (y : Alpha), Exists fun x => relation y x

Logical form (Lean):

```lean
theorem LeftTotalIffConverseRightTotal
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    LeftTotal relation ↔ RightTotal (Converse relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem LeftTotalIffConverseRightTotal
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    LeftTotal relation ↔ RightTotal (Converse relation) := by
  sorry

/--
`RightTotalIffConverseLeftTotal` TODO

Predicate logic:

  RightTotal relation ↔ LeftTotal (Converse relation)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} (relation : Alpha → Beta → Prop), ∀ (y : Beta), Exists fun x => relation x y ↔ ∀ (x : Beta), Exists fun y => relation y x

Logical form (Lean):

```lean
theorem RightTotalIffConverseLeftTotal
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    RightTotal relation ↔ LeftTotal (Converse relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem RightTotalIffConverseLeftTotal
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    RightTotal relation ↔ LeftTotal (Converse relation) := by
  sorry

/--
`RightUniqueIffConverseLeftUnique` TODO

Predicate logic:

  RightUnique relation ↔ LeftUnique (Converse relation)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} (relation : Alpha → Beta → Prop), ∀ (x : Alpha) (y₁ y₂ : Beta), relation x y₁ → relation x y₂ → y₁ = y₂ ↔ ∀ (y : Alpha) (x₁ x₂ : Beta), relation y x₁ → relation y x₂ → x₁ = x₂

Logical form (Lean):

```lean
theorem RightUniqueIffConverseLeftUnique
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    RightUnique relation ↔ LeftUnique (Converse relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem RightUniqueIffConverseLeftUnique
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    RightUnique relation ↔ LeftUnique (Converse relation) := by
  sorry

/--
`LeftUniqueIffConverseRightUnique` TODO

Predicate logic:

  LeftUnique relation ↔ RightUnique (Converse relation)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} (relation : Alpha → Beta → Prop), ∀ (y : Beta) (x₁ x₂ : Alpha), relation x₁ y → relation x₂ y → x₁ = x₂ ↔ ∀ (x : Beta) (y₁ y₂ : Alpha), relation y₁ x → relation y₂ x → y₁ = y₂

Logical form (Lean):

```lean
theorem LeftUniqueIffConverseRightUnique
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    LeftUnique relation ↔ RightUnique (Converse relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem LeftUniqueIffConverseRightUnique
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    LeftUnique relation ↔ RightUnique (Converse relation) := by
  sorry

/--
`ConverseInvolutive` TODO

Predicate logic:

  Converse (Converse relation) = relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop), fun y x => relation y x = relation

Logical form (Lean):

```lean
theorem ConverseInvolutive
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Converse (Converse relation) = relation
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
theorem ConverseInvolutive
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Converse (Converse relation) = relation := by
  sorry

/--
`ReflexiveConverseIff` TODO

Predicate logic:

  Reflexive (Converse relation) ↔ Reflexive relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop), ∀ (x : Alpha), relation x x ↔ ∀ (x : Alpha), relation x x

Logical form (Lean):

```lean
theorem ReflexiveConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Reflexive (Converse relation) ↔ Reflexive relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem ReflexiveConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Reflexive (Converse relation) ↔ Reflexive relation := by
  sorry

/--
`IrreflexiveConverseIff` TODO

Predicate logic:

  Irreflexive (Converse relation) ↔ Irreflexive relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop), ∀ (x : Alpha), relation x x → False ↔ ∀ (x : Alpha), relation x x → False

Logical form (Lean):

```lean
theorem IrreflexiveConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Irreflexive (Converse relation) ↔ Irreflexive relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem IrreflexiveConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Irreflexive (Converse relation) ↔ Irreflexive relation := by
  sorry

/--
`TransitiveConverseIff` TODO

Predicate logic:

  Transitive (Converse relation) ↔ Transitive relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop), ∀ (x y z : Alpha), relation y x → relation z y → relation z x ↔ ∀ (x y z : Alpha), relation x y → relation y z → relation x z

Logical form (Lean):

```lean
theorem TransitiveConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Transitive (Converse relation) ↔ Transitive relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem TransitiveConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Transitive (Converse relation) ↔ Transitive relation := by
  sorry

/--
`AntisymmetricConverseIff` TODO

Predicate logic:

  Antisymmetric (Converse relation) ↔ Antisymmetric relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop), ∀ (x y : Alpha), relation y x → relation x y → x = y ↔ ∀ (x y : Alpha), relation x y → relation y x → x = y

Logical form (Lean):

```lean
theorem AntisymmetricConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Antisymmetric (Converse relation) ↔ Antisymmetric relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem AntisymmetricConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Antisymmetric (Converse relation) ↔ Antisymmetric relation := by
  sorry

/--
`TotalConverseIff` TODO

Predicate logic:

  Total (Converse relation) ↔ Total relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop), ∀ (x y : Alpha), Or (relation y x) (relation x y) ↔ ∀ (x y : Alpha), Or (relation x y) (relation y x)

Logical form (Lean):

```lean
theorem TotalConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Total (Converse relation) ↔ Total relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem TotalConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Total (Converse relation) ↔ Total relation := by
  sorry

/--
`DenseConverseIff` TODO

Predicate logic:

  Dense (Converse relation) ↔ Dense relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop), ∀ (x y : Alpha), relation y x → Exists fun z => (relation z x ∧ relation y z) ↔ ∀ (x y : Alpha), relation x y → Exists fun z => (relation x z ∧ relation z y)

Logical form (Lean):

```lean
theorem DenseConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Dense (Converse relation) ↔ Dense relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem DenseConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Dense (Converse relation) ↔ Dense relation := by
  sorry

end LRA.Relation
