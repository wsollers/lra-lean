from __future__ import annotations

import argparse
import importlib
import json
import sys
from pathlib import Path

from structure_validator_plugins import Finding, ValidationContext


DEFAULT_PLUGIN = "folder_structure"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Validate repository folder/file structure against LRA interface, "
            "model-theory, universal-algebra, and realization standards."
        )
    )
    parser.add_argument(
        "--path",
        dest="paths",
        action="append",
        default=[],
        help=(
            "Repo-relative path to validate. May be repeated. "
            "Defaults to `LRA` when omitted."
        ),
    )
    parser.add_argument(
        "--plugin",
        dest="plugins",
        action="append",
        default=[],
        help=(
            "Validator plugin to run. May be repeated. "
            f"Defaults to `{DEFAULT_PLUGIN}`."
        ),
    )
    parser.add_argument(
        "--allow-legacy-construction-modeltheory",
        action="store_true",
        help="Allow legacy `Construction/ModelTheory` locations in validated targets.",
    )
    parser.add_argument(
        "--json",
        action="store_true",
        help="Emit machine-readable JSON findings instead of text.",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    repo_root = Path(__file__).resolve().parents[1]
    requested_paths = args.paths or ["LRA"]
    target_paths = tuple(_resolve_target(repo_root, path) for path in requested_paths)

    plugins = args.plugins or [DEFAULT_PLUGIN]
    findings: list[Finding] = []
    context = ValidationContext(repo_root=repo_root, target_paths=target_paths)

    for plugin_name in plugins:
        module = importlib.import_module(
            f"structure_validator_plugins.{plugin_name}"
        )
        findings.extend(module.run(context, args))

    findings.sort(key=lambda item: (item.severity, str(item.path), item.message))

    if args.json:
        print(
            json.dumps(
                [
                    {
                        "severity": finding.severity,
                        "path": str(finding.path),
                        "message": finding.message,
                    }
                    for finding in findings
                ],
                indent=2,
            )
        )
    else:
        if findings:
            for finding in findings:
                print(
                    f"{finding.severity.upper()}: {finding.path}: {finding.message}"
                )
        else:
            validated = ", ".join(str(path.relative_to(repo_root)) for path in target_paths)
            print(f"Structure validation passed for {validated}.")

    return 1 if any(finding.severity == "error" for finding in findings) else 0


def _resolve_target(repo_root: Path, target: str) -> Path:
    path = (repo_root / target).resolve()
    if not path.exists():
        raise SystemExit(f"Target path does not exist: {target}")
    try:
        path.relative_to(repo_root)
    except ValueError as exc:
        raise SystemExit(f"Target path escapes repo root: {target}") from exc
    return path


if __name__ == "__main__":
    sys.exit(main())

