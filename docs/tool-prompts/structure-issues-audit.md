# Prompt: Audit Current Structure Issues And Proposed Solutions

You are working in the `lra-lean` repository.

Current repo constraints:

- Do not run `lake build`.
- Do not execute validator gates.
- Do not propose compatibility shims, temporary legacy wrappers, or alias files.
- The repository currently has known broken imports because legacy
  `LRA/VolumeII/**`, `LRA/VolumeIII/**`, and `LRA/VolumeVII/**` subtrees were
  deleted.

Authoritative documents:

- `docs/governance/repository-governance.md`
- `docs/architecture/repository-architecture.md`
- `docs/standards/lean-standards.md`
- `docs/interface-model-standardization-inventory.md`

Existing validator implementation to compare against:

- `scripts/validate_structure.py`
- `scripts/structure_validator_plugins/folder_structure.py`

Task:

Identify the current repository structure issues and propose architecture-correct
solutions.

The result should answer:

1. What documented structure rules already exist?
2. Which current files or imports violate those rules?
3. Which issues are validator coverage gaps versus actual repository placement
   problems?
4. What is the proposed fix for each issue?
5. Which fixes are direct import rewires, which are moves/renames, and which are
   validator enhancements?
6. What should be fixed first to reduce blast radius?

Required output shape:

- a machine-readable issue inventory table
- one row per issue
- fields: `issue_id`, `category`, `severity`, `path`, `evidence`,
  `proposed_solution`, `requires_move`, `requires_import_rewire`,
  `requires_validator_change`, `notes`

Focus areas:

- forbidden imports of deleted `LRA.Volume*.*` modules
- NumberSystems architecture drift
- improper or legacy `ModelTheory` placement
- improper `UniversalAlgebra` placement
- `Realizations` placement and usage
- validator blind spots

Known broken import families to seed the audit:

- `LRA.VolumeII.NumberSystems.Models`
- `LRA.VolumeII.NumberSystems.UniversalProperties`
- `LRA.VolumeII.NumberSystems.CanonicalEmbeddings`
- `LRA.VolumeII.Arithmetic.Model.All`
- `LRA.VolumeII.Integers.Construction`
- `LRA.VolumeIII.RealNumbers.LraReal`
- `LRA.VolumeVII.WithMathlib`

Work statically from the repository contents and the documents above. Do not
build.
