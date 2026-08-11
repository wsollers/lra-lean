import LRA.VolumeII.PeanoSystems.PeanoSystem.Successor

namespace LRA.VolumeII.PeanoSystems

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


/--
**[Definition - Predecessor in a Peano System]**

An element is a predecessor of another element exactly when its successor equals
that element.

Mathematical statement (Lean): `def PredecessorInPeanoSystem`.


Logical form:

```lean
def PredecessorInPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (predecessor element : Element) : Prop :=
  ps.successor predecessor = element
```
-/
def PredecessorInPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (predecessor element : Element) : Prop :=
  ps.successor predecessor = element

/--
**[Definition - Unique Predecessor]**

An element has a unique predecessor exactly when there exists a predecessor and
every other predecessor is equal to it.

Mathematical statement (Lean): `def UniquePredecessor`.


Logical form:

```lean
def UniquePredecessor
    (ps : PeanoSystem Element SetObject)
    (element : Element) : Prop :=
  exists predecessor : Element,
    ps.successor predecessor = element /\
      forall other_predecessor : Element,
        ps.successor other_predecessor = element ->
        other_predecessor = predecessor
```
-/
def UniquePredecessor
    (ps : PeanoSystem Element SetObject)
    (element : Element) : Prop :=
  exists predecessor : Element,
    ps.successor predecessor = element /\
      forall other_predecessor : Element,
        ps.successor other_predecessor = element ->
        other_predecessor = predecessor

/--
**[Theorem - Successors Have Unique Predecessors]**

The successor of an element has that element as its unique predecessor.

Mathematical statement (Lean): `theorem SuccessorsHaveUniquePredecessors`.


Logical form:

```lean
theorem SuccessorsHaveUniquePredecessors
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    UniquePredecessor ps (ps.successor element)
```
-/
theorem SuccessorsHaveUniquePredecessors
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    UniquePredecessor ps (ps.successor element) := by
  sorry

/--
**[Theorem - Predecessors Are Unique]**

Any two predecessors of the same element are equal.

Mathematical statement (Lean): `theorem PredecessorUnique`.


Logical form:

```lean
theorem PredecessorUnique
    (ps : PeanoSystem Element SetObject)
    (first_predecessor second_predecessor element : Element) :
    PredecessorInPeanoSystem ps first_predecessor element ->
    PredecessorInPeanoSystem ps second_predecessor element ->
    first_predecessor = second_predecessor
```
-/
theorem PredecessorUnique
    (ps : PeanoSystem Element SetObject)
    (first_predecessor second_predecessor element : Element) :
    PredecessorInPeanoSystem ps first_predecessor element ->
    PredecessorInPeanoSystem ps second_predecessor element ->
    first_predecessor = second_predecessor := by
  sorry

/--
**[Theorem - Elements Other Than One Have a Predecessor]**

Every element other than the distinguished element is a successor.

Mathematical statement (Lean): `theorem NonOneElementsHaveAPredecessor`.


Logical form:

```lean
theorem NonOneElementsHaveAPredecessor
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    element ≠ ps.one ->
      exists predecessor : Element,
        ps.successor predecessor = element
```
-/
theorem NonOneElementsHaveAPredecessor
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    element ≠ ps.one ->
      exists predecessor : Element,
        ps.successor predecessor = element := by
  sorry

/--
**[Theorem - Predecessor Exists Unique Away From One]**

Every element different from the distinguished element has a unique predecessor.

Mathematical statement (Lean): `theorem PredecessorExistsUniqueAwayFromOne`.


Logical form:

```lean
theorem PredecessorExistsUniqueAwayFromOne
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    element ≠ ps.one -> UniquePredecessor ps element
```
-/
theorem PredecessorExistsUniqueAwayFromOne
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    element ≠ ps.one -> UniquePredecessor ps element := by
  sorry

/--
**[Theorem - Unique Predecessor Characterization Away From One]**

An element is not the distinguished element if and only if it has a unique
predecessor.

Mathematical statement (Lean): `theorem UniquePredecessorCharacterizationAwayFromOne`.


Logical form:

```lean
theorem UniquePredecessorCharacterizationAwayFromOne
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    element ≠ ps.one <-> UniquePredecessor ps element
```
-/
theorem UniquePredecessorCharacterizationAwayFromOne
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    element ≠ ps.one <-> UniquePredecessor ps element := by
  sorry

end LRA.VolumeII.PeanoSystems
