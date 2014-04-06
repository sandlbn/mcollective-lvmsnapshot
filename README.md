mcollective-lvmsnapshot
=======================

Agent to handle lvm snapshots

###Usage:

Create snapshot:

```bash
#mco rpc lvmsnapshot create_snapshot type=percentage size=10 name=lv_snapshot vg_name=vg_root lv_name=lv_root
(or)
#mco rpc lvmsnapshot create_snapshot type=gigabyte size=2 name=lv_snapshot vg_name=vg_root lv_name=lv_root
(or)
#mco rpc lvmsnapshot create_snapshot type=megabyte size=2000 name=lv_snapshot vg_name=vg_root lv_name=lv_root
```

Merge snapshot:

```bash
#mco rpc lvmsnapshot merge_snapshot vg_name=vg_root lv_name=lv_root
```
Remove snapshot:

```bash
#mco rpc lvmsnapshot remove_snapshot vg_name=vg_root lv_name=lv_root
```
Mount snapshot:

```bash
#mco rpc lvmsnapshot mount_snapshot vg_name=vg_root lv_name=lv_root
```
Umount snapshot:

```bash
#mco rpc lvmsnapshot umount_snapshot
```
