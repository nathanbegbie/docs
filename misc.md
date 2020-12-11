# Misc

## Download a static website

I wanted to look at the Seaborn docs offline.
To do this I ran

```bash
wget \
     --recursive \
     --page-requisites \
     --adjust-extension \
     --span-hosts \
     --convert-links \
     --domains seaborn.pydata.org \
     --no-parent \
     https://seaborn.pydata.org # The URL to download
```
