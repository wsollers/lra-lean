# Number-Systems Rewrite Notes

The streamlined Markdown files are authoritative for mathematical meaning and exposition order.

## Required distinction

A proof placeholder is acceptable:

```lean
theorem final_statement : actual_mathematical_proposition := by
  sorry
```

A placeholder definition is not acceptable:

```lean
def mathematical_object := True
```

Nor is a theorem whose title claims mathematics but whose conclusion is only `True`.

## Construction policy

1. Define representative carriers explicitly.
2. Define equivalence relations explicitly.
3. State and prove that each relation is an equivalence relation.
4. Define quotient carriers.
5. Define representative operations.
6. State representative-independence theorems.
7. Descend operations to quotients.
8. State algebraic, order, embedding, universal-property, and completeness theorems.
9. Leave only proof bodies as `sorry`.

## Real-construction separation

Keep distinct:

- Dedekind cuts;
- Cauchy sequences of rationals;
- Cantor nested intervals mediated by endpoint Cauchy sequences;
- primitive nested rational intervals modulo persistent cross-level overlap;
- dyadic expansions;
- interval arithmetic over an already constructed real field.

The primitive interval quotient must not be implemented as interval arithmetic over an existing real field.

## Generation policy

The Blueprint TeX is generated from these Markdown files in manifest order. Lean declarations and dependency metadata are attached through a separate declaration manifest so prose and formal identifiers do not drift.
