import LRA.Function.Properties
import LRA.Function.Structures.PartialFunction.Definition

/-!
Named bundles of function data.

`PartialFunction` lives here because it carries data — a domain of definition
and a value on it — rather than being a property of an arrow. Injective,
surjective, and bijective add no data and remain properties.
-/
