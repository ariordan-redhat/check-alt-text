# check-alt-text.sh

This script file searches all asciidoc files for instances of xref, image and link.

To execute the script, navigate to your docs repo and run the following command:

check-alt-text <destination path>

For example,

check-alt-text.sh ~/Documents/mydir/aap

The output is saved in the following files:

~/Documents/mydir/aap-20230405151259-all-alt-text.csv shows all instances of alt text.

~/Documents/mydir/aap-20230405151259-empty-alt-text.csv shows instances where the alt text is missing: links, xrefs and images are followed by `[]`.

