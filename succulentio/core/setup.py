from typing import Optional

from .manager import SucculentManager


def setup(
    *,
    adapters: Optional[list] = None,
    middleware: Optional[list] = None,
) -> SucculentManager:
    return SucculentManager()
