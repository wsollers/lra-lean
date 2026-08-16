# Sign And Negation Topic

Sign and negation laws record how additive inverse, multiplication,
subtraction, and distinguished elements such as `0` and `1` interact.

This is not the first place additive inverse is defined. The topic explains
what becomes provable after additive inverse, multiplication, distributivity,
and absorbing laws have been combined.

## Core Questions

- Why does multiplying by negative one produce additive inverse?
- Why is the product of two negatives positive?
- Why does subtraction distribute through multiplication?
- Why is additive inverse involutive?
- Which hypotheses are actually used in each proof?

## Intended Theorems

Reserve theorem families for:

- multiplication by negative one;
- left and right multiplication by a negated element;
- product of two negated elements;
- distributivity over subtraction;
- additive inverse involution.

## Example Forms

```text
(-1) * a = -a
```

```text
(-a) * (-b) = a * b
```

```text
a * (b - c) = a * b - a * c
```

```text
-(-a) = a
```

## Dependency Position

This topic should come after:

1. identity and absorbing elements;
2. additive inverse;
3. distributivity;
4. subtraction as addition of additive inverse.

It should come before Volume II concrete number systems reuse these facts.

## Planned Lean Shape

This directory is scaffold-only until implementation.

Expected Lean files:

- `Definition.lean`
- `Theorems.lean`
- `Relationships.lean`
- `Examples.lean`
- `FailureModes.lean`
- `All.lean`

