#!/usr/bin/env python3
"""Validate generated proof-map data and its published site copy."""

from __future__ import annotations

import argparse
import json
import pathlib
import sys


VALID_STATUSES = {"checked", "pending"}
REQUIRED_NODE_KEYS = {
    "id",
    "module",
    "source",
    "kind",
    "status",
    "ordinal",
    "doc",
    "statementDependencies",
    "proofDependencies",
}


def fail(message: str) -> None:
    raise ValueError(message)


def load_document(path: pathlib.Path) -> dict[str, object]:
    try:
        document = json.loads(path.read_text(encoding="utf-8"))
    except FileNotFoundError:
        fail(f"proof-map data does not exist: {path}")
    except json.JSONDecodeError as error:
        fail(f"proof-map data is not valid JSON: {error}")
    if not isinstance(document, dict):
        fail("proof-map root must be an object")
    return document


def validate_document(document: dict[str, object]) -> dict[str, int]:
    if document.get("schemaVersion") != 1:
        fail("unsupported or missing proof-map schemaVersion")
    nodes = document.get("nodes")
    summary = document.get("summary")
    if not isinstance(nodes, list):
        fail("proof-map nodes must be an array")
    if not isinstance(summary, dict):
        fail("proof-map summary must be an object")

    identifiers: set[str] = set()
    for index, node in enumerate(nodes):
        if not isinstance(node, dict):
            fail(f"node {index} must be an object")
        missing = REQUIRED_NODE_KEYS - node.keys()
        if missing:
            fail(f"node {index} is missing keys: {', '.join(sorted(missing))}")
        identifier = node["id"]
        if not isinstance(identifier, str) or not identifier:
            fail(f"node {index} has an invalid id")
        if identifier in identifiers:
            fail(f"duplicate declaration id: {identifier}")
        identifiers.add(identifier)
        if node["status"] not in VALID_STATUSES:
            fail(f"node {identifier} has an invalid status")

    dependency_count = 0
    checked_count = 0
    pending_count = 0
    for node in nodes:
        assert isinstance(node, dict)
        dependencies: set[str] = set()
        for key in ("statementDependencies", "proofDependencies"):
            values = node[key]
            if not isinstance(values, list) or not all(isinstance(item, str) for item in values):
                fail(f"node {node['id']} has an invalid {key} array")
            dependencies.update(values)
        unknown = dependencies - identifiers
        if unknown:
            fail(f"node {node['id']} references unknown declarations: {', '.join(sorted(unknown))}")
        dependency_count += len(dependencies)
        checked_count += node["status"] == "checked"
        pending_count += node["status"] == "pending"

    expected = {
        "declarations": len(nodes),
        "dependencies": dependency_count,
        "checked": checked_count,
        "pending": pending_count,
    }
    if summary != expected:
        fail(f"proof-map summary mismatch: expected {expected}, found {summary}")
    return expected


def validate_site(data_path: pathlib.Path, site: pathlib.Path) -> None:
    proof_map = site / "proof-map"
    required = [
        proof_map / "index.html",
        proof_map / "proof-map.css",
        proof_map / "proof-map.js",
        proof_map / "data.json",
    ]
    missing = [str(path) for path in required if not path.is_file() or path.stat().st_size == 0]
    if missing:
        fail(f"published proof map is incomplete: {', '.join(missing)}")
    if data_path.read_bytes() != (proof_map / "data.json").read_bytes():
        fail("published proof-map data does not match the generated data")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--data", type=pathlib.Path, required=True)
    parser.add_argument("--site", type=pathlib.Path)
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    try:
        summary = validate_document(load_document(args.data))
        if args.site is not None:
            validate_site(args.data, args.site)
    except (OSError, ValueError) as error:
        print(f"proof-map validation failed: {error}", file=sys.stderr)
        return 1
    print(
        "proof-map validation passed: "
        f"{summary['declarations']} declarations, "
        f"{summary['dependencies']} dependencies, "
        f"{summary['pending']} pending"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
