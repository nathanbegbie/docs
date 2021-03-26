# Jupyter

## Jupyterlab

I've had a number of issues trying to get extensions installted in jupyterlba,
often warning me that it needs a much later version of node. I eventually found
this article on StackOverflow, which suggested running the following command:

```bash
conda install nodejs -c conda-forge --repodata-fn=repodata.json
```
