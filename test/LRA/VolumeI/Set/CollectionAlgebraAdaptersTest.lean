import LRA.VolumeI.Set
import LRA.VolumeI.Set.Algebra
import LRA.VolumeI.Set.Algebra

/-!
Smoke tests for the set-backend architecture.

Rewritten for the law-class architecture: the old collection-algebra
adapter tests targeted the retired record interface (now in `hold/Set/`).
These examples check that the generic fluent theorems resolve at every
backend purely from argument types, that the capability boundary holds,
and that the resurrected algebra-of-sets signatures instantiate.
-/

namespace LRA.Tests.VolumeI.Set.CollectionAlgebraAdapters

open LRA.Set

-- Generic theorems resolve at all four backends from argument types.
example (A B : Enderton.Set) : A ∪ B = B ∪ A :=
  UnionCommutative A B
example (A B : LRASet.LRASet Nat) : A ∪ B = B ∪ A :=
  UnionCommutative A B
example (A B : _root_.Set Nat) : A ∪ B = B ∪ A :=
  UnionCommutative A B
example (A B : ZFSet) : A ∪ B = B ∪ A :=
  UnionCommutative A B

-- Membership certificates, both sortings.
example (A B : ZFSet) (x : ZFSet) : x ∈ A ∪ B ↔ x ∈ A ∨ x ∈ B :=
  UnionMembership A B x
example (A B : _root_.Set Nat) (x : Nat) : x ∈ A \ B ↔ x ∈ A ∧ x ∉ B :=
  DifferenceMembership A B x

-- Complement family exists exactly where an ambient carrier does.
example (A : LRASet.LRASet Nat) :
    A ∪ HasComplement.complement A = HasUniversal.universal :=
  UnionComplement A
example (A : _root_.Set Nat) :
    A ∪ HasComplement.complement A = HasUniversal.universal :=
  UnionComplement A

-- Ambient-relative algebras instantiate over the backends.
example (Point : Type) :
    LRA.Set.Algebra.AlgebraOfSets (Set.univ : Set Point) :=
  LRA.Set.Algebra.Instantiations.activeSetAlgebra Point
example (Point : Type) :
    LRA.Set.Algebra.SigmaAlgebraOfSets (Set.univ : Set Point) :=
  LRA.Set.Algebra.Instantiations.activeSigmaAlgebra Point
example (Point : Type) :
    LRA.Set.Algebra.AlgebraOfSets
      (LRA.Set.LRASet.Universal Point) :=
  LRA.Set.Algebra.Instantiations.lraSetAlgebra Point

-- Collection ops resolve at every backend; Covers is generic.
example (C : ZFSet) (T : ZFSet) : Prop := LRA.Set.Covers C T
example (C : LRA.Set.LRASet.LRASet (LRA.Set.LRASet.LRASet Nat))
    (T : LRA.Set.LRASet.LRASet Nat) : Prop :=
  LRA.Set.Covers C T
example (A B : ZFSet) (x : ZFSet) (h : ∃ C : ZFSet, C ∈ A) :
    x ∈ LRA.Set.HasCollectionIntersection.collectionIntersection A ↔
      ∀ C : ZFSet, C ∈ A → x ∈ C :=
  LRA.Set.CollectionIntersectionMembership A x h

end LRA.Tests.VolumeI.Set.CollectionAlgebraAdapters
