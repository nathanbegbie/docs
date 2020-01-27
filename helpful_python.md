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

```python
from datetime import timedelta
from
