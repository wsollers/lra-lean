import LRA.Relation.Operations.Converse.Definition
import LRA.Relation.Properties.Definition
import LRA.Relation.Canonical.IdentityRelation.Definition

namespace LRA.Relation

universe u v

/-- Converse exchanges left-totality with right-totality. -/
theorem LeftTotalIffConverseRightTotal
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    LeftTotal relation ↔ RightTotal (Converse relation) := by
  sorry

/-- Converse exchanges right-totality with left-totality. -/
theorem RightTotalIffConverseLeftTotal
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    RightTotal relation ↔ LeftTotal (Converse relation) := by
  sorry

/-- Converse exchanges right-uniqueness with left-uniqueness. -/
theorem RightUniqueIffConverseLeftUnique
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    RightUnique relation ↔ LeftUnique (Converse relation) := by
  sorry

/-- Converse exchanges left-uniqueness with right-uniqueness. -/
theorem LeftUniqueIffConverseRightUnique
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    LeftUnique relation ↔ RightUnique (Converse relation) := by
  sorry

/--
**[Theorem — ConverseInvolutive]**

Taking the converse twice recovers the original relation.

Logical form:

```lean
theorem ConverseInvolutive
    (relation : Endorelation Alpha) :
    Converse (Converse relation) = relation
```
-/
theorem ConverseInvolutive
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Converse (Converse relation) = relation := by
  rfl

/--
**[Theorem — ReflexiveConverseIff]**

Reflexivity is invariant under converse.

Logical form:

```lean
theorem ReflexiveConverseIff
    (relation : Endorelation Alpha) :
    Reflexive (Converse relation) <-> Reflexive relation
```
-/
theorem ReflexiveConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Reflexive (Converse relation) ↔ Reflexive relation := by
  constructor
  · intro converseReflexive element
    exact converseReflexive element
  · intro reflexive element
    exact reflexive element

/--
**[Theorem — IrreflexiveConverseIff]**

Irreflexivity is invariant under converse.

Logical form:

```lean
theorem IrreflexiveConverseIff
    (relation : Endorelation Alpha) :
    Irreflexive (Converse relation) <-> Irreflexive relation
```
-/
theorem IrreflexiveConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Irreflexive (Converse relation) ↔ Irreflexive relation := by
  constructor
  · intro converseIrreflexive element
    exact converseIrreflexive element
  · intro irreflexive element
    exact irreflexive element

/--
**[Theorem — TransitiveConverseIff]**

Transitivity is invariant under converse.

Logical form:

```lean
theorem TransitiveConverseIff
    (relation : Endorelation Alpha) :
    Transitive (Converse relation) <-> Transitive relation
```
-/
theorem TransitiveConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Transitive (Converse relation) ↔ Transitive relation := by
  constructor
  · intro converseTransitive first second third firstRelatedSecond secondRelatedThird
    exact converseTransitive third second first secondRelatedThird firstRelatedSecond
  · intro transitive first second third firstRelatedSecond secondRelatedThird
    exact transitive third second first secondRelatedThird firstRelatedSecond

/--
**[Theorem — AntisymmetricConverseIff]**

Antisymmetry is invariant under converse.

Logical form:

```lean
theorem AntisymmetricConverseIff
    (relation : Endorelation Alpha) :
    Antisymmetric (Converse relation) <-> Antisymmetric relation
```
-/
theorem AntisymmetricConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Antisymmetric (Converse relation) ↔ Antisymmetric relation := by
  constructor
  · intro converseAntisymmetric left right leftRelatedRight rightRelatedLeft
    exact converseAntisymmetric left right rightRelatedLeft leftRelatedRight
  · intro antisymmetric left right leftRelatedRight rightRelatedLeft
    exact (antisymmetric right left leftRelatedRight rightRelatedLeft).symm

/--
**[Theorem — TotalConverseIff]**

Totality is invariant under converse.

Logical form:

```lean
theorem TotalConverseIff
    (relation : Endorelation Alpha) :
    Total (Converse relation) <-> Total relation
```
-/
theorem TotalConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Total (Converse relation) ↔ Total relation := by
  constructor
  · intro converseTotal left right
    cases converseTotal left right with
    | inl rightRelatedLeft => exact Or.inr rightRelatedLeft
    | inr leftRelatedRight => exact Or.inl leftRelatedRight
  · intro total left right
    cases total left right with
    | inl leftRelatedRight => exact Or.inr leftRelatedRight
    | inr rightRelatedLeft => exact Or.inl rightRelatedLeft

/--
**[Theorem — DenseConverseIff]**

Density is invariant under converse.

Logical form:

```lean
theorem DenseConverseIff
    (relation : Endorelation Alpha) :
    Dense (Converse relation) <-> Dense relation
```
-/
theorem DenseConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Dense (Converse relation) ↔ Dense relation := by
  constructor
  · intro converseDense left right leftRelatedRight
    rcases converseDense right left leftRelatedRight with
      ⟨middle, middleRelatedRight, leftRelatedMiddle⟩
    exact ⟨middle, leftRelatedMiddle, middleRelatedRight⟩
  · intro dense left right leftRelatedRight
    rcases dense right left leftRelatedRight with
      ⟨middle, rightRelatedMiddle, middleRelatedLeft⟩
    exact ⟨middle, middleRelatedLeft, rightRelatedMiddle⟩

end LRA.Relation
