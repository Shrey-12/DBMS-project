from flask import current_app as app
from application.models import Property
from flask import render_template

@app.route("/", methods = ["GET"])
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

