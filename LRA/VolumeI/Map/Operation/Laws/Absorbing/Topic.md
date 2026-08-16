# Absorbing Elements Topic

An absorbing element is the opposite kind of distinguished element from an
identity element. An identity leaves the other input unchanged; an absorber
overwrites the other input.

## Core Question

For an operation `op` and element `z`:

```text
LeftAbsorbing op z  := for every a, op z a = z
RightAbsorbing op z := for every a, op a z = z
TwoSidedAbsorbing op z := both laws
```

## Learning Point

For multiplication-like operations, `0` is often absorbing:

```text
0 * a = 0
a * 0 = 0
```

This is different from `0` being neutral for addition:

```text
0 + a = a
a + 0 = a
```

Keeping those two roles separate prevents a lot of confusion.

## Lean Owners

- `Definition.lean`
- `Theorems.lean`
- `Relationships.lean`
- `All.lean`

Future audit files may include `Examples.lean` and `FailureModes.lean`.

