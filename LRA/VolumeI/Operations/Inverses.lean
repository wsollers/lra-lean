import LRA.VolumeI.Operations.Laws

namespace LRA.VolumeI.Operations

universe u

/--
An element is a left inverse of another element.

Logical form:

```lean
def LeftInverseElement {Alpha : Type u}
    (operation : BinaryOperation Alpha)
    (identity leftInverseOfElement element : Alpha) : Prop :=
  operation leftInverseOfElement element = identity
```
-/
def LeftInverseElement {Alpha : Type u}
    (operation : BinaryOperation Alpha)
    (identity leftInverseOfElement element : Alpha) : Prop :=
  operation leftInverseOfElement element = identity

/--
An element is a right inverse of another element.

Logical form:

```lean
def RightInverseElement {Alpha : Type u}
    (operation : BinaryOperation Alpha)
    (identity rightInverseOfElement element : Alpha) : Prop :=
  operation element rightInverseOfElement = identity
```
-/
def RightInverseElement {Alpha : Type u}
    (operation : BinaryOperation Alpha)
    (identity rightInverseOfElement element : Alpha) : Prop :=
  operation element rightInverseOfElement = identity

/--
An element is a two-sided inverse of another element.

Logical form:

```lean
def TwoSidedInverseElement {Alpha : Type u}
    (operation : BinaryOperation Alpha)
    (identity inverseOfElement element : Alpha) : Prop :=
  LeftInverseElement operation identity inverseOfElement element /\
    RightInverseElement operation identity inverseOfElement element
```
-/
def TwoSidedInverseElement {Alpha : Type u}
    (operation : BinaryOperation Alpha)
    (identity inverseOfElement element : Alpha) : Prop :=
  LeftInverseElement operation identity inverseOfElement element /\
    RightInverseElement operation identity inverseOfElement element

/--
An element is invertible when it has a two-sided inverse.

Logical form:

```lean
def InvertibleElement {Alpha : Type u}
    (operation : BinaryOperation Alpha)
    (identity element : Alpha) : Prop :=
  exists inverseOfElement,
    TwoSidedInverseElement operation identity inverseOfElement element
```
-/
def InvertibleElement {Alpha : Type u}
    (operation : BinaryOperation Alpha)
    (identity element : Alpha) : Prop :=
  exists inverseOfElement,
    TwoSidedInverseElement operation identity inverseOfElement element

/--
Two-sided inverses are unique in a monoid-like operation.

Logical form:

```lean
theorem UniquenessOfInverseElement
    {Alpha : Type u}
    {operation : BinaryOperation Alpha}
    {identity element firstInverse secondInverse : Alpha}
    (operationIsAssociative : Associative operation)
    (identityIsTwoSided : Identity operation identity)
    (firstInverseLaw :
      TwoSidedInverseElement operation identity firstInverse element)
    (secondInverseLaw :
      TwoSidedInverseElement operation identity secondInverse element) :
    firstInverse = secondInverse
```
-/
theorem UniquenessOfInverseElement
    {Alpha : Type u}
    {operation : BinaryOperation Alpha}
    {identity element firstInverse secondInverse : Alpha}
    (operationIsAssociative : Associative operation)
    (identityIsTwoSided : Identity operation identity)
    (firstInverseLaw :
      TwoSidedInverseElement operation identity firstInverse element)
    (secondInverseLaw :
      TwoSidedInverseElement operation identity secondInverse element) :
    firstInverse = secondInverse := by
  sorry

end LRA.VolumeI.Operations
