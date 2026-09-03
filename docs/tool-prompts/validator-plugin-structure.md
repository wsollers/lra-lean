# Prompt: Create Structure Validator Plugin

You are working in the `lra-lean` repository.

Current repo constraints:

- Do not run `lake build`.
- Do not execute validator gates as part of this task.
- The repository is intentionally in a non-buildable state because legacy
  `LRA/VolumeII/**`, `LRA/VolumeIII/**`, and `LRA/VolumeVII/**` subtrees were
  deleted while imports to some of those modules still remain.
- Do not introduce compatibility shims, deprecated aliases, or temporary bridge
  modules.

Authoritative structure documents to enforce:

- `docs/governance/repository-governance.md`
- `docs/architecture/repository-architecture.md`
- `docs/standards/lean-standards.md`
- `docs/interface-model-standardization-inventory.md`
- Existing validator entrypoints:
  - `scripts/validate_structure.py`
  - `scripts/structure_validator_plugins/folder_structure.py`

Task:

Create a new or expanded validator plugin for `scripts/validate_structure.py`
that enforces the documented repository structure, not just local folder shape.

Required capabilities:

1. Enforce architecture rules derived from the documents above, especially:
   - correct placement of `Interface/ModelTheory`
   - correct placement of `Interface/UniversalAlgebra`
   - correct placement of `Realizations`
   - prohibition of legacy `Construction/ModelTheory` where not explicitly
     allowed
   - prohibition of imports from deleted or forbidden legacy `LRA.Volume*.*`
     modules when those modules are not part of the approved public structure
   - separation between core subject code and quarantined areas such as
     `Examples`, `Failures`, and `Interop` where documented
   - NumberSystems public-interface expectations implied by the architecture

2. Build in an explicit allowlist mechanism:
   - path-scoped exceptions
   - rule-scoped exceptions
   - rationale string per exception
   - stable machine-readable format such as JSON or YAML
   - checked into the repository

3. Make the validator machine-usable and machine-discoverable:
   - `--json` output must remain stable and complete
   - findings should include rule id, severity, path, and message
   - plugin names and supported rules should be discoverable from code or a
     manifest
   - avoid output that only a human can interpret

4. Keep scope limited to validator/plugin design and implementation.
   - Do not repair repository imports in this task.
   - Do not run repo-wide builds.

Deliverables:

- proposed validator architecture
- concrete rule list with rule ids
- allowlist file schema
- implementation plan or code changes
- any new manifest needed for discoverability
- exact files to edit

Known broken import families present in the repo right now:

- `LRA.VolumeII.NumberSystems.Models`
- `LRA.VolumeII.NumberSystems.UniversalProperties`
- `LRA.VolumeII.NumberSystems.CanonicalEmbeddings`
- `LRA.VolumeII.Arithmetic.Model.All`
- `LRA.VolumeII.Integers.Construction`
- `LRA.VolumeIII.RealNumbers.LraReal`
- `LRA.VolumeVII.WithMathlib`

Work by static analysis only. Do not attempt to prove success by building.
