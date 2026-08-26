# Tarski-Grothendieck Set Theory Source Notes

This directory mirrors `LRA/Set/ZFC` as the primitive axiom/theorem layer for
the in-house `TGSet` implementation.

- `Axioms/` owns primitive TG assumptions.
- Each axiom-named theorem folder owns primitive consequences derived from that
  axiom, initially as `sorry` stubs.
- `GrothendieckUniverse/` owns the TG-specific universe axiom consequences.

