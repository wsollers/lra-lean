
import LRA.Logic.Language.FirstOrder.Signature
import LRA.Logic.Syntax.FirstOrder.Sentence

namespace LRA.Set.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder

/--
`MembershipRelationSymbol` TODO

Predicate logic:

  inductive MembershipRelationSymbol : Type where
  | mem
  deriving DecidableEq

Predicate logic (unfolded):

  inductive MembershipRelationSymbol : Type where
  | mem
  deriving DecidableEq (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive MembershipRelationSymbol : Type where
  | mem
  deriving DecidableEq
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
inductive MembershipRelationSymbol : Type where
  | mem
  deriving DecidableEq

/--
`MembershipConstantSymbol` TODO

Predicate logic:

  inductive MembershipConstantSymbol : Type where
  | emptySet
  deriving DecidableEq

Predicate logic (unfolded):

  inductive MembershipConstantSymbol : Type where
  | emptySet
  deriving DecidableEq (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive MembershipConstantSymbol : Type where
  | emptySet
  deriving DecidableEq
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
inductive MembershipConstantSymbol : Type where
  | emptySet
  deriving DecidableEq

/--
`MembershipFunctions` TODO

Predicate logic:

  def MembershipFunctions : ArityIndexedSymbols where
  Symbol := Empty
  arity := Empty.elim

Predicate logic (unfolded):

  def MembershipFunctions : ArityIndexedSymbols where
  Symbol := Empty
  arity := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def MembershipFunctions : ArityIndexedSymbols where
  Symbol := Empty
  arity := Empty.elim
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
def MembershipFunctions : ArityIndexedSymbols where
  Symbol := Empty
  arity := Empty.elim

/--
`MembershipRelations` TODO

Predicate logic:

  def MembershipRelations : ArityIndexedSymbols where
  Symbol := MembershipRelationSymbol
  arity := fun _ => 2

Predicate logic (unfolded):

  def MembershipRelations : ArityIndexedSymbols where
  Symbol := MembershipRelationSymbol
  arity := fun _ => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def MembershipRelations : ArityIndexedSymbols where
  Symbol := MembershipRelationSymbol
  arity := fun _ => 2
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
def MembershipRelations : ArityIndexedSymbols where
  Symbol := MembershipRelationSymbol
  arity := fun _ => 2

/--
`MembershipSignature` TODO

Predicate logic:

  def MembershipSignature : Signature where
  Functions := MembershipFunctions
  Relations := MembershipRelations
  Constants := MembershipConstantSymbol

Predicate logic (unfolded):

  def MembershipSignature : Signature where
  Functions := MembershipFunctions
  Relations := MembershipRelations
  Constants := MembershipConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def MembershipSignature : Signature where
  Functions := MembershipFunctions
  Relations := MembershipRelations
  Constants := MembershipConstantSymbol
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
def MembershipSignature : Signature where
  Functions := MembershipFunctions
  Relations := MembershipRelations
  Constants := MembershipConstantSymbol

/--
`MembershipSymbolIsBinary` TODO

Predicate logic:

  MembershipSignature.IsBinaryRelationSymbol .mem

Predicate logic (unfolded):

  LRA.Set.ModelTheory.MembershipSignature.Relations.2 LRA.Set.ModelTheory.MembershipRelationSymbol.mem = instOfNatNat 2.1

Logical form (Lean):

```lean
theorem MembershipSymbolIsBinary :
    MembershipSignature.IsBinaryRelationSymbol .mem
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
theorem MembershipSymbolIsBinary :
    MembershipSignature.IsBinaryRelationSymbol .mem := by
  sorry

/--
`varT` TODO

Predicate logic:

  abbrev varT (n : Nat) : Term MembershipSignature Nat := .var n

Predicate logic (unfolded):

  abbrev varT (n : Nat) : Term MembershipSignature Nat := .var n (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev varT (n : Nat) : Term MembershipSignature Nat := .var n
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
abbrev varT (n : Nat) : Term MembershipSignature Nat := .var n

/--
`emptyT` TODO

Predicate logic:

  abbrev emptyT : Term MembershipSignature Nat := .const .emptySet

Predicate logic (unfolded):

  abbrev emptyT : Term MembershipSignature Nat := .const .emptySet (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev emptyT : Term MembershipSignature Nat := .const .emptySet
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
abbrev emptyT : Term MembershipSignature Nat := .const .emptySet

/--
`binaryTerms` TODO

Predicate logic:

  def binaryTerms
    (left right : Term MembershipSignature Nat) :
    Fin 2 -> Term MembershipSignature Nat :=
  Fin.cases left (Fin.cases right Fin.elim0)

Predicate logic (unfolded):

  def binaryTerms
    (left right : Term MembershipSignature Nat) :
    Fin 2 -> Term MembershipSignature Nat :=
  Fin.cases left (Fin.cases right Fin.elim0) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def binaryTerms
    (left right : Term MembershipSignature Nat) :
    Fin 2 -> Term MembershipSignature Nat :=
  Fin.cases left (Fin.cases right Fin.elim0)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def binaryTerms
    (left right : Term MembershipSignature Nat) :
    Fin 2 -> Term MembershipSignature Nat :=
  Fin.cases left (Fin.cases right Fin.elim0)

/--
`memT` TODO

Predicate logic:

  def memT (left right : Term MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .relation .mem (binaryTerms left right)

Predicate logic (unfolded):

  def memT (left right : Term MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .relation .mem (binaryTerms left right) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def memT (left right : Term MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .relation .mem (binaryTerms left right)
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
def memT (left right : Term MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .relation .mem (binaryTerms left right)

/--
`memF` TODO

Predicate logic:

  abbrev memF (x y : Nat) : Formula MembershipSignature Nat :=
  memT (varT x) (varT y)

Predicate logic (unfolded):

  abbrev memF (x y : Nat) : Formula MembershipSignature Nat :=
  memT (varT x) (varT y) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev memF (x y : Nat) : Formula MembershipSignature Nat :=
  memT (varT x) (varT y)
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
abbrev memF (x y : Nat) : Formula MembershipSignature Nat :=
  memT (varT x) (varT y)

/--
`eqF` TODO

Predicate logic:

  abbrev eqF (x y : Nat) : Formula MembershipSignature Nat :=
  .equal (varT x) (varT y)

Predicate logic (unfolded):

  abbrev eqF (x y : Nat) : Formula MembershipSignature Nat :=
  .equal (varT x) (varT y) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev eqF (x y : Nat) : Formula MembershipSignature Nat :=
  .equal (varT x) (varT y)
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
abbrev eqF (x y : Nat) : Formula MembershipSignature Nat :=
  .equal (varT x) (varT y)

/--
`orF` TODO

Predicate logic:

  def orF (φ ψ : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .impl (.neg φ) ψ

Predicate logic (unfolded):

  def orF (φ ψ : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .impl (.neg φ) ψ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def orF (φ ψ : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .impl (.neg φ) ψ
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
def orF (φ ψ : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .impl (.neg φ) ψ

/--
`iffF` TODO

Predicate logic:

  def iffF (φ ψ : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  Formula.and (.impl φ ψ) (.impl ψ φ)

Predicate logic (unfolded):

  def iffF (φ ψ : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  Formula.and (.impl φ ψ) (.impl ψ φ) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def iffF (φ ψ : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  Formula.and (.impl φ ψ) (.impl ψ φ)
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
def iffF (φ ψ : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  Formula.and (.impl φ ψ) (.impl ψ φ)

end LRA.Set.ModelTheory
