# Tool Prompt Pack

This directory contains machine-discoverable prompts for repository maintenance
tasks that must respect the current `lra-lean` repository state.

Current repo state for all prompts in this folder:

- Do not run `lake build`.
- Do not run validator execution as a success gate.
- Do not propose compatibility shims, legacy aliases, or temporary bridge files.
- Work from the documented structure in [PurposeAndArchitecture.md](/F:/repos/lra-lean/PurposeAndArchitecture.md),
  [DESIGN.md](/F:/repos/lra-lean/DESIGN.md), and
  [docs/interface-model-standardization-inventory.md](/F:/repos/lra-lean/docs/interface-model-standardization-inventory.md).
- The repo currently contains deliberate breakage from deleted legacy
  `LRA/VolumeII/**`, `LRA/VolumeIII/**`, and `LRA/VolumeVII/**` subtrees while
  root aggregator files such as `LRA/VolumeII.lean` remain.

Known broken-import families at prompt creation time:

- `LRA.VolumeII.NumberSystems.Models`
- `LRA.VolumeII.NumberSystems.UniversalProperties`
- `LRA.VolumeII.NumberSystems.CanonicalEmbeddings`
- `LRA.VolumeII.Arithmetic.Model.All`
- `LRA.VolumeII.Integers.Construction`
- `LRA.VolumeIII.RealNumbers.LraReal`
- `LRA.VolumeVII.WithMathlib`

These prompts are intended to drive static analysis, planning, and code
generation without attempting a full repo build.
