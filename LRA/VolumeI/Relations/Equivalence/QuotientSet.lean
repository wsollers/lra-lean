import LRA.VolumeI.Relations.Equivalence.Partition
import LRA.VolumeI.Identity.Model.Theory

namespace LRA.Relation

open LRA.Set

universe u v w

/-!
Quotient sets, one level up the set-theoretic tower.

Three types are in play: `Element` (carrier points), `SetObject` (sets of
carrier points), and `Collection` (sets *of sets* -- where the quotient
lives). The collection's members are set objects, via a second
`Membership SetObject Collection` instance. For Enderton all three levels are
`Set`; for `LRASet` they are `Alpha`, `LRASet Alpha`, and `LRASet (LRASet Alpha)`.
-/

section QuotientSets

variable {Element : Type u} {SetObject : Type v} {Collection : Type w}
variable [Membership Element SetObject]
variable [Membership SetObject Collection]
variable [HasSeparation Element SetObject]

section WithPowerset

variable [HasPowerset SetObject Collection]

/-- A collection object `quotient` is the quotient set of `ambient` by
`relation` when its members are exactly the equivalence classes of ambient
representatives.

Logical form:

```lean
def IsQuotientSetOf
    (quotient : Collection)
    (ambient : SetObject)
    (relation : Endorelation Element) : Prop :=
  ∀ candidate : SetObject,
    candidate ∈ quotient ↔
      candidate ∈ (HasPowerset.powerset ambient : Collection) ∧
        ∃ representative : Element,
          representative ∈ ambient ∧
            candidate = EquivalenceClass ambient relation representative
```
-/
def IsQuotientSetOf
    (quotient : Collection)
    (ambient : SetObject)
    (relation : Endorelation Element) : Prop :=
  ∀ candidate : SetObject,
    candidate ∈ quotient ↔
      candidate ∈ (HasPowerset.powerset ambient : Collection) ∧
        ∃ representative : Element,
          representative ∈ ambient ∧
            candidate = EquivalenceClass ambient relation representative

section WithCollectionSeparation

variable [HasSeparation SetObject Collection]

/-- The quotient set of equivalence classes induced by a relation: the
subsets of `ambient` that are equivalence classes of some ambient
representative, carved out of the power set.

Logical form:

```lean
def QuotientSet
    (ambient : SetObject)
    (relation : Endorelation Element) : Collection :=
  HasSeparation.separation (HasPowerset.powerset ambient : Collection)
    (fun candidate =>
      ∃ representative : Element,
        representative ∈ ambient ∧
          candidate = EquivalenceClass ambient relation representative)
```
-/
def QuotientSet
    (ambient : SetObject)
    (relation : Endorelation Element) : Collection :=
  HasSeparation.separation (HasPowerset.powerset ambient : Collection)
    (fun candidate =>
      ∃ representative : Element,
        representative ∈ ambient ∧
          candidate = EquivalenceClass ambient relation representative)

section Laws

variable [SeparationLaws SetObject Collection]
variable [ExtensionalityLaw SetObject Collection]
variable [HasSubset SetObject]
variable [PowersetMembershipLaws SetObject Collection]
variable [SeparationLaws Element SetObject]
variable [ExtensionalityLaw Element SetObject]

/--
**[Theorem — QuotientSetExists]**

For each ambient set and relation, the quotient set exists.

Logical form:

```lean
theorem QuotientSetExists
    (ambient : SetObject)
    (relation : Endorelation Element) :
    LRA.Identity.Exists
      (fun quotient : Collection =>
        IsQuotientSetOf quotient ambient relation)
```
-/
theorem QuotientSetExists
    (ambient : SetObject)
    (relation : Endorelation Element) :
    LRA.Identity.Exists
      (fun quotient : Collection =>
        IsQuotientSetOf quotient ambient relation) := by
  sorry

/--
**[Theorem — QuotientSetUnique]**

A quotient set is uniquely determined by its memberwise specification.

Logical form:

```lean
theorem QuotientSetUnique
    (ambient : SetObject)
    (relation : Endorelation Element) :
    LRA.Identity.Unique
      (fun quotient : Collection =>
        IsQuotientSetOf quotient ambient relation)
```
-/
theorem QuotientSetUnique
    (ambient : SetObject)
    (relation : Endorelation Element) :
    LRA.Identity.Unique
      (fun quotient : Collection =>
        IsQuotientSetOf quotient ambient relation) := by
  sorry

/--
**[Theorem — QuotientSetExistsAndUnique]**

For each ambient set and relation, there is exactly one quotient set
satisfying the memberwise specification.

Logical form:

```lean
theorem QuotientSetExistsAndUnique
    (ambient : SetObject)
    (relation : Endorelation Element) :
    LRA.Identity.ExistsAndUnique
      (fun quotient : Collection =>
        IsQuotientSetOf quotient ambient relation)
```
-/
theorem QuotientSetExistsAndUnique
    (ambient : SetObject)
    (relation : Endorelation Element) :
    LRA.Identity.ExistsAndUnique
      (fun quotient : Collection =>
        IsQuotientSetOf quotient ambient relation) := by
  sorry

/--
**[Theorem — QuotientSetMembership]**

Membership in the quotient set is membership as an equivalence class.

Logical form:

```lean
theorem QuotientSetMembership
    (ambient : SetObject)
    (relation : Endorelation Element)
    (candidate : SetObject) :
    candidate ∈ QuotientSet (Collection := Collection) ambient relation ↔
      candidate ∈ (HasPowerset.powerset ambient : Collection) ∧
        ∃ representative : Element,
          representative ∈ ambient ∧
            candidate = EquivalenceClass ambient relation representative
```
-/
theorem QuotientSetMembership
    (ambient : SetObject)
    (relation : Endorelation Element)
    (candidate : SetObject) :
    candidate ∈ QuotientSet (Collection := Collection) ambient relation ↔
      candidate ∈ (HasPowerset.powerset ambient : Collection) ∧
        ∃ representative : Element,
          representative ∈ ambient ∧
            candidate = EquivalenceClass ambient relation representative := by
  sorry

end Laws

end WithCollectionSeparation

end WithPowerset

/-- The canonical projection sending an element to its equivalence class.

Logical form:

```lean
def QuotientProjection
    (ambient : SetObject)
    (relation : Endorelation Element) :
    Element -> SetObject :=
  fun element => EquivalenceClass ambient relation element
```
-/
def QuotientProjection
    (ambient : SetObject)
    (relation : Endorelation Element) :
    Element -> SetObject :=
  fun element => EquivalenceClass ambient relation element

/-- The canonical projection viewed as producing members of the quotient
collection. With a typed membership tower, this is definitionally the same
function as `QuotientProjection`; the name records the collection-facing
reading.

Logical form:

```lean
def QuotientClassElement
    (ambient : SetObject)
    (relation : Endorelation Element) :
    Element -> SetObject :=
  QuotientProjection ambient relation
```
-/
def QuotientClassElement
    (ambient : SetObject)
    (relation : Endorelation Element) :
    Element -> SetObject :=
  QuotientProjection ambient relation

section WellDefined

variable [SeparationLaws Element SetObject]
variable [ExtensionalityLaw Element SetObject]

/--
**[Theorem — QuotientProjectionWellDefined]**

The quotient projection is well-defined with respect to equivalent
representatives: related representatives determine the same projected
class.

Logical form:

```lean
theorem QuotientProjectionWellDefined
    {ambient : SetObject}
    {relation : Endorelation Element}
    (relationIsEquivalence : EquivalenceRelation relation)
    {firstRepresentative secondRepresentative : Element}
    (representativesRelated :
      relation firstRepresentative secondRepresentative) :
    QuotientProjection ambient relation firstRepresentative =
      QuotientProjection ambient relation secondRepresentative
```
-/
theorem QuotientProjectionWellDefined
    {ambient : SetObject}
    {relation : Endorelation Element}
    (relationIsEquivalence : EquivalenceRelation relation)
    {firstRepresentative secondRepresentative : Element}
    (representativesRelated :
      relation firstRepresentative secondRepresentative) :
    QuotientProjection ambient relation firstRepresentative =
      QuotientProjection ambient relation secondRepresentative := by
  sorry

/--
**[Theorem — QuotientClassElementWellDefined]**

The collection-facing quotient class element is well-defined with
respect to equivalent representatives.

Logical form:

```lean
theorem QuotientClassElementWellDefined
    {ambient : SetObject}
    {relation : Endorelation Element}
    (relationIsEquivalence : EquivalenceRelation relation)
    {firstRepresentative secondRepresentative : Element}
    (representativesRelated :
      relation firstRepresentative secondRepresentative) :
    QuotientClassElement ambient relation firstRepresentative =
      QuotientClassElement ambient relation secondRepresentative
```
-/
theorem QuotientClassElementWellDefined
    {ambient : SetObject}
    {relation : Endorelation Element}
    (relationIsEquivalence : EquivalenceRelation relation)
    {firstRepresentative secondRepresentative : Element}
    (representativesRelated :
      relation firstRepresentative secondRepresentative) :
    QuotientClassElement ambient relation firstRepresentative =
      QuotientClassElement ambient relation secondRepresentative := by
  sorry

end WellDefined

end QuotientSets

end LRA.Relation
