#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# ==============================================================================
# 2023-10-13  tcodeshare  ISSUE-2 Initial version
# ==============================================================================
import pyfiglet
import sys
from rich.console import Console

# -------------------------------------------------------------------------------
# Supporting functions
# -------------------------------------------------------------------------------
def print_banner(banner):

  title = pyfiglet.figlet_format(banner)
  console = Console()
  console.print(title, style="bold")

# -------------------------------------------------------------------------------
# Main program
# -------------------------------------------------------------------------------
if __name__ == '__main__':
  print_banner (' '.join(sys.argv[1:]))
