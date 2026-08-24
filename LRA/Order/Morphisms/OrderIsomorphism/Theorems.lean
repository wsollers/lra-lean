import LRA.Order.Morphisms.OrderIsomorphism.Definition
import LRA.Order.Lattices.Join.Definition
import LRA.Order.Lattices.Meet.Definition
import LRA.Order.Bounds.BoundSets.Theorems
import LRA.Order.Bounds.GreatestElement.Definition
import LRA.Order.Bounds.LeastElement.Definition
import LRA.Order.Bounds.Supremum.Definition
import LRA.Order.Bounds.Infimum.Definition
import LRA.Order.Bounds.UpperBound.Definition
import LRA.Order.Bounds.LowerBound.Definition
import LRA.Function.Calculus.Classes.Definition
import LRA.Set.SetClass.Representation
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Order

universe u v w

/--
`OrderIsomorphismPreservesJoin` TODO

Predicate logic:

  Join targetRelation (forward left) (forward right) (forward join)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {forward : Alpha → Beta} {inverse : Beta → Alpha}, (∀ (source : Alpha), inverse (forward source) = source ∧ (∀ (target : Beta), forward (inverse target) = target ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (forward left) (forward right) ∧ ∀ (left right : Alpha), targetRelation (forward left) (forward right) → sourceRelation left right))) → ∀ {left right join : Alpha}, (sourceRelation left join ∧ (sourceRelation right join ∧ ∀ (upper : Alpha), sourceRelation left upper → sourceRelation right upper → sourceRelation join upper)) → (targetRelation (forward left) (forward join) ∧ (targetRelation (forward right) (forward join) ∧ ∀ (upper : Beta), targetRelation (forward left) upper → targetRelation (forward right) upper → targetRelation (forward join) upper))

Logical form (Lean):

```lean
theorem OrderIsomorphismPreservesJoin
    {Alpha : Type u} {Beta : Type v}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {forward : Alpha -> Beta} {inverse : Beta -> Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation forward inverse)
    {left right join : Alpha}
    (joinIsJoin : Join sourceRelation left right join) :
    Join targetRelation (forward left) (forward right) (forward join)
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
theorem OrderIsomorphismPreservesJoin
    {Alpha : Type u} {Beta : Type v}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {forward : Alpha -> Beta} {inverse : Beta -> Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation forward inverse)
    {left right join : Alpha}
    (joinIsJoin : Join sourceRelation left right join) :
    Join targetRelation (forward left) (forward right) (forward join) := by
  sorry

/--
`OrderIsomorphismPreservesMeet` TODO

Predicate logic:

  Meet targetRelation (forward left) (forward right) (forward meet)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {forward : Alpha → Beta} {inverse : Beta → Alpha}, (∀ (source : Alpha), inverse (forward source) = source ∧ (∀ (target : Beta), forward (inverse target) = target ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (forward left) (forward right) ∧ ∀ (left right : Alpha), targetRelation (forward left) (forward right) → sourceRelation left right))) → ∀ {left right meet : Alpha}, (sourceRelation meet left ∧ (sourceRelation meet right ∧ ∀ (lower : Alpha), sourceRelation lower left → sourceRelation lower right → sourceRelation lower meet)) → (targetRelation (forward meet) (forward left) ∧ (targetRelation (forward meet) (forward right) ∧ ∀ (lower : Beta), targetRelation lower (forward left) → targetRelation lower (forward right) → targetRelation lower (forward meet)))

Logical form (Lean):

```lean
theorem OrderIsomorphismPreservesMeet
    {Alpha : Type u} {Beta : Type v}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {forward : Alpha -> Beta} {inverse : Beta -> Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation forward inverse)
    {left right meet : Alpha}
    (meetIsMeet : Meet sourceRelation left right meet) :
    Meet targetRelation (forward left) (forward right) (forward meet)
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
theorem OrderIsomorphismPreservesMeet
    {Alpha : Type u} {Beta : Type v}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {forward : Alpha -> Beta} {inverse : Beta -> Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation forward inverse)
    {left right meet : Alpha}
    (meetIsMeet : Meet sourceRelation left right meet) :
    Meet targetRelation (forward left) (forward right) (forward meet) := by
  sorry

/--
`OrderIsomorphismInverse` TODO

Predicate logic:

  OrderIsomorphism targetRelation sourceRelation inverse forward

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {forward : Alpha → Beta} {inverse : Beta → Alpha}, (∀ (source : Alpha), inverse (forward source) = source ∧ (∀ (target : Beta), forward (inverse target) = target ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (forward left) (forward right) ∧ ∀ (left right : Alpha), targetRelation (forward left) (forward right) → sourceRelation left right))) → (∀ (source : Beta), forward (inverse source) = source ∧ (∀ (target : Alpha), inverse (forward target) = target ∧ (∀ (left right : Beta), targetRelation left right → sourceRelation (inverse left) (inverse right) ∧ ∀ (left right : Beta), sourceRelation (inverse left) (inverse right) → targetRelation left right)))

Logical form (Lean):

```lean
theorem OrderIsomorphismInverse
    {Alpha : Type u} {Beta : Type v}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {forward : Alpha -> Beta} {inverse : Beta -> Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation forward inverse) :
    OrderIsomorphism targetRelation sourceRelation inverse forward
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
theorem OrderIsomorphismInverse
    {Alpha : Type u} {Beta : Type v}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {forward : Alpha -> Beta} {inverse : Beta -> Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation forward inverse) :
    OrderIsomorphism targetRelation sourceRelation inverse forward := by
  sorry

/--
`OrderIsomorphismComp` TODO

Predicate logic:

  OrderIsomorphism sourceRelation targetRelation (fun element => secondForward (firstForward element)) (fun element => firstInverse (secondInverse element))

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {Gamma : Type w} {sourceRelation : Alpha → Alpha → Prop} {middleRelation : Beta → Beta → Prop} {targetRelation : Gamma → Gamma → Prop} {firstForward : Alpha → Beta} {firstInverse : Beta → Alpha} {secondForward : Beta → Gamma} {secondInverse : Gamma → Beta}, ((∀ (source : Alpha), firstInverse (firstForward source) = source ∧ (∀ (target : Beta), firstForward (firstInverse target) = target ∧ (∀ (left right : Alpha), sourceRelation left right → middleRelation (firstForward left) (firstForward right) ∧ ∀ (left right : Alpha), middleRelation (firstForward left) (firstForward right) → sourceRelation left right))) ∧ (∀ (source : Beta), secondInverse (secondForward source) = source ∧ (∀ (target : Gamma), secondForward (secondInverse target) = target ∧ (∀ (left right : Beta), middleRelation left right → targetRelation (secondForward left) (secondForward right) ∧ ∀ (left right : Beta), targetRelation (secondForward left) (secondForward right) → middleRelation left right)))) → (∀ (source : Alpha), (fun element => firstInverse (secondInverse element)) ((fun element => secondForward (firstForward element)) source) = source ∧ (∀ (target : Gamma), (fun element => secondForward (firstForward element)) ((fun element => firstInverse (secondInverse element)) target) = target ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation ((fun element => secondForward (firstForward element)) left) ((fun element => secondForward (firstForward element)) right) ∧ ∀ (left right : Alpha), targetRelation ((fun element => secondForward (firstForward element)) left) ((fun element => secondForward (firstForward element)) right) → sourceRelation left right)))

Logical form (Lean):

```lean
theorem OrderIsomorphismComp
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstForward : Alpha -> Beta} {firstInverse : Beta -> Alpha}
    {secondForward : Beta -> Gamma} {secondInverse : Gamma -> Beta}
    (firstMapsAreIsomorphism :
      OrderIsomorphism sourceRelation middleRelation
        firstForward firstInverse)
    (secondMapsAreIsomorphism :
      OrderIsomorphism middleRelation targetRelation
        secondForward secondInverse) :
    OrderIsomorphism sourceRelation targetRelation
      (fun element => secondForward (firstForward element))
      (fun element => firstInverse (secondInverse element))
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
theorem OrderIsomorphismComp
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstForward : Alpha -> Beta} {firstInverse : Beta -> Alpha}
    {secondForward : Beta -> Gamma} {secondInverse : Gamma -> Beta}
    (firstMapsAreIsomorphism :
      OrderIsomorphism sourceRelation middleRelation
        firstForward firstInverse)
    (secondMapsAreIsomorphism :
      OrderIsomorphism middleRelation targetRelation
        secondForward secondInverse) :
    OrderIsomorphism sourceRelation targetRelation
      (fun element => secondForward (firstForward element))
      (fun element => firstInverse (secondInverse element)) := by
  sorry

open LRA.Set

variable {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
variable [Membership Alpha SourceSet] [Membership Beta TargetSet]
variable {sourceRelation : LRA.Relation.Endorelation Alpha}
variable {targetRelation : LRA.Relation.Endorelation Beta}
variable {map : Alpha → Beta}

/--
`OrderIsomorphismPreservesUpperBound` TODO

Predicate logic:

  (∀ subset ∈ SourceSet ∀ imageSet ∈ TargetSet), UpperBound targetRelation imageSet (map bound)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element)) → ∀ {inverse : Beta → Alpha}, (∀ (source : Alpha), inverse (map source) = source ∧ (∀ (target : Beta), map (inverse target) = target ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (map left) (map right) ∧ ∀ (left right : Alpha), targetRelation (map left) (map right) → sourceRelation left right))) → ∀ {bound : Alpha}, (∀ (element : Alpha), inst.1 subset element → sourceRelation element bound) → ∀ (element : Beta), inst_1.1 imageSet element → targetRelation element (map bound)

Logical form (Lean):

```lean
theorem OrderIsomorphismPreservesUpperBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    {inverse : Beta → Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation map inverse)
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

Related proof moves: intro

-/
theorem OrderIsomorphismPreservesUpperBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    {inverse : Beta → Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation map inverse)
    {bound : Alpha}
    (boundIsUpper : UpperBound sourceRelation subset bound)
    : UpperBound targetRelation imageSet (map bound) := by
  sorry

/--
`OrderIsomorphismPreservesLowerBound` TODO

Predicate logic:

  (∀ subset ∈ SourceSet ∀ imageSet ∈ TargetSet), LowerBound targetRelation imageSet (map bound)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element)) → ∀ {inverse : Beta → Alpha}, (∀ (source : Alpha), inverse (map source) = source ∧ (∀ (target : Beta), map (inverse target) = target ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (map left) (map right) ∧ ∀ (left right : Alpha), targetRelation (map left) (map right) → sourceRelation left right))) → ∀ {bound : Alpha}, (∀ (element : Alpha), inst.1 subset element → sourceRelation bound element) → ∀ (element : Beta), inst_1.1 imageSet element → targetRelation (map bound) element

Logical form (Lean):

```lean
theorem OrderIsomorphismPreservesLowerBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    {inverse : Beta → Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation map inverse)
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

Related proof moves: intro

-/
theorem OrderIsomorphismPreservesLowerBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    {inverse : Beta → Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation map inverse)
    {bound : Alpha}
    (boundIsLower : LowerBound sourceRelation subset bound)
    : LowerBound targetRelation imageSet (map bound) := by
  sorry

/--
`OrderIsomorphismPreservesSupremum` TODO

Predicate logic:

  (∀ subset ∈ SourceSet ∀ imageSet ∈ TargetSet), Supremum targetRelation imageSet (map supremum)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element)) → ∀ {inverse : Beta → Alpha}, (∀ (source : Alpha), inverse (map source) = source ∧ (∀ (target : Beta), map (inverse target) = target ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (map left) (map right) ∧ ∀ (left right : Alpha), targetRelation (map left) (map right) → sourceRelation left right))) → ∀ {supremum : Alpha}, (∀ (element : Alpha), inst.1 subset element → sourceRelation element supremum ∧ ∀ (bound : Alpha), (∀ (element : Alpha), inst.1 subset element → sourceRelation element bound) → sourceRelation supremum bound) → (∀ (element : Beta), inst_1.1 imageSet element → targetRelation element (map supremum) ∧ ∀ (bound : Beta), (∀ (element : Beta), inst_1.1 imageSet element → targetRelation element bound) → targetRelation (map supremum) bound)

Logical form (Lean):

```lean
theorem OrderIsomorphismPreservesSupremum
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    {inverse : Beta → Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation map inverse)
    {supremum : Alpha}
    (supremumIsSupremum : Supremum sourceRelation subset supremum)
    : Supremum targetRelation imageSet (map supremum)
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
theorem OrderIsomorphismPreservesSupremum
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    {inverse : Beta → Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation map inverse)
    {supremum : Alpha}
    (supremumIsSupremum : Supremum sourceRelation subset supremum)
    : Supremum targetRelation imageSet (map supremum) := by
  sorry

/--
`OrderIsomorphismPreservesInfimum` TODO

Predicate logic:

  (∀ subset ∈ SourceSet ∀ imageSet ∈ TargetSet), Infimum targetRelation imageSet (map infimum)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element)) → ∀ {inverse : Beta → Alpha}, (∀ (source : Alpha), inverse (map source) = source ∧ (∀ (target : Beta), map (inverse target) = target ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (map left) (map right) ∧ ∀ (left right : Alpha), targetRelation (map left) (map right) → sourceRelation left right))) → ∀ {infimum : Alpha}, (∀ (element : Alpha), inst.1 subset element → sourceRelation infimum element ∧ ∀ (bound : Alpha), (∀ (element : Alpha), inst.1 subset element → sourceRelation bound element) → sourceRelation bound infimum) → (∀ (element : Beta), inst_1.1 imageSet element → targetRelation (map infimum) element ∧ ∀ (bound : Beta), (∀ (element : Beta), inst_1.1 imageSet element → targetRelation bound element) → targetRelation bound (map infimum))

Logical form (Lean):

```lean
theorem OrderIsomorphismPreservesInfimum
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    {inverse : Beta → Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation map inverse)
    {infimum : Alpha}
    (infimumIsInfimum : Infimum sourceRelation subset infimum)
    : Infimum targetRelation imageSet (map infimum)
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
theorem OrderIsomorphismPreservesInfimum
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    {inverse : Beta → Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation map inverse)
    {infimum : Alpha}
    (infimumIsInfimum : Infimum sourceRelation subset infimum)
    : Infimum targetRelation imageSet (map infimum) := by
  sorry

/--
`OrderIsomorphismToConverseSendsSupremumToInfimum` TODO

Predicate logic:

  (∀ subset ∈ SourceSet ∀ imageSet ∈ TargetSet), Infimum targetRelation imageSet (map supremum)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element)) → ∀ {inverse : Beta → Alpha}, (∀ (source : Alpha), inverse (map source) = source ∧ (∀ (target : Beta), map (inverse target) = target ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (map right) (map left) ∧ ∀ (left right : Alpha), targetRelation (map right) (map left) → sourceRelation left right))) → ∀ {supremum : Alpha}, (∀ (element : Alpha), inst.1 subset element → sourceRelation element supremum ∧ ∀ (bound : Alpha), (∀ (element : Alpha), inst.1 subset element → sourceRelation element bound) → sourceRelation supremum bound) → (∀ (element : Beta), inst_1.1 imageSet element → targetRelation (map supremum) element ∧ ∀ (bound : Beta), (∀ (element : Beta), inst_1.1 imageSet element → targetRelation bound element) → targetRelation bound (map supremum))

Logical form (Lean):

```lean
theorem OrderIsomorphismToConverseSendsSupremumToInfimum
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    {inverse : Beta → Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation (LRA.Relation.Converse targetRelation) map inverse)
    {supremum : Alpha}
    (supremumIsSupremum : Supremum sourceRelation subset supremum)
    : Infimum targetRelation imageSet (map supremum)
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
theorem OrderIsomorphismToConverseSendsSupremumToInfimum
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    {inverse : Beta → Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation (LRA.Relation.Converse targetRelation) map inverse)
    {supremum : Alpha}
    (supremumIsSupremum : Supremum sourceRelation subset supremum)
    : Infimum targetRelation imageSet (map supremum) := by
  sorry

/--
`OrderIsomorphismToConverseSendsInfimumToSupremum` TODO

Predicate logic:

  (∀ subset ∈ SourceSet ∀ imageSet ∈ TargetSet), Supremum targetRelation imageSet (map infimum)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x} [inst : Membership Alpha SourceSet] [inst_1 : Membership Beta TargetSet] {sourceRelation : Alpha → Alpha → Prop} {targetRelation : Beta → Beta → Prop} {map : Alpha → Beta} (subset : SourceSet) (imageSet : TargetSet), (∀ (element : Beta), inst_1.1 imageSet element ↔ Exists fun x => (inst.1 subset x ∧ map x = element)) → ∀ {inverse : Beta → Alpha}, (∀ (source : Alpha), inverse (map source) = source ∧ (∀ (target : Beta), map (inverse target) = target ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (map right) (map left) ∧ ∀ (left right : Alpha), targetRelation (map right) (map left) → sourceRelation left right))) → ∀ {infimum : Alpha}, (∀ (element : Alpha), inst.1 subset element → sourceRelation infimum element ∧ ∀ (bound : Alpha), (∀ (element : Alpha), inst.1 subset element → sourceRelation bound element) → sourceRelation bound infimum) → (∀ (element : Beta), inst_1.1 imageSet element → targetRelation element (map infimum) ∧ ∀ (bound : Beta), (∀ (element : Beta), inst_1.1 imageSet element → targetRelation element bound) → targetRelation (map infimum) bound)

Logical form (Lean):

```lean
theorem OrderIsomorphismToConverseSendsInfimumToSupremum
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    {inverse : Beta → Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation (LRA.Relation.Converse targetRelation) map inverse)
    {infimum : Alpha}
    (infimumIsInfimum : Infimum sourceRelation subset infimum)
    : Supremum targetRelation imageSet (map infimum)
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
theorem OrderIsomorphismToConverseSendsInfimumToSupremum
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    {inverse : Beta → Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation (LRA.Relation.Converse targetRelation) map inverse)
    {infimum : Alpha}
    (infimumIsInfimum : Infimum sourceRelation subset infimum)
    : Supremum targetRelation imageSet (map infimum) := by
  sorry

end LRA.Order
