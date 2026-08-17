import LRA.VolumeI.Set.Interface

/-!
Canonical downstream-facing Set interface.

This layer is backend-agnostic: it owns the shared operation capabilities,
law certificates, and generic theorems consumed by later LRA subjects.
Concrete set realizations register instances against this interface.
-/
