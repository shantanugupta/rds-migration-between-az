# rds-migration-between-az

In this process I am moving servers spread across different availability zones to single availability zone. Assumption is sever is not on MultiAZ already.

## Migration Steps
1. Enable MultiAZ
2. Sleep until server is available post step 1
3. Reboot the instance with failover
4. Sleep until server is available post step 3
5. Disable MultiAZ

This script reads the list of servers from `rds.txt` in [BulkProcess.sh](./BulkProcess.sh). 

Expected file format for `rds.txt` is:
```
server1,tagValue
server2,tagValue
#server2,tagValue - If any line starts with #, it's skipped for processing
```
List of servers are read from `rds.txt` file and [switch-az.sh](./switch-az.sh) is invoked for each server in background. All the processing of [switch-az.sh](./switch-az.sh) gets pushed to logs folder with name `/output`

