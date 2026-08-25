# Linux Fundamentals Notes

These notes are my cleaned summary of the Linux classes in the Data Engineering Bootcamp.

## Why Linux Matters

Linux is widely used in data engineering because many servers, cloud environments, databases, containers, and data-processing systems run on Linux-based operating systems.

Some reasons Linux is widely adopted include:

- open source
- free to use in many distributions
- wide variety of distributions
- strong user, group, and permission controls
- lightweight operation
- strong support for scripting and automation
- suitability for remote server administration

## The Linux Kernel

The **kernel** is the core part of an operating system responsible for managing hardware and system resources.

Its responsibilities include:

- CPU scheduling
- memory management
- process management
- communication with storage and other devices
- access to hardware resources

Linux itself is technically a kernel. A complete operating system built around it is commonly called a **Linux distribution**.

Examples include Ubuntu, Debian, Fedora, Red Hat Enterprise Linux, and Rocky Linux.

## Linux Filesystem

The Linux filesystem begins at the root directory:

```bash
/
```

Some important directories include:

- `/bin` - traditionally contains essential user commands
- `/sbin` - traditionally contains system administration commands
- `/home` - user home directories
- `/etc` - system configuration files
- `/var` - variable data such as logs
- `/tmp` - temporary files

On modern distributions, some of these locations may be linked to directories under `/usr`.

## Why Use the Command Line?

The command line is useful because it is:

- fast for many tasks
- scriptable
- suitable for automation
- useful for remote server administration
- easy to combine into larger workflows

## Anatomy of a Command

```text
command [options] [arguments]
```

Example:

```bash
ls -la /home
```

- `ls` is the command
- `-la` contains options
- `/home` is the argument

## Navigation

```bash
whoami
pwd
ls
ls -a
ls -la
cd /
cd ~
cd ..
```

Files beginning with `.` are normally hidden.

## Viewing Files

```bash
cat file.txt
tac file.txt
more file.txt
less file.txt
head -n 5 file.txt
tail -n 5 file.txt
tail -f logfile.log
```

`tail -f` is particularly useful when monitoring a log file that is still being written to.

## Command History

```bash
history
!!
!2
```

`!!` repeats the previous command, while `!2` runs command number 2 from history. These should be used carefully because they execute commands directly.

## Copying and Removing Files

```bash
cp source.txt destination.txt
cp -r source_directory destination_directory
rm file.txt
rm -r directory
```

## Standard Streams and Redirection

Linux programs commonly work with:

1. standard input (`stdin`)
2. standard output (`stdout`)
3. standard error (`stderr`)

Overwrite a file with command output:

```bash
cat file.txt > file1.txt
```

Append instead:

```bash
cat file.txt >> file1.txt
```

## Searching with `grep`

```bash
grep "CODE" file1.txt
grep -i "CODE" file1.txt
grep -ri "CODE" cde2/
```

- `-i` ignores case
- `-r` searches recursively through directories

## Searching with `find`

```bash
find cde/ -name "file.txt"
find cde/ -name "*.txt"
```

## Pipes

A pipe (`|`) passes the standard output of one command to the standard input of another.

```bash
cat customers.txt | grep -i "nigeria"
```

Another example:

```bash
ps aux | grep python
```

## Chaining Commands

Run the second command only if the first succeeds:

```bash
command1 && command2
```

Run the second only if the first fails:

```bash
command1 || command2
```

Run both regardless of success:

```bash
command1 ; command2
```

## Environment Variables

```bash
env
export DATA_DIR=/cde
echo "$DATA_DIR"
unset DATA_DIR
```

Environment variables are commonly used for configuration such as file paths, hosts, ports, and application settings.

Passwords, API keys, and other secrets should never be committed to a public repository.

## Linux Documentation

```bash
man echo
apropos user
```

`man` displays manual pages. `apropos` helps search for relevant manual pages when I know the task but not the exact command.

## Users

```bash
cat /etc/passwd
sudo cat /etc/shadow
sudo adduser baba
sudo useradd john -m
sudo passwd john
su - john
sudo usermod -s /bin/bash baba
sudo userdel immaculate
sudo userdel -r immaculate
```

`/etc/passwd` stores user account information. Modern Linux systems normally store password hashes separately in `/etc/shadow`, which has restricted access.

## Groups

```bash
sudo groupadd cde
cat /etc/group
groups
groups john
sudo usermod -aG cde john
sudo gpasswd -d john cde
sudo groupdel cde
```

A user can belong to more than one group.

The `-a` in:

```bash
sudo usermod -aG cde john
```

is important because `-G` without `-a` can replace the user's existing supplementary group memberships.

## `sudo` and `visudo`

```bash
sudo visudo
```

`sudo` allows authorised users to run commands with elevated privileges. `visudo` is the safer way to edit sudo configuration because it validates the syntax.

An entry beginning with `%` represents a group.

## File Permissions

Linux permissions are normally considered for:

- User (`u`)
- Group (`g`)
- Other (`o`)

Basic permissions are:

- Read (`r`) = 4
- Write (`w`) = 2
- Execute (`x`) = 1

Examples:

```bash
chmod o-x etl.py
chmod 600 etl.txt
chmod 644 file.txt
chmod 755 script.sh
```

Common numeric combinations:

```text
rwx = 7
rw- = 6
r-x = 5
--- = 0
```

`chmod 700 etl.sh` gives the owner read, write, and execute permission while giving group and other users no access.

## WSL and Windows-Mounted Filesystems

While practising permissions, I found that `chmod 700` did not behave as expected when my test file was stored under `/mnt/c`.

`/mnt/c` represents the Windows `C:` drive mounted inside WSL. Because those files are stored on NTFS, their permission behaviour can differ from native Linux files unless WSL metadata options are configured.

When I repeated the same exercise inside my Linux home directory under `~`, `chmod` behaved as expected.

This was a useful reminder that filesystem behaviour depends not only on the command being used but also on the environment and filesystem where the file is stored.

## What Clicked for Me

Linux is not mainly about memorising individual commands. The real power comes from understanding how commands can be combined to work with files, users, permissions, processes, logs, and remote systems.

## Connection to My Previous Experience

Most of my previous work has involved analytics and reporting after data was already available for consumption. Linux is helping me understand more of the operating environment behind data workloads, including permissions, logs, automation, and troubleshooting.

## What I Want to Explore Further

- Linux processes
- shell scripting
- SSH
- `cron`
- process monitoring
- disk and memory monitoring
- logs
- Linux networking
- running data pipelines on Linux
