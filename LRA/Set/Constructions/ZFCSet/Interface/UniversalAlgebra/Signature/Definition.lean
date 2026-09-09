import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.Set.Constructions.ZFCSet.Interface.UniversalAlgebra

/--
`SetOperationSymbol` TODO

Predicate logic:

  inductive SetOperationSymbol where
    | union
    | inter
    | difference
    | symmDiff
    | powerSet
    | collectionUnion
    | collectionIntersection

Predicate logic (unfolded):

  inductive SetOperationSymbol where
    | union
    | inter
    | difference
    | symmDiff
    | powerSet
    | collectionUnion
    | collectionIntersection (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive SetOperationSymbol where
  | union
  | inter
  | difference
  | symmDiff
  | powerSet
  | collectionUnion
  | collectionIntersection
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
inductive SetOperationSymbol where
  | union
  | inter
  | difference
  | symmDiff
  | powerSet
  | collectionUnion
  | collectionIntersection

/--
`setOperationArity` TODO

Predicate logic:

  def setOperationArity : SetOperationSymbol → Nat
    | .union => 2
    | .inter => 2
    | .difference => 2
    | .symmDiff => 2
    | .powerSet => 1
    | .collectionUnion => 1
    | .collectionIntersection => 1

Predicate logic (unfolded):

  def setOperationArity : SetOperationSymbol → Nat
    | .union => 2
    | .inter => 2
    | .difference => 2
    | .symmDiff => 2
    | .powerSet => 1
    | .collectionUnion => 1
    | .collectionIntersection => 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def setOperationArity : SetOperationSymbol → Nat
  | .union => 2
  | .inter => 2
  | .difference => 2
  | .symmDiff => 2
  | .powerSet => 1
  | .collectionUnion => 1
  | .collectionIntersection => 1
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
def setOperationArity : SetOperationSymbol → Nat
  | .union => 2
  | .inter => 2
  | .difference => 2
  | .symmDiff => 2
  | .powerSet => 1
  | .collectionUnion => 1
  | .collectionIntersection => 1

/--
`SetConstantSymbol` TODO

Predicate logic:

  inductive SetConstantSymbol where
    | emptySet

Predicate logic (unfolded):

  inductive SetConstantSymbol where
    | emptySet (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive SetConstantSymbol where
  | emptySet
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
inductive SetConstantSymbol where
  | emptySet

/--
`SetAlgebraicSignature` TODO

Predicate logic:

  abbrev SetAlgebraicSignature : LRA.Identity.AlgebraicSignature where
    OperationSymbol := SetOperationSymbol
    arity := setOperationArity
    ConstantSymbol := SetConstantSymbol

Predicate logic (unfolded):

  abbrev SetAlgebraicSignature : LRA.Identity.AlgebraicSignature where
    OperationSymbol := SetOperationSymbol
    arity := setOperationArity
    ConstantSymbol := SetConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev SetAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := SetOperationSymbol
  arity := setOperationArity
  ConstantSymbol := SetConstantSymbol
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
abbrev SetAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := SetOperationSymbol
  arity := setOperationArity
  ConstantSymbol := SetConstantSymbol

end LRA.Set.Constructions.ZFCSet.Interface.UniversalAlgebra
