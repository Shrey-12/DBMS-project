from flask import current_app as app, flash
from flask import render_template, request, session, redirect, url_for
from application.database import db
from sqlalchemy import text
from application.models import *
from application.controllers_buyer import *
from application.controllers_office import *
from application.controllers_agentDashboard import *
from datetime import date


@app.route('/owners')
def owners():
    query = text("Select * from agent")
    result = db.session.execute(query)
    return render_template("seller.html", agents = result)

@app.route('/owners/submit', methods = ['POST', 'GET'])
def owners_submit():
    if request.method == "POST":
        max_existing_pid = db.session.query(db.func.max(Property.pid)).scalar()
        new_pid = max_existing_pid + 1 if max_existing_pid is not None else 1
        session['new_pid'] = new_pid
        new_property = Property(
            pid         = new_pid,
            house_no    = request.form['house-no'],
            street      = request.form['street'],
            area        = request.form['area'],
            area_sqft   = request.form['area-sqft'],
            pincode     = request.form['pincode'],
            avail       = request.form['avail'],
            market_in   = date.today(),
            rent_price  = request.form['rent-price'],
            sell_price  = request.form['sell-price'],
            no_bedrooms = request.form['bedrooms'],
            build_year  = request.form['year-built'],
            is_sold     = False,
            is_rented   = False
        )
        db.session.add(new_property)
        db.session.commit()
        other_update()
        return render_template("seller_submit.html")

    else:
      query = text("Select * from agent")
      result = db.session.execute(query)
      return render_template("seller.html", agents = result)

def other_update():
    if request.method == "POST":
        new_pid = session.get('new_pid')
        chosen_aid = request.form['agent_id']
        seller_id = request.form['sid']
    
        new_owns = Owns(
            pid = new_pid,
            sid = seller_id,
            current_owner = 1
        )
    
        new_sells = Sells(
            pid = new_pid,
            agent_id = chosen_aid
        )
    
        db.session.add(new_sells)
        db.session.commit()

        db.session.add(new_owns)
        db.session.commit()
        return " "