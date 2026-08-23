# Prompt: Repopulate Volume Aggregators From LaTeX TOC

You are working in the `lra-lean` repository.

Current repo constraints:

- Do not run `lake build`.
- Do not run validator gates.
- Do not migrate old `VolumeI...VolumeVII` subtree content back into `LRA/`.
- Do not create compatibility shims.
- Legacy volume subtrees under `LRA/VolumeII/**`, `LRA/VolumeIII/**`, and
  `LRA/VolumeVII/**` were intentionally removed. Root aggregator files such as
  `LRA/VolumeII.lean` still exist and should remain as aggregators only.

Relevant source material:

- root aggregator files:
  - `LRA/VolumeI.lean`
  - `LRA/VolumeII.lean`
  - `LRA/VolumeIII.lean`
  - `LRA/VolumeVII.lean`
- LaTeX/blueprint sources:
  - `blueprint/src/content.tex`
  - `blueprint/src/macros/common.tex`
  - any included TOC-driving TeX files referenced from `blueprint/src/`
- architecture context:
  - `PurposeAndArchitecture.md`
  - `DESIGN.md`

Task:

Create or revise a script that populates or repopulates the root Lean volume
aggregators according to the LaTeX table of contents order, while importing from
the actual `LRA/` tree rather than from deleted legacy `LRA/Volume*/**`
subtrees.

Required behavior:

1. Read the LaTeX TOC order from the blueprint sources.
2. Map TOC entries to existing `LRA/` modules.
3. Generate root aggregator files in book order, not filesystem alphabetical
   order.
4. Skip entries that no longer have a valid `LRA/` module, but report them.
5. Produce a machine-readable report of:
   - included modules
   - skipped TOC entries
   - ambiguous mappings
   - missing modules
6. Keep aggregators as thin import-only files.

Constraints:

- do not build
- do not reintroduce deleted legacy module trees
- do not add shim modules to satisfy old names
- surface ambiguity instead of guessing silently

Deliverables:

- script design or implementation
- mapping strategy from TOC nodes to `LRA/` modules
- exact files to edit
- report format

Known context:

- there are still imports elsewhere in the repo pointing at deleted legacy
  modules such as `LRA.VolumeII.NumberSystems.Models`,
  `LRA.VolumeIII.RealNumbers.LraReal`, and `LRA.VolumeVII.WithMathlib`
- this task is only about aggregator regeneration, not import repair

Work statically from the repository and TeX sources. Do not build.
