import Mathlib.Data.Real.Basic

namespace LRA.EuclideanSpace

/--
`RealLineDistance` TODO

Predicate logic:

  noncomputable def RealLineDistance (a b : ℝ) : ℝ :=
  if b ≥ a then b - a else a - b

Predicate logic (unfolded):

  noncomputable def RealLineDistance (a b : ℝ) : ℝ :=
  if b ≥ a then b - a else a - b (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def RealLineDistance (a b : ℝ) : ℝ :=
  if b ≥ a then b - a else a - b
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
noncomputable def RealLineDistance (a b : ℝ) : ℝ :=
  if b ≥ a then b - a else a - b

/--
`OpenInterval` TODO

Predicate logic:

  ∀ (a b a_1 : Real), (Real.instLT.lt a a_1 ∧ Real.instLT.lt a_1 b)

Predicate logic (unfolded):

  ∀ (a b a_1 : Real), (Real.instLT.1 a a_1 ∧ Real.instLT.1 a_1 b)

Logical form (Lean):

```lean
def OpenInterval (a b : ℝ) : Set ℝ :=
  {x : ℝ | a < x ∧ x < b}
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
def OpenInterval (a b : ℝ) : Set ℝ :=
  {x : ℝ | a < x ∧ x < b}

/--
`ClosedInterval` TODO

Predicate logic:

  ∀ (a b a_1 : Real), (Real.instLE.le a a_1 ∧ Real.instLE.le a_1 b)

Predicate logic (unfolded):

  ∀ (a b a_1 : Real), (Real.instLE.1 a a_1 ∧ Real.instLE.1 a_1 b)

Logical form (Lean):

```lean
def ClosedInterval (a b : ℝ) : Set ℝ :=
  {x : ℝ | a ≤ x ∧ x ≤ b}
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
def ClosedInterval (a b : ℝ) : Set ℝ :=
  {x : ℝ | a ≤ x ∧ x ≤ b}

/--
`LeftClosedRightOpenInterval` TODO

Predicate logic:

  ∀ (a b a_1 : Real), (Real.instLE.le a a_1 ∧ Real.instLT.lt a_1 b)

Predicate logic (unfolded):

  ∀ (a b a_1 : Real), (Real.instLE.1 a a_1 ∧ Real.instLT.1 a_1 b)

Logical form (Lean):

```lean
def LeftClosedRightOpenInterval (a b : ℝ) : Set ℝ :=
  {x : ℝ | a ≤ x ∧ x < b}
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
def LeftClosedRightOpenInterval (a b : ℝ) : Set ℝ :=
  {x : ℝ | a ≤ x ∧ x < b}

/--
`LeftOpenRightClosedInterval` TODO

Predicate logic:

  ∀ (a b a_1 : Real), (Real.instLT.lt a a_1 ∧ Real.instLE.le a_1 b)

Predicate logic (unfolded):

  ∀ (a b a_1 : Real), (Real.instLT.1 a a_1 ∧ Real.instLE.1 a_1 b)

Logical form (Lean):

```lean
def LeftOpenRightClosedInterval (a b : ℝ) : Set ℝ :=
  {x : ℝ | a < x ∧ x ≤ b}
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
def LeftOpenRightClosedInterval (a b : ℝ) : Set ℝ :=
  {x : ℝ | a < x ∧ x ≤ b}

/--
`OpenRayAbove` TODO

Predicate logic:

  ∀ (a a_1 : Real), Real.lt✝ a a_1

Predicate logic (unfolded):

  ∀ (a a_1 : Real), Real.lt✝ a a_1

Logical form (Lean):

```lean
def OpenRayAbove (a : ℝ) : Set ℝ :=
  {x : ℝ | a < x}
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
def OpenRayAbove (a : ℝ) : Set ℝ :=
  {x : ℝ | a < x}

/--
`ClosedRayAbove` TODO

Predicate logic:

  ∀ (a a_1 : Real), Real.le✝ a a_1

Predicate logic (unfolded):

  ∀ (a a_1 : Real), Real.le✝ a a_1

Logical form (Lean):

```lean
def ClosedRayAbove (a : ℝ) : Set ℝ :=
  {x : ℝ | a ≤ x}
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
def ClosedRayAbove (a : ℝ) : Set ℝ :=
  {x : ℝ | a ≤ x}

/--
`OpenRayBelow` TODO

Predicate logic:

  ∀ (b a : Real), Real.lt✝ a b

Predicate logic (unfolded):

  ∀ (b a : Real), Real.lt✝ a b

Logical form (Lean):

```lean
def OpenRayBelow (b : ℝ) : Set ℝ :=
  {x : ℝ | x < b}
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
def OpenRayBelow (b : ℝ) : Set ℝ :=
  {x : ℝ | x < b}

/--
`ClosedRayBelow` TODO

Predicate logic:

  ∀ (b a : Real), Real.le✝ a b

Predicate logic (unfolded):

  ∀ (b a : Real), Real.le✝ a b

Logical form (Lean):

```lean
def ClosedRayBelow (b : ℝ) : Set ℝ :=
  {x : ℝ | x ≤ b}
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
def ClosedRayBelow (b : ℝ) : Set ℝ :=
  {x : ℝ | x ≤ b}

/--
`Translate1` TODO

Predicate logic:

  def Translate1 (c x : ℝ) : ℝ := x + c

Predicate logic (unfolded):

  def Translate1 (c x : ℝ) : ℝ := x + c (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Translate1 (c x : ℝ) : ℝ := x + c
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
def Translate1 (c x : ℝ) : ℝ := x + c

/--
`Dilate1` TODO

Predicate logic:

  def Dilate1 (k x : ℝ) : ℝ := k * x

Predicate logic (unfolded):

  def Dilate1 (k x : ℝ) : ℝ := k * x (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Dilate1 (k x : ℝ) : ℝ := k * x
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
def Dilate1 (k x : ℝ) : ℝ := k * x

end LRA.EuclideanSpace
