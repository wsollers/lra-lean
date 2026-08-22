# p0-11 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/VolumeII/NumberSystems`
- Build target: `LRA.VolumeII.NumberSystems`
- Last good stop: spec frozen on disk and ready for implementation

## Brief Summary

`p0-11` is live in the Volume II number-system construction layer.

The selector owner [LRA/VolumeII/NumberSystems/Construction.lean](/F:/repos/lra-lean/LRA/VolumeII/NumberSystems/Construction.lean:1)
still hid the chosen Z/Q/R carriers inside bundled systems. `NumberSystemTower`
recorded only `IntegerSystem`, `RationalSystem`, and a generic
`CofinalRealExtension RationalSystem.FieldModel`, so downstream statements could
not name the exact selected carriers or insist that the real stage remained tied
to the actual selected rational-number system.

The ledger owner [LRA/VolumeII/NumberSystems/ComparisonMatrix.lean](/F:/repos/lra-lean/LRA/VolumeII/NumberSystems/ComparisonMatrix.lean:1)
still exposed detached summaries. `SystemLedger` carried its own arbitrary
`carrier : Type`, and `ComparisonMatrixForZQR` asserted only that some ledgers
exist, without tying them to the selected integer carrier, rational carrier,
real carrier, or the actual canonical embedding maps.

## Exact Repair List

- Change [LRA/VolumeII/NumberSystems/Construction.lean](/F:/repos/lra-lean/LRA/VolumeII/NumberSystems/Construction.lean:1).
  Add explicit `IntegerCarrier`, `RationalCarrier`, and `RealCarrier` fields to
  `NumberSystemTower`, together with equality fields
  `IntegerCarrierMatches`, `RationalCarrierMatches`, and
  `RealCarrierMatches` that tie those carriers to the selected bundled systems.

- Change [LRA/VolumeII/NumberSystems/Construction.lean](/F:/repos/lra-lean/LRA/VolumeII/NumberSystems/Construction.lean:1).
  Replace the real-stage field
  `CofinalRealExtension RationalSystem.FieldModel`
  with the stronger
  `LRA.NumberSystems.RealNumbers.RationalRealExtension RationalSystem`
  so the selected real extension is tied to an actual `RationalNumberSystem`,
  not just an arbitrary dense ordered field with the same carrier.

- Change [LRA/VolumeII/NumberSystems/Construction.lean](/F:/repos/lra-lean/LRA/VolumeII/NumberSystems/Construction.lean:1).
  Update the surrounding documentation for `NumberSystemTower`,
  `NumberSystemTowerExists`, and `BuildNumberSystemTower` so the public theorem
  surface states that the selected carriers remain explicit.

- Change [LRA/VolumeII/NumberSystems/ComparisonMatrix.lean](/F:/repos/lra-lean/LRA/VolumeII/NumberSystems/ComparisonMatrix.lean:1).
  Reindex `SystemLedger` by an explicit carrier parameter
  `SystemLedger (carrier : Type _)` instead of letting each ledger hide its own
  unrelated carrier field.

- Change [LRA/VolumeII/NumberSystems/ComparisonMatrix.lean](/F:/repos/lra-lean/LRA/VolumeII/NumberSystems/ComparisonMatrix.lean:1).
  Introduce a carrier-tied `ZQRComparisonMatrix` structure whose fields are:
  `IntegerLedger : SystemLedger SelectedIntegerModel.Carrier`,
  `RationalLedger : SystemLedger SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel.Carrier`,
  `RealLedger : SystemLedger SelectedCofinalRealExtension.RealModel.Carrier`,
  `IntegerToRationalLedger : CanonicalMapLedger SelectedArchimedeanDenseOrderedFieldExtension.IntegerEmbedding.ToField`,
  and
  `RationalToRealLedger : CanonicalMapLedger SelectedCofinalRealExtension.DenseOrderedFieldEmbedding.ToReal`.

- Change [LRA/VolumeII/NumberSystems/ComparisonMatrix.lean](/F:/repos/lra-lean/LRA/VolumeII/NumberSystems/ComparisonMatrix.lean:1).
  Strengthen `ComparisonMatrixForZQR` from an existence theorem about arbitrary
  detached ledgers to
  `Nonempty (ZQRComparisonMatrix ... )`,
  keeping it proposition-valued while tying the output to the selected carriers
  and actual canonical maps.

- Do not edit [docs/commentary/hover_comments.json](/F:/repos/lra-lean/docs/commentary/hover_comments.json:1).
  It is generated commentary output, not the canonical owner for this P0.

## Acceptance Criteria

- `NumberSystemTower` exposes explicit integer, rational, and real carrier
  fields together with equalities back to the selected systems.
- The real stage in `NumberSystemTower` is tied to
  `RationalRealExtension RationalSystem`.
- `SystemLedger` is indexed by the carrier it summarizes.
- `ComparisonMatrixForZQR` now proves existence of a carrier-tied comparison
  matrix over the selected Z/Q/R carriers and canonical embedding maps.
- `python scripts/validate_structure.py --path LRA/VolumeII/NumberSystems`
  passes.
- `lake build LRA.VolumeII.NumberSystems` passes.

## Blockers Or Dependencies

No earlier open P0 blocks this item. Later wave-4 items may strengthen the
construction-specific input data, but this P0 can be closed by exposing the
selected carriers and canonical maps in the active theorem surface.
