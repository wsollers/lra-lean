import Mathlib.Topology.UniformSpace.Cauchy
import LRA.Analysis.NormedLinearSpace.Definition

namespace LRA.Analysis.FunctionalAnalysis.BanachSpaces

universe u v

/--
`IsCauchySequence` TODO

Predicate logic:

  ∀ {K : Type u} [inst : NormedField K] {V : Type v} (space : LRA.Analysis.FunctionalAnalysis.NormedLinearSpaces.NormedLinearSpaceDefinition K V) (sequence : Nat → V) (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m n : Nat), instLENat.le N m → instLENat.le N n → Real.instLT.lt (space.norm (space.vectorSpace.add (sequence m) (space.vectorSpace.neg (sequence n)))) ε

Predicate logic (unfolded):

  ∀ {K : Type u} [inst : NormedField K] {V : Type v} (space : LRA.Analysis.FunctionalAnalysis.NormedLinearSpaces.NormedLinearSpaceDefinition K V) (sequence : Nat → V) (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m n : Nat), instLENat.1 N m → instLENat.1 N n → Real.instLT.1 (space.2 (space.vectorSpace.2 (sequence m) (space.vectorSpace.3 (sequence n)))) ε

Logical form (Lean):

```lean
def IsCauchySequence
    {K : Type u}
    [NormedField K]
    {V : Type v}
    (space : LRA.Analysis.FunctionalAnalysis.NormedLinearSpaces.NormedLinearSpaceDefinition K V)
    (sequence : ℕ → V) : Prop :=
  ∀ ε : Real, 0 < ε → ∃ N : ℕ, ∀ m n : ℕ, N ≤ m → N ≤ n →
    space.norm (space.vectorSpace.add (sequence m) (space.vectorSpace.neg (sequence n))) < ε
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def IsCauchySequence
    {K : Type u}
    [NormedField K]
    {V : Type v}
    (space : LRA.Analysis.FunctionalAnalysis.NormedLinearSpaces.NormedLinearSpaceDefinition K V)
    (sequence : ℕ → V) : Prop :=
  ∀ ε : Real, 0 < ε → ∃ N : ℕ, ∀ m n : ℕ, N ≤ m → N ≤ n →
    space.norm (space.vectorSpace.add (sequence m) (space.vectorSpace.neg (sequence n))) < ε

/--
`ConvergesTo` TODO

Predicate logic:

  ∀ {K : Type u} [inst : NormedField K] {V : Type v} (space : LRA.Analysis.FunctionalAnalysis.NormedLinearSpaces.NormedLinearSpaceDefinition K V) (sequence : Nat → V) (limit : V) (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (space.norm (space.vectorSpace.add (sequence n) (space.vectorSpace.neg limit))) ε

Predicate logic (unfolded):

  ∀ {K : Type u} [inst : NormedField K] {V : Type v} (space : LRA.Analysis.FunctionalAnalysis.NormedLinearSpaces.NormedLinearSpaceDefinition K V) (sequence : Nat → V) (limit : V) (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (space.2 (space.vectorSpace.2 (sequence n) (space.vectorSpace.3 limit))) ε

Logical form (Lean):

```lean
def ConvergesTo
    {K : Type u}
    [NormedField K]
    {V : Type v}
    (space : LRA.Analysis.FunctionalAnalysis.NormedLinearSpaces.NormedLinearSpaceDefinition K V)
    (sequence : ℕ → V)
    (limit : V) : Prop :=
  ∀ ε : Real, 0 < ε → ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
    space.norm (space.vectorSpace.add (sequence n) (space.vectorSpace.neg limit)) < ε
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def ConvergesTo
    {K : Type u}
    [NormedField K]
    {V : Type v}
    (space : LRA.Analysis.FunctionalAnalysis.NormedLinearSpaces.NormedLinearSpaceDefinition K V)
    (sequence : ℕ → V)
    (limit : V) : Prop :=
  ∀ ε : Real, 0 < ε → ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
    space.norm (space.vectorSpace.add (sequence n) (space.vectorSpace.neg limit)) < ε

/--
`BanachSpaceDefinition` TODO

Predicate logic:

  structure BanachSpaceDefinition
    (K : Type u)
    [NormedField K]
    (V : Type v) where

  normedLinearSpace : LRA.Analysis.FunctionalAnalysis.NormedLinearSpaces.NormedLinearSpaceDefinition K V

  complete :
    ∀ sequence : ℕ → V,
      IsCauchySequence normedLinearSpace sequence →
      ∃ limit : V, ConvergesTo normedLinearSpace sequence limit

Predicate logic (unfolded):

  structure BanachSpaceDefinition
    (K : Type u)
    [NormedField K]
    (V : Type v) where

  normedLinearSpace : LRA.Analysis.FunctionalAnalysis.NormedLinearSpaces.NormedLinearSpaceDefinition K V

  complete :
    ∀ sequence : ℕ → V,
      IsCauchySequence normedLinearSpace sequence →
      ∃ limit : V, ConvergesTo normedLinearSpace sequence limit (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure BanachSpaceDefinition
    (K : Type u)
    [NormedField K]
    (V : Type v) where

  normedLinearSpace : LRA.Analysis.FunctionalAnalysis.NormedLinearSpaces.NormedLinearSpaceDefinition K V

  complete :
    ∀ sequence : ℕ → V,
      IsCauchySequence normedLinearSpace sequence →
      ∃ limit : V, ConvergesTo normedLinearSpace sequence limit
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
structure BanachSpaceDefinition
    (K : Type u)
    [NormedField K]
    (V : Type v) where

  normedLinearSpace : LRA.Analysis.FunctionalAnalysis.NormedLinearSpaces.NormedLinearSpaceDefinition K V

  complete :
    ∀ sequence : ℕ → V,
      IsCauchySequence normedLinearSpace sequence →
      ∃ limit : V, ConvergesTo normedLinearSpace sequence limit

end LRA.Analysis.FunctionalAnalysis.BanachSpaces
