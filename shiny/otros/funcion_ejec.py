import pickle
import pandas as pd
import numpy as np
import os.path
from os import path

def ejecutable():
    # rutas
    ruta_registro = './otros/registro.csv'
    ruta_modelo = './otros/final_model.pkl'
    ruta_imputer = './otros/KNNimputer.pickle'

    print("File exists:"+str(path.exists(ruta_registro)))

    # registro nuevo
    nuevo_registro = pd.read_csv(ruta_registro)
    # modelo
    loaded_model = pickle.load(open(ruta_modelo, 'rb'))
    # KNN imputer
    imputer = pickle.load(open(ruta_imputer, 'rb'))
    # variable a imputar
    imputar_lista = ['LANDAREA_MODE',
    'APARTMENTS_MEDI',
    'BASEMENTAREA_AVG',
    'YEARS_BEGINEXPLUATATION_MODE',
    'DEF_60_CNT_SOCIAL_CIRCLE',
    'TOTALAREA_MODE',
    'REGION_RATING_CLIENT',
    'APARTMENTS_MODE',
    'YEARS_BEGINEXPLUATATION_MEDI',
    'YEARS_BUILD_MODE',
    'LIVINGAPARTMENTS_AVG',
    'OBS_60_CNT_SOCIAL_CIRCLE',
    'COMMONAREA_AVG',
    'LIVINGAREA_AVG',
    'ENTRANCES_AVG',
    'LIVINGAREA_MODE',
    'OBS_30_CNT_SOCIAL_CIRCLE',
    'NONLIVINGAREA_MODE',
    'LIVINGAREA_MEDI',
    'NONLIVINGAPARTMENTS_MEDI',
    'ELEVATORS_AVG',
    'FLOORSMIN_AVG',
    'FLAG_DOCUMENT_13',
    'FLOORSMAX_AVG',
    'FLAG_DOCUMENT_16',
    'FLAG_DOCUMENT_18',
    'WALLSMATERIAL_MODE_Panel',
    'ELEVATORS_MODE',
    'FLOORSMIN_MEDI',
    'FLOORSMAX_MEDI',
    'FLOORSMAX_MODE',
    'FLAG_DOCUMENT_14',
    'FLAG_DOCUMENT_11',
    'FLAG_DOCUMENT_6',
    'FLAG_DOCUMENT_5',
    'FLAG_DOCUMENT_7',
    'FLAG_DOCUMENT_10',
    'FLAG_DOCUMENT_19',
    'FLAG_DOCUMENT_20']

    # imputacion
    imputado_nuevo = pd.DataFrame(imputer.transform(np.array(nuevo_registro).reshape(1,-1)),columns=nuevo_registro.columns)

    # asignacion de las variable imputadas
    nuevo_registro.loc[:, imputar_lista] = imputado_nuevo.loc[:, imputar_lista]

    # prediccion de la probabilidad de impago
    prediccion = loaded_model.predict_proba(nuevo_registro)[0][1]

    print(prediccion)

    return prediccion
    
