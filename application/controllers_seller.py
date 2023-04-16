from flask import current_app as app, flash
from application.models import Property
from flask import render_template, request, session, redirect, url_for
from application.database import db
from sqlalchemy import text
from application.models import *
from application.controllers_buyer import *
from application.controllers_office import *
from application.controllers_agentDashboard import *

@app.route('/owners')
def owners():
    return render_template("seller.html")