from flask import current_app as app
from application.models import Property
from flask import render_template
from application.database import db
from sqlalchemy import text


@app.route("/", methods=["GET"])
def home():
    print("Hello")
    '''home_og = Property.query.all()'''

    home_og = text(
        "SELECT * FROM property natural join sells natural join agent ")
    results = db.session.execute(home_og).fetchall()

    search_query1 = text(
        "SELECT distinct area FROM property ")
    results1 = db.session.execute(search_query1).fetchall()

    search_query2 = text(
        "SELECT distinct no_bedrooms FROM property ")
    results2 = db.session.execute(search_query2).fetchall()

    search_query3 = text(
        "SELECT distinct area_sqft FROM property ")
    results3 = db.session.execute(search_query3).fetchall()

    return render_template('index.html', homes=results, loc=results1, loc1=results2, loc2=results3)


'''
@app.route("/<name>")
def user1(name):
    return render_template("index.html", content=name)


@app.route("/admin")
def admin():
    return redirect(url_for("user", name="Admin!!"))


@app.route("/login", methods=["POST", "GET"])
def login():
    if request.method == "POST":
        session.permanent = True
        user = request.form["nm"]
        session["user"] = user
        flash("You have been logged in successfully")
        return redirect(url_for("user"))
    else:
        if "user" in session:
            flash("Already Logged in")
            return redirect(url_for("user"))
        return render_template("login.html")


@app.route("/user")
def user():
    if "user" in session:
        user = session["user"]
        return render_template("user.html", user=user)
    else:
        flash("You are not logged in")
        return redirect(url_for("login"))


@app.route("/logout")
def logout():
    if "user" in session:
        user = session["user"]
        flash(f"You have been logged out successfully, {user}", "info")
    session.pop("user", None)

    return redirect(url_for("login")) '''
