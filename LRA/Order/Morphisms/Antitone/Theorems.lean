import LRA.Order.Morphisms.Antitone.Definition
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
`AntitoneCompAntitoneIsMonotone` TODO

Predicate logic:

  Monotone sourceRelation targetRelation (fun element => secondMap (firstMap element))

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {Gamma : Type w} {sourceRelation : Alpha → Alpha → Prop} {middleRelation : Beta → Beta → Prop} {targetRelation : Gamma → Gamma → Prop} {firstMap : Alpha → Beta} {secondMap : Beta → Gamma}, (∀ (left right : Alpha), sourceRelation left right → middleRelation (firstMap right) (firstMap left) ∧ ∀ (left right : Beta), middleRelation left right → targetRelation (secondMap right) (secondMap left)) → ∀ (left right : Alpha), sourceRelation left right → targetRelation ((fun element => secondMap (firstMap element)) left) ((fun element => secondMap (firstMap element)) right)

Logical form (Lean):

```lean
theorem AntitoneCompAntitoneIsMonotone
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstMap : Alpha -> Beta} {secondMap : Beta -> Gamma}
    (firstMapIsAntitone : Antitone sourceRelation middleRelation firstMap)
    (secondMapIsAntitone : Antitone middleRelation targetRelation secondMap) :
    Monotone sourceRelation targetRelation
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
theorem AntitoneCompAntitoneIsMonotone
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstMap : Alpha -> Beta} {secondMap : Beta -> Gamma}
    (firstMapIsAntitone : Antitone sourceRelation middleRelation firstMap)
    (secondMapIsAntitone : Antitone middleRelation targetRelation secondMap) :
    Monotone sourceRelation targetRelation
      (fun element => secondMap (firstMap element)) := by
  sorry

/--
`AntitoneThenMonotoneIsAntitone` TODO

Predicate logic:

  Antitone sourceRelation targetRelation (fun element => secondMap (firstMap element))

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {Gamma : Type w} {sourceRelation : Alpha → Alpha → Prop} {middleRelation : Beta → Beta → Prop} {targetRelation : Gamma → Gamma → Prop} {firstMap : Alpha → Beta} {secondMap : Beta → Gamma}, (∀ (left right : Alpha), sourceRelation left right → middleRelation (firstMap right) (firstMap left) ∧ ∀ (left right : Beta), middleRelation left right → targetRelation (secondMap left) (secondMap right)) → ∀ (left right : Alpha), sourceRelation left right → targetRelation ((fun element => secondMap (firstMap element)) right) ((fun element => secondMap (firstMap element)) left)

Logical form (Lean):

```lean
theorem AntitoneThenMonotoneIsAntitone
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstMap : Alpha -> Beta} {secondMap : Beta -> Gamma}
    (firstMapIsAntitone : Antitone sourceRelation middleRelation firstMap)
    (secondMapIsMonotone : Monotone middleRelation targetRelation secondMap) :
    Antitone sourceRelation targetRelation
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
theorem AntitoneThenMonotoneIsAntitone
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstMap : Alpha -> Beta} {secondMap : Beta -> Gamma}
    (firstMapIsAntitone : Antitone sourceRelation middleRelation firstMap)
    (secondMapIsMonotone : Monotone middleRelation targetRelation secondMap) :
    Antitone sourceRelation targetRelation
      (fun element => secondMap (firstMap element)) := by
  sorry

/--
`MonotoneThenAntitoneIsAntitone` TODO

Predicate logic:

  Antitone sourceRelation targetRelation (fun element => secondMap (firstMap element))

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {Gamma : Type w} {sourceRelation : Alpha → Alpha → Prop} {middleRelation : Beta → Beta → Prop} {targetRelation : Gamma → Gamma → Prop} {firstMap : Alpha → Beta} {secondMap : Beta → Gamma}, (∀ (left right : Alpha), sourceRelation left right → middleRelation (firstMap left) (firstMap right) ∧ ∀ (left right : Beta), middleRelation left right → targetRelation (secondMap right) (secondMap left)) → ∀ (left right : Alpha), sourceRelation left right → targetRelation ((fun element => secondMap (firstMap element)) right) ((fun element => secondMap (firstMap element)) left)

Logical form (Lean):

```lean
theorem MonotoneThenAntitoneIsAntitone
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstMap : Alpha -> Beta} {secondMap : Beta -> Gamma}
    (firstMapIsMonotone : Monotone sourceRelation middleRelation firstMap)
    (secondMapIsAntitone : Antitone middleRelation targetRelation secondMap) :
    Antitone sourceRelation targetRelation
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
theorem MonotoneThenAntitoneIsAntitone
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstMap : Alpha -> Beta} {secondMap : Beta -> Gamma}
    (firstMapIsMonotone : Monotone sourceRelation middleRelation firstMap)
    (secondMapIsAntitone : Antitone middleRelation targetRelation secondMap) :
    Antitone sourceRelation targetRelation
      (fun element => secondMap (firstMap element)) := by
  sorry

open LRA.Set

variable {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
variable [Membership Alpha SourceSet] [Membership Beta TargetSet]
variable {sourceRelation : LRA.Relation.Endorelation Alpha}
variable {targetRelation : LRA.Relation.Endorelation Beta}
variable {map : Alpha → Beta}

/--
`AntitoneSendsUpperBoundToImageLowerBound` TODO

Predicate logic:

  (∀ subset ∈ SourceSet ∀ imageSet ∈ TargetSet), LowerBound targetRelation imageSet (map bound)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element) ∧ ∀ (left right : Alpha), sourceRelation left right → targetRelation (map right) (map left)) → ∀ {bound : Alpha}, (∀ (element : Alpha), inst.1 subset element → sourceRelation element bound) → ∀ (element : Beta), inst_1.1 imageSet element → targetRelation (map bound) element

Logical form (Lean):

```lean
theorem AntitoneSendsUpperBoundToImageLowerBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    {bound : Alpha}
    (boundIsUpper : UpperBound sourceRelation subset bound)
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
theorem AntitoneSendsUpperBoundToImageLowerBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    {bound : Alpha}
    (boundIsUpper : UpperBound sourceRelation subset bound)
    : LowerBound targetRelation imageSet (map bound) := by
  sorry

/--
`AntitoneSendsLowerBoundToImageUpperBound` TODO

Predicate logic:

  (∀ subset ∈ SourceSet ∀ imageSet ∈ TargetSet), UpperBound targetRelation imageSet (map bound)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element) ∧ ∀ (left right : Alpha), sourceRelation left right → targetRelation (map right) (map left)) → ∀ {bound : Alpha}, (∀ (element : Alpha), inst.1 subset element → sourceRelation bound element) → ∀ (element : Beta), inst_1.1 imageSet element → targetRelation element (map bound)

Logical form (Lean):

```lean
theorem AntitoneSendsLowerBoundToImageUpperBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    {bound : Alpha}
    (boundIsLower : LowerBound sourceRelation subset bound)
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
theorem AntitoneSendsLowerBoundToImageUpperBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    {bound : Alpha}
    (boundIsLower : LowerBound sourceRelation subset bound)
    : UpperBound targetRelation imageSet (map bound) := by
  sorry

/--
`AntitoneImageUpperBoundsIntoLowerBounds` TODO

Predicate logic:

  (∀ subset ∈ SourceSet ∀ imageSet ∈ TargetSet ∀ output ∈ Beta), LowerBound targetRelation imageSet output

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element) ∧ ∀ (left right : Alpha), sourceRelation left right → targetRelation (map right) (map left)) → ∀ (output : Beta), (Exists fun x => ((fun input => ∀ (element : Alpha), inst.1 subset element → sourceRelation element input) x ∧ map x = output)) → ∀ (element : Beta), inst_1.1 imageSet element → targetRelation output element

Logical form (Lean):

```lean
theorem AntitoneImageUpperBoundsIntoLowerBounds
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    (output : Beta)
    (outputIsImageOfUpperBound :
      LRA.Function.ImageClass map
        (fun input => UpperBound sourceRelation subset input) output)
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
theorem AntitoneImageUpperBoundsIntoLowerBounds
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    (output : Beta)
    (outputIsImageOfUpperBound :
      LRA.Function.ImageClass map
        (fun input => UpperBound sourceRelation subset input) output)
    : LowerBound targetRelation imageSet output := by
  sorry

/--
`AntitoneUpperBoundsPreimageLowerBoundsContainment` TODO

Predicate logic:

  (∀ subset ∈ SourceSet ∀ imageSet ∈ TargetSet ∀ bound ∈ Alpha), LRA.Function.PreimageClass map (fun output => LowerBound targetRelation imageSet output) bound

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element) ∧ ∀ (left right : Alpha), sourceRelation left right → targetRelation (map right) (map left)) → ∀ (bound : Alpha), (∀ (element : Alpha), inst.1 subset element → sourceRelation element bound) → Exists fun y => ((fun output => ∀ (element : Beta), inst_1.1 imageSet element → targetRelation output element) y ∧ map bound = y)

Logical form (Lean):

```lean
theorem AntitoneUpperBoundsPreimageLowerBoundsContainment
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    (bound : Alpha)
    (boundIsSourceUpperBound : UpperBound sourceRelation subset bound)
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
theorem AntitoneUpperBoundsPreimageLowerBoundsContainment
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    (bound : Alpha)
    (boundIsSourceUpperBound : UpperBound sourceRelation subset bound)
    : LRA.Function.PreimageClass map
      (fun output => LowerBound targetRelation imageSet output) bound := by
  sorry

/--
`AntitoneImageLowerBoundsIntoUpperBounds` TODO

Predicate logic:

  (∀ subset ∈ SourceSet ∀ imageSet ∈ TargetSet ∀ output ∈ Beta), UpperBound targetRelation imageSet output

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element) ∧ ∀ (left right : Alpha), sourceRelation left right → targetRelation (map right) (map left)) → ∀ (output : Beta), (Exists fun x => ((fun input => ∀ (element : Alpha), inst.1 subset element → sourceRelation input element) x ∧ map x = output)) → ∀ (element : Beta), inst_1.1 imageSet element → targetRelation element output

Logical form (Lean):

```lean
theorem AntitoneImageLowerBoundsIntoUpperBounds
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    (output : Beta)
    (outputIsImageOfLowerBound :
      LRA.Function.ImageClass map
        (fun input => LowerBound sourceRelation subset input) output)
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
theorem AntitoneImageLowerBoundsIntoUpperBounds
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    (output : Beta)
    (outputIsImageOfLowerBound :
      LRA.Function.ImageClass map
        (fun input => LowerBound sourceRelation subset input) output)
    : UpperBound targetRelation imageSet output := by
  sorry

/--
`AntitoneLowerBoundsPreimageUpperBoundsContainment` TODO

Predicate logic:

  (∀ subset ∈ SourceSet ∀ imageSet ∈ TargetSet ∀ bound ∈ Alpha), LRA.Function.PreimageClass map (fun output => UpperBound targetRelation imageSet output) bound

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element) ∧ ∀ (left right : Alpha), sourceRelation left right → targetRelation (map right) (map left)) → ∀ (bound : Alpha), (∀ (element : Alpha), inst.1 subset element → sourceRelation bound element) → Exists fun y => ((fun output => ∀ (element : Beta), inst_1.1 imageSet element → targetRelation element output) y ∧ map bound = y)

Logical form (Lean):

```lean
theorem AntitoneLowerBoundsPreimageUpperBoundsContainment
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    (bound : Alpha)
    (boundIsSourceLowerBound : LowerBound sourceRelation subset bound)
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
theorem AntitoneLowerBoundsPreimageUpperBoundsContainment
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    (bound : Alpha)
    (boundIsSourceLowerBound : LowerBound sourceRelation subset bound)
    : LRA.Function.PreimageClass map
      (fun output => UpperBound targetRelation imageSet output) bound := by
  sorry

end LRA.Order
