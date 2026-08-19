import Mathlib.Data.Set.Basic
import Mathlib.Order.SetNotation
import Mathlib.Order.SymmDiff
import LRA.Set.Interface.Operations

/-!
Mathlib's `Set Alpha` registered as an LRA set backend.

Pure redirection: Mathlib already registers `Set Alpha` against Lean
core's notation classes (`Union`, `Inter`, `HasSubset`,
`EmptyCollection`, `Singleton`, `Insert`, `SDiff`, `Membership`), so the
only work here is registering the project's own capability classes
(`HasComplement`, `HasUniversal`, `HasSymmDiff`, `HasSeparation`,
`HasPowerset`) against Mathlib's corresponding operations. Like `LRASet`
-- its hand-built sibling -- this backend has an ambient carrier type,
so it supports the full capability set including complement and
universal set.

Operations are referenced by name (`Compl.compl`, `Set.univ`, ...)
rather than by token, because Mathlib's `ᶜ`/`∆` notations coexist with
this project's scoped ones inside this namespace.
-/

namespace LRA.Set.MathlibPredicateSet

universe u

variable {Alpha : Type u}

/-- This Mathlib version elaborates `A ⊆ B` for `Set` to `LE.le` via the
`@[use_set_notation_for_order]` mechanism and registers no core
`HasSubset` instance at all. The project's interface states its laws
against core `HasSubset`, so the adapter supplies the bridge --
definitionally `Set.Subset`, so every Mathlib `⊆`/`≤` lemma applies
unchanged. -/
instance : _root_.HasSubset (_root_.Set Alpha) where
  Subset := fun A B => A ≤ B

instance : HasComplement (_root_.Set Alpha) where
  complement := Compl.compl

instance : HasUniversal (_root_.Set Alpha) where
  universal := _root_.Set.univ

instance : HasSymmDiff (_root_.Set Alpha) where
  symmDiff := symmDiff

instance : HasSeparation Alpha (_root_.Set Alpha) where
  separation := fun ambient property => {x ∈ ambient | property x}

instance : HasPowerset (_root_.Set Alpha) (_root_.Set (_root_.Set Alpha)) where
  powerset := _root_.Set.powerset

instance : HasIndexedUnion (_root_.Set Alpha) where
  indexedUnion := fun family => _root_.Set.iUnion family

instance : HasIndexedIntersection (_root_.Set Alpha) where
  indexedIntersection := fun family => _root_.Set.iInter family

instance : HasCountableUnion (_root_.Set Alpha) where
  countableUnion := fun family => _root_.Set.iUnion family

instance : HasCountableIntersection (_root_.Set Alpha) where
  countableIntersection := fun family => _root_.Set.iInter family

instance : HasCollectionUnion (_root_.Set Alpha) (_root_.Set (_root_.Set Alpha)) where
  collectionUnion := _root_.Set.sUnion

instance : HasCollectionIntersection (_root_.Set Alpha) (_root_.Set (_root_.Set Alpha)) where
  collectionIntersection := _root_.Set.sInter

end LRA.Set.MathlibPredicateSet
