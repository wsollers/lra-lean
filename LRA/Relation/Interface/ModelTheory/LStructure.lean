import LRA.Logic.Language.FirstOrder.Signature

namespace LRA.Relation.ModelTheory

open LRA.Logic

universe u

/--
`RelationRelationSymbol` TODO

Predicate logic:

  inductive RelationRelationSymbol : Type
    | rel
    deriving DecidableEq

Predicate logic (unfolded):

  inductive RelationRelationSymbol : Type
    | rel
    deriving DecidableEq (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive RelationRelationSymbol : Type
  | rel
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
inductive RelationRelationSymbol : Type
  | rel
  deriving DecidableEq

/--
`RelationConstantSymbol` TODO

Predicate logic:

  inductive RelationConstantSymbol : Type
    deriving DecidableEq

Predicate logic (unfolded):

  inductive RelationConstantSymbol : Type
    deriving DecidableEq (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive RelationConstantSymbol : Type
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
inductive RelationConstantSymbol : Type
  deriving DecidableEq

/--
`RelationFunctions` TODO

Predicate logic:

  def RelationFunctions : ArityIndexedSymbols where
    Symbol := Empty
    arity := Empty.elim

Predicate logic (unfolded):

  def RelationFunctions : ArityIndexedSymbols where
    Symbol := Empty
    arity := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RelationFunctions : ArityIndexedSymbols where
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
def RelationFunctions : ArityIndexedSymbols where
  Symbol := Empty
  arity := Empty.elim

/--
`RelationRelations` TODO

Predicate logic:

  def RelationRelations : ArityIndexedSymbols where
    Symbol := RelationRelationSymbol
    arity := fun _ => 2

Predicate logic (unfolded):

  def RelationRelations : ArityIndexedSymbols where
    Symbol := RelationRelationSymbol
    arity := fun _ => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RelationRelations : ArityIndexedSymbols where
  Symbol := RelationRelationSymbol
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
def RelationRelations : ArityIndexedSymbols where
  Symbol := RelationRelationSymbol
  arity := fun _ => 2

/--
`RelationSignature` TODO

Predicate logic:

  def RelationSignature : Signature where
    Functions := RelationFunctions
    Relations := RelationRelations
    Constants := RelationConstantSymbol

Predicate logic (unfolded):

  def RelationSignature : Signature where
    Functions := RelationFunctions
    Relations := RelationRelations
    Constants := RelationConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RelationSignature : Signature where
  Functions := RelationFunctions
  Relations := RelationRelations
  Constants := RelationConstantSymbol
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
def RelationSignature : Signature where
  Functions := RelationFunctions
  Relations := RelationRelations
  Constants := RelationConstantSymbol

/--
`RelationLanguage` TODO

Predicate logic:

  abbrev RelationLanguage := FirstOrderLanguage

Predicate logic (unfolded):

  abbrev RelationLanguage := FirstOrderLanguage (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev RelationLanguage := FirstOrderLanguage
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
abbrev RelationLanguage := FirstOrderLanguage

/--
`relationLanguage` TODO

Predicate logic:

  def relationLanguage : RelationLanguage :=
    RelationSignature

Predicate logic (unfolded):

  def relationLanguage : RelationLanguage :=
    RelationSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def relationLanguage : RelationLanguage :=
  RelationSignature
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
def relationLanguage : RelationLanguage :=
  RelationSignature

/--
`RelationStructure` TODO

Predicate logic:

  structure RelationStructure where
    Carrier : Type u
    carrierNonempty : Nonempty Carrier
    relationInterpretation : Carrier → Carrier → Prop

Predicate logic (unfolded):

  structure RelationStructure where
    Carrier : Type u
    carrierNonempty : Nonempty Carrier
    relationInterpretation : Carrier → Carrier → Prop (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure RelationStructure where
  Carrier : Type u
  carrierNonempty : Nonempty Carrier
  relationInterpretation : Carrier → Carrier → Prop
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
structure RelationStructure where
  Carrier : Type u
  carrierNonempty : Nonempty Carrier
  relationInterpretation : Carrier → Carrier → Prop

end LRA.Relation.ModelTheory
