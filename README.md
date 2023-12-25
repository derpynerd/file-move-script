# file-move-script

A bash shell script which can be used to transfer files from one folder to another respective to its last modified date. It takes in three parameters -

- First parameter can either be `-O` or `-N`. With `-O`, files older than the given date are moved. With `-N`, files newer than the given date are moved.
- Second parameter is the date in the format `dd/mm/yyyy`. Files older or newer (depending upon the first parameter) than this date are moved.
- Third parameter is name of a folder in the current directory where files are moved. This folder is created if not already existing.

Shell script mymov only moves files and DOES NOT move folders. After moving the files, shell script also displays total number of files moved and total number of files existing in the current directory.

Example:  
```
c:\ABC> mymov  -O  05/08/2015  XYZ
```
Moves those files of current directory i.e. `c:\ABC` which are older than `05/08/2015` to the folder `XYZ` existing in `c:\ABC`. This folder is created if not already existing.
