# Generic Operation Laws Topic

This topic is the Volume I learning spine for laws of arbitrary operations.
It is intentionally prior to concrete number systems.

## Scope

The project scope is Volume I generic operation laws:

- identity laws: left, right, two-sided;
- closure for arbitrary operations and its relationship to typed
  endo-operations;
- coincidence and uniqueness of identity elements;
- neutral and unit terminology as uses of identity language;
- associativity as a separate law;
- commutativity as a separate law;
- cancellation laws;
- absorbing-element laws;
- distributivity laws for two operations;
- idempotence;
- nilpotence;
- order compatibility;
- equational logic for applying equality through operations;
- sign and negation rules as derived interaction laws;
- number embeddings and mixed-carrier operations;
- inverse laws only after identity and associativity are understood.

No concrete carrier such as natural numbers, fractions, rationals, integers, or
reals owns these concepts. Concrete number-system modules in Volume II certify
that their operations satisfy these concepts.

## Canonical Lean Owners

The canonical Lean concept tree is:

- `Identity/Definition.lean`
- `Identity/Theorems.lean`
- `Identity/Relationships.lean`
- `Associative/Definition.lean`
- `Associative/Theorems.lean`
- `Associative/Relationships.lean`
- `Inverse/Definition.lean`
- `Inverse/Theorems.lean`
- `Inverse/Relationships.lean`

Additional scaffold-only topic directories reserve the intended project shape
before Lean declarations are introduced.

The markdown files in this topic are planning, audit, and learning scaffolds.
They do not replace the Lean files.

## Learning Order

1. Define arbitrary operations with possibly different input and output types.
2. Define closure as the condition that an arbitrary operation returns to the
   intended carrier.
3. Explain that a binary endo-operation has closure by its type.
4. Define left identity and right identity.
5. Define two-sided identity as both left and right identity.
6. Prove the projection theorems.
7. Prove that a left identity and a right identity coincide.
8. Prove uniqueness of a two-sided identity.
9. Explain neutral element and unit element terminology as identity language.
10. Define associativity separately.
11. Prove what associativity permits and what it does not permit.
12. Define commutativity separately and prove how it transfers left/right laws.
13. Combine associativity with identity.
14. Introduce cancellation as its own law.
15. Introduce absorbing elements and separate them from identity elements.
16. Introduce distributivity as interaction between two operations.
17. Introduce idempotence as a sibling law, mainly for set and lattice style
    operations.
18. Introduce nilpotence after iteration and absorbing elements are clear.
19. Introduce equational logic for replacing equals inside operation
    expressions.
20. Introduce sign and negation rules as theorems from additive inverses,
    multiplication, and distributivity.
21. Introduce order compatibility once order concepts are stable.
22. Introduce number embeddings and mixed-carrier operations before Volume II
    begins certifying concrete number-system interactions.
23. Only then introduce inverse laws as the first major orchestration topic.

## Boundary With Volume II

Volume II should not be the first place these generic facts are learned.
Volume II should prove:

- the concrete operation is defined;
- the concrete operation is well-defined if it descends through equivalence;
- the concrete operation is total on the intended carrier;
- the concrete operation satisfies the relevant Volume I generic laws.

After that, Volume II should use the generic theorems from this topic.
