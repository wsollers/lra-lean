# Ordering and Bounds metadata explorer

The pilot extractor treats Lean's compiled environment as the source of truth.
It reads declarations under `LRA.Pilot.OrderBounds`, the supporting `Poset`
structure, and every `@[lraCanonical "..."]` value attached to those
declarations. It emits:

- the elaborated declaration type and documentation;
- declaration kind, compiled module, and canonical concept identifier;
- statement, definition-body, and proof-body dependencies;
- transitive axioms and whether `sorryAx` is present.

From the repository root, regenerate both artifacts with:

```text
lake run lraBoundsExplorer
```

The default outputs are:

```text
build/pilot/order-bounds-metadata.json
build/pilot/order-bounds-explorer.html
```

The HTML is self-contained. Open it directly from the filesystem; it does not
need a local web server or external JavaScript packages. The first two optional
arguments override the JSON and HTML output paths. A third optional argument
overrides the HTML template path.
