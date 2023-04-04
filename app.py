from flask import Flask, redirect, url_for, render_template, request, session, flash
from flask_sqlalchemy import SQLAlchemy
from datetime import timedelta, date
from markupsafe import escape
from config.sqlConfig import MYSQLCONFIG


app = Flask(__name__, template_folder="templates")
app.secret_key = "hello"
app.permanent_session_lifetime = timedelta(minutes=5)

app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+pymysql://" + \
    MYSQLCONFIG.user+":"+MYSQLCONFIG.password+"@localhost:3306/realestate"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False


db = SQLAlchemy(app)


class Property(db.Model):
    pid = db.Column(db.Integer, primary_key=True)
    house = db.Column(db.Integer)
    street = db.Column(db.String(50))
    area = db.Column(db.String(50))
    pincode = db.Column(db.Numeric(4))
    area_sqft = db.Column(db.Integer)
    avail = db.Column(db.Integer)
    market_in = db.Column(db.Date)
    rent_price = db.Column(db.Integer)
    sell_price = db.Column(db.Integer)
    no_bedrooms = db.Column(db.Integer)
    build_year = db.Column(db.Integer)
    is_sold = db.Column(db.Boolean)
    is_rented = db.Column(db.Boolean)


@app.route("/")
def home():
    home_og = Property.query.all()
    return render_template('index.html', homes=home_og)


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


if __name__ == "__main__":
    app.run(debug=True, port=8001)
