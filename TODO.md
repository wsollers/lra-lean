# TODO

## Volume I Notes

- Add a definition of **endorelation**: a binary relation whose two inputs
  come from the same carrier, i.e. a relation of type `α → α → Prop`.
  Contrast with a heterogeneous binary relation `α → β → Prop`.
- Before expanding the active set layer, run the foundational dependency review
  in `docs/restart/foundation-restart-plan/05a-foundational-dependency-review.md`
  for relations, functions, algebra, identity, order, and `Grundlagen`.

## Future Multi-Session Projects

- **Full second-order semantics and Löwenheim-Skolem failure.** Build a
  toy full-semantics second-order `Formula`/`Satisfies` (quantifying over
  the literal, unrestricted `Set Domain` -- not Henkin-restricted) and use
  it to demonstrate concretely why full SOL is generally avoided as a
  foundation:
  - The headline textbook counterexample is that full second-order Peano
    Arithmetic (PA₂) is *categorical* -- every model is isomorphic to the
    standard `Nat` -- which directly contradicts upward Löwenheim-Skolem
    (which, for ordinary FOL, guarantees models of every larger infinite
    cardinality once one infinite model exists). Proving this properly
    needs a genuine categoricity theorem (construct an isomorphism from
    `Nat` into an arbitrary model of PA₂, using the induction axiom and
    full comprehension to show it is bijective) -- a substantial,
    textbook-chapter-scale proof, not a quick addition.
  - A smaller, more tractable alternative demonstration (if the full
    categoricity route proves too large): show a small, finite-signature
    property that full second-order quantification can define but no
    first-order formula over the same signature can (e.g. even
    cardinality of the domain, or a connectedness-style property) --
    illustrates the same underlying mechanism (full semantics quantifies
    over the entire powerset, which is strictly stronger than anything
    first-order) without requiring the full categoricity theorem.
  - Explicitly deferred as its own multi-session project, separate from
    the Henkin-semantics work actually in progress (`Model/SecondOrder/`
    or similar) -- full semantics is deliberately *not* built as part of
    that work, per the standard caution (no complete proof system exists
    for it; compactness and Löwenheim-Skolem both fail) that motivated
    building Henkin semantics as the primary second-order semantics in
    the first place.
