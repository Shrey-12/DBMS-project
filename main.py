from flask import Flask
from datetime import timedelta
from application.database import db
from application.config import Config

app = None


def build_app():
    app = Flask(__name__, template_folder="templates")
    app.config.from_object(Config)
    app.secret_key = "hello"
    app.permanent_session_lifetime = timedelta(minutes=5)
    app.config['SQLALCHEMY_DATABASE_URI'] = Config.SQLALCHEMY_DATABASE_URI
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = Config.SQLALCHEMY_TRACK_MODIFICATIONS
    db.init_app(app)
    app.app_context().push()
    return app
     

app = build_app()
from application.controllers_buyer import *
from application.controllers_agent import *
from application.controllers_office import *
from application.controllers_seller import *
from application.controllers_login import *
from application.controllers_agentDashboard import *


if __name__ == "__main__":
    app.run(host="0.0.0.0",debug=True, port=8000)
