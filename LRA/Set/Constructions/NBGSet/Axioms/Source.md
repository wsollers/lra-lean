# von Neumann-Bernays-Godel Set Theory Source Notes

This directory mirrors `LRA/Set/ZFC` as the primitive axiom/theorem layer for
the in-house `NBGSet`/`NBGClass` implementation.

- `Axioms/` owns primitive NBG assumptions.
- Each axiom-named theorem folder owns primitive consequences derived from that
  axiom, initially as `sorry` stubs.
- `ClassComprehension/` owns the NBG-specific class-comprehension consequences.

