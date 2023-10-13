# Dependencies

Ensure that your system meets the prerequisites for Docker installation.

Alternativly use virtualenv

```
python3 -m pip install virtualenv # (if you don't already have virtualenv installed)
virtualenv venv to # create your new environment (called 'venv' here)
source venv/bin/activate # to enter the virtual environment
pip install -r requirements.txt to install the requirements in the current environment
```

# Ex. 1 - python

### python - A

Please execute

```
$ ./RUN_A
```

### python - B

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

