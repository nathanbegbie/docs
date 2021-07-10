# Helpful Python

To get the size of a file use the follwoing:

```python
import os
os.path.getsize("path/to/file")
```

This will give you the size of the file in bytes, which you may want to transform into something more readable.
In this case the [humanfriendly](https://humanfriendly.readthedocs.io/en/latest/index.html) package is great!

```python
import os
from humanfriendly import format_size

format_size(os.path.getsize("path/to/file"))
```

You can also use the `humanfriendly` library to format time more easily with `format_timespan`.

TODO:

```python
from datetime import timedelta
from
```

## Get JSON from requests

I forget this a lot

```python
import requests

response = requests.get(...)
data = response.json()
```

## Write JSON to file

write from dict to JSON file:

```python
import json
with open('result.json', 'w') as file:
    json.dump(sample, file)
```

## Read JSON from file

read dict from JSON file:

```python
import json
with open("./mySchema.json", "r", encoding="utf-8") as file:
    schema = json.loads(file.read())
```

note the use of `loads` with an 's'!

## Logging, Debugging

This is helpful generally, but also specifically came accross it using requests and Jupyter notbeooks:

```python
import logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)
logging.info("this is informative logging!")
```

You can set the level where you want. So:

```python
...
logger.setLevel(logging.DEBUG)
logging.debug("You'll start getting Requests data if you use it now")
...
```

Gives you all of the requests that are made using the Requests lib!

## Downloading a big file

derived from [this question on stack overflow](https://stackoverflow.com/questions/16694907/download-large-file-in-python-with-requests)

```python
from pathlib import Path
import requests
import shutil

def download_file(url, file_name=None, directory_path=None):
    if not file_name:
        file_name = Path(url.split("/")[-1])
    if directory_path:
        local_file_path = Path(directory_path, file_name)

    with requests.get(url, stream=True) as r:
        with open(local_file_path, "wb") as f:
            shutil.copyfileobj(r.raw, f)

    return local_file_path
```

## Installing things with pip

You can wither run `pip install` or `python -m pip install`
which achieve the same thing, but I get the following
warning when `pip install`-ing in my jupyter docker
container:

```bash
WARNING: pip is being invoked by an old script wrapper. This will fail in a future version of pip.
Please see https://github.com/pypa/pip/issues/5599 for advice on fixing the underlying issue.
To avoid this problem you can invoke Python with '-m pip' instead of running pip directly.
```

So it might be a good idea to switch the `-m` as a matter
of routine.
