import LRA.AlgebraicStructures.CommutativeMonoid.Interface.Laws.Definition
import LRA.AlgebraicStructures.Monoid.Interface.Definitions.ConceptSignature

namespace LRA.AlgebraicStructures

/--
`CommutativeMonoidConceptSignature` The UA-level signature for a commutative monoid is exactly `Monoid`'s — commutativity is a `Laws`-level property (`MultiplicativeCommutativeLaws`), not a new signature element.

Predicate logic:

  abbrev CommutativeMonoidConceptSignature :=
    MonoidConceptSignature

Predicate logic (unfolded):

  abbrev CommutativeMonoidConceptSignature :=
    MonoidConceptSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev CommutativeMonoidConceptSignature :=
  MonoidConceptSignature
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
abbrev CommutativeMonoidConceptSignature :=
  MonoidConceptSignature

end LRA.AlgebraicStructures
