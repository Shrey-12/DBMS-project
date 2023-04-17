from flask import current_app as app, flash
from application.models import Property
from flask import render_template, request, session, redirect, url_for
from application.database import db
from sqlalchemy import text
from application.models import *
from application.controllers_buyer import *
from application.controllers_office import *
from application.controllers_agentDashboard import *

@app.route('/agent/<aid>')
def agent_selected(aid):
    query = text("SELECT * FROM agent WHERE agent_id= :id")
    search_params1 = {
        'id': aid
    }
    results1 = db.session.execute(query, search_params1).fetchall()

    query_search = text(
        """WITH prop(pid) AS
        (SELECT pid FROM sells WHERE agent_id = :id)
        SELECT * FROM buys NATURAL JOIN prop NATURAL JOIN property;"""
    )
    search_params2 = {
        'id': aid
    }
    results2 = db.session.execute(query_search, search_params2).fetchall()

    return render_template("agent_interface.html", agent=results1[0], homes=results2)
