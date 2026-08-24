import LRA.Order.Bounds.BoundSets.Theorems

namespace LRA.Order

open LRA.Set

universe u v

section GaloisRelationships

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSeparation Element SetObject]
variable [HasUniversal SetObject] [HasComplement SetObject]
variable [MembershipLaws Element SetObject]
variable [SeparationLaws Element SetObject]
variable [UniversalMembershipLaws Element SetObject]
variable [ExtensionalityLaw Element SetObject]
variable [SubsetLaws SetObject]

/--
`SubsetOfLowerBoundsOfUpperBounds` TODO

Predicate logic:

  (∀ A ∈ U), A ⊆ LowerBounds relation (UpperBounds relation A)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject] [inst_6 : LRA.Set.HasSeparation Element SetObject] [inst_7 : LRA.Set.HasUniversal SetObject] [inst_8 : LRA.Set.HasComplement SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ (LRA.Set.SeparationLaws Element SetObject ∧ (LRA.Set.UniversalMembershipLaws Element SetObject ∧ (LRA.Set.ExtensionalityLaw Element SetObject ∧ LRA.Set.SubsetLaws SetObject)))) → ∀ (relation : Element → Element → Prop) (subset : SetObject), inst_5.1 subset (inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (inst_6.separation inst_7.universal (LRA.Order.UpperBound relation subset)) element → relation bound element)

Logical form (Lean):

```lean
theorem SubsetOfLowerBoundsOfUpperBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    subset ⊆ LowerBounds relation (UpperBounds relation subset)
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
theorem SubsetOfLowerBoundsOfUpperBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    subset ⊆ LowerBounds relation (UpperBounds relation subset) := by
  sorry

/--
`SubsetOfUpperBoundsOfLowerBounds` TODO

Predicate logic:

  (∀ A ∈ U), A ⊆ UpperBounds relation (LowerBounds relation A)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject] [inst_6 : LRA.Set.HasSeparation Element SetObject] [inst_7 : LRA.Set.HasUniversal SetObject] [inst_8 : LRA.Set.HasComplement SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ (LRA.Set.SeparationLaws Element SetObject ∧ (LRA.Set.UniversalMembershipLaws Element SetObject ∧ (LRA.Set.ExtensionalityLaw Element SetObject ∧ LRA.Set.SubsetLaws SetObject)))) → ∀ (relation : Element → Element → Prop) (subset : SetObject), inst_5.1 subset (inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (inst_6.separation inst_7.universal (LRA.Order.LowerBound relation subset)) element → relation element bound)

Logical form (Lean):

```lean
theorem SubsetOfUpperBoundsOfLowerBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    subset ⊆ UpperBounds relation (LowerBounds relation subset)
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
theorem SubsetOfUpperBoundsOfLowerBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    subset ⊆ UpperBounds relation (LowerBounds relation subset) := by
  sorry

/--
`UpperBoundsLowerBoundsUpperBounds` TODO

Predicate logic:

  (∀ A ∈ U), UpperBounds relation (LowerBounds relation (UpperBounds relation A)) = UpperBounds relation A

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject] [inst_6 : LRA.Set.HasSeparation Element SetObject] [inst_7 : LRA.Set.HasUniversal SetObject] [inst_8 : LRA.Set.HasComplement SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ (LRA.Set.SeparationLaws Element SetObject ∧ (LRA.Set.UniversalMembershipLaws Element SetObject ∧ (LRA.Set.ExtensionalityLaw Element SetObject ∧ LRA.Set.SubsetLaws SetObject)))) → ∀ (relation : Element → Element → Prop) (subset : SetObject), inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (inst_6.1 inst_7.universal (LRA.Order.LowerBound relation (LRA.Order.UpperBounds relation subset))) element → relation element bound = inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 subset element → relation element bound

Logical form (Lean):

```lean
theorem UpperBoundsLowerBoundsUpperBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    UpperBounds relation
        (LowerBounds relation (UpperBounds relation subset)) =
      UpperBounds relation subset
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
theorem UpperBoundsLowerBoundsUpperBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    UpperBounds relation
        (LowerBounds relation (UpperBounds relation subset)) =
      UpperBounds relation subset := by
  sorry

/--
`LowerBoundsUpperBoundsLowerBounds` TODO

Predicate logic:

  (∀ A ∈ U), LowerBounds relation (UpperBounds relation (LowerBounds relation A)) = LowerBounds relation A

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject] [inst_6 : LRA.Set.HasSeparation Element SetObject] [inst_7 : LRA.Set.HasUniversal SetObject] [inst_8 : LRA.Set.HasComplement SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ (LRA.Set.SeparationLaws Element SetObject ∧ (LRA.Set.UniversalMembershipLaws Element SetObject ∧ (LRA.Set.ExtensionalityLaw Element SetObject ∧ LRA.Set.SubsetLaws SetObject)))) → ∀ (relation : Element → Element → Prop) (subset : SetObject), inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (inst_6.1 inst_7.universal (LRA.Order.UpperBound relation (LRA.Order.LowerBounds relation subset))) element → relation bound element = inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 subset element → relation bound element

Logical form (Lean):

```lean
theorem LowerBoundsUpperBoundsLowerBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    LowerBounds relation
        (UpperBounds relation (LowerBounds relation subset)) =
      LowerBounds relation subset
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
theorem LowerBoundsUpperBoundsLowerBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    LowerBounds relation
        (UpperBounds relation (LowerBounds relation subset)) =
      LowerBounds relation subset := by
  sorry

/--
`LowerUpperClosureIsExtensive` TODO

Predicate logic:

  (∀ A ∈ U), A ⊆ LowerUpperClosure relation A

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject] [inst_6 : LRA.Set.HasSeparation Element SetObject] [inst_7 : LRA.Set.HasUniversal SetObject] [inst_8 : LRA.Set.HasComplement SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ (LRA.Set.SeparationLaws Element SetObject ∧ (LRA.Set.UniversalMembershipLaws Element SetObject ∧ (LRA.Set.ExtensionalityLaw Element SetObject ∧ LRA.Set.SubsetLaws SetObject)))) → ∀ (relation : Element → Element → Prop) (subset : SetObject), inst_5.1 subset (inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (LRA.Order.UpperBounds relation subset) element → relation bound element)

Logical form (Lean):

```lean
theorem LowerUpperClosureIsExtensive
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    subset ⊆ LowerUpperClosure relation subset
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
theorem LowerUpperClosureIsExtensive
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    subset ⊆ LowerUpperClosure relation subset := by
  sorry

/--
`LowerUpperClosureIsMonotone` TODO

Predicate logic:

  (∀ A B ∈ U), LowerUpperClosure relation A ⊆ LowerUpperClosure relation B

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject] [inst_6 : LRA.Set.HasSeparation Element SetObject] [inst_7 : LRA.Set.HasUniversal SetObject] [inst_8 : LRA.Set.HasComplement SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ (LRA.Set.SeparationLaws Element SetObject ∧ (LRA.Set.UniversalMembershipLaws Element SetObject ∧ (LRA.Set.ExtensionalityLaw Element SetObject ∧ LRA.Set.SubsetLaws SetObject)))) → ∀ {relation : Element → Element → Prop} {smaller larger : SetObject}, inst_5.1 smaller larger → inst_5.1 (inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (LRA.Order.UpperBounds relation smaller) element → relation bound element) (inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (LRA.Order.UpperBounds relation larger) element → relation bound element)

Logical form (Lean):

```lean
theorem LowerUpperClosureIsMonotone
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : smaller ⊆ larger) :
    LowerUpperClosure relation smaller ⊆
      LowerUpperClosure relation larger
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
theorem LowerUpperClosureIsMonotone
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : smaller ⊆ larger) :
    LowerUpperClosure relation smaller ⊆
      LowerUpperClosure relation larger := by
  sorry

/--
`LowerUpperClosureIsIdempotent` TODO

Predicate logic:

  (∀ A ∈ U), LowerUpperClosure relation (LowerUpperClosure relation A) = LowerUpperClosure relation A

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject] [inst_6 : LRA.Set.HasSeparation Element SetObject] [inst_7 : LRA.Set.HasUniversal SetObject] [inst_8 : LRA.Set.HasComplement SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ (LRA.Set.SeparationLaws Element SetObject ∧ (LRA.Set.UniversalMembershipLaws Element SetObject ∧ (LRA.Set.ExtensionalityLaw Element SetObject ∧ LRA.Set.SubsetLaws SetObject)))) → ∀ (relation : Element → Element → Prop) (subset : SetObject), inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (inst_6.separation inst_7.universal (LRA.Order.UpperBound relation (LRA.Order.LowerUpperClosure relation subset))) element → relation bound element = inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (inst_6.separation inst_7.universal (LRA.Order.UpperBound relation subset)) element → relation bound element

Logical form (Lean):

```lean
theorem LowerUpperClosureIsIdempotent
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    LowerUpperClosure relation (LowerUpperClosure relation subset) =
      LowerUpperClosure relation subset
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
theorem LowerUpperClosureIsIdempotent
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    LowerUpperClosure relation (LowerUpperClosure relation subset) =
      LowerUpperClosure relation subset := by
  sorry

/--
`UpperLowerClosureIsExtensive` TODO

Predicate logic:

  (∀ A ∈ U), A ⊆ UpperLowerClosure relation A

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject] [inst_6 : LRA.Set.HasSeparation Element SetObject] [inst_7 : LRA.Set.HasUniversal SetObject] [inst_8 : LRA.Set.HasComplement SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ (LRA.Set.SeparationLaws Element SetObject ∧ (LRA.Set.UniversalMembershipLaws Element SetObject ∧ (LRA.Set.ExtensionalityLaw Element SetObject ∧ LRA.Set.SubsetLaws SetObject)))) → ∀ (relation : Element → Element → Prop) (subset : SetObject), inst_5.1 subset (inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (LRA.Order.LowerBounds relation subset) element → relation element bound)

Logical form (Lean):

```lean
theorem UpperLowerClosureIsExtensive
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    subset ⊆ UpperLowerClosure relation subset
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
theorem UpperLowerClosureIsExtensive
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    subset ⊆ UpperLowerClosure relation subset := by
  sorry

/--
`UpperLowerClosureIsMonotone` TODO

Predicate logic:

  (∀ A B ∈ U), UpperLowerClosure relation A ⊆ UpperLowerClosure relation B

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject] [inst_6 : LRA.Set.HasSeparation Element SetObject] [inst_7 : LRA.Set.HasUniversal SetObject] [inst_8 : LRA.Set.HasComplement SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ (LRA.Set.SeparationLaws Element SetObject ∧ (LRA.Set.UniversalMembershipLaws Element SetObject ∧ (LRA.Set.ExtensionalityLaw Element SetObject ∧ LRA.Set.SubsetLaws SetObject)))) → ∀ {relation : Element → Element → Prop} {smaller larger : SetObject}, inst_5.1 smaller larger → inst_5.1 (inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (LRA.Order.LowerBounds relation smaller) element → relation element bound) (inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (LRA.Order.LowerBounds relation larger) element → relation element bound)

Logical form (Lean):

```lean
theorem UpperLowerClosureIsMonotone
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : smaller ⊆ larger) :
    UpperLowerClosure relation smaller ⊆
      UpperLowerClosure relation larger
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
theorem UpperLowerClosureIsMonotone
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : smaller ⊆ larger) :
    UpperLowerClosure relation smaller ⊆
      UpperLowerClosure relation larger := by
  sorry

/--
`UpperLowerClosureIsIdempotent` TODO

Predicate logic:

  (∀ A ∈ U), UpperLowerClosure relation (UpperLowerClosure relation A) = UpperLowerClosure relation A

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject] [inst_6 : LRA.Set.HasSeparation Element SetObject] [inst_7 : LRA.Set.HasUniversal SetObject] [inst_8 : LRA.Set.HasComplement SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ (LRA.Set.SeparationLaws Element SetObject ∧ (LRA.Set.UniversalMembershipLaws Element SetObject ∧ (LRA.Set.ExtensionalityLaw Element SetObject ∧ LRA.Set.SubsetLaws SetObject)))) → ∀ (relation : Element → Element → Prop) (subset : SetObject), inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (inst_6.separation inst_7.universal (LRA.Order.LowerBound relation (LRA.Order.UpperLowerClosure relation subset))) element → relation element bound = inst_6.1 inst_7.1 fun bound => ∀ (element : Element), inst.1 (inst_6.separation inst_7.universal (LRA.Order.LowerBound relation subset)) element → relation element bound

Logical form (Lean):

```lean
theorem UpperLowerClosureIsIdempotent
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    UpperLowerClosure relation (UpperLowerClosure relation subset) =
      UpperLowerClosure relation subset
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
theorem UpperLowerClosureIsIdempotent
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    UpperLowerClosure relation (UpperLowerClosure relation subset) =
      UpperLowerClosure relation subset := by
  sorry

end GaloisRelationships

end LRA.Order
