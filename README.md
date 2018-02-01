# Semi automation for db imports in Wordpress

This is an semi automation for the tedious task of importing a live database into a local one

The bash script needs execution permissions so give
```
sudo chmod +x /path/to/live-to-local-db.sh
```
a go.

___ This script inlines the password on the shell.  ___
You won't see it, but it will be saved in your bash history.

You could use something like expect to find a workaround.

Running the script:
```
/path/to/live-to-local-db.sh
```

TIPS:
* you might need to flush your rewrite rules after importing the database
  * VIA GUI: dashboard -> settings -> permalinks -> save changes
