import LRA.Relation.Interface.Satisfy_Generic
import LRA.Relation.Interface.Laws
import LRA.Relation.Interface.ModelTheory

namespace LRA.Relation

universe u v

/--
`genericTheory` TODO

Predicate logic:

  ∀ {RelationObject : Type v} {Carrier : Type u} [inst : LRA.Relation.GenericSemantics RelationObject Carrier] (relation : RelationObject), LRA.Relation.ModelTheory.RelationTheory (LRA.Relation.interpret relation)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Relation.ModelTheory.RelationTheory (inst.1 relation)

Logical form (Lean):

```lean
def genericTheory
    {RelationObject : Type v} {Carrier : Type u}
    [GenericSemantics RelationObject Carrier]
    (relation : RelationObject) : Prop :=
  LRA.Relation.ModelTheory.RelationTheory (interpret relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def genericTheory
    {RelationObject : Type v} {Carrier : Type u}
    [GenericSemantics RelationObject Carrier]
    (relation : RelationObject) : Prop :=
  LRA.Relation.ModelTheory.RelationTheory (interpret relation)

/--
`toModelTheoryStructure` TODO

Predicate logic:

  def toModelTheoryStructure
      {RelationObject : Type v} {Carrier : Type u}
      [GenericSemantics RelationObject Carrier]
      [Nonempty Carrier]
      (relation : RelationObject) :
      LRA.Relation.ModelTheory.RelationStructure where
    Carrier := Carrier
    carrierNonempty := inferInstance
    relationInterpretation := interpret relation

Predicate logic (unfolded):

  def toModelTheoryStructure
      {RelationObject : Type v} {Carrier : Type u}
      [GenericSemantics RelationObject Carrier]
      [Nonempty Carrier]
      (relation : RelationObject) :
      LRA.Relation.ModelTheory.RelationStructure where
    Carrier := Carrier
    carrierNonempty := inferInstance
    relationInterpretation := interpret relation (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def toModelTheoryStructure
    {RelationObject : Type v} {Carrier : Type u}
    [GenericSemantics RelationObject Carrier]
    [Nonempty Carrier]
    (relation : RelationObject) :
    LRA.Relation.ModelTheory.RelationStructure where
  Carrier := Carrier
  carrierNonempty := inferInstance
  relationInterpretation := interpret relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def toModelTheoryStructure
    {RelationObject : Type v} {Carrier : Type u}
    [GenericSemantics RelationObject Carrier]
    [Nonempty Carrier]
    (relation : RelationObject) :
    LRA.Relation.ModelTheory.RelationStructure where
  Carrier := Carrier
  carrierNonempty := inferInstance
  relationInterpretation := interpret relation

/--
`toFirstOrderModel` TODO

Predicate logic:

  def toFirstOrderModel
      {RelationObject : Type v} {Carrier : Type u}
      [GenericSemantics RelationObject Carrier]
      [Nonempty Carrier]
      (relation : RelationObject) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.Relation.ModelTheory.RelationSignature :=
    LRA.Relation.ModelTheory.relationModel (toModelTheoryStructure relation)

Predicate logic (unfolded):

  def toFirstOrderModel
      {RelationObject : Type v} {Carrier : Type u}
      [GenericSemantics RelationObject Carrier]
      [Nonempty Carrier]
      (relation : RelationObject) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.Relation.ModelTheory.RelationSignature :=
    LRA.Relation.ModelTheory.relationModel (toModelTheoryStructure relation) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def toFirstOrderModel
    {RelationObject : Type v} {Carrier : Type u}
    [GenericSemantics RelationObject Carrier]
    [Nonempty Carrier]
    (relation : RelationObject) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.Relation.ModelTheory.RelationSignature :=
  LRA.Relation.ModelTheory.relationModel (toModelTheoryStructure relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def toFirstOrderModel
    {RelationObject : Type v} {Carrier : Type u}
    [GenericSemantics RelationObject Carrier]
    [Nonempty Carrier]
    (relation : RelationObject) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.Relation.ModelTheory.RelationSignature :=
  LRA.Relation.ModelTheory.relationModel (toModelTheoryStructure relation)

/--
`satisfiesModelTheory` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : LRA.Relation.Endorelation Carrier), (LRA.Relation.Reflexive relation ∧ (LRA.Relation.Symmetric relation ∧ LRA.Relation.Transitive relation)) → LRA.Relation.ModelTheory.RelationTheory relation

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    relation : Endorelation Carrier
    reflexive : LRA.Relation.Reflexive relation
    symmetric : LRA.Relation.Symmetric relation
    transitive : LRA.Relation.Transitive relation
  Prove
    ((∀ (x : Carrier), relation x x) ∧ ((∀ (x y : Carrier), relation x y → relation y x) ∧ (∀ (x y z : Carrier), relation x y → relation y z → relation x z))) → LRA.Relation.ModelTheory.RelationTheory relation

Logical form (Lean):

```lean
theorem satisfiesModelTheory
    {Carrier : Type u}
    (relation : Endorelation Carrier)
    (reflexive : LRA.Relation.Reflexive relation)
    (symmetric : LRA.Relation.Symmetric relation)
    (transitive : LRA.Relation.Transitive relation) :
    LRA.Relation.ModelTheory.RelationTheory relation where
  reflexive := reflexive
  symmetric := symmetric
  transitive
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
theorem satisfiesModelTheory
    {Carrier : Type u}
    (relation : Endorelation Carrier)
    (reflexive : LRA.Relation.Reflexive relation)
    (symmetric : LRA.Relation.Symmetric relation)
    (transitive : LRA.Relation.Transitive relation) :
    LRA.Relation.ModelTheory.RelationTheory relation where
  reflexive := reflexive
  symmetric := symmetric
  transitive := transitive
end LRA.Relation
