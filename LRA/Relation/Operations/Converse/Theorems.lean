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
