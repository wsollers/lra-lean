import LRA.NumberSystems.Integers.Interface.Definition
import LRA.NumberSystems.Integers.Constructions.Polish
import LRA.NumberSystems.Carriers.Witnesses

namespace LRA.NumberSystems.Integers

/--
`LRA_Z_Polish` TODO

Predicate logic:

  abbrev LRA_Z_Polish := LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z

Predicate logic (unfolded):

  abbrev LRA_Z_Polish := LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_Z_Polish := LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z
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
abbrev LRA_Z_Polish := LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z

/--
`LRA_Z_QuotientOrderedPairs` TODO

Predicate logic:

  abbrev LRA_Z_QuotientOrderedPairs := LRA.NumberSystems.Carriers.Z_QuotientOrderedPairs

Predicate logic (unfolded):

  abbrev LRA_Z_QuotientOrderedPairs := LRA.NumberSystems.Carriers.Z_QuotientOrderedPairs (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_Z_QuotientOrderedPairs := LRA.NumberSystems.Carriers.Z_QuotientOrderedPairs
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
abbrev LRA_Z_QuotientOrderedPairs := LRA.NumberSystems.Carriers.Z_QuotientOrderedPairs

/--
`LRA_Z_Tao` TODO

Predicate logic:

  abbrev LRA_Z_Tao := LRA.NumberSystems.Carriers.Z_Tao

Predicate logic (unfolded):

  abbrev LRA_Z_Tao := LRA.NumberSystems.Carriers.Z_Tao (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_Z_Tao := LRA.NumberSystems.Carriers.Z_Tao
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
abbrev LRA_Z_Tao := LRA.NumberSystems.Carriers.Z_Tao

/--
`LRA_Z_Mendelson` TODO

Predicate logic:

  abbrev LRA_Z_Mendelson := LRA.NumberSystems.Carriers.Z_Mendelson

Predicate logic (unfolded):

  abbrev LRA_Z_Mendelson := LRA.NumberSystems.Carriers.Z_Mendelson (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_Z_Mendelson := LRA.NumberSystems.Carriers.Z_Mendelson
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
abbrev LRA_Z_Mendelson := LRA.NumberSystems.Carriers.Z_Mendelson

/--
`LRA_Z` TODO

Predicate logic:

  abbrev LRA_Z := LRA_Z_Polish

Predicate logic (unfolded):

  abbrev LRA_Z := LRA_Z_Polish (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_Z := LRA_Z_Polish
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
abbrev LRA_Z := LRA_Z_Polish

/--
`LRA_Int` TODO

Predicate logic:

  abbrev LRA_Int := LRA_Z

Predicate logic (unfolded):

  abbrev LRA_Int := LRA_Z (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_Int := LRA_Z
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
abbrev LRA_Int := LRA_Z

/--
`LRA_DefaultCarrier` TODO

Predicate logic:

  abbrev LRA_DefaultCarrier := LRA_Int

Predicate logic (unfolded):

  abbrev LRA_DefaultCarrier := LRA_Int (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_DefaultCarrier := LRA_Int
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
abbrev LRA_DefaultCarrier := LRA_Int

/--
`LRA_MATHLIB_Z` TODO

Predicate logic:

  abbrev LRA_MATHLIB_Z := Int

Predicate logic (unfolded):

  abbrev LRA_MATHLIB_Z := Int (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_MATHLIB_Z := Int
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
abbrev LRA_MATHLIB_Z := Int

/--
`LRA_Z_Pos` TODO

Predicate logic:

  def LRA_Z_Pos : Type := { value : LRA_Z // (0 : LRA_Z) < value }

Predicate logic (unfolded):

  def LRA_Z_Pos : Type := { value : LRA_Z // (0 : LRA_Z) < value } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def LRA_Z_Pos : Type := { value : LRA_Z // (0 : LRA_Z) < value }
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
def LRA_Z_Pos : Type := { value : LRA_Z // (0 : LRA_Z) < value }

/--
`LRA_Z_Nonneg` TODO

Predicate logic:

  def LRA_Z_Nonneg : Type := { value : LRA_Z // (0 : LRA_Z) <= value }

Predicate logic (unfolded):

  def LRA_Z_Nonneg : Type := { value : LRA_Z // (0 : LRA_Z) <= value } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def LRA_Z_Nonneg : Type := { value : LRA_Z // (0 : LRA_Z) <= value }
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
def LRA_Z_Nonneg : Type := { value : LRA_Z // (0 : LRA_Z) <= value }

/--
`LRA_Z_Neg` TODO

Predicate logic:

  def LRA_Z_Neg : Type := { value : LRA_Z // value < (0 : LRA_Z) }

Predicate logic (unfolded):

  def LRA_Z_Neg : Type := { value : LRA_Z // value < (0 : LRA_Z) } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def LRA_Z_Neg : Type := { value : LRA_Z // value < (0 : LRA_Z) }
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
def LRA_Z_Neg : Type := { value : LRA_Z // value < (0 : LRA_Z) }

/--
`LRA_Z_Nonpos` TODO

Predicate logic:

  def LRA_Z_Nonpos : Type := { value : LRA_Z // value <= (0 : LRA_Z) }

Predicate logic (unfolded):

  def LRA_Z_Nonpos : Type := { value : LRA_Z // value <= (0 : LRA_Z) } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def LRA_Z_Nonpos : Type := { value : LRA_Z // value <= (0 : LRA_Z) }
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
def LRA_Z_Nonpos : Type := { value : LRA_Z // value <= (0 : LRA_Z) }

namespace LRA_Z_Pos

noncomputable instance : OfNat LRA.NumberSystems.Integers.LRA_Z_Pos 1 := ⟨⟨1, by
  sorry
⟩⟩

noncomputable instance : Nonempty LRA.NumberSystems.Integers.LRA_Z_Pos := ⟨1⟩

noncomputable instance : Add LRA.NumberSystems.Integers.LRA_Z_Pos := ⟨
  fun left right => ⟨left.1 + right.1, by
    sorry
  ⟩
⟩

noncomputable instance : Mul LRA.NumberSystems.Integers.LRA_Z_Pos := ⟨
  fun left right => ⟨left.1 * right.1, by
    sorry
  ⟩
⟩

end LRA_Z_Pos

namespace LRA_Z_Nonneg

noncomputable instance : OfNat LRA.NumberSystems.Integers.LRA_Z_Nonneg 0 := ⟨⟨0, by
  sorry
⟩⟩

noncomputable instance : OfNat LRA.NumberSystems.Integers.LRA_Z_Nonneg 1 := ⟨⟨1, by
  sorry
⟩⟩

noncomputable instance : Nonempty LRA.NumberSystems.Integers.LRA_Z_Nonneg := ⟨0⟩

noncomputable instance : Add LRA.NumberSystems.Integers.LRA_Z_Nonneg := ⟨
  fun left right => ⟨left.1 + right.1, by
    sorry
  ⟩
⟩

noncomputable instance : Mul LRA.NumberSystems.Integers.LRA_Z_Nonneg := ⟨
  fun left right => ⟨left.1 * right.1, by
    sorry
  ⟩
⟩

end LRA_Z_Nonneg

namespace LRA_Z_Neg

noncomputable instance : Nonempty LRA.NumberSystems.Integers.LRA_Z_Neg := ⟨⟨-1, by
  sorry
⟩⟩

noncomputable instance : Add LRA.NumberSystems.Integers.LRA_Z_Neg := ⟨
  fun left right => ⟨left.1 + right.1, by
    sorry
  ⟩
⟩

end LRA_Z_Neg

namespace LRA_Z_Nonpos

noncomputable instance : OfNat LRA.NumberSystems.Integers.LRA_Z_Nonpos 0 := ⟨⟨0, by
  sorry
⟩⟩

noncomputable instance : Nonempty LRA.NumberSystems.Integers.LRA_Z_Nonpos := ⟨0⟩

noncomputable instance : Add LRA.NumberSystems.Integers.LRA_Z_Nonpos := ⟨
  fun left right => ⟨left.1 + right.1, by
    sorry
  ⟩
⟩

end LRA_Z_Nonpos

end LRA.NumberSystems.Integers
