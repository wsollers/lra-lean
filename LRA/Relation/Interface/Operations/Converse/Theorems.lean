import LRA.Relation.Interface.Operations.Converse.Definition
import LRA.Relation.Interface.Laws.Definition
import LRA.Relation.Interface.Canonical.IdentityRelation.Definition

namespace LRA.Relation

universe u v

/--
`LeftTotalIffConverseRightTotal` TODO

Predicate logic:

  ∀ {Alpha : Type u} {Beta : Type v} (relation : LRA.Relation.HeterogeneousBinaryRelation Alpha Beta), LRA.Relation.LeftTotal relation ↔ LRA.Relation.RightTotal (LRA.Relation.Converse relation)

Predicate logic (unfolded):

  Ambient
    (Alpha, Beta)
  Objects
    relation : HeterogeneousBinaryRelation Alpha Beta
  Prove
    LRA.Relation.LeftTotal relation ↔ LRA.Relation.RightTotal (LRA.Relation.Converse relation)

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

  ∀ {Alpha : Type u} {Beta : Type v} (relation : LRA.Relation.HeterogeneousBinaryRelation Alpha Beta), LRA.Relation.RightTotal relation ↔ LRA.Relation.LeftTotal (LRA.Relation.Converse relation)

Predicate logic (unfolded):

  Ambient
    (Alpha, Beta)
  Objects
    relation : HeterogeneousBinaryRelation Alpha Beta
  Prove
    LRA.Relation.RightTotal relation ↔ LRA.Relation.LeftTotal (LRA.Relation.Converse relation)

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

  ∀ {Alpha : Type u} {Beta : Type v} (relation : LRA.Relation.HeterogeneousBinaryRelation Alpha Beta), LRA.Relation.RightUnique relation ↔ LRA.Relation.LeftUnique (LRA.Relation.Converse relation)

Predicate logic (unfolded):

  Ambient
    (Alpha, Beta)
  Objects
    relation : HeterogeneousBinaryRelation Alpha Beta
  Prove
    LRA.Relation.RightUnique relation ↔ LRA.Relation.LeftUnique (LRA.Relation.Converse relation)

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

  ∀ {Alpha : Type u} {Beta : Type v} (relation : LRA.Relation.HeterogeneousBinaryRelation Alpha Beta), LRA.Relation.LeftUnique relation ↔ LRA.Relation.RightUnique (LRA.Relation.Converse relation)

Predicate logic (unfolded):

  Ambient
    (Alpha, Beta)
  Objects
    relation : HeterogeneousBinaryRelation Alpha Beta
  Prove
    LRA.Relation.LeftUnique relation ↔ LRA.Relation.RightUnique (LRA.Relation.Converse relation)

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

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), LRA.Relation.Converse (LRA.Relation.Converse relation) = relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : Endorelation Alpha
  Prove
    fun y x => relation y x = relation

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

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), LRA.Relation.Reflexive (LRA.Relation.Converse relation) ↔ LRA.Relation.Reflexive relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : Endorelation Alpha
  Prove
    LRA.Relation.Reflexive (LRA.Relation.Converse relation) ↔ LRA.Relation.Reflexive relation

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

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), LRA.Relation.Irreflexive (LRA.Relation.Converse relation) ↔ LRA.Relation.Irreflexive relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : Endorelation Alpha
  Prove
    LRA.Relation.Irreflexive (LRA.Relation.Converse relation) ↔ LRA.Relation.Irreflexive relation

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

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), LRA.Relation.Transitive (LRA.Relation.Converse relation) ↔ LRA.Relation.Transitive relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : Endorelation Alpha
  Prove
    LRA.Relation.Transitive (LRA.Relation.Converse relation) ↔ LRA.Relation.Transitive relation

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

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), LRA.Relation.Antisymmetric (LRA.Relation.Converse relation) ↔ LRA.Relation.Antisymmetric relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : Endorelation Alpha
  Prove
    LRA.Relation.Antisymmetric (LRA.Relation.Converse relation) ↔ LRA.Relation.Antisymmetric relation

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

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), LRA.Relation.Total (LRA.Relation.Converse relation) ↔ LRA.Relation.Total relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : Endorelation Alpha
  Prove
    LRA.Relation.Total (LRA.Relation.Converse relation) ↔ LRA.Relation.Total relation

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

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), LRA.Relation.Dense (LRA.Relation.Converse relation) ↔ LRA.Relation.Dense relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : Endorelation Alpha
  Prove
    LRA.Relation.Dense (LRA.Relation.Converse relation) ↔ LRA.Relation.Dense relation

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
