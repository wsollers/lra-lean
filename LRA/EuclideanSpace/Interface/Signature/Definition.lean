import LRA.Logic.Language.FirstOrder.Signature

namespace LRA.EuclideanSpace

/--
`TarskiRelationSymbol` TODO

Predicate logic:

  inductive TarskiRelationSymbol where
  | between
  | congruent

Predicate logic (unfolded):

  inductive TarskiRelationSymbol where
  | between
  | congruent (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive TarskiRelationSymbol where
  | between
  | congruent
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
inductive TarskiRelationSymbol where
  | between
  | congruent

/--
`TarskiFirstOrderRelations` TODO

Predicate logic:

  def TarskiFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := TarskiRelationSymbol
  arity
    | .between => 3
    | .congruent => 4

Predicate logic (unfolded):

  def TarskiFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := TarskiRelationSymbol
  arity
    | .between => 3
    | .congruent => 4 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def TarskiFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := TarskiRelationSymbol
  arity
    | .between => 3
    | .congruent => 4
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
def TarskiFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := TarskiRelationSymbol
  arity
    | .between => 3
    | .congruent => 4

/--
`TarskiFirstOrderSignature` TODO

Predicate logic:

  def TarskiFirstOrderSignature : LRA.Logic.Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := TarskiFirstOrderRelations
  Constants := Empty

Predicate logic (unfolded):

  def TarskiFirstOrderSignature : LRA.Logic.Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := TarskiFirstOrderRelations
  Constants := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def TarskiFirstOrderSignature : LRA.Logic.Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := TarskiFirstOrderRelations
  Constants := Empty
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
def TarskiFirstOrderSignature : LRA.Logic.Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := TarskiFirstOrderRelations
  Constants := Empty

end LRA.EuclideanSpace
