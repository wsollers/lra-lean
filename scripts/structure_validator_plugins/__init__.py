from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
from typing import Protocol


@dataclass(frozen=True)
class Finding:
    severity: str
    path: Path
    message: str


@dataclass(frozen=True)
class ValidationContext:
    repo_root: Path
    target_paths: tuple[Path, ...]


class ValidatorPlugin(Protocol):
    name: str

    def run(self, context: ValidationContext, args: object) -> list[Finding]:
        ...

