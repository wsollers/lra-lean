import LRA.EuclideanSpace.MathlibPoint.Definition
import LRA.EuclideanSpace.Interface.Laws

namespace LRA.EuclideanSpace

variable {n : ℕ}

/--
`MathlibCongruenceReflexivity` TODO

Predicate logic:

  congruent x y y x

Predicate logic (unfolded):

  ∀ {n : Nat} (x y : WithLp instOfNatAtLeastTwo.1 ((i : Fin n) → (fun x => Real) i)), LRA.EuclideanSpace.instCongruentMathlibPoint.1 x y y x

Logical form (Lean):

```lean
theorem MathlibCongruenceReflexivity (x y : MathlibPoint n) :
    congruent x y y x
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
theorem MathlibCongruenceReflexivity (x y : MathlibPoint n) :
    congruent x y y x := by
  sorry

/--
`MathlibCongruenceTransitivity` TODO

Predicate logic:

  congruent z w u v

Predicate logic (unfolded):

  ∀ {n : Nat} (x y z w u v : WithLp instOfNatAtLeastTwo.1 ((i : Fin n) → (fun x => Real) i)), (LRA.EuclideanSpace.instCongruentMathlibPoint.1 x y z w ∧ LRA.EuclideanSpace.instCongruentMathlibPoint.1 x y u v) → LRA.EuclideanSpace.instCongruentMathlibPoint.1 z w u v

Logical form (Lean):

```lean
theorem MathlibCongruenceTransitivity (x y z w u v : MathlibPoint n)
    (xyCongZw : congruent x y z w) (xyCongUv : congruent x y u v) :
    congruent z w u v
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
theorem MathlibCongruenceTransitivity (x y z w u v : MathlibPoint n)
    (xyCongZw : congruent x y z w) (xyCongUv : congruent x y u v) :
    congruent z w u v := by
  sorry

/--
`MathlibCongruenceIdentity` TODO

Predicate logic:

  x = y

Predicate logic (unfolded):

  ∀ {n : Nat} (x y z : WithLp instOfNatAtLeastTwo.1 ((i : Fin n) → (fun x => Real) i)), LRA.EuclideanSpace.instCongruentMathlibPoint.1 x y z z → x = y

Logical form (Lean):

```lean
theorem MathlibCongruenceIdentity (x y z : MathlibPoint n)
    (xyCongZz : congruent x y z z) : x = y
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
theorem MathlibCongruenceIdentity (x y z : MathlibPoint n)
    (xyCongZz : congruent x y z z) : x = y := by
  sorry

/--
`MathlibSegmentConstruction` TODO

Predicate logic:

  ∃ z ∈ MathlibPoint n, between x y z ∧ congruent y z a b

Predicate logic (unfolded):

  ∀ {n : Nat} (x y a b : WithLp instOfNatAtLeastTwo.1 ((i : Fin n) → (fun x => Real) i)), Exists fun z => (LRA.EuclideanSpace.instBetweenMathlibPoint.1 x y z ∧ LRA.EuclideanSpace.instCongruentMathlibPoint.1 y z a b)

Logical form (Lean):

```lean
theorem MathlibSegmentConstruction (x y a b : MathlibPoint n) :
    ∃ z : MathlibPoint n, between x y z ∧ congruent y z a b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem MathlibSegmentConstruction (x y a b : MathlibPoint n) :
    ∃ z : MathlibPoint n, between x y z ∧ congruent y z a b := by
  sorry

/--
`MathlibFiveSegment` TODO

Predicate logic:

  congruent z u z' u'

Predicate logic (unfolded):

  ∀ {n : Nat} (x y z x' y' z' u u' : WithLp instOfNatAtLeastTwo.1 ((i : Fin n) → (fun x => Real) i)), (x = y → False ∧ (LRA.EuclideanSpace.instBetweenMathlibPoint.1 x y z ∧ (LRA.EuclideanSpace.instBetweenMathlibPoint.1 x' y' z' ∧ (LRA.EuclideanSpace.instCongruentMathlibPoint.1 x y x' y' ∧ (LRA.EuclideanSpace.instCongruentMathlibPoint.1 y z y' z' ∧ (LRA.EuclideanSpace.instCongruentMathlibPoint.1 x u x' u' ∧ LRA.EuclideanSpace.instCongruentMathlibPoint.1 y u y' u')))))) → LRA.EuclideanSpace.instCongruentMathlibPoint.1 z u z' u'

Logical form (Lean):

```lean
theorem MathlibFiveSegment (x y z x' y' z' u u' : MathlibPoint n) (xNeY : x ≠ y)
    (bxyz : between x y z) (bxyz' : between x' y' z')
    (xyCongXy' : congruent x y x' y') (yzCongYz' : congruent y z y' z')
    (xuCongXu' : congruent x u x' u') (yuCongYu' : congruent y u y' u') :
    congruent z u z' u'
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
theorem MathlibFiveSegment (x y z x' y' z' u u' : MathlibPoint n) (xNeY : x ≠ y)
    (bxyz : between x y z) (bxyz' : between x' y' z')
    (xyCongXy' : congruent x y x' y') (yzCongYz' : congruent y z y' z')
    (xuCongXu' : congruent x u x' u') (yuCongYu' : congruent y u y' u') :
    congruent z u z' u' := by
  sorry

/--
`MathlibBetweennessIdentity` TODO

Predicate logic:

  x = y

Predicate logic (unfolded):

  ∀ {n : Nat} (x y : WithLp instOfNatAtLeastTwo.1 ((i : Fin n) → (fun x => Real) i)), LRA.EuclideanSpace.instBetweenMathlibPoint.1 x y x → x = y

Logical form (Lean):

```lean
theorem MathlibBetweennessIdentity (x y : MathlibPoint n)
    (bxyx : between x y x) : x = y
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
theorem MathlibBetweennessIdentity (x y : MathlibPoint n)
    (bxyx : between x y x) : x = y := by
  sorry

/--
`MathlibInnerPasch` TODO

Predicate logic:

  ∃ x ∈ MathlibPoint n, between u x z ∧ between q x v

Predicate logic (unfolded):

  ∀ {n : Nat} (u v p q z : WithLp instOfNatAtLeastTwo.1 ((i : Fin n) → (fun x => Real) i)), (LRA.EuclideanSpace.instBetweenMathlibPoint.1 u p v ∧ LRA.EuclideanSpace.instBetweenMathlibPoint.1 p q z) → Exists fun x => (LRA.EuclideanSpace.instBetweenMathlibPoint.1 u x z ∧ LRA.EuclideanSpace.instBetweenMathlibPoint.1 q x v)

Logical form (Lean):

```lean
theorem MathlibInnerPasch (u v p q z : MathlibPoint n)
    (bupv : between u p v) (bpqz : between p q z) :
    ∃ x : MathlibPoint n, between u x z ∧ between q x v
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem MathlibInnerPasch (u v p q z : MathlibPoint n)
    (bupv : between u p v) (bpqz : between p q z) :
    ∃ x : MathlibPoint n, between u x z ∧ between q x v := by
  sorry

/--
`MathlibPlayfair` TODO

Predicate logic:

  ∃ x y ∈ MathlibPoint n, between a b x ∧ between a c y ∧ between x t y

Predicate logic (unfolded):

  ∀ {n : Nat} (a b c d t : WithLp instOfNatAtLeastTwo.1 ((i : Fin n) → (fun x => Real) i)), (LRA.EuclideanSpace.instBetweenMathlibPoint.1 a d t ∧ (LRA.EuclideanSpace.instBetweenMathlibPoint.1 b d c ∧ a = d → False)) → Exists fun x => Exists fun y => (LRA.EuclideanSpace.instBetweenMathlibPoint.1 a b x ∧ (LRA.EuclideanSpace.instBetweenMathlibPoint.1 a c y ∧ LRA.EuclideanSpace.instBetweenMathlibPoint.1 x t y))

Logical form (Lean):

```lean
theorem MathlibPlayfair (a b c d t : MathlibPoint n)
    (badt : between a d t) (bbdc : between b d c) (aNeD : a ≠ d) :
    ∃ x y : MathlibPoint n, between a b x ∧ between a c y ∧ between x t y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem MathlibPlayfair (a b c d t : MathlibPoint n)
    (badt : between a d t) (bbdc : between b d c) (aNeD : a ≠ d) :
    ∃ x y : MathlibPoint n, between a b x ∧ between a c y ∧ between x t y := by
  sorry

/--
`MathlibContinuity` TODO

Predicate logic:

  (∃ a ∈ MathlibPoint n, ∀ x y, φ x → ψ y → between a x y) → ∃ b ∈ MathlibPoint n, ∀ x y, φ x → ψ y → between x b y

Predicate logic (unfolded):

  ∀ {n : Nat} (φ ψ : WithLp instOfNatAtLeastTwo.1 ((i : Fin n) → (fun x => Real) i) → Prop), (Exists fun a => ∀ (x y : WithLp instOfNatAtLeastTwo.1 ((i : Fin n) → (fun x => Real) i)), φ x → ψ y → LRA.EuclideanSpace.instBetweenMathlibPoint.1 a x y) → Exists fun b => ∀ (x y : WithLp instOfNatAtLeastTwo.1 ((i : Fin n) → (fun x => Real) i)), φ x → ψ y → LRA.EuclideanSpace.instBetweenMathlibPoint.1 x b y

Logical form (Lean):

```lean
theorem MathlibContinuity (φ ψ : MathlibPoint n → Prop)
    (separated : ∃ a : MathlibPoint n, ∀ x y, φ x → ψ y → between a x y) :
    ∃ b : MathlibPoint n, ∀ x y, φ x → ψ y → between x b y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem MathlibContinuity (φ ψ : MathlibPoint n → Prop)
    (separated : ∃ a : MathlibPoint n, ∀ x y, φ x → ψ y → between a x y) :
    ∃ b : MathlibPoint n, ∀ x y, φ x → ψ y → between x b y := by
  sorry

instance : CongruenceLaws (MathlibPoint n) where
  CongruenceReflexivity := MathlibCongruenceReflexivity
  CongruenceTransitivity := MathlibCongruenceTransitivity
  CongruenceIdentity := MathlibCongruenceIdentity

instance : SegmentConstructionLaw (MathlibPoint n) where
  SegmentConstruction := MathlibSegmentConstruction

instance : FiveSegmentLaw (MathlibPoint n) where
  FiveSegment := MathlibFiveSegment

instance : BetweennessLaws (MathlibPoint n) where
  BetweennessIdentity := MathlibBetweennessIdentity
  InnerPasch := MathlibInnerPasch

instance : ParallelLaw (MathlibPoint n) where
  Playfair := MathlibPlayfair

instance : ContinuityLaw (MathlibPoint n) where
  Continuity := MathlibContinuity

end LRA.EuclideanSpace
