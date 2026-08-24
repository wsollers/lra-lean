namespace LRA.UniversalAlgebra.UniversalProperties.Basic

universe u v

/--
`QuotientUniversalProperty` TODO

Predicate logic:

  structure QuotientUniversalProperty
    (Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (sourceObject quotientObject : Object)
    (projection : Arrow sourceObject quotientObject)
    (RespectsKernel : forall targetObject, Arrow sourceObject targetObject -> Prop) :
    Prop where
  ExistsFactor :
    forall targetObject (map : Arrow sourceObject targetObject),
      RespectsKernel targetObject map ->
        Nonempty (Arrow quotientObject targetObject)
  UniqueFactor :
    forall targetObject
      (map : Arrow sourceObject targetObject)
      (_mapRespectsKernel : RespectsKernel targetObject map)
      (firstFactor secondFactor : Arrow quotientObject targetObject),
        firstFactor = secondFactor

Predicate logic (unfolded):

  structure QuotientUniversalProperty
    (Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (sourceObject quotientObject : Object)
    (projection : Arrow sourceObject quotientObject)
    (RespectsKernel : forall targetObject, Arrow sourceObject targetObject -> Prop) :
    Prop where
  ExistsFactor :
    forall targetObject (map : Arrow sourceObject targetObject),
      RespectsKernel targetObject map ->
        Nonempty (Arrow quotientObject targetObject)
  UniqueFactor :
    forall targetObject
      (map : Arrow sourceObject targetObject)
      (_mapRespectsKernel : RespectsKernel targetObject map)
      (firstFactor secondFactor : Arrow quotientObject targetObject),
        firstFactor = secondFactor (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure QuotientUniversalProperty
    (Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (sourceObject quotientObject : Object)
    (projection : Arrow sourceObject quotientObject)
    (RespectsKernel : forall targetObject, Arrow sourceObject targetObject -> Prop) :
    Prop where
  ExistsFactor :
    forall targetObject (map : Arrow sourceObject targetObject),
      RespectsKernel targetObject map ->
        Nonempty (Arrow quotientObject targetObject)
  UniqueFactor :
    forall targetObject
      (map : Arrow sourceObject targetObject)
      (_mapRespectsKernel : RespectsKernel targetObject map)
      (firstFactor secondFactor : Arrow quotientObject targetObject),
        firstFactor = secondFactor
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
structure QuotientUniversalProperty
    (Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (sourceObject quotientObject : Object)
    (projection : Arrow sourceObject quotientObject)
    (RespectsKernel : forall targetObject, Arrow sourceObject targetObject -> Prop) :
    Prop where
  ExistsFactor :
    forall targetObject (map : Arrow sourceObject targetObject),
      RespectsKernel targetObject map ->
        Nonempty (Arrow quotientObject targetObject)
  UniqueFactor :
    forall targetObject
      (map : Arrow sourceObject targetObject)
      (_mapRespectsKernel : RespectsKernel targetObject map)
      (firstFactor secondFactor : Arrow quotientObject targetObject),
        firstFactor = secondFactor

end LRA.UniversalAlgebra.UniversalProperties.Basic
