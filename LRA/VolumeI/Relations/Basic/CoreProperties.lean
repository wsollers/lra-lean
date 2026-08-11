import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.VolumeI.Relations

universe u

/--
Reflexivity of an endorelation.

Logical form:

```lean
def Reflexive {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall element, relation element element
```
-/
def Reflexive {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall element, relation element element

/--
Irreflexivity of an endorelation.

Logical form:

```lean
def Irreflexive {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall element, Not (relation element element)
```
-/
def Irreflexive {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall element, Not (relation element element)

/--
Symmetry of an endorelation.

Logical form:

```lean
def Symmetric {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right, relation left right -> relation right left
```
-/
def Symmetric {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right, relation left right -> relation right left

/--
Antisymmetry of an endorelation.

Logical form:

```lean
def Antisymmetric {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right, relation left right -> relation right left -> left = right
```
-/
def Antisymmetric {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right, relation left right -> relation right left -> left = right

/--
Asymmetry of an endorelation.

Logical form:

```lean
def Asymmetric {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right, relation left right -> Not (relation right left)
```
-/
def Asymmetric {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right, relation left right -> Not (relation right left)

/--
Transitivity of an endorelation.

Logical form:

```lean
def Transitive {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall first second third,
    relation first second -> relation second third -> relation first third
```
-/
def Transitive {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall first second third,
    relation first second -> relation second third -> relation first third

/--
Connexity of an endorelation.

Logical form:

```lean
def Connex {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right, relation left right \/ relation right left
```
-/
def Connex {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right, relation left right \/ relation right left

/--
Totality, or connexity, of an endorelation.

Logical form:

```lean
def Total {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  Connex relation
```
-/
def Total {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  Connex relation

/--
Exactly one of three propositions holds.

Logical form:

```lean
def ExactlyOneOfThree (first second third : Prop) : Prop :=
  (first /\ Not second /\ Not third) \/
    (second /\ Not first /\ Not third) \/
      (third /\ Not first /\ Not second)
```
-/
def ExactlyOneOfThree (first second third : Prop) : Prop :=
  (first /\ Not second /\ Not third) \/
    (second /\ Not first /\ Not third) \/
      (third /\ Not first /\ Not second)

/--
Weak trichotomy of an endorelation: one of the three alternatives holds.

Logical form:

```lean
def Trichotomous {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right, relation left right \/ left = right \/ relation right left
```
-/
def Trichotomous {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right, relation left right \/ left = right \/ relation right left

/--
Omnibus trichotomy: exactly one of `xRy`, `x = y`, and `yRx` holds.

Logical form:

```lean
def ExactlyTrichotomous {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right,
    ExactlyOneOfThree (relation left right) (left = right) (relation right left)
```
-/
def ExactlyTrichotomous {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right,
    ExactlyOneOfThree (relation left right) (left = right) (relation right left)

/--
Left-Euclidean property of an endorelation.

Logical form:

```lean
def LeftEuclidean {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall fixed left right,
    relation left fixed -> relation right fixed -> relation left right
```
-/
def LeftEuclidean {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall fixed left right,
    relation left fixed -> relation right fixed -> relation left right

/--
Right-Euclidean property of an endorelation.

Logical form:

```lean
def RightEuclidean {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall fixed left right,
    relation fixed left -> relation fixed right -> relation left right
```
-/
def RightEuclidean {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall fixed left right,
    relation fixed left -> relation fixed right -> relation left right

/--
Density of an endorelation.

Logical form:

```lean
def Dense {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right,
    relation left right ->
      exists middle, relation left middle /\ relation middle right
```
-/
def Dense {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right,
    relation left right ->
      exists middle, relation left middle /\ relation middle right

/--
Equivalence-relation laws for an endorelation.

Logical form:

```lean
def Equivalence {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  Reflexive relation /\ Symmetric relation /\ Transitive relation
```
-/
def Equivalence {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  Reflexive relation /\ Symmetric relation /\ Transitive relation

end LRA.VolumeI.Relations
