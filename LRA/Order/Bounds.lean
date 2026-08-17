import LRA.Order.Bounds.UpperBound.Definition
import LRA.Order.Bounds.LowerBound.Definition
import LRA.Order.Bounds.BoundedAbove.Definition
import LRA.Order.Bounds.BoundedBelow.Definition
import LRA.Order.Bounds.Bounded.Definition
import LRA.Order.Bounds.GreatestElement.Definition
import LRA.Order.Bounds.GreatestElement.Theorems
import LRA.Order.Bounds.GreatestElement.Relationships
import LRA.Order.Bounds.LeastElement.Definition
import LRA.Order.Bounds.LeastElement.Theorems
import LRA.Order.Bounds.LeastElement.Relationships
import LRA.Order.Bounds.MaximalElement.Definition
import LRA.Order.Bounds.MaximalElement.Relationships
import LRA.Order.Bounds.MinimalElement.Definition
import LRA.Order.Bounds.MinimalElement.Relationships
import LRA.Order.Bounds.Supremum.Definition
import LRA.Order.Bounds.Supremum.Theorems
import LRA.Order.Bounds.Infimum.Definition
import LRA.Order.Bounds.Infimum.Theorems
import LRA.Order.Bounds.LeastUpperBoundProperty.Definition
import LRA.Order.Bounds.GreatestLowerBoundProperty.Definition

/-!
Canonical foundational bounds vocabulary.

Backend-neutral extrema, supremum, and infimum theorems are exposed here.
Set-algebra interaction theorems and top/bottom definitions remain outside this
aggregate until their set-interface dependencies have canonical paths.
-/
