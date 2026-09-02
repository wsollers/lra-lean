import LRA.Order.Morphisms.OrderEmbedding.Definition
import LRA.Relation.Interface.Laws.Definition
import LRA.Order.Bounds.BoundSets.Theorems
import LRA.Order.Bounds.GreatestElement.Definition
import LRA.Order.Bounds.LeastElement.Definition
import LRA.Order.Bounds.Supremum.Definition
import LRA.Order.Bounds.Infimum.Definition
import LRA.Order.Bounds.UpperBound.Definition
import LRA.Order.Bounds.LowerBound.Definition
import LRA.Function.Calculus.Classes.Definition
import LRA.Set.SetClass.Representation
import LRA.Relation.Interface.Operations.Converse.Definition

namespace LRA.Order

universe u v w

/--
`OrderEmbeddingInjective` TODO

Predicate logic:

  Function.Injective map

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {map : Alpha → Beta}, (∀ (x y : Alpha), sourceRelation x y → sourceRelation y x → x = y ∧ (∀ (x : Beta), targetRelation x x ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (map left) (map right) ∧ ∀ (left right : Alpha), targetRelation (map left) (map right) → sourceRelation left right))) → ∀ (y : Beta) (x₁ x₂ : Alpha), (map x₁ = y ∧ map x₂ = y) → x₁ = x₂

Logical form (Lean):

```lean
theorem OrderEmbeddingInjective
    {Alpha : Type u} {Beta : Type v}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {map : Alpha -> Beta}
    (sourceIsAntisymmetric : LRA.Relation.Antisymmetric sourceRelation)
    (targetIsReflexive : LRA.Relation.Reflexive targetRelation)
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map) :
    Function.Injective map
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem OrderEmbeddingInjective
    {Alpha : Type u} {Beta : Type v}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {map : Alpha -> Beta}
    (sourceIsAntisymmetric : LRA.Relation.Antisymmetric sourceRelation)
    (targetIsReflexive : LRA.Relation.Reflexive targetRelation)
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map) :
    Function.Injective map := by
  sorry
/--
`OrderEmbeddingComp` TODO

Predicate logic:

  OrderEmbedding sourceRelation targetRelation (fun element => secondMap (firstMap element))

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {Gamma : Type w} {sourceRelation : Alpha → Alpha → Prop} {middleRelation : Beta → Beta → Prop} {targetRelation : Gamma → Gamma → Prop} {firstMap : Alpha → Beta} {secondMap : Beta → Gamma}, ((∀ (left right : Alpha), sourceRelation left right → middleRelation (firstMap left) (firstMap right) ∧ ∀ (left right : Alpha), middleRelation (firstMap left) (firstMap right) → sourceRelation left right) ∧ (∀ (left right : Beta), middleRelation left right → targetRelation (secondMap left) (secondMap right) ∧ ∀ (left right : Beta), targetRelation (secondMap left) (secondMap right) → middleRelation left right)) → (∀ (left right : Alpha), sourceRelation left right → targetRelation ((fun element => secondMap (firstMap element)) left) ((fun element => secondMap (firstMap element)) right) ∧ ∀ (left right : Alpha), targetRelation ((fun element => secondMap (firstMap element)) left) ((fun element => secondMap (firstMap element)) right) → sourceRelation left right)

Logical form (Lean):

```lean
theorem OrderEmbeddingComp
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstMap : Alpha -> Beta} {secondMap : Beta -> Gamma}
    (firstMapIsEmbedding : OrderEmbedding sourceRelation middleRelation firstMap)
    (secondMapIsEmbedding : OrderEmbedding middleRelation targetRelation secondMap) :
    OrderEmbedding sourceRelation targetRelation
      (fun element => secondMap (firstMap element))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem OrderEmbeddingComp
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstMap : Alpha -> Beta} {secondMap : Beta -> Gamma}
    (firstMapIsEmbedding : OrderEmbedding sourceRelation middleRelation firstMap)
    (secondMapIsEmbedding : OrderEmbedding middleRelation targetRelation secondMap) :
    OrderEmbedding sourceRelation targetRelation
      (fun element => secondMap (firstMap element)) := by
  sorry
open LRA.Set

variable {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
variable [Membership Alpha SourceSet] [Membership Beta TargetSet]
variable {sourceRelation : LRA.Relation.Endorelation Alpha}
variable {targetRelation : LRA.Relation.Endorelation Beta}
variable {map : Alpha → Beta}

/--
`OrderEmbeddingSendsUpperBoundToImageUpperBound` TODO

Predicate logic:

  (∀ subset ∈ SourceSet ∀ imageSet ∈ TargetSet), UpperBound targetRelation imageSet (map bound)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element) ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (map left) (map right) ∧ ∀ (left right : Alpha), targetRelation (map left) (map right) → sourceRelation left right)) → ∀ {bound : Alpha}, (∀ (element : Alpha), inst.1 subset element → sourceRelation element bound) → ∀ (element : Beta), inst_1.1 imageSet element → targetRelation element (map bound)

Logical form (Lean):

```lean
theorem OrderEmbeddingSendsUpperBoundToImageUpperBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    {bound : Alpha}
    (boundIsUpper : UpperBound sourceRelation subset bound)
    : UpperBound targetRelation imageSet (map bound)
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
theorem OrderEmbeddingSendsUpperBoundToImageUpperBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    {bound : Alpha}
    (boundIsUpper : UpperBound sourceRelation subset bound)
    : UpperBound targetRelation imageSet (map bound) := by
  sorry
/--
`OrderEmbeddingSendsLowerBoundToImageLowerBound` TODO

Predicate logic:

  (∀ subset ∈ SourceSet ∀ imageSet ∈ TargetSet), LowerBound targetRelation imageSet (map bound)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element) ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (map left) (map right) ∧ ∀ (left right : Alpha), targetRelation (map left) (map right) → sourceRelation left right)) → ∀ {bound : Alpha}, (∀ (element : Alpha), inst.1 subset element → sourceRelation bound element) → ∀ (element : Beta), inst_1.1 imageSet element → targetRelation (map bound) element

Logical form (Lean):

```lean
theorem OrderEmbeddingSendsLowerBoundToImageLowerBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    {bound : Alpha}
    (boundIsLower : LowerBound sourceRelation subset bound)
    : LowerBound targetRelation imageSet (map bound)
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
theorem OrderEmbeddingSendsLowerBoundToImageLowerBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    {bound : Alpha}
    (boundIsLower : LowerBound sourceRelation subset bound)
    : LowerBound targetRelation imageSet (map bound) := by
  sorry
/--
`OrderEmbeddingUpperBoundsPreimageIff` TODO

Predicate logic:

  (∀ subset ∈ SourceSet ∀ imageSet ∈ TargetSet ∀ bound ∈ Alpha), UpperBound sourceRelation subset bound ↔ LRA.Function.PreimageClass map (fun output => UpperBound targetRelation imageSet output) bound

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element) ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (map left) (map right) ∧ ∀ (left right : Alpha), targetRelation (map left) (map right) → sourceRelation left right)) → ∀ (bound : Alpha), ∀ (element : Alpha), inst.1 subset element → sourceRelation element bound ↔ Exists fun y => ((fun output => ∀ (element : Beta), inst_1.1 imageSet element → targetRelation element output) y ∧ map bound = y)

Logical form (Lean):

```lean
theorem OrderEmbeddingUpperBoundsPreimageIff
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    (bound : Alpha)
    : UpperBound sourceRelation subset bound ↔
      LRA.Function.PreimageClass map
        (fun output => UpperBound targetRelation imageSet output) bound
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem OrderEmbeddingUpperBoundsPreimageIff
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    (bound : Alpha)
    : UpperBound sourceRelation subset bound ↔
      LRA.Function.PreimageClass map
        (fun output => UpperBound targetRelation imageSet output) bound := by
  sorry
/--
`OrderEmbeddingLowerBoundsPreimageIff` TODO

Predicate logic:

  (∀ subset ∈ SourceSet ∀ imageSet ∈ TargetSet ∀ bound ∈ Alpha), LowerBound sourceRelation subset bound ↔ LRA.Function.PreimageClass map (fun output => LowerBound targetRelation imageSet output) bound

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element) ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (map left) (map right) ∧ ∀ (left right : Alpha), targetRelation (map left) (map right) → sourceRelation left right)) → ∀ (bound : Alpha), ∀ (element : Alpha), inst.1 subset element → sourceRelation bound element ↔ Exists fun y => ((fun output => ∀ (element : Beta), inst_1.1 imageSet element → targetRelation output element) y ∧ map bound = y)

Logical form (Lean):

```lean
theorem OrderEmbeddingLowerBoundsPreimageIff
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    (bound : Alpha)
    : LowerBound sourceRelation subset bound ↔
      LRA.Function.PreimageClass map
        (fun output => LowerBound targetRelation imageSet output) bound
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem OrderEmbeddingLowerBoundsPreimageIff
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    (bound : Alpha)
    : LowerBound sourceRelation subset bound ↔
      LRA.Function.PreimageClass map
        (fun output => LowerBound targetRelation imageSet output) bound := by
  sorry
/--
`OrderEmbeddingPreservesGreatestElement` TODO

Predicate logic:

  (∀ subset ∈ SourceSet ∀ imageSet ∈ TargetSet), GreatestElement targetRelation imageSet (map greatest)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element) ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (map left) (map right) ∧ ∀ (left right : Alpha), targetRelation (map left) (map right) → sourceRelation left right)) → ∀ {greatest : Alpha}, (inst.1 subset greatest ∧ ∀ (element : Alpha), inst.1 subset element → sourceRelation element greatest) → (inst_1.1 imageSet (map greatest) ∧ ∀ (element : Beta), inst_1.1 imageSet element → targetRelation element (map greatest))

Logical form (Lean):

```lean
theorem OrderEmbeddingPreservesGreatestElement
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    {greatest : Alpha}
    (greatestIsGreatest : GreatestElement sourceRelation subset greatest)
    : GreatestElement targetRelation imageSet (map greatest)
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
theorem OrderEmbeddingPreservesGreatestElement
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    {greatest : Alpha}
    (greatestIsGreatest : GreatestElement sourceRelation subset greatest)
    : GreatestElement targetRelation imageSet (map greatest) := by
  sorry
/--
`OrderEmbeddingPreservesLeastElement` TODO

Predicate logic:

  (∀ subset ∈ SourceSet ∀ imageSet ∈ TargetSet), LeastElement targetRelation imageSet (map least)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element) ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (map left) (map right) ∧ ∀ (left right : Alpha), targetRelation (map left) (map right) → sourceRelation left right)) → ∀ {least : Alpha}, (inst.1 subset least ∧ ∀ (element : Alpha), inst.1 subset element → sourceRelation least element) → (inst_1.1 imageSet (map least) ∧ ∀ (element : Beta), inst_1.1 imageSet element → targetRelation (map least) element)

Logical form (Lean):

```lean
theorem OrderEmbeddingPreservesLeastElement
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    {least : Alpha}
    (leastIsLeast : LeastElement sourceRelation subset least)
    : LeastElement targetRelation imageSet (map least)
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
theorem OrderEmbeddingPreservesLeastElement
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    {least : Alpha}
    (leastIsLeast : LeastElement sourceRelation subset least)
    : LeastElement targetRelation imageSet (map least) := by
  sorry
end LRA.Order
