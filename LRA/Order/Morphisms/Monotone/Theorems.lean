import LRA.Order.Morphisms.Monotone.Definition
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
`MonotoneIdentity` TODO

Predicate logic:

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), LRA.Order.Monotone relation relation fun element => element

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : LRA.Relation.Endorelation Alpha
  Prove
    relation left right → relation ((fun element => element) left) ((fun element => element) right)

Logical form (Lean):

```lean
theorem MonotoneIdentity
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    Monotone relation relation (fun element => element)
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
theorem MonotoneIdentity
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    Monotone relation relation (fun element => element) := by
  sorry
/--
`MonotoneComp` TODO

Predicate logic:

  ∀ {Alpha : Type u} {Beta : Type v} {Gamma : Type w} {sourceRelation : LRA.Relation.Endorelation Alpha} {middleRelation : LRA.Relation.Endorelation Beta} {targetRelation : LRA.Relation.Endorelation Gamma} {firstMap : Alpha → Beta} {secondMap : Beta → Gamma}, (LRA.Order.Monotone sourceRelation middleRelation firstMap ∧ LRA.Order.Monotone middleRelation targetRelation secondMap) → LRA.Order.Monotone sourceRelation targetRelation fun x => secondMap (firstMap x)

Predicate logic (unfolded):

  Ambient
    (Alpha, Beta, Gamma)
  Objects
    sourceRelation : LRA.Relation.Endorelation Alpha
    middleRelation : LRA.Relation.Endorelation Beta
    targetRelation : LRA.Relation.Endorelation Gamma
    firstMap : Alpha -> Beta
    secondMap : Beta -> Gamma
    firstMapIsMonotone : Monotone sourceRelation middleRelation firstMap
    secondMapIsMonotone : Monotone middleRelation targetRelation secondMap
  Prove
    ((∀ (left right : Alpha), sourceRelation left right → middleRelation (firstMap left) (firstMap right)) ∧ (∀ (left right : Beta), middleRelation left right → targetRelation (secondMap left) (secondMap right))) → ∀ (left right : Alpha), sourceRelation left right → targetRelation ((fun x => secondMap (firstMap x)) left) ((fun x => secondMap (firstMap x)) right)

Logical form (Lean):

```lean
theorem MonotoneComp
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstMap : Alpha -> Beta} {secondMap : Beta -> Gamma}
    (firstMapIsMonotone : Monotone sourceRelation middleRelation firstMap)
    (secondMapIsMonotone : Monotone middleRelation targetRelation secondMap) :
    Monotone sourceRelation targetRelation (fun x => secondMap (firstMap x))
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
theorem MonotoneComp
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstMap : Alpha -> Beta} {secondMap : Beta -> Gamma}
    (firstMapIsMonotone : Monotone sourceRelation middleRelation firstMap)
    (secondMapIsMonotone : Monotone middleRelation targetRelation secondMap) :
    Monotone sourceRelation targetRelation (fun x => secondMap (firstMap x)) := by
  sorry
open LRA.Set

variable {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
variable [Membership Alpha SourceSet] [Membership Beta TargetSet]
variable {sourceRelation : LRA.Relation.Endorelation Alpha}
variable {targetRelation : LRA.Relation.Endorelation Beta}
variable {map : Alpha → Beta}

/--
`MonotoneSendsUpperBoundToImageUpperBound` TODO

Predicate logic:

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : LRA.Relation.Endorelation Alpha} {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (LRA.Set.Represents imageSet (LRA.Function.ImageClass map (LRA.Set.ClassOfSet subset)) ∧ LRA.Order.Monotone sourceRelation targetRelation map) → ∀ {bound : Alpha}, LRA.Order.UpperBound sourceRelation subset bound → LRA.Order.UpperBound targetRelation imageSet (map bound)

Predicate logic (unfolded):

  Ambient
    (Alpha, Beta, SourceSet, TargetSet, ∈)
  Objects
    sourceRelation : LRA.Relation.Endorelation Alpha
    targetRelation : LRA.Relation.Endorelation Beta
    map : Alpha → Beta
    subset : SourceSet
    imageSet : TargetSet
    representsImage : Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset))
    mapIsMonotone : Monotone sourceRelation targetRelation map
    bound : Alpha
    boundIsUpper : UpperBound sourceRelation subset bound
  Prove
    ((∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element)) ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (map left) (map right))) → ∀ {bound : Alpha}, (∀ (element : Alpha), inst.1 subset element → sourceRelation element bound) → ∀ (element : Beta), inst_1.1 imageSet element → targetRelation element (map bound)

Logical form (Lean):

```lean
theorem MonotoneSendsUpperBoundToImageUpperBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsMonotone : Monotone sourceRelation targetRelation map)
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
theorem MonotoneSendsUpperBoundToImageUpperBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsMonotone : Monotone sourceRelation targetRelation map)
    {bound : Alpha}
    (boundIsUpper : UpperBound sourceRelation subset bound)
    : UpperBound targetRelation imageSet (map bound) := by
  sorry
/--
`MonotoneSendsLowerBoundToImageLowerBound` TODO

Predicate logic:

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : LRA.Relation.Endorelation Alpha} {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (LRA.Set.Represents imageSet (LRA.Function.ImageClass map (LRA.Set.ClassOfSet subset)) ∧ LRA.Order.Monotone sourceRelation targetRelation map) → ∀ {bound : Alpha}, LRA.Order.LowerBound sourceRelation subset bound → LRA.Order.LowerBound targetRelation imageSet (map bound)

Predicate logic (unfolded):

  Ambient
    (Alpha, Beta, SourceSet, TargetSet, ∈)
  Objects
    sourceRelation : LRA.Relation.Endorelation Alpha
    targetRelation : LRA.Relation.Endorelation Beta
    map : Alpha → Beta
    subset : SourceSet
    imageSet : TargetSet
    representsImage : Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset))
    mapIsMonotone : Monotone sourceRelation targetRelation map
    bound : Alpha
    boundIsLower : LowerBound sourceRelation subset bound
  Prove
    ((∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element)) ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (map left) (map right))) → ∀ {bound : Alpha}, (∀ (element : Alpha), inst.1 subset element → sourceRelation bound element) → ∀ (element : Beta), inst_1.1 imageSet element → targetRelation (map bound) element

Logical form (Lean):

```lean
theorem MonotoneSendsLowerBoundToImageLowerBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsMonotone : Monotone sourceRelation targetRelation map)
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
theorem MonotoneSendsLowerBoundToImageLowerBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsMonotone : Monotone sourceRelation targetRelation map)
    {bound : Alpha}
    (boundIsLower : LowerBound sourceRelation subset bound)
    : LowerBound targetRelation imageSet (map bound) := by
  sorry
/--
`MonotoneImageUpperBoundsContainment` TODO

Predicate logic:

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : LRA.Relation.Endorelation Alpha} {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (LRA.Set.Represents imageSet (LRA.Function.ImageClass map (LRA.Set.ClassOfSet subset)) ∧ LRA.Order.Monotone sourceRelation targetRelation map) → ∀ (output : Beta), LRA.Function.ImageClass map (fun input => LRA.Order.UpperBound sourceRelation subset input) output → LRA.Order.UpperBound targetRelation imageSet output

Predicate logic (unfolded):

  Ambient
    (Alpha, Beta, SourceSet, TargetSet, ∈)
  Objects
    sourceRelation : LRA.Relation.Endorelation Alpha
    targetRelation : LRA.Relation.Endorelation Beta
    map : Alpha → Beta
    subset : SourceSet
    imageSet : TargetSet
    representsImage : Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset))
    mapIsMonotone : Monotone sourceRelation targetRelation map
    output : Beta
    outputIsImageOfUpperBound : LRA.Function.ImageClass map (fun input => UpperBound sourceRelation subset input) output
  Prove
    ((∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element)) ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (map left) (map right))) → ∀ (output : Beta), (Exists fun x => (((fun input => ∀ (element : Alpha), inst.1 subset element → sourceRelation element input) x) ∧ map x = output)) → ∀ (element : Beta), inst_1.1 imageSet element → targetRelation element output

Logical form (Lean):

```lean
theorem MonotoneImageUpperBoundsContainment
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsMonotone : Monotone sourceRelation targetRelation map)
    (output : Beta)
    (outputIsImageOfUpperBound :
      LRA.Function.ImageClass map
        (fun input => UpperBound sourceRelation subset input) output)
    : UpperBound targetRelation imageSet output
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
theorem MonotoneImageUpperBoundsContainment
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsMonotone : Monotone sourceRelation targetRelation map)
    (output : Beta)
    (outputIsImageOfUpperBound :
      LRA.Function.ImageClass map
        (fun input => UpperBound sourceRelation subset input) output)
    : UpperBound targetRelation imageSet output := by
  sorry
/--
`MonotoneUpperBoundsPreimageContainment` TODO

Predicate logic:

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : LRA.Relation.Endorelation Alpha} {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (LRA.Set.Represents imageSet (LRA.Function.ImageClass map (LRA.Set.ClassOfSet subset)) ∧ LRA.Order.Monotone sourceRelation targetRelation map) → ∀ (bound : Alpha), LRA.Order.UpperBound sourceRelation subset bound → LRA.Function.PreimageClass map (fun output => LRA.Order.UpperBound targetRelation imageSet output) bound

Predicate logic (unfolded):

  Ambient
    (Alpha, Beta, SourceSet, TargetSet, ∈)
  Objects
    sourceRelation : LRA.Relation.Endorelation Alpha
    targetRelation : LRA.Relation.Endorelation Beta
    map : Alpha → Beta
    subset : SourceSet
    imageSet : TargetSet
    representsImage : Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset))
    mapIsMonotone : Monotone sourceRelation targetRelation map
    bound : Alpha
    boundIsSourceUpperBound : UpperBound sourceRelation subset bound
  Prove
    ((∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element)) ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (map left) (map right))) → ∀ (bound : Alpha), (∀ (element : Alpha), inst.1 subset element → sourceRelation element bound) → Exists fun y => (((fun output => ∀ (element : Beta), inst_1.1 imageSet element → targetRelation element output) y) ∧ map bound = y)

Logical form (Lean):

```lean
theorem MonotoneUpperBoundsPreimageContainment
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsMonotone : Monotone sourceRelation targetRelation map)
    (bound : Alpha)
    (boundIsSourceUpperBound : UpperBound sourceRelation subset bound)
    : LRA.Function.PreimageClass map
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

Related proof moves: TODO

-/
theorem MonotoneUpperBoundsPreimageContainment
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsMonotone : Monotone sourceRelation targetRelation map)
    (bound : Alpha)
    (boundIsSourceUpperBound : UpperBound sourceRelation subset bound)
    : LRA.Function.PreimageClass map
      (fun output => UpperBound targetRelation imageSet output) bound := by
  sorry
/--
`MonotoneImageLowerBoundsContainment` TODO

Predicate logic:

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : LRA.Relation.Endorelation Alpha} {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (LRA.Set.Represents imageSet (LRA.Function.ImageClass map (LRA.Set.ClassOfSet subset)) ∧ LRA.Order.Monotone sourceRelation targetRelation map) → ∀ (output : Beta), LRA.Function.ImageClass map (fun input => LRA.Order.LowerBound sourceRelation subset input) output → LRA.Order.LowerBound targetRelation imageSet output

Predicate logic (unfolded):

  Ambient
    (Alpha, Beta, SourceSet, TargetSet, ∈)
  Objects
    sourceRelation : LRA.Relation.Endorelation Alpha
    targetRelation : LRA.Relation.Endorelation Beta
    map : Alpha → Beta
    subset : SourceSet
    imageSet : TargetSet
    representsImage : Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset))
    mapIsMonotone : Monotone sourceRelation targetRelation map
    output : Beta
    outputIsImageOfLowerBound : LRA.Function.ImageClass map (fun input => LowerBound sourceRelation subset input) output
  Prove
    ((∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element)) ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (map left) (map right))) → ∀ (output : Beta), (Exists fun x => (((fun input => ∀ (element : Alpha), inst.1 subset element → sourceRelation input element) x) ∧ map x = output)) → ∀ (element : Beta), inst_1.1 imageSet element → targetRelation output element

Logical form (Lean):

```lean
theorem MonotoneImageLowerBoundsContainment
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsMonotone : Monotone sourceRelation targetRelation map)
    (output : Beta)
    (outputIsImageOfLowerBound :
      LRA.Function.ImageClass map
        (fun input => LowerBound sourceRelation subset input) output)
    : LowerBound targetRelation imageSet output
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
theorem MonotoneImageLowerBoundsContainment
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsMonotone : Monotone sourceRelation targetRelation map)
    (output : Beta)
    (outputIsImageOfLowerBound :
      LRA.Function.ImageClass map
        (fun input => LowerBound sourceRelation subset input) output)
    : LowerBound targetRelation imageSet output := by
  sorry
/--
`MonotoneLowerBoundsPreimageContainment` TODO

Predicate logic:

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : LRA.Relation.Endorelation Alpha} {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (LRA.Set.Represents imageSet (LRA.Function.ImageClass map (LRA.Set.ClassOfSet subset)) ∧ LRA.Order.Monotone sourceRelation targetRelation map) → ∀ (bound : Alpha), LRA.Order.LowerBound sourceRelation subset bound → LRA.Function.PreimageClass map (fun output => LRA.Order.LowerBound targetRelation imageSet output) bound

Predicate logic (unfolded):

  Ambient
    (Alpha, Beta, SourceSet, TargetSet, ∈)
  Objects
    sourceRelation : LRA.Relation.Endorelation Alpha
    targetRelation : LRA.Relation.Endorelation Beta
    map : Alpha → Beta
    subset : SourceSet
    imageSet : TargetSet
    representsImage : Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset))
    mapIsMonotone : Monotone sourceRelation targetRelation map
    bound : Alpha
    boundIsSourceLowerBound : LowerBound sourceRelation subset bound
  Prove
    ((∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element)) ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (map left) (map right))) → ∀ (bound : Alpha), (∀ (element : Alpha), inst.1 subset element → sourceRelation bound element) → Exists fun y => (((fun output => ∀ (element : Beta), inst_1.1 imageSet element → targetRelation output element) y) ∧ map bound = y)

Logical form (Lean):

```lean
theorem MonotoneLowerBoundsPreimageContainment
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsMonotone : Monotone sourceRelation targetRelation map)
    (bound : Alpha)
    (boundIsSourceLowerBound : LowerBound sourceRelation subset bound)
    : LRA.Function.PreimageClass map
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

Related proof moves: TODO

-/
theorem MonotoneLowerBoundsPreimageContainment
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsMonotone : Monotone sourceRelation targetRelation map)
    (bound : Alpha)
    (boundIsSourceLowerBound : LowerBound sourceRelation subset bound)
    : LRA.Function.PreimageClass map
      (fun output => LowerBound targetRelation imageSet output) bound := by
  sorry
end LRA.Order
