*** Settings ***
#Library  JupyterLibrary
Library  JupyterLibrary

*** Keywords ***
Launch Python3 JupyterHub
  Wait Until Page Contains  New
  Wait Until Page Contains  Files
  #TODO: This window title may change so we should be selecting something with more certainty
  Switch Window  Home Page - Select or create a notebook
  Click Button  new-dropdown-button
  Click Link  Python 3

Launch Python3 JupyterLab Smoke Test Notebook
  Launch a new JupyterLab Document

  Add and Run JupyterLab Code Cell  !pip freeze
  Wait Until JupyterLab Code Cells Is Not Active
  Capture Page Screenshot
  Add and Run JupyterLab Code Cell  !pip install watermark
  Wait Until JupyterLab Code Cells Is Not Active

  Add and Run JupyterLab Code Cell  import boto3     import kafka     import pandas     import matplotlib     import numpy     import scipy
  Wait Until JupyterLab Code Cells Is Not Active
  Capture Page Screenshot

  Add and Run JupyterLab Code Cell  import watermark

  Add and Run JupyterLab Code Cell  %load_ext watermark
  Add and Run JupyterLab Code Cell  %watermark
  Capture Page Screenshot
  Add and Run JupyterLab Code Cell  %watermark --iversions
  Capture Page Screenshot
  
  JupyterLab Code Cell Error Output Should Not Be Visible
