# p0-11 Verify Result

- Status: `approved`
- Task backend: `main-thread coordinator`
- Verify task id: `main-thread`
- Launched: `2026-08-22`
- Last good stop: verification completed with no bounded correction list

## Verifier Outcome

The spec is correct and implementation-complete.

1. The selector defect is real. `NumberSystemTower` currently hides the chosen
   carriers inside bundled systems, so downstream statements cannot refer to the
   selected Z/Q/R carriers without unpacking implementation details.

2. The proposed `NumberSystemTower` repair is coherent. Adding explicit carrier
   fields plus equality witnesses is the minimal carrier-tied surface change,
   and replacing the real-stage field by
   `LRA.NumberSystems.RealNumbers.RationalRealExtension RationalSystem`
   keeps the real stage attached to an actual selected rational-number system.

3. The ledger defect is real. `SystemLedger` currently stores an arbitrary
   `carrier : Type`, and `ComparisonMatrixForZQR` only proves that some ledgers
   exist. That leaves the theorem compatible with summaries unrelated to the
   selected integer model, rational extension, real extension, or canonical
   embedding maps.

4. The proposed ledger repair is coherent. Reindexing `SystemLedger` by an
   external carrier parameter and introducing a carrier-tied
   `ZQRComparisonMatrix` structure is the bounded way to ensure the theorem
   surface talks about the selected carriers and actual canonical maps.

5. Keeping `ComparisonMatrixForZQR` proposition-valued as
   `Nonempty (ZQRComparisonMatrix ... )` is the right endpoint. It preserves the
   theorem role while tightening the witness type to the selected tower.

6. The validator/build gate is sufficient. The active subject router is
   [LRA/VolumeII/NumberSystems.lean](/F:/repos/lra-lean/LRA/VolumeII/NumberSystems.lean:1),
   so `python scripts/validate_structure.py --path LRA/VolumeII/NumberSystems`
   and `lake build LRA.VolumeII.NumberSystems` are the correct scoped success
   gates.

## Resolution

`p0-11` is ready for implementation on `main`: patch only
`Construction.lean` and `ComparisonMatrix.lean` as specified above, then run
the scoped gates before commit and push.
