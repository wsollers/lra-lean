namespace LRA.Set

universe u v w

/--
`HasComplement` TODO

Predicate logic:

  class HasComplement (α : Type u) where
  complement : α → α

Predicate logic (unfolded):

  class HasComplement (α : Type u) where
  complement : α → α (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class HasComplement (α : Type u) where
  complement : α → α
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
class HasComplement (α : Type u) where
  complement : α → α

scoped postfix:1024 "ᶜ" => HasComplement.complement

/--
`HasUniversal` TODO

Predicate logic:

  class HasUniversal (α : Type u) where
  universal : α

Predicate logic (unfolded):

  class HasUniversal (α : Type u) where
  universal : α (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class HasUniversal (α : Type u) where
  universal : α
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
class HasUniversal (α : Type u) where
  universal : α

scoped notation "𝒰" => HasUniversal.universal

/--
`HasSymmDiff` TODO

Predicate logic:

  class HasSymmDiff (α : Type u) where
  symmDiff : α → α → α

Predicate logic (unfolded):

  class HasSymmDiff (α : Type u) where
  symmDiff : α → α → α (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class HasSymmDiff (α : Type u) where
  symmDiff : α → α → α
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
class HasSymmDiff (α : Type u) where
  symmDiff : α → α → α

scoped infixl:100 " ∆ " => HasSymmDiff.symmDiff

/--
`HasSeparation` TODO

Predicate logic:

  class HasSeparation (Element : outParam (Type u)) (SetObject : Type v) where
  separation : SetObject → (Element → Prop) → SetObject

Predicate logic (unfolded):

  class HasSeparation (Element : outParam (Type u)) (SetObject : Type v) where
  separation : SetObject → (Element → Prop) → SetObject (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class HasSeparation (Element : outParam (Type u)) (SetObject : Type v) where
  separation : SetObject → (Element → Prop) → SetObject
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
class HasSeparation (Element : outParam (Type u)) (SetObject : Type v) where
  separation : SetObject → (Element → Prop) → SetObject

/--
`HasPowerset` TODO

Predicate logic:

  class HasPowerset (SetObject : Type u) (Collection : outParam (Type v)) where
  powerset : SetObject → Collection

Predicate logic (unfolded):

  class HasPowerset (SetObject : Type u) (Collection : outParam (Type v)) where
  powerset : SetObject → Collection (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class HasPowerset (SetObject : Type u) (Collection : outParam (Type v)) where
  powerset : SetObject → Collection
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
class HasPowerset (SetObject : Type u) (Collection : outParam (Type v)) where
  powerset : SetObject → Collection

/--
`HasIndexedUnion` TODO

Predicate logic:

  class HasIndexedUnion (SetObject : Type v) where
  indexedUnion : {Index : Type w} → (Index → SetObject) → SetObject

Predicate logic (unfolded):

  class HasIndexedUnion (SetObject : Type v) where
  indexedUnion : {Index : Type w} → (Index → SetObject) → SetObject (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class HasIndexedUnion (SetObject : Type v) where
  indexedUnion : {Index : Type w} → (Index → SetObject) → SetObject
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
class HasIndexedUnion (SetObject : Type v) where
  indexedUnion : {Index : Type w} → (Index → SetObject) → SetObject

/--
`HasIndexedIntersection` TODO

Predicate logic:

  class HasIndexedIntersection (SetObject : Type v) where
  indexedIntersection : {Index : Type w} → (Index → SetObject) → SetObject

Predicate logic (unfolded):

  class HasIndexedIntersection (SetObject : Type v) where
  indexedIntersection : {Index : Type w} → (Index → SetObject) → SetObject (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class HasIndexedIntersection (SetObject : Type v) where
  indexedIntersection : {Index : Type w} → (Index → SetObject) → SetObject
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
class HasIndexedIntersection (SetObject : Type v) where
  indexedIntersection : {Index : Type w} → (Index → SetObject) → SetObject

/--
`HasCountableUnion` TODO

Predicate logic:

  class HasCountableUnion (SetObject : Type v) where
  countableUnion : (Nat → SetObject) → SetObject

Predicate logic (unfolded):

  class HasCountableUnion (SetObject : Type v) where
  countableUnion : (Nat → SetObject) → SetObject (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class HasCountableUnion (SetObject : Type v) where
  countableUnion : (Nat → SetObject) → SetObject
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
class HasCountableUnion (SetObject : Type v) where
  countableUnion : (Nat → SetObject) → SetObject

/--
`HasCountableIntersection` TODO

Predicate logic:

  class HasCountableIntersection (SetObject : Type v) where
  countableIntersection : (Nat → SetObject) → SetObject

Predicate logic (unfolded):

  class HasCountableIntersection (SetObject : Type v) where
  countableIntersection : (Nat → SetObject) → SetObject (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class HasCountableIntersection (SetObject : Type v) where
  countableIntersection : (Nat → SetObject) → SetObject
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
class HasCountableIntersection (SetObject : Type v) where
  countableIntersection : (Nat → SetObject) → SetObject

/--
`HasCollectionUnion` TODO

Predicate logic:

  class HasCollectionUnion (SetObject : outParam (Type v)) (Collection : Type w) where
  collectionUnion : Collection → SetObject

Predicate logic (unfolded):

  class HasCollectionUnion (SetObject : outParam (Type v)) (Collection : Type w) where
  collectionUnion : Collection → SetObject (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class HasCollectionUnion (SetObject : outParam (Type v)) (Collection : Type w) where
  collectionUnion : Collection → SetObject
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
class HasCollectionUnion (SetObject : outParam (Type v)) (Collection : Type w) where
  collectionUnion : Collection → SetObject

/--
`HasCollectionIntersection` TODO

Predicate logic:

  class HasCollectionIntersection (SetObject : outParam (Type v)) (Collection : Type w) where
  collectionIntersection : Collection → SetObject

Predicate logic (unfolded):

  class HasCollectionIntersection (SetObject : outParam (Type v)) (Collection : Type w) where
  collectionIntersection : Collection → SetObject (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class HasCollectionIntersection (SetObject : outParam (Type v)) (Collection : Type w) where
  collectionIntersection : Collection → SetObject
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
class HasCollectionIntersection (SetObject : outParam (Type v)) (Collection : Type w) where
  collectionIntersection : Collection → SetObject

end LRA.Set
