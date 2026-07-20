# Step 6: First Set Core

## Goal

Build the smallest new Lean set foundation that lets the user begin proving
real statements immediately.

## Proposed Skeleton

```text
LRA/
  Foundation.lean
  Foundation/
    Sets.lean
```

## Initial Definitions

- membership;
- empty set;
- universal set, if the architecture chooses ambient carriers;
- subset;
- set equality through extensionality;
- proper subset;
- union;
- intersection;
- set difference;
- complement, after the relative/absolute decision is made;
- symmetric difference;
- power set, if its universe behavior is clear enough.

## Initial Theorem Statements

- extensionality;
- subset reflexivity;
- subset transitivity;
- subset antisymmetry / set equality by mutual inclusion;
- union commutativity and associativity;
- intersection commutativity and associativity;
- union/intersection identity laws;
- absorption laws;
- distributive laws;
- complement involution, if using classical logic;
- De Morgan laws;
- monotonicity and antitonicity of basic operations.

## Proof Policy

- Definitions must be real.
- Theorem statements must be mathematically honest.
- Proofs may use `sorry`.
- Prefer short theorem statements that can be completed by hand.
- Avoid large umbrella theorems until the individual clauses exist.

## Acceptance Criteria

- The first set core compiles.
- The theorem statements are small enough to serve as proof exercises.
- The file contains no later-layer declarations.
