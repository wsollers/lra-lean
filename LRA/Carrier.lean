import LRA.Carrier.Finiteness
import LRA.Carrier.Countability

/-!
Canonical Carrier subject.

`LRA.Carrier` owns Prop-valued predicates about a bare carrier type --
"is this type finite/countable/uncountable" -- as distinct from
properties of a specific relation or function on it (`LRA.Relation`/
`LRA.Function`, which this subject is built directly from) or
comparisons *across* different types (`LRA.Cardinality`, which
consumes this subject's predicates rather than owning its own copies).

`IsFinite`/`IsInfinite` live in `Finiteness.lean`; `IsCountable`/
`IsCountablyInfinite`/`IsUncountable` live in `Countability.lean`.
-/
