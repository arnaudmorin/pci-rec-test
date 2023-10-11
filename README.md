# Intro

We created this set of exercises to give you the opportunity to express yourself technically. Do as much as you can in
the time you have. Feel free to ask us questions, if any. No worries if you can't make it all by lack of time or
understanding of what we're asking. We'll defrief it with you during our next call.

**Have fun!**

## Fork

Fork this repo to your own github repo

# Ex. 1 - python

This exercise will be split into multiple smaller ones. For each one
you can create files named `a.py`, `b.py` and `c.py`. You maybe resuse the same
environment for all sub-exercises

Guidelines:
- Use python version python3.7+.
- Unless specified otherwise you can only use builtin modules.

### python - A

Write a script that prints out whatever text input is passed as argument

Example:

```
$ python a.py ping ping ping
ping ping ping
```

### python - B

Write a script take takes one argument (-t/--target) which can only
accept the following values `titi`, `toto`, `tata`. When called with a valid
target, the script should print out the target text to stdout (`titi`, `toto` or `tata`).
When an invalid target is provided an error message should be printed to stderr

Example:

```
$ python b.py --target titi
titi

$ python b.py -t tutu
usage: b.py [-h] [-t {titi,toto,tata}]
b.py: error: argument -t/--target: invalid choice: 'tutu' (choose from 'titi', 'toto', 'tata')
```

### python - C

Write a script that creates ascii art equivalent of text passed as argument.
For this exercise you may use a 3rd party module.

Example:

```bash
$ python c.py 'Hello buddies'
 _   _        _  _          _                 _      _  _
| | | |  ___ | || |  ___   | |__   _   _   __| |  __| |(_)  ___  ___
| |_| | / _ \| || | / _ \  | '_ \ | | | | / _` | / _` || | / _ \/ __|
|  _  ||  __/| || || (_) | | |_) || |_| || (_| || (_| || ||  __/\__ \
|_| |_| \___||_||_| \___/  |_.__/  \__,_| \__,_| \__,_||_| \___||___/

```

# Ex. 2 - docker

In ex2 folder, you will find a `app` binary.

Can you build very lighweight docker image that contains ONLY `app` binary, and that execute `app` by default?

Push your Dockerfile in the ex2 folder.

# Ex. 3 - terraform

In ex3 folder, you will find an incomplete `openrc` file.

You will need to amend the file to configure the correct `OS_USERNAME` and `OS_PASSWORD` with the one that we gave to you.

Then, using `terraform`, can you write a plan to boot a `d2-4` on `GRA7` region with a floating IP.

Bonus, on that instance, make sure a web server (`nginx`) is running.

Push your `main.tf` file in ex3 folder.

# Ex. 4 - git

In this repo, there are two branches:

- stein
- queens

Stein contains the following commits:

- 1ff2641 (stein) G
- cf24853 F
- 3fcdfa0 E
- cb8c71a D
- 849ef26 C
- 372c155 B
- edc8ed7 A

Queens contains the following commits:

- 2624c16 (queens) F
- 5e3521b B
- edc8ed7 A

So the common ancestor is A (same commit ID).

B has been cherry-picked from stein to queens, without conflicts.

F has also been cherry-picked but with conflicts (solved, of course).

## Exercice

You will need to create two branches:

- merged
- rebased

### Merged

Create the merged branch first:

```bash
git checkout -b merged origin/queens
```

Then merge the stein branch into your branch

```bash
git merge origin/stein
```

You will have a conflict to solved.

Solve it, then push your `merged` branch to your repo.

### Rebased

Now create the rebased branch:

```bash
git checkout -b rebased origin/queens
```

Now rebase it on top of stein:

```bash
git rebase -i origin/stein
```

You will have a conflict to solved.

Solve it, then push your `rebased` branch to your repo.

## Check diff

Now check the diff between your two branches `merged` and `rebased`.

```bash
git diff merged..rebased
```

Can you explain why you have a diff?

Write down the explanation in ex4 folder (like in a `README.md` file)
