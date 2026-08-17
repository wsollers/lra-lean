# Congruence Topic

Congruence records when operations respect an equivalence relation on their
carrier. This is the universal-algebraic condition that lets operations descend
from representatives to quotient classes.

## Core Questions

- If `a ~ b`, must `f a ~ f b`?
- If `a₁ ~ a₂` and `b₁ ~ b₂`, must `op a₁ b₁ ~ op a₂ b₂`?
- Which equivalence-relation hypotheses are needed for quotient projection
  well-definedness?
- How does relation congruence differ from automatic equality substitution?

## Intended Definitions

For operations over a carrier and an equivalence relation, reserve definitions
or theorem names for:

- unary operation congruence;
- binary operation congruence;
- relation requirements combining equivalence and operation congruence;
- quotient-projection well-definedness.

## Example Forms

```text
a ~ b -> f a ~ f b
```

```text
a₁ ~ a₂ -> b₁ ~ b₂ -> op a₁ b₁ ~ op a₂ b₂
```

## Dependency Position

This topic depends on operation syntax and equivalence relations. It belongs to
Universal Algebra rather than intrinsic operation laws because the concept is
about compatibility between operations and a relation.

Expected Lean files:

- `Definition.lean`
- `Theorems.lean`
- `Relationships.lean`
- `Consequences.lean`
- `Examples.lean`
- `FailureModes.lean`
- `All.lean`
