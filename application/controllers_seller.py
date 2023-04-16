from flask import current_app as app, flash
from application.models import Property
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
    return render_template("seller.html")

@app.route('/owners/submit', methods = ['POST', 'GET'])
def owners_submit():
    if request.method == "POST":
        max_existing_pid = db.session.query(db.func.max(Property.pid)).scalar()
        new_pid = max_existing_pid + 1 if max_existing_pid is not None else 1
        print(str(new_pid) + "hahah")
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
        return f"Form submitted successfully."

    else:
      return render_template("seller.html")