# Left Identity

## Informal Meaning

An element is a left identity for an operation when placing it on the left side
of any input leaves that input unchanged.

For an operation `op` and element `e`, the intended statement is:

```text
for every a, op e a = a
```

## Learning Point

Left identity is only a left-sided promise. It says nothing by itself about
`op a e`.

That distinction is the point of keeping left and right identity separate.

## Implementation Target

Lean owner: `Identity/Definition.lean`.

The direct application theorem belongs in `Identity/Theorems.lean`.

