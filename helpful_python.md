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

## Unzipping Files

```python
import shutil
shutil.unpack_archive(filename, extract_dir)
```

## List All the Files in a Directory

```python
def get_files(directory, file_type_suffix):
    return [
        Path(directory, filename)
        for filename
        in listdir(directory)
        if Path(directory, filename).is_file() and filename.endswith(file_type_suffix)
    ]
```

## Getting files names in a directory

```python
from os import listdir
from os.path import isfile, join
onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]
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

If you want the file to be formatted, use `indent=2` like so:

```python
json.dump(sample, file, indent=2)
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

## Python, asdf and virtualenvwrapper

This approach is cobbled together because I have the following needs:

-   macOS
-   brew for general package management on macOS
-   asdf for managing python versions
-   virtualenv and virtualenvwrapper for managing python environments

This approach was informed by [this article](https://web.archive.org/web/20220819101628/https://abbasegbeyemi.me/blog/python-asdf-virtualenv/).

To get the latest version of python:

```sh
asdf plugin-update python
asdf install python latest
```

or you can install the specific version that you want

```sh
asdf install python 3.12.1
```

set it to be the global one

```sh
asdf global python 3.12.1
```

then install the virtualenv packages that you need

```sh
python -m pip install --upgrade pip
python -m pip install virtualenv virtualenvwrapper
asdf reshim
```

So we then create the environment:

```sh
mkvirtualenv my_project_name
```

The virtualenv will be activated once this command is complete.
You can explicitly associate it with a directory if you would like

## JupyterLab Desktop, Kernels and virtualenv

Given the constraints mentioned above, we want to use JupyterLab and the
power of notebooks, along with the the same setup that we use above
for managing the python version and environments that we need in order
to run these applications.

We have

-   JupyterLab _Desktop_

However, because I want to have this standalone application, you also need
to install jupyterlab because for some reason you need this as well for the
managing the kernels. If you have only installed the Desktop application.

So first make sure that you have:

```sh
brew install jupyterlab
```

This approach is informed by [this article](https://web.archive.org/web/20230724170856/https://sesync-ci.github.io/faq/python-virtual-env.html).

Activate your desired virtualenvironment:

```sh
workon my_project_name
```

Given that we want to keep track of dependencies, you probably want to
associate the virtualenv with a particular directory. This means that

```sh
mkvirtualenv -a project_path -p $(asdf where python)/bin/python name_of_project
```

Then we need to add the following:

```sh
python -m pip install --upgrade pip
python -m pip install ipykernel
```

You can also add the packages that you want at this point.

```sh
python -m pip install pandas seaborn
```

Then we create the kernel.

```sh
python -m ipykernel install --user --name="kernel_name" --display-name="My Kernel Name"
```

Confirm it's create:

```sh
jupyter kernelspec list
```

Restart Jupyterlab
