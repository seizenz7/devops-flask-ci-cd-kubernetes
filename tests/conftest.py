"""
Pytest configuration file
Handles setup, fixtures, dan Python path configuration untuk test suite
"""

import sys
from pathlib import Path

# Add root directory to Python path
# WHY: Pytest running dari root folder, tapi needs to import app.py dari root
root_dir = Path(__file__).parent.parent
sys.path.insert(0, str(root_dir))