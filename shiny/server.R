library(reticulate)
library(shiny)
library(readr)
library(dplyr)
source('cuestionario1.R')
source('cuestionario2.R')
source('aceptacion.R')
source('asesor.R')
source('en_riesgo.R')
source('functions.R')
options(encoding = 'UTF-8')
shinyServer(function(input, output, session){
  
  bureau <- read_csv("C:/Users/Beltran/Desktop/Master/TFM/data/datos_bureau_final.csv")
  
  use_condaenv('C:/Users/Beltran/Anaconda3')
  
  # Boton para comenzar -------------------------------------
  observeEvent(input$comenzar, {
    
    # Cuestionario Principal  -------------------------------
    cuestionario1()
    
    #output$bureau
    
    updateNavbarPage(session, "mainPanel",
                      selected = 'cuestionario1'
    )
    
  })
  
  # Boton para ennviar la solicitud -------------------------
  observeEvent(input$enviar, {
    
    # genero un dataframe
    tuDataFrame <- data.frame('SK_ID_CURR' = input$dni,
                              'AMT_CREDIT' = input$cuantia,
                              'DAYS_BIRTH' = -lubridate::time_length(difftime(Sys.Date(), as.Date(input$edad)), 'days'),
                              'AMT_ANNUITY' = annuity(input$cuantia, input$duracion_prestamo),
                              'PAYMENT_RATE' = annuity(input$cuantia, input$duracion_prestamo)/input$cuantia,
                              'DAYS_EMPLOYED_PERC' = change_vida_laboral(input$vida_laboral)/lubridate::time_length(difftime(Sys.Date(), as.Date(input$edad)), 'days'),
                              'AMT_INCOME_TOTAL' = input$ingresos,
                              'AMT_GOODS_PRICE' = input$coste_bien,
                              'ANNUITY_INCOME_PERC' = annuity(input$cuantia, input$duracion_prestamo) / input$ingresos,
                              'DAYS_ID_PUBLISH' = -dni(input$edad, input$validez),
                              'NAME_CONTRACT_TYPE_Cash_loans' = if (input$tipo_prestamo == 'Cash') 1 else 0,
                              'OCCUPATION_TYPE_Drivers' = if (input$tipo_puesto == 'Transportista') 1 else 0,
                              'OCCUPATION_TYPE_Laborers' = if (input$tipo_puesto == 'Peón') 1 else 0,
                              'OCCUPATION_TYPE_Managers' = if (input$tipo_puesto == 'Director/a') 1 else 0,
                              'OCCUPATION_TYPE_Secretaries' = if (input$tipo_puesto == 'Secretario/a') 1 else 0,
                              'OCCUPATION_TYPE_Core_staff' = if (input$tipo_puesto == 'Personal de apoyo') 1 else 0,
                              'OCCUPATION_TYPE_Cooking_staff' = if (input$tipo_puesto == 'Empleado de hostelería') 1 else 0,
                              'OCCUPATION_TYPE_HR_staff' = if (input$tipo_puesto == 'Personal de apoyo cualificado') 1 else 0,
                              'OCCUPATION_TYPE_High_skill_tech_staff' = if (input$tipo_puesto == 'Experto de tecnología') 1 else 0,
                              'OCCUPATION_TYPE_IT_staff' = if (input$tipo_puesto == 'Encargado de IT') 1 else 0,
                              'OCCUPATION_TYPE_Sales_staff' = if (input$tipo_puesto == 'Personal de ventas') 1 else 0,
                              'OCCUPATION_TYPE_Medicine_staff' = if (input$tipo_puesto == 'Sanitario') 1 else 0,
                              'OCCUPATION_TYPE_Private_service_staff' = if (input$tipo_puesto == 'Otros') 1 else 0,
                              'NAME_FAMILY_STATUS_Married' = if (input$estado_civil == 'Casado/a') 1 else 0,
                              'NAME_FAMILY_STATUS_Single_/_not_married' = if (input$estado_civil == 'Soltero/a') 1 else 0,
                              'NAME_FAMILY_STATUS_Civil_marriage' = if (input$estado_civil == 'Pareja de hecho') 1 else 0,
                              'NAME_FAMILY_STATUS_Separated' = if (input$estado_civil == 'Divorciado/a') 1 else 0,
                              'FLAG_WORK_PHONE' = if (is.null(input$telefono)) 0 else 1,
                              'NAME_INCOME_TYPE_Working' = if (input$fuente_ingresos == 'Asalariado') 1 else 0,
                              'NAME_INCOME_TYPE_Commercial_associate' = if (input$fuente_ingresos == 'Asociado') 1 else 0,
                              'NAME_INCOME_TYPE_Unemployed' = if (input$fuente_ingresos == 'Desempleado') 1 else 0,
                              'NAME_INCOME_TYPE_Businessman' = if (input$fuente_ingresos == 'Autónomo') 1 else 0,
                              'ORGANIZATION_TYPE_Advertising' = if (input$sector_empresa == 'Marketing') 1 else 0,
                              'ORGANIZATION_TYPE_Agriculture' = if (input$sector_empresa == 'Agricultura') 1 else 0,
                              'ORGANIZATION_TYPE_Bank' = if (input$sector_empresa == 'Banca') 1 else 0,
                              'ORGANIZATION_TYPE_Business_Entity_Type_2' = if (input$sector_empresa == 'Negocios tipo 1') 1 else 0,
                              'ORGANIZATION_TYPE_Business_Entity_Type_3' = if (input$sector_empresa == 'Negocios tipo 2') 1 else 0,
                              'ORGANIZATION_TYPE_Electricity' = if (input$sector_empresa == 'Electricidad') 1 else 0,
                              'ORGANIZATION_TYPE_Emergency' = if (input$sector_empresa == 'Salud') 1 else 0,
                              'ORGANIZATION_TYPE_Government' = if (input$sector_empresa == 'Gubernamental') 1 else 0,
                              'ORGANIZATION_TYPE_Hotel' = if (input$sector_empresa == 'Turismo') 1 else 0,
                              'ORGANIZATION_TYPE_Industry_type_10' = if (input$sector_empresa == 'Industria tipo 10') 1 else 0,
                              'ORGANIZATION_TYPE_Industry_type_12' = if (input$sector_empresa == 'Industria tipo 12') 1 else 0,
                              'ORGANIZATION_TYPE_Industry_type_2' = if (input$sector_empresa == 'Industria tipo 2') 1 else 0,
                              'ORGANIZATION_TYPE_Industry_type_3' = if (input$sector_empresa == 'Industria tipo 3') 1 else 0,
                              'ORGANIZATION_TYPE_Industry_type_4' = if (input$sector_empresa == 'Industria tipo 4') 1 else 0,
                              'ORGANIZATION_TYPE_Industry_type_7' = if (input$sector_empresa == 'Industria tipo 7') 1 else 0,
                              'ORGANIZATION_TYPE_Insurance' = if (input$sector_empresa == 'Seguros') 1 else 0,
                              'ORGANIZATION_TYPE_Mobile' = if (input$sector_empresa == 'Telefonía') 1 else 0,
                              'ORGANIZATION_TYPE_Other' = if (input$sector_empresa == 'Otros') 1 else 0,
                              'ORGANIZATION_TYPE_Religion' = if (input$sector_empresa == 'Religión') 1 else 0,
                              'ORGANIZATION_TYPE_Security' = if (input$sector_empresa == 'Cuerpos de seguridad') 1 else 0,
                              'ORGANIZATION_TYPE_Security_Ministries' = if (input$sector_empresa == 'Seguridad privada') 1 else 0,
                              'ORGANIZATION_TYPE_Self-employed' = if (input$sector_empresa == 'ETT') 1 else 0,
                              'ORGANIZATION_TYPE_Services' = if (input$sector_empresa == 'Servicios') 1 else 0,
                              'ORGANIZATION_TYPE_Trade_type_1' = if (input$sector_empresa == 'Comercio tipo 1') 1 else 0,
                              'ORGANIZATION_TYPE_Trade_type_4' = if (input$sector_empresa == 'Comercio tipo 4') 1 else 0,
                              'ORGANIZATION_TYPE_Trade_type_7' = if (input$sector_empresa == 'Comercio tipo 7') 1 else 0,
                              'ORGANIZATION_TYPE_XNA' = if (input$sector_empresa == 'No sabe/No contesta') 1 else 0,
                              'NAME_EDUCATION_TYPE_Academic_degree' = if (input$educacion == 'Grado universitario' || input$educacion == 'Máster/Doctorado') 1 else 0,
                              'FLAG_EMAIL' = if (is.null(input$email)) 0 else 1,
                              'FLAG_CONT_MOBILE' = 1,
                              'REG_REGION_NOT_WORK_REGION' = if (input$region_nacimiento != input$region_trabajo) 1 else 0,
                              'REG_REGION_NOT_LIVE_REGION' = if (input$region_nacimiento != input$region_residencia) 1 else 0,
                              'LIVE_REGION_NOT_WORK_REGION' = if (input$region_residencia != input$region_trabajo) 1 else 0,
                              'LIVE_CITY_NOT_WORK_CITY' = if (input$ciudad_trabajo_residencia == 'No') 1 else 0,
                              'REG_CITY_NOT_WORK_CITY' = if (input$ciudad_nacimiento_trabajo == 'No') 1 else 0,
                              'REG_CITY_NOT_LIVE_CITY' = if (input$ciudad_nacimiento_residencia == 'No') 1 else 0,
                              'NAME_HOUSING_TYPE_Office_apartment' = if (input$vivienda_propiedad == 'Sí') 1 else 0,
                              'NAME_HOUSING_TYPE_Rented_apartment' = if (input$vivienda_propiedad == 'No') 1 else 0,
                              'HOUSETYPE_MODE_specific_housing' = if (input$tipo_vivienda == 'Chalet unifamiliar') 1 else 0,
                              'HOUSETYPE_MODE_terraced_house' = if (input$tipo_vivienda == 'Chalet adosado') 1 else 0,
                              'HOUSETYPE_MODE_nan' = if (input$tipo_vivienda != 'Chalet unifamiliar' && input$tipo_vivienda != 'Chalet adosado') 1 else 0,
                              'NAME_TYPE_SUITE_Family' = if (input$m2 == '+300') 1 else 0,
                              'NAME_TYPE_SUITE_Children' = if (input$m2 == '150-300') 1 else 0,
                              'NAME_TYPE_SUITE_Other_A' = if (input$m2 == '100-150') 1 else 0,
                              'NAME_TYPE_SUITE_Other_B' = if (input$m2 == '50-100') 1 else 0,
                              'WALLSMATERIAL_MODE_Block' = 0,
                              'WALLSMATERIAL_MODE_Others' = 0,
                              'WALLSMATERIAL_MODE_nan' = 0,
                              'FONDKAPREMONT_MODE_nan' = 0,
                              'FONDKAPREMONT_MODE_not_specified' = 0,
                              'FONDKAPREMONT_MODE_org_spec_account' = 0,
                              'EMERGENCYSTATE_MODE_No' = 0,
                              'WEEKDAY_APPR_PROCESS_START_WEDNESDAY' = if (weekdays(Sys.Date()) == "miércoles") 1 else 0,
                              'WEEKDAY_APPR_PROCESS_START_FRIDAY' = if (weekdays(Sys.Date()) == "viernes") 1 else 0,
                              'WEEKDAY_APPR_PROCESS_START_SUNDAY' = if (weekdays(Sys.Date()) == "domingo") 1 else 0,
                              'WEEKDAY_APPR_PROCESS_START_SATURDAY' = if (weekdays(Sys.Date()) == "sábado") 1 else 0,
                              'LANDAREA_MODE' = NaN,
                              'APARTMENTS_MEDI' = NaN,
                              'BASEMENTAREA_AVG' = NaN,
                              'YEARS_BEGINEXPLUATATION_MODE' = NaN,
                              'DEF_60_CNT_SOCIAL_CIRCLE' = NaN,
                              'TOTALAREA_MODE' = NaN,
                              'REGION_RATING_CLIENT' = NaN,
                              'APARTMENTS_MODE' = NaN,
                              'YEARS_BEGINEXPLUATATION_MEDI' = NaN,
                              'YEARS_BUILD_MODE' = NaN,
                              'LIVINGAPARTMENTS_AVG' = NaN,
                              'OBS_60_CNT_SOCIAL_CIRCLE' = NaN,
                              'COMMONAREA_AVG' = NaN,
                              'LIVINGAREA_AVG' = NaN,
                              'ENTRANCES_AVG' = NaN,
                              'LIVINGAREA_MODE' = NaN,
                              'OBS_30_CNT_SOCIAL_CIRCLE' = NaN,
                              'NONLIVINGAREA_MODE' = NaN,
                              'LIVINGAREA_MEDI' = NaN,
                              'NONLIVINGAPARTMENTS_MEDI' = NaN,
                              'ELEVATORS_AVG' = NaN,
                              'FLOORSMIN_AVG' = NaN,
                              'FLAG_DOCUMENT_13' = NaN,
                              'FLOORSMAX_AVG' = NaN,
                              'FLAG_DOCUMENT_16' = NaN,
                              'FLAG_DOCUMENT_18' = NaN,
                              'WALLSMATERIAL_MODE_Panel' = NaN,
                              'ELEVATORS_MODE' = NaN,
                              'FLOORSMIN_MEDI' = NaN,
                              'FLOORSMAX_MEDI' = NaN,
                              'FLOORSMAX_MODE' = NaN,
                              'FLAG_DOCUMENT_14' = NaN,
                              'FLAG_DOCUMENT_11' = NaN,
                              'FLAG_DOCUMENT_6' = NaN,
                              'FLAG_DOCUMENT_5' = NaN,
                              'FLAG_DOCUMENT_7' = NaN,
                              'FLAG_DOCUMENT_10' = NaN,
                              'FLAG_DOCUMENT_19' = NaN,
                              'FLAG_DOCUMENT_20' = NaN
                              )
    
    
    
    # bureau <- read_csv("C:/Users/Beltran/Desktop/Master/TFM/data/datos_bureau_final.csv")
    
    final <- merge(x = tuDataFrame, y = bureau[, c("SK_ID_CURR", setdiff(colnames(bureau),colnames(tuDataFrame)))], by = "SK_ID_CURR", all.x = TRUE)
    
    final <- select(final, -1)
    
    # luego se guarda en un fichero
    write.csv(final, file = "C:/Users/Beltran/Desktop/Master/TFM/interfaz_shiny/otros/registro.csv", row.names = F)
    
    Sys.sleep(10)
    
    # dataframe a usar por el asesor
    
    asesor_df <<- select(final, c("EXT_SOURCE_1", "EXT_SOURCE_2", "EXT_SOURCE_3", "PAYMENT_RATE", "APPROVED_CNT_PAYMENT_MEAN",
                                   "AMT_ANNUITY"))
     
    #a <- py_run_file('./otros/ejecutable.py')
    #a <- a$prediccion
    source_python('./otros/funcion_ejec.py')
    
    a <- ejecutable()
    
    #py_run_file('./otros/graficos_shap.py')
    
    source_python('./otros/func_graf.py')
    
    b <- graficos()
    
    if (a >= 0.65) {
      
      # Cuestionario cliente malo  ----------------------------
      cuestionario2()
      
      updateNavbarPage(session, "mainPanel",
                        selected = 'cuestionario2')
      
      # Asesor ------------------------------------------------
      asesor()
      
    } 
    
    else if (a >= 0.577) {
      
      # Aceptacion --------------------------------------------
      aceptacion()
      
      updateNavbarPage(session, "mainPanel",
                       selected = 'aceptacion')
      
      # Asesor ------------------------------------------------
      en_riesgo()
      
    }
    
    else {
      
      # Aceptacion --------------------------------------------
      aceptacion()
      
      updateNavbarPage(session, "mainPanel",
                        selected = 'aceptacion')
      
      # Asesor ------------------------------------------------
      asesor()
      
    }
  
  },
  
  ignoreInit = TRUE)
  
  # Value boxes ------------------------------------
  output$ext_source_1 <- renderValueBox({
    valueBox(asesor_df$EXT_SOURCE_1, 
             "EXT_SOURCE_1", color = "yellow")
  })
  
  output$ext_source_2 <- renderValueBox({
    valueBox(asesor_df$EXT_SOURCE_2, 
             "EXT_SOURCE_2", color = "yellow")
  })
  
  output$ext_source_3 <- renderValueBox({
    valueBox(asesor_df$EXT_SOURCE_3, 
             "EXT_SOURCE_3", color = "yellow")
  })
  
  output$payment_rate <- renderValueBox({
    valueBox(asesor_df$PAYMENT_RATE, 
             "PAYMENT_RATE", color = "yellow")
  })
  
  output$cnt_payment <- renderValueBox({
    valueBox(asesor_df$APPROVED_CNT_PAYMENT_MEAN, 
             "APPROVED_CNT_PAYMENT_MEAN", color = "yellow")
  })
  
  output$amt_annuity <- renderValueBox({
    valueBox(asesor_df$AMT_ANNUITY, 
             "AMT_ANNUITY", color = "yellow")
  })
  
  # Boton para volver atras -----------------------------------
  observeEvent(input$volver, {
    
    # Se borra el cuestionario1 -----------------------
    removeTab(
      inputId = 'mainPanel',
      target = 'cuestionario1'
    )
    
    updateNavbarPage(session, "mainPanel",
                     selected = 'home')
    
  },
  
  ignoreInit = TRUE)
  
  # Boton para finalizar el cuestionario2 -----------------------------------
  observeEvent(input$enviar_doc, {
    
    # Se borra el cuestionario1 -----------------------
    removeTab(
      inputId = 'mainPanel',
      target = 'cuestionario1'
    )
    
    # Se borra el cuestionario2 -----------------------
    removeTab(
      inputId = 'mainPanel',
      target = 'cuestionario2'
    )
    
    updateNavbarPage(session, "mainPanel",
                     selected = 'home')
    
  },
  
  ignoreInit = TRUE)
  
  # Boton para finalizar la prueba tras aceptacion -----------------------------------
  observeEvent(input$finalizar, {
    
    # Se borra el cuestionario1 -----------------------
    removeTab(
      inputId = 'mainPanel',
      target = 'cuestionario1'
    )
    
    # Se borra la pantalla de aceptacion -----------------------
    removeTab(
      inputId = 'mainPanel',
      target = 'aceptacion'
    )
    
    updateNavbarPage(session, "mainPanel",
                     selected = 'home')
    
  },
  
  ignoreInit = TRUE)
  
  # Boton para finalizar asesor -----------------------------------
  observeEvent(input$cerrar_asesor, {
    
    # Se borra el asesor -----------------------
    removeTab(
      inputId = 'mainPanel',
      target = 'vista_asesor'
    )
    
    # Se borra la pantalla de aceptacion -----------------------
    removeTab(
      inputId = 'mainPanel',
      target = 'aceptacion'
    )
    
    updateNavbarPage(session, "mainPanel",
                     selected = 'home')
    
  },
  
  ignoreInit = TRUE)
  
  # Boton para finalizar cliente en riesgo -----------------------------------
  observeEvent(input$cerrar_en_riesgo, {
    
    # Se borra el asesor con cliente en riesgo -----------------------
    removeTab(
      inputId = 'mainPanel',
      target = 'en_riesgo'
    )
    
    # Se borra la pantalla de aceptacion -----------------------
    removeTab(
      inputId = 'mainPanel',
      target = 'aceptacion'
    )
    
    updateNavbarPage(session, "mainPanel",
                     selected = 'home')
    
  },
  
  ignoreInit = TRUE)
})