import LRA.Set.Interface.Definitions.Operations

namespace LRA.Set

universe u v

/--
`ExtensionalityLaw` TODO

Predicate logic:

  class ExtensionalityLaw (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] : Prop where
  SetExtensionality :
    ∀ {A B : SetObject}, (∀ x : Element, x ∈ A ↔ x ∈ B) → A = B

Predicate logic (unfolded):

  class ExtensionalityLaw (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] : Prop where
  SetExtensionality :
    ∀ {A B : SetObject}, (∀ x : Element, x ∈ A ↔ x ∈ B) → A = B (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class ExtensionalityLaw (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] : Prop where
  SetExtensionality :
    ∀ {A B : SetObject}, (∀ x : Element, x ∈ A ↔ x ∈ B) → A = B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
class ExtensionalityLaw (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] : Prop where
  SetExtensionality :
    ∀ {A B : SetObject}, (∀ x : Element, x ∈ A ↔ x ∈ B) → A = B

/--
`MembershipLaws` TODO

Predicate logic:

  class MembershipLaws (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject] :
    Prop where
  EmptyMembership : ∀ x : Element, x ∉ (∅ : SetObject)
  UnionMembership :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∪ B ↔ x ∈ A ∨ x ∈ B
  IntersectionMembership :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∩ B ↔ x ∈ A ∧ x ∈ B
  DifferenceMembership :
    ∀ (A B : SetObject) (x : Element), x ∈ A \ B ↔ x ∈ A ∧ x ∉ B
  SubsetIffAllMembers :
    ∀ A B : SetObject, A ⊆ B ↔ ∀ x : Element, x ∈ A → x ∈ B

Predicate logic (unfolded):

  class MembershipLaws (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject] :
    Prop where
  EmptyMembership : ∀ x : Element, x ∉ (∅ : SetObject)
  UnionMembership :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∪ B ↔ x ∈ A ∨ x ∈ B
  IntersectionMembership :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∩ B ↔ x ∈ A ∧ x ∈ B
  DifferenceMembership :
    ∀ (A B : SetObject) (x : Element), x ∈ A \ B ↔ x ∈ A ∧ x ∉ B
  SubsetIffAllMembers :
    ∀ A B : SetObject, A ⊆ B ↔ ∀ x : Element, x ∈ A → x ∈ B (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class MembershipLaws (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject] :
    Prop where
  EmptyMembership : ∀ x : Element, x ∉ (∅ : SetObject)
  UnionMembership :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∪ B ↔ x ∈ A ∨ x ∈ B
  IntersectionMembership :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∩ B ↔ x ∈ A ∧ x ∈ B
  DifferenceMembership :
    ∀ (A B : SetObject) (x : Element), x ∈ A \ B ↔ x ∈ A ∧ x ∉ B
  SubsetIffAllMembers :
    ∀ A B : SetObject, A ⊆ B ↔ ∀ x : Element, x ∈ A → x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, Or.inl, Or.inr

-/
class MembershipLaws (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject] :
    Prop where
  EmptyMembership : ∀ x : Element, x ∉ (∅ : SetObject)
  UnionMembership :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∪ B ↔ x ∈ A ∨ x ∈ B
  IntersectionMembership :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∩ B ↔ x ∈ A ∧ x ∈ B
  DifferenceMembership :
    ∀ (A B : SetObject) (x : Element), x ∈ A \ B ↔ x ∈ A ∧ x ∉ B
  SubsetIffAllMembers :
    ∀ A B : SetObject, A ⊆ B ↔ ∀ x : Element, x ∈ A → x ∈ B

/--
`SeparationLaws` TODO

Predicate logic:

  class SeparationLaws (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasSeparation Element SetObject] :
    Prop where
  SeparationMembership :
    ∀ (A : SetObject) (property : Element → Prop) (x : Element),
      x ∈ HasSeparation.separation A property ↔ x ∈ A ∧ property x

Predicate logic (unfolded):

  class SeparationLaws (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasSeparation Element SetObject] :
    Prop where
  SeparationMembership :
    ∀ (A : SetObject) (property : Element → Prop) (x : Element),
      x ∈ HasSeparation.separation A property ↔ x ∈ A ∧ property x (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class SeparationLaws (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasSeparation Element SetObject] :
    Prop where
  SeparationMembership :
    ∀ (A : SetObject) (property : Element → Prop) (x : Element),
      x ∈ HasSeparation.separation A property ↔ x ∈ A ∧ property x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
class SeparationLaws (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasSeparation Element SetObject] :
    Prop where
  SeparationMembership :
    ∀ (A : SetObject) (property : Element → Prop) (x : Element),
      x ∈ HasSeparation.separation A property ↔ x ∈ A ∧ property x

/--
`UniversalMembershipLaws` TODO

Predicate logic:

  class UniversalMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject] : Prop where
  UniversalMembership : ∀ x : Element, x ∈ (𝒰 : SetObject)
  ComplementMembership :
    ∀ (A : SetObject) (x : Element), x ∈ Aᶜ ↔ x ∉ A

Predicate logic (unfolded):

  class UniversalMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject] : Prop where
  UniversalMembership : ∀ x : Element, x ∈ (𝒰 : SetObject)
  ComplementMembership :
    ∀ (A : SetObject) (x : Element), x ∈ Aᶜ ↔ x ∉ A (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class UniversalMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject] : Prop where
  UniversalMembership : ∀ x : Element, x ∈ (𝒰 : SetObject)
  ComplementMembership :
    ∀ (A : SetObject) (x : Element), x ∈ Aᶜ ↔ x ∉ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
class UniversalMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject] : Prop where
  UniversalMembership : ∀ x : Element, x ∈ (𝒰 : SetObject)
  ComplementMembership :
    ∀ (A : SetObject) (x : Element), x ∈ Aᶜ ↔ x ∉ A

/--
`SymmDiffMembershipLaws` TODO

Predicate logic:

  class SymmDiffMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasSymmDiff SetObject] : Prop where
  SymmetricDifferenceMembership :
    ∀ (A B : SetObject) (x : Element),
      x ∈ A ∆ B ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)

Predicate logic (unfolded):

  class SymmDiffMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasSymmDiff SetObject] : Prop where
  SymmetricDifferenceMembership :
    ∀ (A B : SetObject) (x : Element),
      x ∈ A ∆ B ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class SymmDiffMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasSymmDiff SetObject] : Prop where
  SymmetricDifferenceMembership :
    ∀ (A B : SetObject) (x : Element),
      x ∈ A ∆ B ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, Or.inl, Or.inr

-/
class SymmDiffMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasSymmDiff SetObject] : Prop where
  SymmetricDifferenceMembership :
    ∀ (A B : SetObject) (x : Element),
      x ∈ A ∆ B ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)

/--
`PowersetMembershipLaws` TODO

Predicate logic:

  class PowersetMembershipLaws (SetObject : Type u) (Collection : Type v)
    [Membership SetObject Collection] [HasSubset SetObject]
    [HasPowerset SetObject Collection] : Prop where
  PowersetMembership :
    ∀ A B : SetObject, B ∈ (HasPowerset.powerset A : Collection) ↔ B ⊆ A

Predicate logic (unfolded):

  class PowersetMembershipLaws (SetObject : Type u) (Collection : Type v)
    [Membership SetObject Collection] [HasSubset SetObject]
    [HasPowerset SetObject Collection] : Prop where
  PowersetMembership :
    ∀ A B : SetObject, B ∈ (HasPowerset.powerset A : Collection) ↔ B ⊆ A (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class PowersetMembershipLaws (SetObject : Type u) (Collection : Type v)
    [Membership SetObject Collection] [HasSubset SetObject]
    [HasPowerset SetObject Collection] : Prop where
  PowersetMembership :
    ∀ A B : SetObject, B ∈ (HasPowerset.powerset A : Collection) ↔ B ⊆ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
class PowersetMembershipLaws (SetObject : Type u) (Collection : Type v)
    [Membership SetObject Collection] [HasSubset SetObject]
    [HasPowerset SetObject Collection] : Prop where
  PowersetMembership :
    ∀ A B : SetObject, B ∈ (HasPowerset.powerset A : Collection) ↔ B ⊆ A

section Wrappers

variable {Element : Type u} {SetObject : Type v}

/--
`SetExtensionality` TODO

Predicate logic:

  (∀ A B ∈ U), (∀ x : Element, x ∈ A ↔ x ∈ B) → A = B

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject], LRA.Set.ExtensionalityLaw Element SetObject → ∀ {A B : SetObject}, (∀ (x : Element), inst.1 A x ↔ inst.1 B x) → A = B

Logical form (Lean):

```lean
theorem SetExtensionality
    [Membership Element SetObject] [ExtensionalityLaw Element SetObject]
    {A B : SetObject} (sameMembers : ∀ x : Element, x ∈ A ↔ x ∈ B) :
    A = B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem SetExtensionality
    [Membership Element SetObject] [ExtensionalityLaw Element SetObject]
    {A B : SetObject} (sameMembers : ∀ x : Element, x ∈ A ↔ x ∈ B) :
    A = B := by

  sorry

/--
`EmptyMembership` TODO

Predicate logic:

  ∀ x : Element, x ∉ ∅ ∈ SetObject

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ (x : Element), inst.1 inst_4.1 x → False

Logical form (Lean):

```lean
theorem EmptyMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ x : Element, x ∉ (∅ : SetObject)
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
theorem EmptyMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ x : Element, x ∉ (∅ : SetObject) := by
  sorry

/--
`UnionMembership` TODO

Predicate logic:

  ∀ A B ∈ SetObject x ∈ Element, x ∈ A ∪ B ↔ x ∈ A ∨ x ∈ B

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ (A B : SetObject) (x : Element), inst.1 (inst_1.1 A B) x ↔ Or (inst.1 A x) (inst.1 B x)

Logical form (Lean):

```lean
theorem UnionMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∪ B ↔ x ∈ A ∨ x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, Or.inl, Or.inr, cases, rcases

-/
theorem UnionMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∪ B ↔ x ∈ A ∨ x ∈ B := by
  sorry

/--
`IntersectionMembership` TODO

Predicate logic:

  ∀ A B ∈ SetObject x ∈ Element, x ∈ A ∩ B ↔ x ∈ A ∧ x ∈ B

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ (A B : SetObject) (x : Element), inst.1 (inst_2.1 A B) x ↔ (inst.1 A x ∧ inst.1 B x)

Logical form (Lean):

```lean
theorem IntersectionMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∩ B ↔ x ∈ A ∧ x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem IntersectionMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∩ B ↔ x ∈ A ∧ x ∈ B := by
  sorry

/--
`DifferenceMembership` TODO

Predicate logic:

  ∀ A B ∈ SetObject x ∈ Element, x ∈ A \ B ↔ x ∈ A ∧ x ∉ B

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ (A B : SetObject) (x : Element), inst.1 (inst_3.1 A B) x ↔ (inst.1 A x ∧ inst.1 B x → False)

Logical form (Lean):

```lean
theorem DifferenceMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element), x ∈ A \ B ↔ x ∈ A ∧ x ∉ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem DifferenceMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element), x ∈ A \ B ↔ x ∈ A ∧ x ∉ B := by
  sorry

/--
`SubsetIffAllMembers` TODO

Predicate logic:

  ∀ A B : SetObject, A ⊆ B ↔ ∀ x : Element, x ∈ A → x ∈ B

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ (A B : SetObject), inst_5.1 A B ↔ ∀ (x : Element), inst.1 A x → inst.1 B x

Logical form (Lean):

```lean
theorem SubsetIffAllMembers
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ A B : SetObject, A ⊆ B ↔ ∀ x : Element, x ∈ A → x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem SubsetIffAllMembers
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ A B : SetObject, A ⊆ B ↔ ∀ x : Element, x ∈ A → x ∈ B := by
  sorry

/--
`SeparationMembership` TODO

Predicate logic:

  ∀ A ∈ SetObject property ∈ Element → Prop x ∈ Element, x ∈ HasSeparation.separation A property ↔ x ∈ A ∧ property x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject], LRA.Set.SeparationLaws Element SetObject → ∀ (A : SetObject) (property : Element → Prop) (x : Element), inst.1 (inst_1.1 A property) x ↔ (inst.1 A x ∧ property x)

Logical form (Lean):

```lean
theorem SeparationMembership
    [Membership Element SetObject] [HasSeparation Element SetObject]
    [SeparationLaws Element SetObject] :
    ∀ (A : SetObject) (property : Element → Prop) (x : Element),
      x ∈ HasSeparation.separation A property ↔ x ∈ A ∧ property x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem SeparationMembership
    [Membership Element SetObject] [HasSeparation Element SetObject]
    [SeparationLaws Element SetObject] :
    ∀ (A : SetObject) (property : Element → Prop) (x : Element),
      x ∈ HasSeparation.separation A property ↔ x ∈ A ∧ property x := by
  sorry

/--
`UniversalMembership` TODO

Predicate logic:

  ∀ x : Element, x ∈ 𝒰 ∈ SetObject

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasUniversal SetObject] [inst_2 : LRA.Set.HasComplement SetObject], LRA.Set.UniversalMembershipLaws Element SetObject → ∀ (x : Element), inst.1 inst_1.1 x

Logical form (Lean):

```lean
theorem UniversalMembership
    [Membership Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject] [UniversalMembershipLaws Element SetObject] :
    ∀ x : Element, x ∈ (𝒰 : SetObject)
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
theorem UniversalMembership
    [Membership Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject] [UniversalMembershipLaws Element SetObject] :
    ∀ x : Element, x ∈ (𝒰 : SetObject) := by
  sorry

/--
`ComplementMembership` TODO

Predicate logic:

  ∀ A ∈ SetObject x ∈ Element, x ∈ Aᶜ ↔ x ∉ A

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasUniversal SetObject] [inst_2 : LRA.Set.HasComplement SetObject], LRA.Set.UniversalMembershipLaws Element SetObject → ∀ (A : SetObject) (x : Element), inst.1 (inst_2.1 A) x ↔ inst.1 A x → False

Logical form (Lean):

```lean
theorem ComplementMembership
    [Membership Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject] [UniversalMembershipLaws Element SetObject] :
    ∀ (A : SetObject) (x : Element), x ∈ Aᶜ ↔ x ∉ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem ComplementMembership
    [Membership Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject] [UniversalMembershipLaws Element SetObject] :
    ∀ (A : SetObject) (x : Element), x ∈ Aᶜ ↔ x ∉ A := by
  sorry

/--
`SymmetricDifferenceMembership` TODO

Predicate logic:

  ∀ A B ∈ SetObject x ∈ Element, x ∈ A ∆ B ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSymmDiff SetObject], LRA.Set.SymmDiffMembershipLaws Element SetObject → ∀ (A B : SetObject) (x : Element), inst.1 (inst_1.1 A B) x ↔ Or ((inst.1 A x ∧ inst.1 B x → False)) ((inst.1 B x ∧ inst.1 A x → False))

Logical form (Lean):

```lean
theorem SymmetricDifferenceMembership
    [Membership Element SetObject] [HasSymmDiff SetObject]
    [SymmDiffMembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element),
      x ∈ A ∆ B ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, Or.inl, Or.inr

-/
theorem SymmetricDifferenceMembership
    [Membership Element SetObject] [HasSymmDiff SetObject]
    [SymmDiffMembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element),
      x ∈ A ∆ B ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A) := by
  sorry

/--
`PowersetMembership` TODO

Predicate logic:

  ∀ A B : SetObject, B ∈ HasPowerset.powerset A ∈ Collection ↔ B ⊆ A

Predicate logic (unfolded):

  ∀ {SetObject : Type u} {Collection : Type v} [inst : Membership SetObject Collection] [inst_1 : HasSubset SetObject] [inst_2 : LRA.Set.HasPowerset SetObject Collection], LRA.Set.PowersetMembershipLaws SetObject Collection → ∀ (A B : SetObject), inst.1 (inst_2.1 A) B ↔ inst_1.1 B A

Logical form (Lean):

```lean
theorem PowersetMembership {SetObject : Type u} {Collection : Type v}
    [Membership SetObject Collection] [HasSubset SetObject]
    [HasPowerset SetObject Collection]
    [PowersetMembershipLaws SetObject Collection] :
    ∀ A B : SetObject, B ∈ (HasPowerset.powerset A : Collection) ↔ B ⊆ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem PowersetMembership {SetObject : Type u} {Collection : Type v}
    [Membership SetObject Collection] [HasSubset SetObject]
    [HasPowerset SetObject Collection]
    [PowersetMembershipLaws SetObject Collection] :
    ∀ A B : SetObject, B ∈ (HasPowerset.powerset A : Collection) ↔ B ⊆ A := by
  sorry

end Wrappers

end LRA.Set
