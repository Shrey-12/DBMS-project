from flask import current_app as app, flash
from application.models import Property
from flask import render_template, request, session, redirect, url_for
from application.database import db
from sqlalchemy import text
from application.models import *
from application.controllers_buyer import *
from application.controllers_office import *
from application.controllers_agentDashboard import *

@app.route("/")
def users():
    return render_template('user.html')

@app.route("/<type>", methods=["POST", "GET"])
def login(type):
    u_type = type
    if request.method == "POST":
        session.permanent = True
        id = request.form.get("Username")
        password = request.form.get("Password")
        session["id"] = id
        
        if(isValidUser(id, password, u_type)):

            print("You have been logged in successfully ")
            if(type == "user"):
                return redirect(url_for("buyer"))
            elif(type == "agent_office"):
                return redirect(url_for('agency'))
            elif(type == "agent"):
                return redirect(url_for('agent_dashboard', agent_id = id))
        
        else:
            print("Try again")
            return redirect(url_for('login',type = u_type))
    else:
        if "user" in session:
            flash("Already Logged in")
            return redirect(url_for("user"))
        print("home")
        return render_template("login.html")





