# Right Identity

## Informal Meaning

An element is a right identity for an operation when placing it on the right
side of any input leaves that input unchanged.

For an operation `op` and element `e`, the intended statement is:

```text
for every a, op a e = a
```

## Learning Point

Right identity is only a right-sided promise. It says nothing by itself about
`op e a`.

## Implementation Target

Lean owner: `Identity/Definition.lean`.

The direct application theorem belongs in `Identity/Theorems.lean`.

