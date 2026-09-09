import LRA.Identity.Interface.SecondOrder.LStructure
import LRA.Identity.Interface.FirstOrder.Model
import LRA.Identity.Interface.Logic.SOL.Theory

namespace LRA.Identity.Interface.SecondOrder

universe u

/--
`HenkinModel` TODO

Predicate logic:

  structure HenkinModel (L : LStructure) where
    firstOrder : LRA.Identity.Interface.FirstOrder.Model L
    predicateDomain : LRA.Identity.Logic.SOL.HenkinPredicateDomain
      firstOrder.interpretation.Domain

Predicate logic (unfolded):

  structure HenkinModel (L : LStructure) where
    firstOrder : LRA.Identity.Interface.FirstOrder.Model L
    predicateDomain : LRA.Identity.Logic.SOL.HenkinPredicateDomain
      firstOrder.interpretation.Domain

Logical form (Lean):

```lean
structure HenkinModel (L : LStructure) where
  firstOrder : LRA.Identity.Interface.FirstOrder.Model L
  predicateDomain : LRA.Identity.Logic.SOL.HenkinPredicateDomain
    firstOrder.interpretation.Domain
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
structure HenkinModel (L : LStructure) where
  firstOrder : LRA.Identity.Interface.FirstOrder.Model L
  predicateDomain : LRA.Identity.Logic.SOL.HenkinPredicateDomain
    firstOrder.interpretation.Domain

/--
`FullModel` TODO

Predicate logic:

  structure FullModel (L : LStructure) where
    firstOrder : LRA.Identity.Interface.FirstOrder.Model L

Predicate logic (unfolded):

  structure FullModel (L : LStructure) where
    firstOrder : LRA.Identity.Interface.FirstOrder.Model L

Logical form (Lean):

```lean
structure FullModel (L : LStructure) where
  firstOrder : LRA.Identity.Interface.FirstOrder.Model L
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
structure FullModel (L : LStructure) where
  firstOrder : LRA.Identity.Interface.FirstOrder.Model L

end LRA.Identity.Interface.SecondOrder
