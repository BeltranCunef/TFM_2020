'''
    Este archivo contiene todas las funciones para realizar la limpieza de datos necesaria en un primer momento. El fin
    es llevar a cabo una limpieza general y así poder lanzar modelos de prueba sobre un conjunto de datos eestándar para todos.
'''


import pandas as pd
import numpy as np

def cleaning(df, input_nan = False, standardize_column_names = True, making_dummies = False):
    '''
    Parámetros
    --------------------------
    df = pandas.Dataframe
        Dataframe de entrada que será filtrado.
    
    input_nan = boolean
        Parámetro para imputar los valores faltantes, Si la variable es numérica se optará por la mediana y si es categórica
        por la moda. Por defecto es False.
    
    standardize = boolean
        Estandarizar los nombres de las columnas, se ponen como mayúscula y se sustituyen los espacios en blanco por '_'.
        Por defecto es True.
    
    making_dummies = boolean
        Genera dummies para todas las variables categóricas y borra la variable original. Por defecto es False.
    --------------------------
    Salidas
    --------------------------
    df = pandas.Dataframe
        Dataframe ya modificado.
    --------------------------
    '''
    if(input_nan == True):
        '''
        Recorremos todas las columnas, observamos el tipo de los datos, si son string imputamos por la moda, si son numéricos
        lo hacemos por la mediana
        '''
        for columna in df.columns.values:
            if(str(df[columna].values.dtype) == 'object'):
                df[columna].fillna(df[columna].mode()[0], inplace=True)
            else:
                df[columna].fillna(df[columna].median(), inplace=True)

    if(making_dummies == True):
        '''
        Selecciono todas las columnas cuyos tipos sean object y guardo los nombres en una lista. Genero las cummies mediante
        la función get_dummies de pandas. Borro del dataset las variables original y uno el dataset con las dummies generadas.
        '''
        categoricas = df.select_dtypes(include = [np.object])
        dummies = pd.get_dummies(categoricas)
        df.drop(categoricas.columns, axis = 1, inplace = True)
        df = df.merge(dummies, left_index = True, right_index = True)
    
    if(standardize_column_names == True):
        '''
        Primero mapeamos los nombres de las columnas y los ponemos todos en mayúscula, luego hacemos lo mismo para
        reemplazar los espacios en blanco por _
        '''
        df.columns = pd.Series(df.columns).str.upper().str.replace(" ","_")

    return df

                

