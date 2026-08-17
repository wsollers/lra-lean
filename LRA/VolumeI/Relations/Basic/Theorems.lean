import LRA.VolumeI.Relations.Basic.Properties

namespace LRA.Relation

/-!
Home for elementary theorems connecting basic relation properties.
-/

universe u

/--
**[Theorem — IdentityRelationIsReflexive]**

The identity relation is reflexive.

Logical form:

```lean
theorem IdentityRelationIsReflexive :
    Reflexive (IdentityRelation Alpha)
```
-/
theorem IdentityRelationIsReflexive
    {Alpha : Type u} :
    Reflexive (IdentityRelation Alpha) := by
  intro element
  rfl

/--
**[Theorem — IdentityRelationIsSymmetric]**

The identity relation is symmetric.

Logical form:

```lean
theorem IdentityRelationIsSymmetric :
    Symmetric (IdentityRelation Alpha)
```
-/
theorem IdentityRelationIsSymmetric
    {Alpha : Type u} :
    Symmetric (IdentityRelation Alpha) := by
  intro left right related
  exact related.symm

/--
**[Theorem — IdentityRelationIsTransitive]**

The identity relation is transitive.

Logical form:

```lean
theorem IdentityRelationIsTransitive :
    Transitive (IdentityRelation Alpha)
```
-/
theorem IdentityRelationIsTransitive
    {Alpha : Type u} :
    Transitive (IdentityRelation Alpha) := by
  intro first second third firstRelatedSecond secondRelatedThird
  exact firstRelatedSecond.trans secondRelatedThird

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
