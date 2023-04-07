import os
from application.sqlConfig import MYSQLCONFIG

basedir = os.path.abspath(os.path.dirname(__file__))

class Config:
    DEBUG = True
    SQLALCHEMY_DATABASE_URI = "mysql+pymysql://" + \
    MYSQLCONFIG.user+":"+MYSQLCONFIG.password+"@localhost:3306/realestate"
    SQLALCHEMY_TRACK_MODIFICATIONS = False