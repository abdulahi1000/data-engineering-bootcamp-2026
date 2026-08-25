# Linux Fundamentals

These notes document what I learned during the Linux section of my Data Engineering bootcamp.

## Why Linux Matters

Linux is widely used in data engineering because many servers, cloud environments, databases, containers, and data-processing systems run on Linux-based operating systems.

Key reasons include:

- Open source
- Free to use
- Many distributions
- Strong permission controls
- Lightweight
- Good for automation and scripting
- Well suited for remote server administration

## The Linux Kernel

The kernel manages system resources and communication with hardware. Linux itself is technically a kernel. A complete operating system built around it is commonly called a Linux distribution.

Examples include Ubuntu, Debian, Red Hat Enterprise Linux, Fedora, and Rocky Linux.

## Linux Filesystem

The filesystem begins at the root directory:

```bash
/
```

Important directories include `/bin` and `/sbin`.

## Why Use the Command Line?

The CLI is useful because it is fast, scriptable, suitable for remote administration, and allows commands to be combined.

## Anatomy of a Command

```text
command [options] [arguments]
```

Example:

```bash
ls -la /home
```

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

`tail -f` is especially useful for monitoring changing log files.

## Command History

```bash
history
!!
!2
```

Use history shortcuts carefully because they execute commands directly.

## Copying and Removing Files

```bash
cp source.txt destination.txt
cp -r source_directory destination_directory
rm file.txt
rm -r directory
```

## Standard Streams and Redirection

Linux commands commonly work with `stdin`, `stdout`, and `stderr`.

Overwrite a file:

```bash
cat file.txt > file1.txt
```

Append instead:

```bash
cat file.txt >> file1.txt
```

## Searching with grep

```bash
grep "CODE" file1.txt
grep -i "CODE" file1.txt
grep -ri "CODE" cde2/
```

## Searching with find

```bash
find cde/ -name "file.txt"
find cde/ -name "*.txt"
```

## Pipes

A pipe passes the output of one command into another.

```bash
cat customers.txt | grep "Lagos"
ps aux | grep python
```

## Chaining Commands

```bash
command1 && command2
command1 || command2
command1 ; command2
```

## Environment Variables

```bash
env
export DATA_DIR=/cde
echo "$DATA_DIR"
unset DATA_DIR
```

Never commit secrets such as passwords or API keys to a public repository.

## Linux Documentation

```bash
man echo
apropos user
```

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

The `-a` in `usermod -aG` matters because `-G` without `-a` can replace existing supplementary group memberships.

## sudo and visudo

```bash
sudo visudo
```

An entry beginning with `%` refers to a group.

## File Permissions

Permission categories:

- User (`u`)
- Group (`g`)
- Other (`o`)

Permissions:

- Read (`r`)
- Write (`w`)
- Execute (`x`)

Example:

```bash
ls -l
chmod o-x etl.py
chmod 600 etl.txt
chmod 644 file.txt
chmod 755 script.sh
```

Numeric values:

```text
r = 4
w = 2
x = 1

rwx = 7
rw- = 6
r-x = 5
--- = 0
```

## What Clicked for Me

Linux is not just about memorising commands. The command line gives engineers a way to work directly with files, users, permissions, logs, processes, and remote systems. Individual commands become much more powerful when they are combined and automated.

## Connection to My Previous Experience

Most of my previous data work has involved analytics, reporting, dashboards, and working with data after it has already been made available for analysis. Learning Linux is helping me understand more of what happens behind the scenes when data workloads are deployed, automated, monitored, and maintained.

## What I Want to Explore Further

- Linux processes
- pipes
- shell scripting
- SSH
- cron
- process monitoring
- disk and memory monitoring
- logs
- Linux networking
- deploying data pipelines on Linux
