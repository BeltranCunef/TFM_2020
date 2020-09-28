'''
    Este archivo contiene todas las funciones relacionadas con el análisis exploratorio del conjunto de datos.
'''
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

def null_count(df):
    '''
    Parámetros
    ----------------
    df = pandas.DataFrame
        DataFrame de entrada que será analizado.
    ----------------
    Salidas
    ----------------
    message = string
        Imprime un mensaje por pantalla mostrando los resultados de la función
    ----------------
    '''
    if df.isnull().sum().sum() > 0:
        mask_total = df.isnull().sum().sort_values(ascending=False) 
        total = mask_total[mask_total > 0]

        mask_percent = df.isnull().mean().sort_values(ascending=False) 
        percent = mask_percent[mask_percent > 0] 

        missing_data = pd.concat([total, percent], axis=1, keys=['Total', 'Porcentaje'])
    
        return  missing_data
    else: 
        print('No se han encontrado NaN.')

def columns_w_many_nans(df, missing_percent=.9):
    '''
    Parámetros
    ---------------
    df = pandas.DataFrame
        DataFrame de entrada sobre el cual actúa la función.

    missing_percent = float64
        Valor numérico que indica el porcentaje total de NaN.
    ---------------
    Salidas
    ---------------
    columns = list
        Lista de las columnas que presentan un porcentaje superior o igual de NaN al indicado.
    '''
    mask_percent = df.isnull().mean()
    series = mask_percent[mask_percent > missing_percent]
    columns = series.index.to_list()
    print(columns) 
    return columns

def heatmap_numeric_target(df, target):
    '''
     Parámetros
    ---------------
    df = pandas.DataFrame
        DataFrame de entrada sobre el cual actúa la función.

    target = string
        Variable dependiente del dataset.
    ---------------
    Salidas
    ---------------
    g = graph
        Mapa de calor ue indica la correlación entres variables numéricas y el target.
    '''
    plt.figure(figsize=(12, 20))
    g = sns.heatmap(df.corr()[[target]].sort_values(by=target, ascending = False), 
                    annot=True, 
                    cmap='coolwarm', 
                    vmin=-1,
                    vmax=1) 
    return g

def duplicated_columns(df):
    '''
    Parámetros
    ----------------
    df = pandas.DataFrame
        DataFrame de entrada que será analizado.
    ----------------
    Salidas
    ----------------
    duplicated_columns = list
        Lista que contiene el nombre de las variables que suponen un duplicado.
    ----------------
    '''
    duplicated_columns = []
    columnas = df.columns

    for columna1 in columnas:
        if(len(columnas)>0):
            for columna2 in columnas.drop(columna1):
                if (df[columna1].equals(df[columna2])):
                    duplicated_columns.append(columna2)
                
            columnas = columnas.drop(columna1)
    
    if(len(duplicated_columns) > 0):
        print("\nNúmero de columnas duplicadas: ", len(duplicated_columns))
        return duplicated_columns
    else:
        print("No hay columnas duplicadas")

def numerical_distplot(df, target = None, num_values = 10):
    '''
    Parámetros
    ----------------
    df = pandas.DataFrame
        DataFrame de entrada que será analizado.
    
    target = object
        String que indica la variable segmentadora

    num_values = integer
        Número de valores distintos que tiene que tener como mínimo la variable.
    ----------------
    Salidas
    ----------------
    g = graph
        Histogramas con densidades de las variables numéricas.
    ----------------
    '''
    if(target is None):
        aux = df.nunique() >= num_values
        columns = aux[aux == True].index
        f = pd.melt(df, value_vars=df.select_dtypes(include = [np.number])) 
        g = sns.FacetGrid(f, col='variable', col_wrap=4, sharex=False, sharey=False)
        g = g.map(sns.distplot, 'value')
        return g
    else:
        filtro1 = df.select_dtypes(include = [np.number])
        filtro2 = filtro1.nunique() >= num_values
        columns = filtro2[filtro2 == True].index
        for column in columns:
            g = sns.FacetGrid(df, col=target, hue=target, hue_kws={'color': ['b', 'r']})
            g.map(sns.distplot, column)
        
        return g

def catplots_categorical(df, target,  categorical_columns = None):
    '''
    Parámetros
    ---------------
    df = pandas.DataFrame
        DataFrame de entrada sobre el cual actúa la función.

    categorical_columns = list
        Lista de las variables categóricas sobre las que se quieren realizar los boxplots.

    target = str
        Variable target sobre la que se establecen las relaciones de las variables categóricas.
    ---------------
    Salidas
    ---------------
    columns = list
        Lista de las columnas que presentan un porcentaje superior o igual de NaN al indicado.
    '''
    def catplot(x, hue, data):
        sns.catplot(x=x, hue=hue, kind="count", data=data)
        x = plt.xticks(rotation=90)

    if(categorical_columns is None):
        variable = df.select_dtypes(include = [np.object]).columns
        for columna in variable:
            catplot(columna, target, df)
    else:
        for columna in categorical_columns:
            catplot(columna, target, df)

