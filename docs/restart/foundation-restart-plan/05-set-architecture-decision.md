# Step 5: Set Architecture Decision

## Goal

Choose the representation of sets before writing the new Lean foundation.

## Candidate 1: Predicate Sets Over A Carrier

```lean
abbrev LRASet (α : Type u) := α → Prop
```

Strengths:

- simple;
- proof-friendly;
- close to ordinary Lean practice;
- lets the user start proving set algebra quickly.

Cost:

- the book often speaks as if all sets are objects in one universe;
- Lean will expose carriers and universe levels earlier than the prose does.

## Candidate 2: Structured Set Objects

```lean
structure SetObject where
  Carrier : Type u
  member : Carrier → Prop
```

Strengths:

- closer to a universe-of-sets style;
- easier to talk about sets as objects.

Cost:

- more ceremony;
- harder elementary proofs;
- more friction before the user can start proving.

## Candidate 3: Two-Layer Design

Use predicate sets as the proof engine, while documenting a book-facing
vocabulary layer that explains how this represents the notes.

Strengths:

- likely best for learning and progress;
- keeps proofs small;
- gives the book translation a visible home.

Cost:

- requires discipline so the explanatory layer does not become fake structure.

## Initial Preference

Use the two-layer design.

Keep Lean definitions proof-friendly, but document the translation from book
language to Lean language explicitly.

## Open Questions

- Should complement be absolute over a carrier or relative to an explicit
  universe set?
- Should `powerSet` appear in the first core or wait until universe behavior is
  documented?
- Should the first set module use classical logic globally, locally, or not at
  all?

## Acceptance Criteria

- One representation is chosen.
- The book-to-Lean translation is documented.
- Known compromises are listed before implementation begins.
