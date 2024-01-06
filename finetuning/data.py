from datasets import load_dataset,Dataset
import pandas as pd

def load_my_dataset(data_files):
    df = pd.read_csv(data_files)
    dataset = Dataset.from_pandas(df)
    return dataset

# Path to your data file
data_file = './mydata.csv'

# Load the dataset
dataset = load_my_dataset(data_file)

# Show location and information of the dataset
print(dataset)

# Displaying the first entry of the dataset
print("First entry:", dataset[0])

# Displaying the last entry of the dataset
print("Last entry:", dataset[-1])


