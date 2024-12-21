from dataclasses import dataclass


@dataclass
class Style:
    default: str = "\033[0m"
    red: str = "\033[91m"
    green: str = "\033[92m"
    blue: str = "\033[94m"
    white: str = "\033[97m"
