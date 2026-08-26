namespace LRA.Set.Constructions.GrothendieckUniverse

universe u

variable {SetObject : Type u} [Membership SetObject SetObject]

def IsEmptySet (A : SetObject) : Prop :=
  ∀ x : SetObject, x ∉ A

def IsPairSet (left right pair : SetObject) : Prop :=
  ∀ x : SetObject, x ∈ pair ↔ x = left ∨ x = right

def IsUnionOf (A union : SetObject) : Prop :=
  ∀ x : SetObject, x ∈ union ↔ ∃ B : SetObject, B ∈ A ∧ x ∈ B

def IsPowerSetOf (A powerSet : SetObject) : Prop :=
  ∀ x : SetObject, x ∈ powerSet ↔ ∀ y : SetObject, y ∈ x → y ∈ A

def IsSuccessorOf (A successor : SetObject) : Prop :=
  ∀ x : SetObject, x ∈ successor ↔ x ∈ A ∨ x = A

def IsInductiveSet (A : SetObject) : Prop :=
  (∃ empty : SetObject, empty ∈ A ∧ IsEmptySet empty) ∧
  ∀ x : SetObject, x ∈ A → ∃ successor : SetObject, successor ∈ A ∧ IsSuccessorOf x successor

def IsImageOfFamilyOn
    (indexSet : SetObject)
    (family : SetObject → SetObject)
    (image : SetObject) : Prop :=
  ∀ y : SetObject, y ∈ image ↔ ∃ i : SetObject, i ∈ indexSet ∧ y = family i

def IsIndexedUnionOfFamilyOn
    (indexSet : SetObject)
    (family : SetObject → SetObject)
    (union : SetObject) : Prop :=
  ∀ x : SetObject, x ∈ union ↔ ∃ i : SetObject, i ∈ indexSet ∧ x ∈ family i

def IsTransitiveUniverse (U : SetObject) : Prop :=
  ∀ ⦃x y : SetObject⦄, x ∈ U → y ∈ x → y ∈ U

def IsClosedUnderPairing (U : SetObject) : Prop :=
  ∀ ⦃x y : SetObject⦄, x ∈ U → y ∈ U →
    ∃ pair : SetObject, pair ∈ U ∧ IsPairSet x y pair

def IsClosedUnderPowerSet (U : SetObject) : Prop :=
  ∀ ⦃x : SetObject⦄, x ∈ U →
    ∃ powerSet : SetObject, powerSet ∈ U ∧ IsPowerSetOf x powerSet

def IsClosedUnderIndexedUnion (U : SetObject) : Prop :=
  ∀ ⦃indexSet : SetObject⦄, indexSet ∈ U →
    ∀ family : SetObject → SetObject,
      (∀ i : SetObject, i ∈ indexSet → family i ∈ U) →
        ∃ image : SetObject,
          image ∈ U ∧
          IsImageOfFamilyOn indexSet family image ∧
          ∃ union : SetObject,
            union ∈ U ∧ IsIndexedUnionOfFamilyOn indexSet family union

def ContainsInductiveSet (U : SetObject) : Prop :=
  ∃ omega : SetObject, omega ∈ U ∧ IsInductiveSet omega

def IsGrothendieckUniverse (U : SetObject) : Prop :=
  IsTransitiveUniverse U ∧
  IsClosedUnderPairing U ∧
  IsClosedUnderPowerSet U ∧
  IsClosedUnderIndexedUnion U ∧
  ContainsInductiveSet U

def IsGrothendieckUniverseFor (A U : SetObject) : Prop :=
  A ∈ U ∧ IsGrothendieckUniverse U

end LRA.Set.Constructions.GrothendieckUniverse
