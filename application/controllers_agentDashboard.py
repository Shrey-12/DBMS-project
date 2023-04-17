from flask import current_app as app
from application.models import Property, Sells,Buys
from flask import render_template, request, session, redirect, url_for
from application.database import db
from sqlalchemy import or_,and_, text


@app.route("/agent/<agent_id>/dashboard")
def agent_dashboard(agent_id):
    soldProperties = (
        Property.query.join(Sells, Sells.pid == Property.pid)
        .filter(Property.pid == Sells.pid)
        .filter(Sells.agent_id == agent_id)
        .filter(or_(Property.is_sold==1,Property.is_rented == 1)).all()
    )
    pendingProperties = (
        Property.query.join(Sells, Sells.pid == Property.pid)
        .filter(Sells.agent_id == agent_id)
        .filter(and_(Property.is_sold == 0, Property.is_rented == 0)).all()
    )


    return render_template(
        "agent_dashboard.html",
        agentID=agent_id,
        pendingProperties=pendingProperties,
        soldProperties=soldProperties,
    )


@app.route('/agent/<agent_id>/dashboard/<pid>', methods= ['POST'])
def buys(pid):
    new_bid = request.form['bid']
    new_market_out = request.form['Market_out']
    new_year = request.form['year']
    new_pid = pid
    new_buys= Buys(
        bid = new_bid,
        pid = new_pid,
        year = new_year,
        market_out = new_market_out

    )
    db.session.add(new_buys)
    db.session.commit()


