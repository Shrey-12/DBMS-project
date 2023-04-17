from flask import current_app as app
from application.models import Property, Agent, Sells, Buys
from flask import render_template, request, session, redirect, url_for
from application.database import db
from sqlalchemy import text
from application.controllers_buyer import *

'''@app.route("/agency/<name>", methods=["GET", "POST"])
def agent_det(name):
    query = text("SELECT * FROM Agent WHERE agent_name = :name")
    search_params = {
        'name': name
    }
    results = db.session.execute(query, search_params).fetchall()
    query_search = text(
        """WITH prop(pid) AS
        (SELECT pid FROM sells WHERE agent_id = (SELECT agent_id FROM Agent WHERE agent_name=:name))
        SELECT * FROM buys NATURAL JOIN prop NATURAL JOIN property;"""
    )
    search_params = {
        'name': name
    }
    results = db.session.execute(query_search, search_params).fetchall()
    
    return render_template("agentinfosales.html", names = name, agents=results, homes=results)'''

@app.route('/agency')
def agency():
    query = text("Select * from agent")
    result_agent = db.session.execute(query)
    result_agent1 = db.session.execute(query)
    return render_template('agentoffice.html', agents = result_agent, homes = result_agent1)

@app.route("/agency/<name>", methods=["GET", "POST"])
def agent_det(name):
    query = text("SELECT * FROM agent WHERE agent_name= :aname")
    search_params1 = {
        'aname': name
    }
    results1 = db.session.execute(query, search_params1).fetchall()
    a_name = results1[0].agent_name.lower().replace(" ", "")
    query_search = text(
        """WITH prop(pid) AS
        (SELECT pid FROM sells WHERE agent_id = (SELECT agent_id FROM agent WHERE agent_name= :aname))
        SELECT * FROM buys NATURAL JOIN prop NATURAL JOIN property;"""
    )
    search_params2 = {
        'aname': name
    }
    results2 = db.session.execute(query_search, search_params2).fetchall()

    return render_template("agentinfosales.html",anames = a_name, agent=results1[0], homes=results2)


'''@app.route("/agency/<name>", methods=["GET", "POST"])
def agent_det(name):
    agent = Agent.query.filter_by(agent_name=name).first()
    if agent:
        prop = Sells.query.filter_by(agent_id=agent.agent_id).with_entities(Sells.pid)
        results = Buys.query.join(prop, Buys.pid == Property.pid).join(Property, Buys.pid == Property.pid.alias('prop')).all()
        return render_template("agentinfosales.html", names=name, agents=results, homes=results)
    else:
        # Handle agent not found
        return render_template("error.html", message="Agent not found"), 404'''
