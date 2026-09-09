import Mathlib.Data.Set.Basic
import LRA.Set.Constructions.Mathlib.PredicateSet.Instances
import LRA.Set
import LRA.Set.Constructions.TypeSet
import LRA.Set.Constructions.ZFCSet.Axioms
import LRA.Set.Constructions.ZFCSet
import LRA.Set.Interface.ModelTheory
import LRA.SetSystems.AlgebraOfSets
import LRA.SetSystems.SigmaAlgebra

namespace LRA.SetSystems.Instantiations

open LRA.SetSystems LRA.Set

/--
`ActiveSet` TODO

Predicate logic:

  abbrev ActiveSet (Point : Type) := Set Point

Predicate logic (unfolded):

  abbrev ActiveSet (Point : Type) := Set Point (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev ActiveSet (Point : Type) := Set Point
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
abbrev ActiveSet (Point : Type) := Set Point

/--
`activeSetAlgebraMembersAreSubsets` TODO

Predicate logic:

  ∀ (Point : Type) (A : LRA.SetSystems.Instantiations.ActiveSet Point), True → Set.instLE.le A Set.univ

Predicate logic (unfolded):

  Ambient
    (Point)
  Objects
    (none)
  Prove
    True → { le := fun s₁ s₂ => ∀ ⦃a : Point⦄, a ∈ s₁ → a ∈ s₂}.le A fun _a => True

Logical form (Lean):

```lean
theorem activeSetAlgebraMembersAreSubsets (Point : Type) :
    ∀ A : ActiveSet Point, True → A ⊆ Set.univ
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
theorem activeSetAlgebraMembersAreSubsets (Point : Type) :
    ∀ A : ActiveSet Point, True → A ⊆ Set.univ := by
  sorry
/--
`activeSetAlgebraUnionIsMember` TODO

Predicate logic:

  ∀ (Point : Type) (A B : LRA.SetSystems.Instantiations.ActiveSet Point), True → True → True

Predicate logic (unfolded):

  ∀ (Point : Type) (A B : LRA.SetSystems.Instantiations.ActiveSet Point), True → True → True (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
theorem activeSetAlgebraUnionIsMember (Point : Type) :
    ∀ A B : ActiveSet Point, True → True → True
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
theorem activeSetAlgebraUnionIsMember (Point : Type) :
    ∀ A B : ActiveSet Point, True → True → True := by
  sorry
/--
`activeSetAlgebraIntersectionIsMember` TODO

Predicate logic:

  ∀ (Point : Type) (A B : LRA.SetSystems.Instantiations.ActiveSet Point), True → True → True

Predicate logic (unfolded):

  ∀ (Point : Type) (A B : LRA.SetSystems.Instantiations.ActiveSet Point), True → True → True (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
theorem activeSetAlgebraIntersectionIsMember (Point : Type) :
    ∀ A B : ActiveSet Point, True → True → True
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
theorem activeSetAlgebraIntersectionIsMember (Point : Type) :
    ∀ A B : ActiveSet Point, True → True → True := by
  sorry
/--
`activeSetAlgebraDifferenceIsMember` TODO

Predicate logic:

  ∀ (Point : Type) (A B : LRA.SetSystems.Instantiations.ActiveSet Point), True → True → True

Predicate logic (unfolded):

  ∀ (Point : Type) (A B : LRA.SetSystems.Instantiations.ActiveSet Point), True → True → True (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
theorem activeSetAlgebraDifferenceIsMember (Point : Type) :
    ∀ A B : ActiveSet Point, True → True → True
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
theorem activeSetAlgebraDifferenceIsMember (Point : Type) :
    ∀ A B : ActiveSet Point, True → True → True := by
  sorry
/--
`activeSetAlgebraSymmetricDifferenceIsMember` TODO

Predicate logic:

  ∀ (Point : Type) (A B : LRA.SetSystems.Instantiations.ActiveSet Point), True → True → True

Predicate logic (unfolded):

  ∀ (Point : Type) (A B : LRA.SetSystems.Instantiations.ActiveSet Point), True → True → True (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
theorem activeSetAlgebraSymmetricDifferenceIsMember (Point : Type) :
    ∀ A B : ActiveSet Point, True → True → True
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
theorem activeSetAlgebraSymmetricDifferenceIsMember (Point : Type) :
    ∀ A B : ActiveSet Point, True → True → True := by
  sorry
/--
`activeSetAlgebra` TODO

Predicate logic:

  def activeSetAlgebra (Point : Type) :
      AlgebraOfSets (Set.univ : ActiveSet Point) where
    IsMember := fun _ => True
    MembersAreSubsets := activeSetAlgebraMembersAreSubsets Point
    EmptyIsMember := trivial
    UnionIsMember := activeSetAlgebraUnionIsMember Point
    IntersectionIsMember := activeSetAlgebraIntersectionIsMember Point
    DifferenceIsMember := activeSetAlgebraDifferenceIsMember Point
    SymmetricDifferenceIsMember := activeSetAlgebraSymmetricDifferenceIsMember Point
    AmbientIsMember := trivial

Predicate logic (unfolded):

  def activeSetAlgebra (Point : Type) :
      AlgebraOfSets (Set.univ : ActiveSet Point) where
    IsMember := fun _ => True
    MembersAreSubsets := activeSetAlgebraMembersAreSubsets Point
    EmptyIsMember := trivial
    UnionIsMember := activeSetAlgebraUnionIsMember Point
    IntersectionIsMember := activeSetAlgebraIntersectionIsMember Point
    DifferenceIsMember := activeSetAlgebraDifferenceIsMember Point
    SymmetricDifferenceIsMember := activeSetAlgebraSymmetricDifferenceIsMember Point
    AmbientIsMember := trivial (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def activeSetAlgebra (Point : Type) :
    AlgebraOfSets (Set.univ : ActiveSet Point) where
  IsMember := fun _ => True
  MembersAreSubsets := activeSetAlgebraMembersAreSubsets Point
  EmptyIsMember := trivial
  UnionIsMember := activeSetAlgebraUnionIsMember Point
  IntersectionIsMember := activeSetAlgebraIntersectionIsMember Point
  DifferenceIsMember := activeSetAlgebraDifferenceIsMember Point
  SymmetricDifferenceIsMember := activeSetAlgebraSymmetricDifferenceIsMember Point
  AmbientIsMember := trivial
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
def activeSetAlgebra (Point : Type) :
    AlgebraOfSets (Set.univ : ActiveSet Point) where
  IsMember := fun _ => True
  MembersAreSubsets := activeSetAlgebraMembersAreSubsets Point
  EmptyIsMember := trivial
  UnionIsMember := activeSetAlgebraUnionIsMember Point
  IntersectionIsMember := activeSetAlgebraIntersectionIsMember Point
  DifferenceIsMember := activeSetAlgebraDifferenceIsMember Point
  SymmetricDifferenceIsMember := activeSetAlgebraSymmetricDifferenceIsMember Point
  AmbientIsMember := trivial

/--
`emptyUniversalSetAlgebraMembersAreSubsets` TODO

Predicate logic:

  ∀ (Point : Type) (A : LRA.SetSystems.Instantiations.ActiveSet Point), Or (A = Set.instEmptyCollection.emptyCollection)(A = Set.univ) → Set.instLE.le A Set.univ

Predicate logic (unfolded):

  Ambient
    (Point)
  Objects
    (none)
  Prove
    Or (A = Set.instEmptyCollection.1)(A = fun_a => True) → { le := fun s₁ s₂ => ∀ ⦃a : Point⦄, a ∈ s₁ → a ∈ s₂}.le A fun _a => True

Logical form (Lean):

```lean
theorem emptyUniversalSetAlgebraMembersAreSubsets (Point : Type) :
    ∀ A : ActiveSet Point, (A = ∅ ∨ A = Set.univ) → A ⊆ Set.univ
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases

-/
theorem emptyUniversalSetAlgebraMembersAreSubsets (Point : Type) :
    ∀ A : ActiveSet Point, (A = ∅ ∨ A = Set.univ) → A ⊆ Set.univ := by
  sorry
/--
`emptyUniversalSetAlgebraEmptyIsMember` TODO

Predicate logic:

  ∀ (Point : Type), Or (Set.instEmptyCollection.emptyCollection = Set.instEmptyCollection.emptyCollection) (Set.instEmptyCollection.emptyCollection = Set.univ)

Predicate logic (unfolded):

  Ambient
    (Point)
  Objects
    (none)
  Prove
    Or (Set.instEmptyCollection.1 = Set.instEmptyCollection.1)(Set.instEmptyCollection.1 = fun_a => True)

Logical form (Lean):

```lean
theorem emptyUniversalSetAlgebraEmptyIsMember (Point : Type) :
    ((∅ : ActiveSet Point) = ∅ ∨ (∅ : ActiveSet Point) = Set.univ)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases

-/
theorem emptyUniversalSetAlgebraEmptyIsMember (Point : Type) :
    ((∅ : ActiveSet Point) = ∅ ∨ (∅ : ActiveSet Point) = Set.univ) := by
  sorry
/--
`emptyUniversalSetAlgebraUnionIsMember` TODO

Predicate logic:

  ∀ (Point : Type) (A B : LRA.SetSystems.Instantiations.ActiveSet Point), (Or (A = Set.instEmptyCollection.emptyCollection)(A = Set.univ) ∧ Or (B = Set.instEmptyCollection.emptyCollection)(B = Set.univ)) → Or (A ∪ B = Set.instEmptyCollection.emptyCollection)(A ∪ B = Set.univ)

Predicate logic (unfolded):

  Ambient
    (Point)
  Objects
    (none)
  Prove
    (Or (A = Set.instEmptyCollection.1)(A = fun_a => True) ∧ Or (B = Set.instEmptyCollection.1)(B = fun_a => True)) → Or (A ∪ B = Set.instEmptyCollection.1)(A ∪ B = fun_a => True)

Logical form (Lean):

```lean
theorem emptyUniversalSetAlgebraUnionIsMember (Point : Type) :
    ∀ A B : ActiveSet Point,
      (A = ∅ ∨ A = Set.univ) →
      (B = ∅ ∨ B = Set.univ) →
      (A ∪ B = ∅ ∨ A ∪ B = Set.univ)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases

-/
theorem emptyUniversalSetAlgebraUnionIsMember (Point : Type) :
    ∀ A B : ActiveSet Point,
      (A = ∅ ∨ A = Set.univ) →
      (B = ∅ ∨ B = Set.univ) →
      (A ∪ B = ∅ ∨ A ∪ B = Set.univ) := by
  sorry
/--
`emptyUniversalSetAlgebraIntersectionIsMember` TODO

Predicate logic:

  ∀ (Point : Type) (A B : LRA.SetSystems.Instantiations.ActiveSet Point), (Or (A = Set.instEmptyCollection.emptyCollection)(A = Set.univ) ∧ Or (B = Set.instEmptyCollection.emptyCollection)(B = Set.univ)) → Or (A ∩ B = Set.instEmptyCollection.emptyCollection)(A ∩ B = Set.univ)

Predicate logic (unfolded):

  Ambient
    (Point)
  Objects
    (none)
  Prove
    (Or (A = Set.instEmptyCollection.1)(A = fun_a => True) ∧ Or (B = Set.instEmptyCollection.1)(B = fun_a => True)) → Or (A ∩ B = Set.instEmptyCollection.1)(A ∩ B = fun_a => True)

Logical form (Lean):

```lean
theorem emptyUniversalSetAlgebraIntersectionIsMember (Point : Type) :
    ∀ A B : ActiveSet Point,
      (A = ∅ ∨ A = Set.univ) →
      (B = ∅ ∨ B = Set.univ) →
      (A ∩ B = ∅ ∨ A ∩ B = Set.univ)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases

-/
theorem emptyUniversalSetAlgebraIntersectionIsMember (Point : Type) :
    ∀ A B : ActiveSet Point,
      (A = ∅ ∨ A = Set.univ) →
      (B = ∅ ∨ B = Set.univ) →
      (A ∩ B = ∅ ∨ A ∩ B = Set.univ) := by
  sorry
/--
`emptyUniversalSetAlgebraDifferenceIsMember` TODO

Predicate logic:

  ∀ (Point : Type) (A B : LRA.SetSystems.Instantiations.ActiveSet Point), (Or (A = Set.instEmptyCollection.emptyCollection)(A = Set.univ) ∧ Or (B = Set.instEmptyCollection.emptyCollection)(B = Set.univ)) → Or (A \ B = Set.instEmptyCollection.emptyCollection)(A \ B = Set.univ)

Predicate logic (unfolded):

  Ambient
    (Point)
  Objects
    (none)
  Prove
    (Or (A = Set.instEmptyCollection.1)(A = fun_a => True) ∧ Or (B = Set.instEmptyCollection.1)(B = fun_a => True)) → Or (A \ B = Set.instEmptyCollection.1)(A \ B = fun_a => True)

Logical form (Lean):

```lean
theorem emptyUniversalSetAlgebraDifferenceIsMember (Point : Type) :
    ∀ A B : ActiveSet Point,
      (A = ∅ ∨ A = Set.univ) →
      (B = ∅ ∨ B = Set.univ) →
      (A \ B = ∅ ∨ A \ B = Set.univ)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases

-/
theorem emptyUniversalSetAlgebraDifferenceIsMember (Point : Type) :
    ∀ A B : ActiveSet Point,
      (A = ∅ ∨ A = Set.univ) →
      (B = ∅ ∨ B = Set.univ) →
      (A \ B = ∅ ∨ A \ B = Set.univ) := by
  sorry
/--
`emptyUniversalSetAlgebraSymmetricDifferenceIsMember` TODO

Predicate logic:

  ∀ (Point : Type) (A B : LRA.SetSystems.Instantiations.ActiveSet Point), (Or (A = Set.instEmptyCollection.emptyCollection)(A = Set.univ) ∧ Or (B = Set.instEmptyCollection.emptyCollection)(B = Set.univ)) → Or (LRA.Set.MathlibPredicateSet.instHasSymmDiffSet.symmDiff A B = Set.instEmptyCollection.emptyCollection) (LRA.Set.MathlibPredicateSet.instHasSymmDiffSet.symmDiff A B = Set.univ)

Predicate logic (unfolded):

  Ambient
    (Point)
  Objects
    (none)
  Prove
    (Or (A = Set.instEmptyCollection.1)(A = fun_a => True) ∧ Or (B = Set.instEmptyCollection.1)(B = fun_a => True)) → Or (LRA.Set.MathlibPredicateSet.instHasSymmDiffSet.1 A B = Set.instEmptyCollection.1) (LRA.Set.MathlibPredicateSet.instHasSymmDiffSet.1 A B = fun_a => True)

Logical form (Lean):

```lean
theorem emptyUniversalSetAlgebraSymmetricDifferenceIsMember (Point : Type) :
    ∀ A B : ActiveSet Point,
      (A = ∅ ∨ A = Set.univ) →
      (B = ∅ ∨ B = Set.univ) →
      (A ∆ B = ∅ ∨ A ∆ B = Set.univ)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases

-/
theorem emptyUniversalSetAlgebraSymmetricDifferenceIsMember (Point : Type) :
    ∀ A B : ActiveSet Point,
      (A = ∅ ∨ A = Set.univ) →
      (B = ∅ ∨ B = Set.univ) →
      (A ∆ B = ∅ ∨ A ∆ B = Set.univ) := by
  sorry
/--
`emptyUniversalSetAlgebraAmbientIsMember` TODO

Predicate logic:

  ∀ (Point : Type), Or (Set.univ = Set.instEmptyCollection.emptyCollection)(Set.univ = Set.univ)

Predicate logic (unfolded):

  Ambient
    (Point)
  Objects
    (none)
  Prove
    Or (fun _a => True = Set.instEmptyCollection.1)(fun _a => True = fun_a => True)

Logical form (Lean):

```lean
theorem emptyUniversalSetAlgebraAmbientIsMember (Point : Type) :
    ((Set.univ : ActiveSet Point) = ∅ ∨
      (Set.univ : ActiveSet Point) = Set.univ)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases

-/
theorem emptyUniversalSetAlgebraAmbientIsMember (Point : Type) :
    ((Set.univ : ActiveSet Point) = ∅ ∨
      (Set.univ : ActiveSet Point) = Set.univ) := by
  sorry
/--
`emptyUniversalSetAlgebra` TODO

Predicate logic:

  def emptyUniversalSetAlgebra (Point : Type) :
      AlgebraOfSets (Set.univ : ActiveSet Point) where
    IsMember := fun setObject => setObject = ∅ ∨ setObject = Set.univ
    MembersAreSubsets := emptyUniversalSetAlgebraMembersAreSubsets Point
    EmptyIsMember := emptyUniversalSetAlgebraEmptyIsMember Point
    UnionIsMember := emptyUniversalSetAlgebraUnionIsMember Point
    IntersectionIsMember := emptyUniversalSetAlgebraIntersectionIsMember Point
    DifferenceIsMember := emptyUniversalSetAlgebraDifferenceIsMember Point
    SymmetricDifferenceIsMember :=
      emptyUniversalSetAlgebraSymmetricDifferenceIsMember Point
    AmbientIsMember := emptyUniversalSetAlgebraAmbientIsMember Point

Predicate logic (unfolded):

  def emptyUniversalSetAlgebra (Point : Type) :
      AlgebraOfSets (Set.univ : ActiveSet Point) where
    IsMember := fun setObject => setObject = ∅ ∨ setObject = Set.univ
    MembersAreSubsets := emptyUniversalSetAlgebraMembersAreSubsets Point
    EmptyIsMember := emptyUniversalSetAlgebraEmptyIsMember Point
    UnionIsMember := emptyUniversalSetAlgebraUnionIsMember Point
    IntersectionIsMember := emptyUniversalSetAlgebraIntersectionIsMember Point
    DifferenceIsMember := emptyUniversalSetAlgebraDifferenceIsMember Point
    SymmetricDifferenceIsMember :=
      emptyUniversalSetAlgebraSymmetricDifferenceIsMember Point
    AmbientIsMember := emptyUniversalSetAlgebraAmbientIsMember Point (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def emptyUniversalSetAlgebra (Point : Type) :
    AlgebraOfSets (Set.univ : ActiveSet Point) where
  IsMember := fun setObject => setObject = ∅ ∨ setObject = Set.univ
  MembersAreSubsets := emptyUniversalSetAlgebraMembersAreSubsets Point
  EmptyIsMember := emptyUniversalSetAlgebraEmptyIsMember Point
  UnionIsMember := emptyUniversalSetAlgebraUnionIsMember Point
  IntersectionIsMember := emptyUniversalSetAlgebraIntersectionIsMember Point
  DifferenceIsMember := emptyUniversalSetAlgebraDifferenceIsMember Point
  SymmetricDifferenceIsMember :=
    emptyUniversalSetAlgebraSymmetricDifferenceIsMember Point
  AmbientIsMember := emptyUniversalSetAlgebraAmbientIsMember Point
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
def emptyUniversalSetAlgebra (Point : Type) :
    AlgebraOfSets (Set.univ : ActiveSet Point) where
  IsMember := fun setObject => setObject = ∅ ∨ setObject = Set.univ
  MembersAreSubsets := emptyUniversalSetAlgebraMembersAreSubsets Point
  EmptyIsMember := emptyUniversalSetAlgebraEmptyIsMember Point
  UnionIsMember := emptyUniversalSetAlgebraUnionIsMember Point
  IntersectionIsMember := emptyUniversalSetAlgebraIntersectionIsMember Point
  DifferenceIsMember := emptyUniversalSetAlgebraDifferenceIsMember Point
  SymmetricDifferenceIsMember :=
    emptyUniversalSetAlgebraSymmetricDifferenceIsMember Point
  AmbientIsMember := emptyUniversalSetAlgebraAmbientIsMember Point

/--
`activeSigmaAlgebraCountableUnionIsMember` TODO

Predicate logic:

  ∀ (Point : Type) (family : Nat → LRA.SetSystems.Instantiations.ActiveSet Point), (∀ (index : Nat), (LRA.SetSystems.Instantiations.activeSetAlgebra Point).IsMember (family index)) → (LRA.SetSystems.Instantiations.activeSetAlgebra Point).IsMember (LRA.Set.MathlibPredicateSet.instHasCountableUnionSet.countableUnion family)

Predicate logic (unfolded):

  Ambient
    (Point)
  Objects
    (none)
  Prove
    (∀ (index : Nat), (LRA.SetSystems.Instantiations.activeSetAlgebra Point).toRingOfSets.1 (family index)) → (LRA.SetSystems.Instantiations.activeSetAlgebra Point).toRingOfSets.1 (LRA.Set.MathlibPredicateSet.instHasCountableUnionSet.1 family)

Logical form (Lean):

```lean
theorem activeSigmaAlgebraCountableUnionIsMember (Point : Type) :
    ∀ family : Nat → ActiveSet Point,
      (∀ index, (activeSetAlgebra Point).IsMember (family index)) →
        (activeSetAlgebra Point).IsMember
          (HasCountableUnion.countableUnion family)
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
theorem activeSigmaAlgebraCountableUnionIsMember (Point : Type) :
    ∀ family : Nat → ActiveSet Point,
      (∀ index, (activeSetAlgebra Point).IsMember (family index)) →
        (activeSetAlgebra Point).IsMember
          (HasCountableUnion.countableUnion family) := by
  sorry
/--
`activeSigmaAlgebra` TODO

Predicate logic:

  def activeSigmaAlgebra (Point : Type) :
      SigmaAlgebraOfSets (Set.univ : ActiveSet Point) where
    toAlgebraOfSets := activeSetAlgebra Point
    CountableUnionIsMember := activeSigmaAlgebraCountableUnionIsMember Point

Predicate logic (unfolded):

  def activeSigmaAlgebra (Point : Type) :
      SigmaAlgebraOfSets (Set.univ : ActiveSet Point) where
    toAlgebraOfSets := activeSetAlgebra Point
    CountableUnionIsMember := activeSigmaAlgebraCountableUnionIsMember Point (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def activeSigmaAlgebra (Point : Type) :
    SigmaAlgebraOfSets (Set.univ : ActiveSet Point) where
  toAlgebraOfSets := activeSetAlgebra Point
  CountableUnionIsMember := activeSigmaAlgebraCountableUnionIsMember Point
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
def activeSigmaAlgebra (Point : Type) :
    SigmaAlgebraOfSets (Set.univ : ActiveSet Point) where
  toAlgebraOfSets := activeSetAlgebra Point
  CountableUnionIsMember := activeSigmaAlgebraCountableUnionIsMember Point

/--
`lraSetAlgebraMembersAreSubsets` TODO

Predicate logic:

  ∀ (Point : Type) (A : LRA.Set.Constructions.TypeSet Point), True → LRA.Set.Constructions.TypeSet.instHasSubset.Subset A (LRA.Set.Constructions.TypeSet.Universal Point)

Predicate logic (unfolded):

  Ambient
    (Point)
  Objects
    (none)
  Prove
    True → LRA.Set.Constructions.TypeSet.instHasSubset.1 A fun x => True

Logical form (Lean):

```lean
theorem lraSetAlgebraMembersAreSubsets (Point : Type) :
    ∀ A : LRA.Set.Constructions.TypeSet Point, True →
      A ⊆ LRA.Set.Constructions.TypeSet.Universal Point
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
theorem lraSetAlgebraMembersAreSubsets (Point : Type) :
    ∀ A : LRA.Set.Constructions.TypeSet Point, True →
      A ⊆ LRA.Set.Constructions.TypeSet.Universal Point := by
  sorry
/--
`lraSetAlgebraUnionIsMember` TODO

Predicate logic:

  ∀ (Point : Type) (A B : LRA.Set.Constructions.TypeSet Point), True → True → True

Predicate logic (unfolded):

  ∀ (Point : Type) (A B : LRA.Set.Constructions.TypeSet Point), True → True → True (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
theorem lraSetAlgebraUnionIsMember (Point : Type) :
    ∀ A B : LRA.Set.Constructions.TypeSet Point, True → True → True
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
theorem lraSetAlgebraUnionIsMember (Point : Type) :
    ∀ A B : LRA.Set.Constructions.TypeSet Point, True → True → True := by
  sorry
/--
`lraSetAlgebraIntersectionIsMember` TODO

Predicate logic:

  ∀ (Point : Type) (A B : LRA.Set.Constructions.TypeSet Point), True → True → True

Predicate logic (unfolded):

  ∀ (Point : Type) (A B : LRA.Set.Constructions.TypeSet Point), True → True → True (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
theorem lraSetAlgebraIntersectionIsMember (Point : Type) :
    ∀ A B : LRA.Set.Constructions.TypeSet Point, True → True → True
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
theorem lraSetAlgebraIntersectionIsMember (Point : Type) :
    ∀ A B : LRA.Set.Constructions.TypeSet Point, True → True → True := by
  sorry
/--
`lraSetAlgebraDifferenceIsMember` TODO

Predicate logic:

  ∀ (Point : Type) (A B : LRA.Set.Constructions.TypeSet Point), True → True → True

Predicate logic (unfolded):

  ∀ (Point : Type) (A B : LRA.Set.Constructions.TypeSet Point), True → True → True (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
theorem lraSetAlgebraDifferenceIsMember (Point : Type) :
    ∀ A B : LRA.Set.Constructions.TypeSet Point, True → True → True
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
theorem lraSetAlgebraDifferenceIsMember (Point : Type) :
    ∀ A B : LRA.Set.Constructions.TypeSet Point, True → True → True := by
  sorry
/--
`lraSetAlgebraSymmetricDifferenceIsMember` TODO

Predicate logic:

  ∀ (Point : Type) (A B : LRA.Set.Constructions.TypeSet Point), True → True → True

Predicate logic (unfolded):

  ∀ (Point : Type) (A B : LRA.Set.Constructions.TypeSet Point), True → True → True (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
theorem lraSetAlgebraSymmetricDifferenceIsMember (Point : Type) :
    ∀ A B : LRA.Set.Constructions.TypeSet Point, True → True → True
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
theorem lraSetAlgebraSymmetricDifferenceIsMember (Point : Type) :
    ∀ A B : LRA.Set.Constructions.TypeSet Point, True → True → True := by
  sorry
/--
`lraSetAlgebra` TODO

Predicate logic:

  def lraSetAlgebra (Point : Type) :
      AlgebraOfSets (LRA.Set.Constructions.TypeSet.Universal Point) where
    IsMember := fun _ => True
    MembersAreSubsets := lraSetAlgebraMembersAreSubsets Point
    EmptyIsMember := trivial
    UnionIsMember := lraSetAlgebraUnionIsMember Point
    IntersectionIsMember := lraSetAlgebraIntersectionIsMember Point
    DifferenceIsMember := lraSetAlgebraDifferenceIsMember Point
    SymmetricDifferenceIsMember := lraSetAlgebraSymmetricDifferenceIsMember Point
    AmbientIsMember := trivial

Predicate logic (unfolded):

  def lraSetAlgebra (Point : Type) :
      AlgebraOfSets (LRA.Set.Constructions.TypeSet.Universal Point) where
    IsMember := fun _ => True
    MembersAreSubsets := lraSetAlgebraMembersAreSubsets Point
    EmptyIsMember := trivial
    UnionIsMember := lraSetAlgebraUnionIsMember Point
    IntersectionIsMember := lraSetAlgebraIntersectionIsMember Point
    DifferenceIsMember := lraSetAlgebraDifferenceIsMember Point
    SymmetricDifferenceIsMember := lraSetAlgebraSymmetricDifferenceIsMember Point
    AmbientIsMember := trivial (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def lraSetAlgebra (Point : Type) :
    AlgebraOfSets (LRA.Set.Constructions.TypeSet.Universal Point) where
  IsMember := fun _ => True
  MembersAreSubsets := lraSetAlgebraMembersAreSubsets Point
  EmptyIsMember := trivial
  UnionIsMember := lraSetAlgebraUnionIsMember Point
  IntersectionIsMember := lraSetAlgebraIntersectionIsMember Point
  DifferenceIsMember := lraSetAlgebraDifferenceIsMember Point
  SymmetricDifferenceIsMember := lraSetAlgebraSymmetricDifferenceIsMember Point
  AmbientIsMember := trivial
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
def lraSetAlgebra (Point : Type) :
    AlgebraOfSets (LRA.Set.Constructions.TypeSet.Universal Point) where
  IsMember := fun _ => True
  MembersAreSubsets := lraSetAlgebraMembersAreSubsets Point
  EmptyIsMember := trivial
  UnionIsMember := lraSetAlgebraUnionIsMember Point
  IntersectionIsMember := lraSetAlgebraIntersectionIsMember Point
  DifferenceIsMember := lraSetAlgebraDifferenceIsMember Point
  SymmetricDifferenceIsMember := lraSetAlgebraSymmetricDifferenceIsMember Point
  AmbientIsMember := trivial

end LRA.SetSystems.Instantiations
