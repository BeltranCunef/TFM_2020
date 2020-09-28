import pickle
import pandas as pd
import numpy as np
import shap
import matplotlib.pyplot as plt
import os
os.environ['QT_QPA_PLATFORM_PLUGIN_PATH'] = 'C:/Users/Beltran/Anaconda3/Library/plugins/platforms'

def graficos():

    shap.initjs()
    # rutas
    ruta_registro = './otros/registro.csv'
    ruta_modelo = './otros/final_model.pkl'
    ruta_imputer = './otros/KNNimputer.pickle'

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

    # shap values
    explainer = shap.TreeExplainer(loaded_model)
    shap_values = explainer.shap_values(nuevo_registro)

    # figura 1
    plt.clf()
    shap.force_plot(explainer.expected_value[1], shap_values[1][0,:], nuevo_registro.iloc[0,:], link='logit', matplotlib=True, show=False)
    plt.savefig('./www/summary_plot1.png', bbox_inches = 'tight', pad_inches = 1.0, dpi=1000)

    # figura 2
    plt.figure(figsize=(500,1000))
    shap.waterfall_plot(explainer.expected_value[1], shap_values[1][0,:], nuevo_registro.columns.values, show=False)
    plt.savefig("./www/summary_plot2.png", bbox_inches = 'tight', pad_inches = 1.0, dpi = 1000) 

    return True

