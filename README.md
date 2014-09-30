#Drupal Module Renamer

Rename Drupal modules: creates a new module, copy all files over, rename files, directories and strings, such as functions, includes.

Warning: do not use it without a thorough check after the process!

Usage:
  Single module

    $ python -O rename.py NAME_FROM NAME_TO PATH_TO_MODULE

  Group of modules

    $ sh controller.sh NAME_FROM NAME_TO “site-name” PATH_TO_MODULES


