import LRA.Logic.Language.FirstOrder.Signature

namespace LRA.EuclideanSpace

/-!
The first-order vocabulary of Tarski's axiomatization of `n`-dimensional
Euclidean geometry (`E_n`): two relation symbols, no function or
constant symbols. Points are the single sort; nothing at this layer
combines two points into a third the way `+` combines two field
elements -- every geometric fact is stated via `TarskiRelationSymbol`'s
two relations.

* `between`   (ternary, `B(x, y, z)`) -- `y` lies on the segment `xz`.
* `congruent` (4-ary, `xy ≡ zw`) -- segment `xy` has the same length as
  segment `zw`. Equality of points is *defined* from this (`x = y ↔
  Congruent x y z z` for any `z`), not assumed as a separate primitive
  -- matching Tarski's own presentation, which needs no equality axiom
  beyond first-order logic's built-in one.

This file registers only the vocabulary. The theory `E_n` (the eleven
congruence/betweenness/dimension/parallel/continuity axioms) and the
standard model (`Point n` with distance-based interpretations) are later
work.
-/

/-- The two relation symbols of Tarski's language `L_geom = {B, ≡}`.

Logical form:

```lean
inductive TarskiRelationSymbol where
  | between
  | congruent
```
-/
inductive TarskiRelationSymbol where
  | between
  | congruent

/-- The arity assignment for `L_geom`: `between` is ternary, `congruent`
is `4`-ary.

Logical form:

```lean
def TarskiFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := TarskiRelationSymbol
  arity
    | .between => 3
    | .congruent => 4
```
-/
def TarskiFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := TarskiRelationSymbol
  arity
    | .between => 3
    | .congruent => 4

/-- The signature `L_geom`: `between`/`congruent` as its only relation
symbols, no function symbols, no constant symbols.

Logical form:

```lean
def TarskiFirstOrderSignature : LRA.Logic.Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := TarskiFirstOrderRelations
  Constants := Empty
```
-/
def TarskiFirstOrderSignature : LRA.Logic.Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := TarskiFirstOrderRelations
  Constants := Empty

end LRA.EuclideanSpace
