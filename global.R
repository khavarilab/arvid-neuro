# Contains common import statements and functions

library(shiny)
library(shinydashboard)
library(DT)

df_studydata = read.csv('./www/study_summary_data.csv', check.names = F)

df_studymeta = read.csv('./www/study_metadata.csv', check.names = F)

df_columnmeta = read.csv('./www/column_metadata.csv', check.names = F)
