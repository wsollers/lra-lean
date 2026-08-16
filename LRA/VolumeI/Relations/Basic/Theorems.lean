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
  sorry

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
  sorry

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
  sorry

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
  sorry

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
  sorry

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
  sorry

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
  sorry

end LRA.Relation
