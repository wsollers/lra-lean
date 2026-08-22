from __future__ import annotations

from pathlib import Path

from . import Finding, ValidationContext


name = "folder_structure"

MODEL_THEORY_REQUIRED = {"LStructure.lean", "Theory.lean", "Model.lean"}
MODEL_THEORY_FORBIDDEN = {"Axioms.lean", "Satisfaction.lean", "Structure.lean"}
CORE_QUARANTINE_DIRS = {"Examples", "Failures", "Interop", "Realizations"}
CORE_QUARANTINE_FILES = {
    "Examples.lean",
    "Failures.lean",
    "Interop.lean",
    "Realizations.lean",
}


def run(context: ValidationContext, args: object) -> list[Finding]:
    findings: list[Finding] = []
    for target in context.target_paths:
        findings.extend(_check_target(context.repo_root, target, args))
    return findings


def _check_target(repo_root: Path, target: Path, args: object) -> list[Finding]:
    findings: list[Finding] = []

    for directory in _walk_dirs(target):
        findings.extend(_check_model_theory_dir(directory))
        findings.extend(_check_universal_algebra_dir(directory))
        findings.extend(_check_core_import_quarantine(repo_root, directory))
        findings.extend(_check_legacy_modeltheory(directory, args))

    return findings


def _walk_dirs(target: Path) -> list[Path]:
    if target.is_file():
        return [target.parent]
    return [target, *(path for path in target.rglob("*") if path.is_dir())]


def _check_model_theory_dir(directory: Path) -> list[Finding]:
    model_theory_dir = directory / "Interface" / "ModelTheory"
    if not model_theory_dir.is_dir():
        return []

    findings: list[Finding] = []
    present_files = {path.name for path in model_theory_dir.glob("*.lean")}
    missing = MODEL_THEORY_REQUIRED - present_files
    forbidden = MODEL_THEORY_FORBIDDEN & present_files

    for filename in sorted(missing):
        findings.append(
            Finding(
                severity="error",
                path=model_theory_dir / filename,
                message=f"missing required Interface/ModelTheory file `{filename}`",
            )
        )

    for filename in sorted(forbidden):
        findings.append(
            Finding(
                severity="error",
                path=model_theory_dir / filename,
                message=(
                    f"legacy Interface/ModelTheory file `{filename}` is not allowed; "
                    "use `LStructure.lean`, `Theory.lean`, and `Model.lean`"
                ),
            )
        )

    return findings


def _check_universal_algebra_dir(directory: Path) -> list[Finding]:
    ua_dir = directory / "Interface" / "UniversalAlgebra"
    if not ua_dir.is_dir():
        return []

    signature_definition = ua_dir / "Signature" / "Definition.lean"
    if signature_definition.is_file():
        return []

    return [
        Finding(
            severity="error",
            path=signature_definition,
            message=(
                "missing required universal-algebra signature entrypoint "
                "`Interface/UniversalAlgebra/Signature/Definition.lean`"
            ),
        )
    ]


def _check_core_import_quarantine(repo_root: Path, directory: Path) -> list[Finding]:
    findings: list[Finding] = []

    for file_path in directory.glob("*.lean"):
        if _is_quarantined_leaf(file_path):
            continue

        try:
            source = file_path.read_text(encoding="utf-8")
        except UnicodeDecodeError:
            findings.append(
                Finding(
                    severity="error",
                    path=file_path,
                    message="unable to read file as UTF-8 during structure validation",
                )
            )
            continue

        for line in source.splitlines():
            stripped = line.strip()
            if not stripped.startswith("import "):
                continue
            if ".Examples" in stripped or ".Failures" in stripped:
                findings.append(
                    Finding(
                        severity="error",
                        path=file_path.relative_to(repo_root),
                        message=(
                            "core file imports a quarantined Examples/Failures module: "
                            f"`{stripped}`"
                        ),
                    )
                )

    return findings


def _is_quarantined_leaf(file_path: Path) -> bool:
    if file_path.name in CORE_QUARANTINE_FILES:
        return True
    if any(part in CORE_QUARANTINE_DIRS for part in file_path.parts):
        return True

    stem = file_path.stem.lower()
    return "example" in stem or "failure" in stem


def _check_legacy_modeltheory(directory: Path, args: object) -> list[Finding]:
    legacy_dir = directory / "Construction" / "ModelTheory"
    if not legacy_dir.is_dir():
        return []

    if getattr(args, "allow_legacy_construction_modeltheory", False):
        return []

    return [
        Finding(
            severity="error",
            path=legacy_dir,
            message=(
                "legacy `Construction/ModelTheory` location is disallowed for validated "
                "targets; move concrete backends under `Realizations/`"
            ),
        )
    ]
