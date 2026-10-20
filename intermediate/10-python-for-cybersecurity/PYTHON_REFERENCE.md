# Python Fundamentals — CyberLabs Quick Reference

**For both intermediate Python rooms.** No previous Python experience required. Examples use Python 3 and can be copied into `python3` or a `.py` file. On Windows, `py` often works instead of `python3`.

## 1. Running Python and printing

Save code as `hello.py`, then run `python3 hello.py`. Indentation matters in Python: use four spaces per block.

```python
print("Hello, CyberLabs!")
# This is a comment; Python ignores it.
```

## 2. Variables and data types

Variables hold values; assignment uses `=`. Python infers the type.

```python
host = "127.0.0.1"       # str: text
port = 8088              # int: whole number
timeout = 0.5            # float: decimal
connected = False        # bool: True or False
print(type(port))
print(f"Testing {host}:{port} (timeout {timeout}s)")
```

An **f-string** substitutes values inside braces. `str(port)` turns an integer into text; `int("8088")` turns numeric text into an integer.

## 3. Operators and conditions

`==` checks equality; `=` assigns. Other comparisons: `!=`, `<`, `>`, `<=`, `>=`. Combine tests with `and`, `or`, `not`.

```python
status = 200
if status == 200:
    print("Success")
elif status == 403:
    print("Forbidden")
else:
    print("Other response")
```

## 4. Lists, dictionaries, tuples and sets

```python
ports = [22, 80, 443]               # ordered, editable list
ports.append(8088)
print(ports[0])                      # 22; indexes start at zero
finding = {"port": 8088, "open": True}  # dictionary: key -> value
print(finding["port"])
endpoint = ("127.0.0.1", 8088)     # tuple: fixed pair
unique_ports = set([80, 80, 443]) # set: unique values
```

## 5. Loops

A `for` loop processes items; `range(start, stop)` excludes `stop`. A `while` loop runs as long as its condition is true. `break` exits a loop; `continue` skips to the next iteration.

```python
for port in [80, 443, 8088]:
    print("Checking", port)

for number in range(1, 4):
    print(number)                   # prints 1, 2, 3

count = 0
while count < 3:
    count += 1
    print(count)
```

## 6. Functions and return values

Define a function with `def`. Parameters receive input; `return` sends a result back. A function that only prints returns `None`.

```python
def describe_port(port, is_open):
    if is_open:
        return f"{port}/tcp open"
    return f"{port}/tcp closed"

message = describe_port(8088, True)
print(message)
```

## 7. User input and validation

`input()` always returns a string. Convert it safely before using it as a number.

```python
raw = input("Enter a port: ").strip()
try:
    port = int(raw)
    if not 1 <= port <= 65535:
        raise ValueError("Port must be 1–65535")
    print("Chosen port:", port)
except ValueError as error:
    print("Invalid input:", error)
```

## 8. Importing modules

`import` loads code from a module. `socket` works with networking, `json` with structured data, `pathlib` with files, and `time` with timing.

```python
import socket
from pathlib import Path
print(socket.gethostbyname("localhost"))
print(Path("findings.json").suffix)
```

## 9. Working with text and files

Use `with` to close files automatically. `strip()` removes whitespace; `splitlines()` breaks text into separate lines.

```python
from pathlib import Path

Path("notes.txt").write_text("80\n443\n8088\n", encoding="utf-8")
ports_text = Path("notes.txt").read_text(encoding="utf-8")
for line in ports_text.splitlines():
    print(line.strip())
```

## 10. Exceptions and error handling

Errors such as missing files or refused connections need handling. Catch specific exceptions instead of hiding all failures with a bare `except`.

```python
try:
    text = Path("missing-file.txt").read_text()
except FileNotFoundError:
    print("That file does not exist.")
```

## 11. JSON reports

JSON stores basic values, lists and dictionaries in a format other tools can read.

```python
import json
from pathlib import Path

report = {"host": "127.0.0.1", "open_ports": [8088]}
Path("findings.json").write_text(json.dumps(report, indent=2))
loaded = json.loads(Path("findings.json").read_text())
print(loaded["open_ports"])
```

## 12. A safe networking example

Only probe targets you own or are authorized to assess. This example connects to your own computer (loopback) and reports whether the local training service is listening.

```python
import socket

try:
    with socket.create_connection(("127.0.0.1", 8088), timeout=0.5):
        print("Local training port is open")
except OSError:
    print("Connection failed or timed out")
```

## 13. Menu-driven programs and dispatch dictionaries

A dictionary can map typed options to functions. The function name without parentheses is a **reference**; adding `()` calls it.

```python
def say_hello():
    print("Hello!")

def show_help():
    print("Choose an option.")

actions = {"1": say_hello, "2": show_help}
choice = input("1 = hello, 2 = help: ").strip()
action = actions.get(choice)
if action:
    action()
else:
    print("Unknown option")
```

## 14. Common mistakes

| Symptom | Check |
|---|---|
| `IndentationError` | Use four spaces consistently within `if`, `for` and function blocks |
| `NameError` | Is the variable defined and spelled correctly? |
| `TypeError` | Are you mixing text and numbers? Use `str()` or `int()` |
| `ValueError` | Is the conversion valid, such as `int("abc")`? |
| `ModuleNotFoundError` | Is the imported package installed in this Python environment? |
| `ConnectionRefusedError` | Is the local practice server running on that port? |

## Practice before the lab

1. Create a variable called `target` with `"127.0.0.1"` and print it with an f-string.
2. Write a loop that prints ports 8087 through 8089.
3. Create a function that receives a port and returns `"HTTP"` for port 80 or 8088, otherwise `"Unknown"`.
4. Store the results in a dictionary, then save them as JSON.
5. Modify the menu example to add a third action.

**Reminder:** These are small programming exercises, not permission to scan an arbitrary network. Follow the scope stated in each CyberLabs room.
