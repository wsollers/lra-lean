# Step 2: Scope Stops At Sets

## Goal

Keep the restart focused on the logic prelude and set foundations until the set
architecture is settled.

## In Scope

- Lean-native logical proof patterns;
- a tiny Bourbaki-style propositional object logic;
- placeholder locations for first-order logic, proof theory, and model theory;
- set representation;
- membership;
- subset and equality;
- elementary set operations;
- elementary set algebra theorem statements;
- source-grounding against Volume I set-theory material;
- diagrams and governance needed to explain the set architecture.

## Out Of Scope

- relation algebra;
- functions as relations;
- equivalence relations and quotients;
- order theory;
- cardinality;
- natural numbers, integers, rationals, and reals;
- Blueprint expansion beyond diagrams needed to understand set architecture.

## Rule

Later topics may inform design questions, but they must not force substantive
Lean declarations during the logic-and-set phase.

Model theory is accommodated as a future location, but it is not part of the
restart core. Its initial file should contain only a wiring test and an
explanatory module comment.

## Acceptance Criteria

- The first restart milestone has no relation/function/order/cardinality/number
  declarations.
- Any later-layer pressure is recorded as an open question rather than coded.
