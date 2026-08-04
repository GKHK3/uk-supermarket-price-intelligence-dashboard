# Aldi Cleaning Code

```python
 # Import
import pandas as pd
import numpy as np
df = pd.read_csv("data/All_Data_Aldi.csv")

 # Checking values
df.shape
```
```python
 # Checking for NULL values (Run again to test)
df.isnull().sum()
```

```python
 # Deleting NULL values
df = df.dropna()
```
```python
**CHECKING** largest and smallest values
df.nlargest(10, "prices_unit_(£)")
df.nsmallest(10, "prices_unit_(£)")
```
```python
 #Quick anomaly check
df["prices_unit_(£)"].describe()
```

**CLEANING DATA**

```python
# REMOVING values below 0

df = df[(df["prices_(£)"] > 0)]
FILTERING PRICES above/ below 50%
```
```python
# Sorting values and getting previous product price
df = df.sort_values(["names", "date"])

df["previous_price"] = df.groupby("names")["prices_(£)"].shift(1)

df["previous_price"]
```

```python
# Price change calculator (Percentage)

df["price_change"] = df["prices_(£)"] - df["previous_price"]

df["percent_change"] = (
    (df["prices_(£)"] - df["previous_price"])
    / df["previous_price"]
) * 100

df.sort_values(by="percent_change", ascending=False)
```
```python
 # Checking for NA values 
 df.isnull().sum()
 ```
 ```python
 #Dropping NA values again
df = df.dropna()
```
```python
 # Finding suspicious values 
suspicious = df[df["percent_change"].abs() > 50]

suspicious.sort_values(by='percent_change', ascending=True)
df.shape #quick check
```

```python
 # REMOVING suspicious values 
suspicious = df[df["percent_change"].abs() > 50]

df = df[df["percent_change"].abs() <= 50]
df.shape #quick result check
```

**REMOVING** prices_unit

```python
  # Defining the medium
df["median_price_unit"] = (
    df.groupby("names")["prices_unit_(£)"]
      .transform("median")
)
```

```python
 # Finding the % of medium 
df["percent_difference"] = (
    abs(df["prices_unit_(£)"] - df["median_price_unit"])
    / df["median_price_unit"]
) * 100

suspicious2 = df[df["percent_difference"] > 100]

suspicious2.sort_values("percent_difference", ascending=False)
```

```python
 # Removes values above 100
df = df[df["percent_difference"] <= 100]
 # Quick anomaly check
df.nlargest(10, "prices_(£)")
**REMOVING** 0.0 values
df.shape #quick check
 #Removing values
df = df[(df["prices_unit_(£)"] > 0.1) & (df["prices_unit_(£)"] < 100)]
df.shape #quick check
FINAL CHECK FOR ANOMALIES
df.nsmallest(10, "prices_unit_(£)")
df.nlargest(10, "prices_unit_(£)")
 # Random results test

temp_result = df.iloc[np.random.default_rng().choice(len(df), size=5, replace=False)]

temp_result
REMOVING CATEGORY
final_df = df.drop(df[df['category'] == 'free-from'].index)

print(f"Original rows: {len(df)}")
print(f"Final rows: {len(final_df)}")
print(f"Rows removed: {len(df) - len(final_df)}")
CLEANUP
 # Renaming column
final_df = final_df.rename(columns={
    'names': 'product',
    'prices_(£)': 'prices',
    'prices_unit_(£)': 'prices_unit'
})
 # Dropping unecessary columns
final_df = final_df.drop(columns=['previous_price', 'price_change', 'percent_change', 'median_price_unit','percent_difference'])
 # Organizing Column order
final_df = final_df[['category', 'prices', 'prices_unit', 'unit', 'product', 'date', 'own_brand', 'supermarket']]
 # Quick column check
print(final_df.columns)
CONVERT TO CSV
final_df.to_csv("Aldi_clean.csv", index=False)
 # Final check, vs_code database loaded properly
final_df.shape