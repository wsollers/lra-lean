# Generic Operation Laws Proof Readiness Audit

This audit records the state after the initial scaffold batches for generic
operation laws.

## Import Order

`All.lean` follows the learning order:

1. Closure
2. EquationalLogic
3. Identity
4. Associative
5. Commutative
6. Absorbing
7. Cancellation
8. Distributive
9. Idempotent
10. Nilpotent
11. Inverse
12. SignNegation
13. OrderCompatibility
14. NumberEmbeddings

## Concept Shape

Each topic has the standard concept-family shape:

- `Definition.lean`
- `Theorems.lean`
- `Relationships.lean`
- `Examples.lean`
- `FailureModes.lean`
- `All.lean`
- `Topic.md`
- `ProofOrder.md`
- `source.md`

## Naming Audit

The current naming conventions are usable for proof work:

- direct law application uses `LawName.apply`;
- two-sided concepts use `.left`, `.right`, and `.of_left_right`;
- failure predicates use `Fails...`;
- examples and failure modes use concrete carrier names in theorem names;
- transfer theorems name the hypothesis that performs the transfer, such as
  `Commutative.left_identity_to_right_identity`.

## Proof Order Audit

The existing `ProofOrder.md` files are concept-facing learning guides. They do
not need to list every scaffold theorem verbatim before proof work starts.

When a proof pass begins for a topic, update that topic's `ProofOrder.md` only
if the theorem file has drifted from the checklist in a way that would confuse
the proof sequence.

## Ready For Proofs

Start proof implementation in this order:

1. `Closure/Theorems.lean`
2. `Closure/Relationships.lean`
3. `Closure/Examples.lean`
4. `Closure/FailureModes.lean`
5. `EquationalLogic/Theorems.lean`
6. `EquationalLogic/Relationships.lean`
7. `EquationalLogic/Examples.lean`
8. `EquationalLogic/FailureModes.lean`
9. `Identity/Theorems.lean`
10. `Identity/Relationships.lean`
11. `Identity/Examples.lean`
12. `Identity/FailureModes.lean`

After those are complete, continue through the same learning order used by
`All.lean`.

## Audit Result

The scaffold is ready to begin proof work at `Closure`.

