#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# ==============================================================================
# 2023-10-13  tcodeshare  ISSUE-2 Initial version
# ==============================================================================
import argparse
import sys

# -------------------------------------------------------------------------------
# Supporting functions
# -------------------------------------------------------------------------------

def cre_opt_parser():

  allowed_choices = [ 'titi' ,'toto' ,'tata' ]

  parser = argparse.ArgumentParser(
      formatter_class=argparse.ArgumentDefaultsHelpFormatter)

  parser.add_argument(
      '-t',
      '--target',
      metavar="TARGET",
      dest='target',
      help='Specify target',
      choices=allowed_choices,
      required=True)

  return parser
# -------------------------------------------------------------------------------
# Main program
# -------------------------------------------------------------------------------
if __name__ == '__main__':

  parser = cre_opt_parser()
  args, opts = parser.parse_known_args()

  print ( args.target )
