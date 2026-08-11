import LRA.VolumeI.Functions.Inverses

namespace LRA.VolumeI.Functions

universe u

/--
A section is a right inverse.

Logical form:

```lean
def Section {Domain Codomain : Type u}
    (sectionMap : Codomain -> Domain)
    (map : Domain -> Codomain) : Prop :=
  RightInverse sectionMap map
```
-/
def Section {Domain Codomain : Type u}
    (sectionMap : Codomain -> Domain)
    (map : Domain -> Codomain) : Prop :=
  RightInverse sectionMap map

/--
A retraction is a left inverse.

Logical form:

```lean
def Retraction {Domain Codomain : Type u}
    (retractionMap : Codomain -> Domain)
    (map : Domain -> Codomain) : Prop :=
  LeftInverse retractionMap map
```
-/
def Retraction {Domain Codomain : Type u}
    (retractionMap : Codomain -> Domain)
    (map : Domain -> Codomain) : Prop :=
  LeftInverse retractionMap map

end LRA.VolumeI.Functions
