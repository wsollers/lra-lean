# Order-Relation Repair Decisions

R11. Every axiomatic-set `Set` provider must register its own `instance (priority := high) : HasPairing <Carrier> <Carrier> <Carrier>` using that provider's real pairing construction, so generic `OrderedPair` does not silently fall back to `Prod`; predicate-backed providers are the documented exception because they have no same-carrier pairing object and intentionally rely on the fallback, as noted in `LRA/Set/Interop/Providers/LRA/Predicate.lean` and `LRA/Set/Interop/Providers/Mathlib/Predicate.lean`.
