# check-alt-text.sh

This script file searches all asciidoc files for instances of `xref`, 'image' and 'link'.

To execute the script, navigate to your docs repo and run the following command:

```
check-alt-text <destination path>
```

For example,

```
check-alt-text.sh ~/Documents/mydir/my-repo
```

The output is saved in the following files:

- ~/Documents/mydir/my-repo-20230405151259-all-alt-text.csv shows all instances of alt text.
- `~/Documents/mydir/my-repo-20230405151259-empty-alt-text.csv` shows instances where the alt text is missing: `link`, `xref` and `image` are followed by `[]`.

Example output of a CSV file:

```
.//platform/requirements.adoc,15, xref,worker-nodes[Jobs scheduled on the worker nodes]
```

When imported into an application that displays CSV files, the content is displayed in a table:

| Path to file | line number | type | alt text |
| ------------ | ----------- | ---- | -------- |
| ./platform/requirements.adoc | 15 |  xref | worker-nodes[Jobs scheduled on the worker nodes] |
