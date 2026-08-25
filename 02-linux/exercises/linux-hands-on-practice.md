# Linux Hands-on Practice

Use a Linux VM, WSL, or another safe Linux environment.

## 1. Navigation and Files

- Run `whoami` and `pwd`
- Create `cde-linux-practice`
- Enter the folder
- Create `logs/`, `customers.txt`, `transactions.txt`, and `.env.example`
- Run `ls` and `ls -la`
- Save a screenshot as `../images/01-linux-navigation.png`

## 2. Redirection and Search

- Add at least five sample customer records to `customers.txt`
- Include at least two records containing `Lagos`
- Use `grep` and `grep -i`
- Redirect output using `>`
- Append using `>>`
- Use `find` to locate `.txt` files
- Save a screenshot as `../images/02-grep-and-find.png`

## 3. Pipes

Try:

```bash
cat customers.txt | grep "Lagos"
```

Then try another pipe and explain in two or three sentences what is happening.

## 4. Permissions

- Create `etl.sh`
- Check its permissions with `ls -l`
- Change its permissions with symbolic mode
- Try `chmod 700 etl.sh`
- Save a before-and-after screenshot as `../images/03-file-permissions.png`

## 5. Reflection

Answer:

- Which command will I likely use most?
- Which concept was least intuitive?
- How could Linux support a data pipeline?
- What would I like to automate?
