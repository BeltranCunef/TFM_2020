import pandas as pd
import numpy as np
import json

data_path = "../data/application_train.csv"
dictionary_path = "../data/HomeCredit_columns_description.csv"

data = pd.read_csv(data_path)
dictionary = pd.read_csv(dictionary_path, encoding='latin')

def read_metadata(df, dic):
    '''
    This functions generates a Python dictionary with information of all the columns
    in a pandas DataFrame

    Parameters
    --------------------------
    df = pandas.Dataframe
        Dataframe to get statistical information of each column
    
    dic = pandas.Dataframe
        Dataframe to get description of the features of 'df'
    --------------------------

    Returns
    --------------------------
    metadata = Python dictionary
        Dictionary with description and statistics of all features in 'df'.
    --------------------------

    Notes
    -----
    Numpy ints and floats aren't supported in json, thats why I converted
    all values to 'float'.
    '''

    metadata = {}
    for i in range(len(df.columns)): 
        X = df.columns[i]
        if X != "SK_ID_CURR":
            if str(df.dtypes[f"{X}"]) == "int64":
                metadata[X] = {"Description" : dic["Description"].iloc[dic["Row"][dic["Row"] == f"{X}"].index[0]],
                             "type" : "int64",
                             "statistics": {
                                 "range" : float(df[f"{X}"].max()-df[f"{X}"].min()),
                                 "mean" : float(df[f"{X}"].mean()),
                                 "median" : float(df[f"{X}"].describe()["50%"]),
                                 "mode" : float(df[f"{X}"].mode()[0]),
                                 "sd" : float(df[f"{X}"].std()),
                                 "min" : float(df[f"{X}"].min()),
                                 "max" : float(df[f"{X}"].max()),
                                 "quartile_1": float(df[f"{X}"].describe()["25%"]),
                                 "quartile_3": float(df[f"{X}"].describe()["75%"])}
                            }
            if str(df.dtypes[f"{X}"]) == "object":
                metadata[X] = {"Description" : dic["Description"].iloc[dic["Row"][dic["Row"] == f"{X}"].index[0]],
                             "type" : "object",
                             "statistics": {
                                 "classes" : list(np.sort(df[f"{X}"].dropna().unique())),
                                 "n_classes" : float(df[f"{X}"].nunique()),
                                 "mode" : df[f"{X}"].describe()["top"],
                                 "freq" : float(df[f"{X}"].describe()["freq"])}
                         }
            if str(df.dtypes[f"{X}"]) == "float64":
                metadata[X] = {"Description" : dic["Description"].iloc[dic["Row"][dic["Row"] == f"{X}"].index[0]],
                             "type" : "float64",
                             "statistics": {
                                 "range" : float(df[f"{X}"].max()-df[f"{X}"].min()),
                                 "mean" : float(df[f"{X}"].mean()),
                                 "median" : float(df[f"{X}"].describe()["50%"]),
                                 "mode" : float(df[f"{X}"].mode()[0]),
                                 "sd" : float(df[f"{X}"].std()),
                                 "min" : float(df[f"{X}"].min()),
                                 "max" : float(df[f"{X}"].max()),
                                 "quartile_1": float(df[f"{X}"].describe()["25%"]),
                                 "quartile_3": float(df[f"{X}"].describe()["75%"])}
                          }
    return metadata

metadata = read_metadata(df=data, dic=dictionary)

with open('metadata.json', 'w') as json_file:
    json.dump(metadata, json_file, indent=2)