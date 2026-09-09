import LRA.Set.Constructions.TypeSet.Definition

namespace LRA.Set.Constructions.TypeSet

universe u v

variable {Alpha : Type u}

/--
`Empty` TODO

Predicate logic:

  ∀ (Alpha : Type u) (a : Alpha), False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    False

Logical form (Lean):

```lean
def Empty (Alpha : Type u) : LRA.Set.Constructions.TypeSet Alpha := fun _ => False
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
def Empty (Alpha : Type u) : LRA.Set.Constructions.TypeSet Alpha := fun _ => False

/--
`EmptyMembership` TODO

Predicate logic:

  ∀ {Alpha : Type u} (x : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem (LRA.Set.Constructions.TypeSet.Empty Alpha) x ↔ False

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    x : Alpha
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.mem (LRA.Set.Constructions.TypeSet.Empty Alpha) x ↔ False

Logical form (Lean):

```lean
theorem EmptyMembership (x : Alpha) : x ∈ Empty Alpha ↔ False
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
theorem EmptyMembership (x : Alpha) : x ∈ Empty Alpha ↔ False := by
  sorry

/--
`Singleton` TODO

Predicate logic:

  ∀ {Alpha : Type u} (a a_1 : Alpha), a_1 = a

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    a_1 = a

Logical form (Lean):

```lean
def Singleton (a : Alpha) : LRA.Set.Constructions.TypeSet Alpha := fun x => x = a
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
def Singleton (a : Alpha) : LRA.Set.Constructions.TypeSet Alpha := fun x => x = a

/--
`SingletonMembership` TODO

Predicate logic:

  ∀ {Alpha : Type u} (a x : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem (LRA.Set.Constructions.TypeSet.Singleton a) x ↔ x = a

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    a x : Alpha
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.mem (LRA.Set.Constructions.TypeSet.Singleton a) x ↔ x = a

Logical form (Lean):

```lean
theorem SingletonMembership (a x : Alpha) : x ∈ Singleton a ↔ x = a
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
theorem SingletonMembership (a x : Alpha) : x ∈ Singleton a ↔ x = a := by
  sorry

/--
`Insert` TODO

Predicate logic:

  ∀ {Alpha : Type u} (a : Alpha) (A : LRA.Set.Constructions.TypeSet Alpha) (a_1 : Alpha), Or (a_1 = a)(LRA.Set.Constructions.instMembershipTypeSet.mem A a_1)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Or (a_1 = a)(LRA.Set.Constructions.instMembershipTypeSet.1 A a_1)

Logical form (Lean):

```lean
def Insert (a : Alpha) (A : LRA.Set.Constructions.TypeSet Alpha) : LRA.Set.Constructions.TypeSet Alpha :=
  fun x => x = a ∨ x ∈ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases, unfold

-/
def Insert (a : Alpha) (A : LRA.Set.Constructions.TypeSet Alpha) : LRA.Set.Constructions.TypeSet Alpha :=
  fun x => x = a ∨ x ∈ A

/--
`InsertMembership` TODO

Predicate logic:

  ∀ {Alpha : Type u} (a x : Alpha) (A : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem (LRA.Set.Constructions.TypeSet.Insert a A) x ↔ Or (x = a)(LRA.Set.Constructions.instMembershipTypeSet.mem A x)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    a x : Alpha
    A : LRA.Set.Constructions.TypeSet Alpha
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.mem (LRA.Set.Constructions.TypeSet.Insert a A) x ↔ Or (x = a)(LRA.Set.Constructions.instMembershipTypeSet.mem A x)

Logical form (Lean):

```lean
theorem InsertMembership (a x : Alpha) (A : LRA.Set.Constructions.TypeSet Alpha) :
    x ∈ Insert a A ↔ x = a ∨ x ∈ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, Or.inl, Or.inr, cases, rcases

-/
theorem InsertMembership (a x : Alpha) (A : LRA.Set.Constructions.TypeSet Alpha) :
    x ∈ Insert a A ↔ x = a ∨ x ∈ A := by
  sorry

/--
`Pair` TODO

Predicate logic:

  ∀ {Alpha : Type u} (a b a_1 : Alpha), Or (a_1 = a)(a_1 = b)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Or (a_1 = a)(a_1 = b)

Logical form (Lean):

```lean
def Pair (a b : Alpha) : LRA.Set.Constructions.TypeSet Alpha := fun x => x = a ∨ x = b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases, unfold

-/
def Pair (a b : Alpha) : LRA.Set.Constructions.TypeSet Alpha := fun x => x = a ∨ x = b

/--
`PairMembership` TODO

Predicate logic:

  ∀ {Alpha : Type u} (a b x : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem (LRA.Set.Constructions.TypeSet.Pair a b) x ↔ Or (x = a)(x = b)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    a b x : Alpha
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.mem (LRA.Set.Constructions.TypeSet.Pair a b) x ↔ Or (x = a)(x = b)

Logical form (Lean):

```lean
theorem PairMembership (a b x : Alpha) : x ∈ Pair a b ↔ x = a ∨ x = b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, Or.inl, Or.inr, cases, rcases

-/
theorem PairMembership (a b x : Alpha) : x ∈ Pair a b ↔ x = a ∨ x = b := by
  sorry

/--
`PairEqualsInsertSingleton` TODO

Predicate logic:

  ∀ {Alpha : Type u} (a b : Alpha), LRA.Set.Constructions.TypeSet.Pair a b = LRA.Set.Constructions.TypeSet.Insert a (LRA.Set.Constructions.TypeSet.Singleton b)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    a b : Alpha
  Prove
    fun x => Or (x = a)(x = b) = funx => Or (x = a)(LRA.Set.Constructions.instMembershipTypeSet.1 (fun x => x = b)x)

Logical form (Lean):

```lean
theorem PairEqualsInsertSingleton (a b : Alpha) :
    Pair a b = Insert a (Singleton b)
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
theorem PairEqualsInsertSingleton (a b : Alpha) :
    Pair a b = Insert a (Singleton b) := by
  sorry

/--
`Union` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha) (a : Alpha), Or (LRA.Set.Constructions.instMembershipTypeSet.mem A a) (LRA.Set.Constructions.instMembershipTypeSet.mem B a)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Or (LRA.Set.Constructions.instMembershipTypeSet.1 A a) (LRA.Set.Constructions.instMembershipTypeSet.1 B a)

Logical form (Lean):

```lean
def Union (A B : LRA.Set.Constructions.TypeSet Alpha) : LRA.Set.Constructions.TypeSet Alpha :=
  fun x => x ∈ A ∨ x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases, unfold

-/
def Union (A B : LRA.Set.Constructions.TypeSet Alpha) : LRA.Set.Constructions.TypeSet Alpha :=
  fun x => x ∈ A ∨ x ∈ B

/--
`UnionMembership` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem (A.Union B) x ↔ Or (LRA.Set.Constructions.instMembershipTypeSet.mem A x) (LRA.Set.Constructions.instMembershipTypeSet.mem B x)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    A B : LRA.Set.Constructions.TypeSet Alpha
    x : Alpha
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.mem (A.Union B) x ↔ Or (LRA.Set.Constructions.instMembershipTypeSet.mem A x) (LRA.Set.Constructions.instMembershipTypeSet.mem B x)

Logical form (Lean):

```lean
theorem UnionMembership (A B : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha) :
    x ∈ Union A B ↔ x ∈ A ∨ x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, Or.inl, Or.inr, cases, rcases

-/
theorem UnionMembership (A B : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha) :
    x ∈ Union A B ↔ x ∈ A ∨ x ∈ B := by
  sorry

/--
`Intersection` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha) (a : Alpha), (LRA.Set.Constructions.instMembershipTypeSet.mem A a ∧ LRA.Set.Constructions.instMembershipTypeSet.mem B a)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (LRA.Set.Constructions.instMembershipTypeSet.1 A a ∧ LRA.Set.Constructions.instMembershipTypeSet.1 B a)

Logical form (Lean):

```lean
def Intersection (A B : LRA.Set.Constructions.TypeSet Alpha) : LRA.Set.Constructions.TypeSet Alpha :=
  fun x => x ∈ A ∧ x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def Intersection (A B : LRA.Set.Constructions.TypeSet Alpha) : LRA.Set.Constructions.TypeSet Alpha :=
  fun x => x ∈ A ∧ x ∈ B

/--
`IntersectionMembership` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem (A.Intersection B) x ↔ (LRA.Set.Constructions.instMembershipTypeSet.mem A x ∧ LRA.Set.Constructions.instMembershipTypeSet.mem B x)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    A B : LRA.Set.Constructions.TypeSet Alpha
    x : Alpha
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.mem (A.Intersection B) x ↔ (LRA.Set.Constructions.instMembershipTypeSet.mem A x ∧ LRA.Set.Constructions.instMembershipTypeSet.mem B x)

Logical form (Lean):

```lean
theorem IntersectionMembership (A B : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha) :
    x ∈ Intersection A B ↔ x ∈ A ∧ x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases

-/
theorem IntersectionMembership (A B : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha) :
    x ∈ Intersection A B ↔ x ∈ A ∧ x ∈ B := by
  sorry

/--
`Complement` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A : LRA.Set.Constructions.TypeSet Alpha) (a : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem A a → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.1 A a → False

Logical form (Lean):

```lean
def Complement (A : LRA.Set.Constructions.TypeSet Alpha) : LRA.Set.Constructions.TypeSet Alpha :=
  fun x => x ∉ A
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
def Complement (A : LRA.Set.Constructions.TypeSet Alpha) : LRA.Set.Constructions.TypeSet Alpha :=
  fun x => x ∉ A

/--
`ComplementMembership` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem A.Complement x ↔ ¬ LRA.Set.Constructions.instMembershipTypeSet.mem A x

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    A : LRA.Set.Constructions.TypeSet Alpha
    x : Alpha
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.mem A.Complement x ↔ ¬ LRA.Set.Constructions.instMembershipTypeSet.mem A x

Logical form (Lean):

```lean
theorem ComplementMembership (A : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha) :
    x ∈ Complement A ↔ x ∉ A
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
theorem ComplementMembership (A : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha) :
    x ∈ Complement A ↔ x ∉ A := by
  sorry

/--
`Universal` TODO

Predicate logic:

  ∀ (Alpha : Type u) (a : Alpha), True

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    True

Logical form (Lean):

```lean
def Universal (Alpha : Type u) : LRA.Set.Constructions.TypeSet Alpha := fun _ => True
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
def Universal (Alpha : Type u) : LRA.Set.Constructions.TypeSet Alpha := fun _ => True

/--
`UniversalMembership` TODO

Predicate logic:

  ∀ {Alpha : Type u} (x : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem (LRA.Set.Constructions.TypeSet.Universal Alpha) x

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    x : Alpha
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.1 (fun x => True) x

Logical form (Lean):

```lean
theorem UniversalMembership (x : Alpha) : x ∈ Universal Alpha
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
theorem UniversalMembership (x : Alpha) : x ∈ Universal Alpha := by
  sorry

/--
`Difference` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha) (a : Alpha), (LRA.Set.Constructions.instMembershipTypeSet.mem A a ∧ ¬ LRA.Set.Constructions.instMembershipTypeSet.mem B a)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (LRA.Set.Constructions.instMembershipTypeSet.1 A a ∧ (LRA.Set.Constructions.instMembershipTypeSet.1 B a → False))

Logical form (Lean):

```lean
def Difference (A B : LRA.Set.Constructions.TypeSet Alpha) : LRA.Set.Constructions.TypeSet Alpha :=
  fun x => x ∈ A ∧ x ∉ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def Difference (A B : LRA.Set.Constructions.TypeSet Alpha) : LRA.Set.Constructions.TypeSet Alpha :=
  fun x => x ∈ A ∧ x ∉ B

/--
`DifferenceMembership` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem (A.Difference B) x ↔ (LRA.Set.Constructions.instMembershipTypeSet.mem A x ∧ ¬ LRA.Set.Constructions.instMembershipTypeSet.mem B x)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    A B : LRA.Set.Constructions.TypeSet Alpha
    x : Alpha
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.mem (A.Difference B) x ↔ (LRA.Set.Constructions.instMembershipTypeSet.mem A x ∧ ¬ LRA.Set.Constructions.instMembershipTypeSet.mem B x)

Logical form (Lean):

```lean
theorem DifferenceMembership (A B : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha) :
    x ∈ Difference A B ↔ x ∈ A ∧ x ∉ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases

-/
theorem DifferenceMembership (A B : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha) :
    x ∈ Difference A B ↔ x ∈ A ∧ x ∉ B := by
  sorry

/--
`IsRelativeComplementOf` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B D : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem D x ↔ (LRA.Set.Constructions.instMembershipTypeSet.mem A x ∧ ¬ LRA.Set.Constructions.instMembershipTypeSet.mem B x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.mem D x ↔ (LRA.Set.Constructions.instMembershipTypeSet.mem A x ∧ ¬ LRA.Set.Constructions.instMembershipTypeSet.mem B x)

Logical form (Lean):

```lean
def IsRelativeComplementOf
    (A B D : LRA.Set.Constructions.TypeSet Alpha) : Prop :=
  ∀ x : Alpha, x ∈ D ↔ x ∈ A ∧ x ∉ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, unfold

-/
def IsRelativeComplementOf
    (A B D : LRA.Set.Constructions.TypeSet Alpha) : Prop :=
  ∀ x : Alpha, x ∈ D ↔ x ∈ A ∧ x ∉ B

/--
`RelativeComplement` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha) (a : Alpha), (LRA.Set.Constructions.instMembershipTypeSet.mem A a ∧ ¬ LRA.Set.Constructions.instMembershipTypeSet.mem B a)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (LRA.Set.Constructions.instMembershipTypeSet.1 A a ∧ (LRA.Set.Constructions.instMembershipTypeSet.1 B a → False))

Logical form (Lean):

```lean
abbrev RelativeComplement
    (A B : LRA.Set.Constructions.TypeSet Alpha) : LRA.Set.Constructions.TypeSet Alpha :=
  Difference A B
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
abbrev RelativeComplement
    (A B : LRA.Set.Constructions.TypeSet Alpha) : LRA.Set.Constructions.TypeSet Alpha :=
  Difference A B

/--
`RelativeComplementIsRelativeComplementOf` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha), A.IsRelativeComplementOf B (A.RelativeComplement B)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    A B : LRA.Set.Constructions.TypeSet Alpha
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.1 (fun x => (LRA.Set.Constructions.instMembershipTypeSet.1 A x ∧ (LRA.Set.Constructions.instMembershipTypeSet.1 B x → False))) x ↔ (LRA.Set.Constructions.instMembershipTypeSet.1 A x ∧ (LRA.Set.Constructions.instMembershipTypeSet.1 B x → False))

Logical form (Lean):

```lean
theorem RelativeComplementIsRelativeComplementOf
    (A B : LRA.Set.Constructions.TypeSet Alpha) :
    IsRelativeComplementOf A B (RelativeComplement A B)
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
theorem RelativeComplementIsRelativeComplementOf
    (A B : LRA.Set.Constructions.TypeSet Alpha) :
    IsRelativeComplementOf A B (RelativeComplement A B) := by
  sorry

/--
`RelativeComplementMembership` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem (A.RelativeComplement B) x ↔ (LRA.Set.Constructions.instMembershipTypeSet.mem A x ∧ ¬ LRA.Set.Constructions.instMembershipTypeSet.mem B x)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    A B : LRA.Set.Constructions.TypeSet Alpha
    x : Alpha
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.mem (A.RelativeComplement B) x ↔ (LRA.Set.Constructions.instMembershipTypeSet.mem A x ∧ ¬ LRA.Set.Constructions.instMembershipTypeSet.mem B x)

Logical form (Lean):

```lean
theorem RelativeComplementMembership
    (A B : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha) :
    x ∈ RelativeComplement A B ↔ x ∈ A ∧ x ∉ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases

-/
theorem RelativeComplementMembership
    (A B : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha) :
    x ∈ RelativeComplement A B ↔ x ∈ A ∧ x ∉ B := by
  sorry

/--
`SymmetricDifference` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha) (a : Alpha), Or ((LRA.Set.Constructions.instMembershipTypeSet.mem A a ∧ ¬ LRA.Set.Constructions.instMembershipTypeSet.mem B a)) ((LRA.Set.Constructions.instMembershipTypeSet.mem B a ∧ ¬ LRA.Set.Constructions.instMembershipTypeSet.mem A a))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Or ((LRA.Set.Constructions.instMembershipTypeSet.1 A a ∧ (LRA.Set.Constructions.instMembershipTypeSet.1 B a → False))) ((LRA.Set.Constructions.instMembershipTypeSet.1 B a ∧ (LRA.Set.Constructions.instMembershipTypeSet.1 A a → False)))

Logical form (Lean):

```lean
def SymmetricDifference
    (A B : LRA.Set.Constructions.TypeSet Alpha) : LRA.Set.Constructions.TypeSet Alpha :=
  fun x => (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, Or.inl, Or.inr, unfold

-/
def SymmetricDifference
    (A B : LRA.Set.Constructions.TypeSet Alpha) : LRA.Set.Constructions.TypeSet Alpha :=
  fun x => (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)

/--
`SymmetricDifferenceMembership` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem (A.SymmetricDifference B) x ↔ Or ((LRA.Set.Constructions.instMembershipTypeSet.mem A x ∧ ¬ LRA.Set.Constructions.instMembershipTypeSet.mem B x)) ((LRA.Set.Constructions.instMembershipTypeSet.mem B x ∧ ¬ LRA.Set.Constructions.instMembershipTypeSet.mem A x))

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    A B : LRA.Set.Constructions.TypeSet Alpha
    x : Alpha
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.mem (A.SymmetricDifference B) x ↔ Or ((LRA.Set.Constructions.instMembershipTypeSet.mem A x ∧ ¬ LRA.Set.Constructions.instMembershipTypeSet.mem B x)) ((LRA.Set.Constructions.instMembershipTypeSet.mem B x ∧ ¬ LRA.Set.Constructions.instMembershipTypeSet.mem A x))

Logical form (Lean):

```lean
theorem SymmetricDifferenceMembership
    (A B : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha) :
    x ∈ SymmetricDifference A B ↔
      (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases, Or.inl, Or.inr

-/
theorem SymmetricDifferenceMembership
    (A B : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha) :
    x ∈ SymmetricDifference A B ↔
      (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A) := by
  sorry

/--
`Subset` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem A x → LRA.Set.Constructions.instMembershipTypeSet.mem B x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.1 A x → LRA.Set.Constructions.instMembershipTypeSet.1 B x

Logical form (Lean):

```lean
def Subset (A B : LRA.Set.Constructions.TypeSet Alpha) : Prop :=
  ∀ x : Alpha, x ∈ A → x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def Subset (A B : LRA.Set.Constructions.TypeSet Alpha) : Prop :=
  ∀ x : Alpha, x ∈ A → x ∈ B

/--
`SubsetIff` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha), A.Subset B ↔ ∀ (x : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem A x → LRA.Set.Constructions.instMembershipTypeSet.mem B x

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    A B : LRA.Set.Constructions.TypeSet Alpha
  Prove
    A.Subset B ↔ ∀ (x : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem A x → LRA.Set.Constructions.instMembershipTypeSet.mem B x

Logical form (Lean):

```lean
theorem SubsetIff (A B : LRA.Set.Constructions.TypeSet Alpha) :
    Subset A B ↔ ∀ x : Alpha, x ∈ A → x ∈ B
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
theorem SubsetIff (A B : LRA.Set.Constructions.TypeSet Alpha) :
    Subset A B ↔ ∀ x : Alpha, x ∈ A → x ∈ B := by
  sorry

/--
`PowerSet` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A a : LRA.Set.Constructions.TypeSet Alpha) (x : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem a x → LRA.Set.Constructions.instMembershipTypeSet.mem A x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.1 a x → LRA.Set.Constructions.instMembershipTypeSet.1 A x

Logical form (Lean):

```lean
def PowerSet (A : LRA.Set.Constructions.TypeSet Alpha) :
    LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha) :=
  fun B => Subset B A
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
def PowerSet (A : LRA.Set.Constructions.TypeSet Alpha) :
    LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha) :=
  fun B => Subset B A

/--
`PowerSetMembership` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem A.PowerSet B ↔ B.Subset A

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    A B : LRA.Set.Constructions.TypeSet Alpha
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.mem A.PowerSet B ↔ B.Subset A

Logical form (Lean):

```lean
theorem PowerSetMembership
    (A B : LRA.Set.Constructions.TypeSet Alpha) :
    B ∈ PowerSet A ↔ Subset B A
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
theorem PowerSetMembership
    (A B : LRA.Set.Constructions.TypeSet Alpha) :
    B ∈ PowerSet A ↔ Subset B A := by
  sorry

/--
`CollectionUnion` TODO

Predicate logic:

  ∀ {Alpha : Type u} (C : LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) (a : Alpha), Exists fun B => (LRA.Set.Constructions.instMembershipTypeSet.mem C B ∧ LRA.Set.Constructions.instMembershipTypeSet.mem B a)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun B => (LRA.Set.Constructions.instMembershipTypeSet.1 C B ∧ LRA.Set.Constructions.instMembershipTypeSet.1 B a)

Logical form (Lean):

```lean
def CollectionUnion
    (C : LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) :
    LRA.Set.Constructions.TypeSet Alpha :=
  fun x => ∃ B, B ∈ C ∧ x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def CollectionUnion
    (C : LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) :
    LRA.Set.Constructions.TypeSet Alpha :=
  fun x => ∃ B, B ∈ C ∧ x ∈ B

/--
`CollectionUnionMembership` TODO

Predicate logic:

  ∀ {Alpha : Type u} (C : LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) (x : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem C.CollectionUnion x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipTypeSet.mem C B ∧ LRA.Set.Constructions.instMembershipTypeSet.mem B x)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    C : LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)
    x : Alpha
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.mem C.CollectionUnion x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipTypeSet.mem C B ∧ LRA.Set.Constructions.instMembershipTypeSet.mem B x)

Logical form (Lean):

```lean
theorem CollectionUnionMembership
    (C : LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) (x : Alpha) :
    x ∈ CollectionUnion C ↔ ∃ B, B ∈ C ∧ x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases, use

-/
theorem CollectionUnionMembership
    (C : LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) (x : Alpha) :
    x ∈ CollectionUnion C ↔ ∃ B, B ∈ C ∧ x ∈ B := by
  sorry

/--
`CollectionIntersection` TODO

Predicate logic:

  ∀ {Alpha : Type u} (C : LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) (a : Alpha) (B : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem C B → LRA.Set.Constructions.instMembershipTypeSet.mem B a

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.1 C B → LRA.Set.Constructions.instMembershipTypeSet.1 B a

Logical form (Lean):

```lean
def CollectionIntersection
    (C : LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) :
    LRA.Set.Constructions.TypeSet Alpha :=
  fun x => ∀ B, B ∈ C → x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def CollectionIntersection
    (C : LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) :
    LRA.Set.Constructions.TypeSet Alpha :=
  fun x => ∀ B, B ∈ C → x ∈ B

/--
`CollectionIntersectionMembership` TODO

Predicate logic:

  ∀ {Alpha : Type u} (C : LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) (x : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem C.CollectionIntersection x ↔ ∀ (B : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem C B → LRA.Set.Constructions.instMembershipTypeSet.mem B x

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    C : LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)
    x : Alpha
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.mem C.CollectionIntersection x ↔ ∀ (B : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem C B → LRA.Set.Constructions.instMembershipTypeSet.mem B x

Logical form (Lean):

```lean
theorem CollectionIntersectionMembership
    (C : LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) (x : Alpha) :
    x ∈ CollectionIntersection C ↔ ∀ B, B ∈ C → x ∈ B
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
theorem CollectionIntersectionMembership
    (C : LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) (x : Alpha) :
    x ∈ CollectionIntersection C ↔ ∀ B, B ∈ C → x ∈ B := by
  sorry

/--
`Nonempty` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A : LRA.Set.Constructions.TypeSet Alpha), Exists fun x => LRA.Set.Constructions.instMembershipTypeSet.mem A x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun x => LRA.Set.Constructions.instMembershipTypeSet.1 A x

Logical form (Lean):

```lean
def Nonempty (A : LRA.Set.Constructions.TypeSet Alpha) : Prop :=
  ∃ x : Alpha, x ∈ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def Nonempty (A : LRA.Set.Constructions.TypeSet Alpha) : Prop :=
  ∃ x : Alpha, x ∈ A

/--
`Separation` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A : LRA.Set.Constructions.TypeSet Alpha) (property : Alpha → Prop) (a : Alpha), (LRA.Set.Constructions.instMembershipTypeSet.mem A a ∧ property a)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (LRA.Set.Constructions.instMembershipTypeSet.1 A a ∧ property a)

Logical form (Lean):

```lean
def Separation
    (A : LRA.Set.Constructions.TypeSet Alpha) (property : Alpha → Prop) :
    LRA.Set.Constructions.TypeSet Alpha :=
  fun x => x ∈ A ∧ property x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def Separation
    (A : LRA.Set.Constructions.TypeSet Alpha) (property : Alpha → Prop) :
    LRA.Set.Constructions.TypeSet Alpha :=
  fun x => x ∈ A ∧ property x

/--
`SeparationMembership` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A : LRA.Set.Constructions.TypeSet Alpha) (property : Alpha → Prop) (x : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem (A.Separation property) x ↔ (LRA.Set.Constructions.instMembershipTypeSet.mem A x ∧ property x)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    A : LRA.Set.Constructions.TypeSet Alpha
    property : Alpha → Prop
    x : Alpha
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.mem (A.Separation property) x ↔ (LRA.Set.Constructions.instMembershipTypeSet.mem A x ∧ property x)

Logical form (Lean):

```lean
theorem SeparationMembership
    (A : LRA.Set.Constructions.TypeSet Alpha) (property : Alpha → Prop) (x : Alpha) :
    x ∈ Separation A property ↔ x ∈ A ∧ property x
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
    (A : LRA.Set.Constructions.TypeSet Alpha) (property : Alpha → Prop) (x : Alpha) :
    x ∈ Separation A property ↔ x ∈ A ∧ property x := by
  sorry

/--
`Family` TODO

Predicate logic:

  def Family (Index : Type v) (Alpha : Type u) :=
    Index → LRA.Set.Constructions.TypeSet Alpha

Predicate logic (unfolded):

  def Family (Index : Type v) (Alpha : Type u) :=
    Index → LRA.Set.Constructions.TypeSet Alpha (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Family (Index : Type v) (Alpha : Type u) :=
  Index → LRA.Set.Constructions.TypeSet Alpha
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def Family (Index : Type v) (Alpha : Type u) :=
  Index → LRA.Set.Constructions.TypeSet Alpha

/--
`IndexedUnion` TODO

Predicate logic:

  ∀ {Alpha : Type u} {Index : Type v} (family : LRA.Set.Constructions.TypeSet.Family Index Alpha) (a : Alpha), Exists fun i => LRA.Set.Constructions.instMembershipTypeSet.mem (family i) a

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun i => LRA.Set.Constructions.instMembershipTypeSet.1 (family i) a

Logical form (Lean):

```lean
def IndexedUnion {Index : Type v} (family : Family Index Alpha) :
    LRA.Set.Constructions.TypeSet Alpha :=
  fun x => ∃ i : Index, x ∈ family i
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def IndexedUnion {Index : Type v} (family : Family Index Alpha) :
    LRA.Set.Constructions.TypeSet Alpha :=
  fun x => ∃ i : Index, x ∈ family i

/--
`IndexedUnionMembership` TODO

Predicate logic:

  ∀ {Alpha : Type u} {Index : Type v} (family : LRA.Set.Constructions.TypeSet.Family Index Alpha) (x : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem (LRA.Set.Constructions.TypeSet.IndexedUnion family) x ↔ Exists fun i => LRA.Set.Constructions.instMembershipTypeSet.mem (family i) x

Predicate logic (unfolded):

  Ambient
    (Alpha, Index)
  Objects
    family : Family Index Alpha
    x : Alpha
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.mem (LRA.Set.Constructions.TypeSet.IndexedUnion family) x ↔ Exists fun i => LRA.Set.Constructions.instMembershipTypeSet.mem (family i) x

Logical form (Lean):

```lean
theorem IndexedUnionMembership
    {Index : Type v} (family : Family Index Alpha) (x : Alpha) :
    x ∈ IndexedUnion family ↔ ∃ i : Index, x ∈ family i
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, use, rcases

-/
theorem IndexedUnionMembership
    {Index : Type v} (family : Family Index Alpha) (x : Alpha) :
    x ∈ IndexedUnion family ↔ ∃ i : Index, x ∈ family i := by
  sorry

/--
`IndexedIntersection` TODO

Predicate logic:

  ∀ {Alpha : Type u} {Index : Type v} (family : LRA.Set.Constructions.TypeSet.Family Index Alpha) (a : Alpha) (i : Index), LRA.Set.Constructions.instMembershipTypeSet.mem (family i) a

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.1 (family i) a

Logical form (Lean):

```lean
def IndexedIntersection {Index : Type v} (family : Family Index Alpha) :
    LRA.Set.Constructions.TypeSet Alpha :=
  fun x => ∀ i : Index, x ∈ family i
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def IndexedIntersection {Index : Type v} (family : Family Index Alpha) :
    LRA.Set.Constructions.TypeSet Alpha :=
  fun x => ∀ i : Index, x ∈ family i

/--
`IndexedIntersectionMembership` TODO

Predicate logic:

  ∀ {Alpha : Type u} {Index : Type v} (family : LRA.Set.Constructions.TypeSet.Family Index Alpha) (x : Alpha), LRA.Set.Constructions.instMembershipTypeSet.mem (LRA.Set.Constructions.TypeSet.IndexedIntersection family) x ↔ ∀ (i : Index), LRA.Set.Constructions.instMembershipTypeSet.mem (family i) x

Predicate logic (unfolded):

  Ambient
    (Alpha, Index)
  Objects
    family : Family Index Alpha
    x : Alpha
  Prove
    LRA.Set.Constructions.instMembershipTypeSet.mem (LRA.Set.Constructions.TypeSet.IndexedIntersection family) x ↔ ∀ (i : Index), LRA.Set.Constructions.instMembershipTypeSet.mem (family i) x

Logical form (Lean):

```lean
theorem IndexedIntersectionMembership
    {Index : Type v} (family : Family Index Alpha) (x : Alpha) :
    x ∈ IndexedIntersection family ↔ ∀ i : Index, x ∈ family i
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
theorem IndexedIntersectionMembership
    {Index : Type v} (family : Family Index Alpha) (x : Alpha) :
    x ∈ IndexedIntersection family ↔ ∀ i : Index, x ∈ family i := by
  sorry

end LRA.Set.Constructions.TypeSet
