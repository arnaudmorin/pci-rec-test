# Dependencies

Ensure that your system meets the prerequisites:
* terraform  v0.13.4
* ansible

# Configuration

Please create a secret file that will contains credentials. 


```
$ vim ./secrets/openrc
export OS_USERNAME="REPLACE_ME"
export OS_PASSWORD="REPLACE_ME"

```
# Ex. 3 

## Provisioning

Simple run the script as follows. 

Please examinate plan, once checked please approve apply
```
$ ./RUNME
```
The script will pring command to execute to check Web server is up and running


## De-provisioning

Please execute script over docker wrapper as follows.

Please carefully check it and approve it once you are sure

```
$ ./DESTROYME
```

