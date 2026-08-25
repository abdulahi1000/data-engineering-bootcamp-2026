# Linux Fundamentals

This section documents my hands-on introduction to Linux from a data engineering perspective.

Before this bootcamp, most of my data work had been closer to analytics, reporting, dashboards, and consuming data that had already been made available for analysis. Learning Linux is helping me understand more of what happens behind the scenes when data workloads are deployed, automated, monitored, and maintained.

## Status

- [x] Linux fundamentals notes completed
- [x] Command-line navigation practised
- [x] Files and directories practised
- [x] Search with `grep` and `find` practised
- [x] Redirection practised
- [x] Pipes practised
- [x] File permissions practised
- [x] WSL filesystem behaviour explored
- [x] Hands-on exercises completed
- [x] Reflection added
- [x] Public-ready screenshots added

## What I Learned

### Linux, the kernel, and distributions

One of the first distinctions that became clearer to me was the difference between the Linux kernel and a Linux distribution.

The **kernel** manages system resources and communication between software and hardware. Operating systems such as Ubuntu, Debian, Fedora, and Red Hat are complete distributions built around the Linux kernel.

### Why Linux matters in data engineering

A lot of data engineering work runs outside a desktop interface. Data pipelines, databases, containers, cloud servers, schedulers, and distributed processing systems commonly run in Linux environments.

Being comfortable with Linux makes it easier to:

- work with files and directories
- inspect logs
- manage permissions
- search and filter text
- automate repetitive operations
- work with remote servers
- troubleshoot applications and pipelines

## What I Practised

### Navigation and files

```bash
whoami
pwd
mkdir cde-linux-practice
cd cde-linux-practice
mkdir logs
touch customers.txt transactions.txt
ls -la
```

This exercise helped me practise navigating the filesystem and creating files and directories from the command line.

### Searching with `grep` and `find`

I created a small `customers.txt` file and searched it using:

```bash
grep -i "lagos" customers.txt
find . -name "*.txt"
```

I also redirected the search result into another file:

```bash
grep -i "lagos" customers.txt > lagos_customers.txt
cat lagos_customers.txt
```

### Pipes

I used a pipe to pass the output of one command directly into another:

```bash
cat customers.txt | grep -i "nigeria"
```

The key idea for me is that the first command produces output, and the second command receives that output as its input. This makes small Linux commands much more useful when they are combined.

### File permissions

I created a shell script and checked its permissions:

```bash
touch etl.sh
ls -l etl.sh
chmod 700 etl.sh
ls -l etl.sh
```

Inside the native WSL Linux filesystem, the permission changed from:

```text
-rw-r--r--
```

to:

```text
-rwx------
```

`700` means:

| User type | Permission | Value |
|---|---|---:|
| Owner | `rwx` | 7 |
| Group | `---` | 0 |
| Other | `---` | 0 |

## A Problem I Ran Into: `chmod` Inside `/mnt/c`

One of the most useful parts of this exercise came from something that did not work as I expected.

I initially created `etl.sh` under:

```text
/mnt/c/Users/.../cde-linux-practice
```

and ran:

```bash
chmod 700 etl.sh
```

The command completed, but `ls -l` still showed the file as:

```text
-rwxrwxrwx
```

I later understood that `/mnt/c` is the Windows filesystem mounted inside WSL. Files stored there can follow Windows/NTFS permission behaviour rather than behaving exactly like files stored in WSL's native Linux filesystem.

I moved the exercise to my Linux home directory:

```bash
cd ~
mkdir cde-linux-practice
cd cde-linux-practice
```

and repeated the test. This time `chmod 700` produced the expected result:

```text
-rwx------
```

That experience made the difference between **using Linux commands** and **understanding the environment those commands are running in** much clearer to me.

## What Clicked for Me

The biggest takeaway from this class is that Linux is not mainly about memorising commands.

The real value is understanding how simple commands can be combined to navigate systems, inspect data, search files, manage permissions, monitor logs, and eventually automate work.

Commands such as `grep`, `find`, `tail`, `chmod`, pipes, and redirection may look small individually, but together they form the building blocks of much larger workflows.

## Connection to My Previous Experience

Most of my previous data work has involved consuming data through reporting and analytics tools after it has already been prepared for use.

Linux is making me think further down the stack. Instead of only asking whether a dataset refreshed successfully, I am beginning to think about questions such as:

- Where is the process actually running?
- Which user owns it?
- Does it have permission to access the required files?
- Where would I find its logs if it fails?
- How could the task be automated?
- What operating environment is the workload running in?

That change in perspective is one of the reasons I am learning data engineering.

## Detailed Notes

See [notes.md](./notes.md) for my cleaned class notes.

## Hands-on Practice

See [Linux hands-on practice](./exercises/linux-hands-on-practice.md) for the exercises I completed.

## Proof of Work

Public-ready screenshots are stored in [`images/`](./images/).

The screenshots cover:

1. Navigation and file creation
2. `grep`, `find`, and output redirection
3. Pipes
4. File permissions and the WSL `/mnt/c` lesson

## What I Want to Explore Further

- Linux processes and process management
- shell scripting
- SSH and remote servers
- scheduled jobs with `cron`
- log monitoring
- memory and disk monitoring
- Linux networking
- running data pipelines on Linux
