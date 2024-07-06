# Panda

```bash
pip install pandas
pip install jupyter
```

Launch Notebook
```bash
jupyter notebook author.ipynb
```


## Load CSV

```python
import pandas as pd

authors = pd.read_csv('authors.csv')
authors.head()
authors.describe()

authors_books = pd.read_csv('authors_books.csv')
authors_books.head()
authors_books.describe()
```

## Selecting Columns
```python
authors[['firstname', 'lastname']]
```

```python
```

```python
```


## Filtering Rows 

https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.query.html

## Grouping Data


## Join DataFrame

https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.join.html


