# Linux Hands-on Practice

This exercise records the commands I ran after the Linux classes and what I learned from them.

## Exercise 1: Navigation and File Creation ✅

I started WSL and checked my current user and working directory:

```bash
whoami
pwd
```

I then created a practice directory and some sample files:

```bash
mkdir cde-linux-practice
cd cde-linux-practice
mkdir logs
touch customers.txt transactions.txt
ls -la
```

### What I learned

- `pwd` shows my current location in the filesystem.
- `mkdir` creates directories.
- `touch` can create empty files.
- `ls -la` shows hidden files and detailed metadata including permissions, ownership, and timestamps.

---

## Exercise 2: `grep`, `find`, and Redirection ✅

I added sample customer records to `customers.txt` and displayed them using:

```bash
cat customers.txt
```

I searched for customers in Lagos using a case-insensitive search:

```bash
grep -i "lagos" customers.txt
```

I then used `find` to locate text files in the current directory:

```bash
find . -name "*.txt"
```

I redirected the Lagos result into a new file:

```bash
grep -i "lagos" customers.txt > lagos_customers.txt
```

and confirmed the result with:

```bash
cat lagos_customers.txt
```

### What I learned

`grep` searches the contents of files, while `find` searches for filesystem objects such as files and directories.

The `>` operator redirects standard output into a file and overwrites that file if it already exists.

---

## Exercise 3: Pipes ✅

I ran:

```bash
cat customers.txt | grep -i "nigeria"
```

### What I learned

The pipe (`|`) takes the output produced by `cat customers.txt` and passes it directly to `grep` as input.

Instead of treating commands as isolated operations, I can connect smaller commands together to create a workflow. This is one of the Linux concepts I expect to use regularly in scripting and data engineering.

> Note: `grep -i "nigeria" customers.txt` can perform this specific search without `cat`, but the exercise is useful for demonstrating how pipes work.

---

## Exercise 4: File Permissions and WSL ✅

I first created `etl.sh` under the Windows-mounted filesystem at `/mnt/c/...` and tried:

```bash
chmod 700 etl.sh
ls -l etl.sh
```

The permission did not appear to change and continued to show:

```text
-rwxrwxrwx
```

I then moved to my native Linux home directory:

```bash
cd ~
mkdir cde-linux-practice
cd cde-linux-practice
touch etl.sh
```

Before changing the permissions:

```bash
ls -l etl.sh
```

Result:

```text
-rw-r--r--
```

I then ran:

```bash
chmod 700 etl.sh
ls -l etl.sh
```

Result:

```text
-rwx------
```

### What I learned

`chmod 700` means:

- owner: read, write, execute (`rwx`)
- group: no permission (`---`)
- other: no permission (`---`)

I also learned that files stored in `/mnt/c` are on the Windows NTFS filesystem mounted into WSL. Permission behaviour there can differ from the native Linux filesystem.

This was a useful troubleshooting exercise because the command itself was correct. The unexpected behaviour came from the filesystem where I was running it.

---

## Reflection

### Which Linux commands do I think I will use often?

Commands such as `cd`, `ls`, `cat`, `grep`, `find`, `tail`, and `chmod` already feel directly relevant to working with files, logs, scripts, and servers.

### Which concept was least intuitive?

File permissions became more interesting once I ran into the difference between files under `/mnt/c` and files inside the native WSL filesystem. It showed me that understanding the environment matters just as much as knowing the syntax of a command.

### How could Linux support a data pipeline?

A data pipeline may need to read and write files, execute scripts, access configuration through environment variables, monitor logs, run under a specific user, and have the correct permissions. Linux provides the tools needed to manage all of those pieces.

### What would I like to automate next?

I want to practise writing a small shell script and later schedule it so I can connect these Linux fundamentals to an actual data-engineering workflow.
