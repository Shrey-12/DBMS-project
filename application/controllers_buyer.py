from flask import current_app as app
from application.models import Property
from flask import render_template, request, session, redirect, url_for
from application.database import db
from sqlalchemy import text



@app.route("/", methods=["GET", "POST"])
def home():
    print("Hello")
    '''home_og = Property.query.all()'''

    search_query1 = text(
        "SELECT DISTINCT area FROM property order by area"
    )
    results1 = db.session.execute(search_query1).fetchall()

    search_query2 = text(
        "SELECT DISTINCT no_bedrooms FROM property order by no_bedrooms"
    )
    results2 = db.session.execute(search_query2).fetchall()

    search_query3 = text(
        "SELECT DISTINCT area_sqft FROM property order by area_sqft"
    )
    results3 = db.session.execute(search_query3).fetchall()

    if "url" not in session.keys() :
        home_og = text(
            "SELECT * FROM property natural join sells natural join agent ")
        results = db.session.execute(home_og).fetchall()
        return render_template('house_listing.html', homes=results, loc=results1, loc1=results2, loc2=results3)

    elif session["url"] == 'submit':
        search_query = text(
            "SELECT * FROM property NATURAL JOIN sells NATURAL JOIN agent "
            "WHERE property.area=:location AND ((sell_price BETWEEN :lower_price AND :upper_price) OR (rent_price BETWEEN :lower_price AND :upper_price)) AND no_bedrooms=:bedrooms AND area_sqft BETWEEN :min_area AND :max_area AND property.avail=:avail_prop"
        )
        search_params = {
            'location': session.get('location', ''),
            'lower_price': session.get('lower_price', 0),
            'upper_price': session.get('upper_price', float('inf')),
            'bedrooms': session.get('bedrooms', ''),
            'min_area': session.get('min_area', 0),
            'max_area': session.get('max_area', float('inf')),
            'avail_prop': session.get('avail_prop', '')
        }
        results = db.session.execute(search_query, search_params).fetchall()
        session.pop('location')
        session.pop('bedrooms')
        session.pop('min_area')
        session.pop('max_area')
        session.pop('lower_price')
        session.pop('upper_price')
        session.pop('avail_prop')
        session.pop('url')
        return render_template('house_listing.html', homes=results, loc=results1, loc1=results2, loc2=results3)
    
    elif session['url'] == 'Asylum Hill':
        search_query = text(
            "SELECT * FROM property NATURAL JOIN sells NATURAL JOIN agent "
            "WHERE property.area=:location"
        )
        search_params = {
        'location': 'Asylum Hill'
        }
        results = db.session.execute(search_query, search_params).fetchall()
        session.pop('url')
        session.pop('location')
        return render_template('house_listing.html', homes=results, loc=results1, loc1=results2, loc2=results3)
    
    elif session['url'] == 'Blue Hills':
        search_query = text(
            "SELECT * FROM property NATURAL JOIN sells NATURAL JOIN agent "
            "WHERE property.area=:location"
        )
        search_params = {
            'location': 'Blue Hills'
        }
        results = db.session.execute(search_query, search_params).fetchall()
        session.pop('url')
        session.pop('location')
        return render_template('house_listing.html', homes=results, loc=results1, loc1=results2, loc2=results3)

    elif session['url'] == 'Barry Square':
        search_query = text(
            "SELECT * FROM property NATURAL JOIN sells NATURAL JOIN agent "
            "WHERE property.area=:location"
        )
        search_params = {
            'location': 'Barry Square'
        }
        results = db.session.execute(search_query, search_params).fetchall()
        session.pop('url')
        session.pop('location')
        return render_template('house_listing.html', homes=results, loc=results1, loc1=results2, loc2=results3)



    

@app.route('/submit', methods=['POST'])
def submit():
    session['url']= "submit"
    location = request.form['location']
    session['location'] = location

    price_range = request.form.get('price', '')
    if price_range:
        price_range = price_range.replace('$', '').replace(',', '')
        lower_price, upper_price = map(int, price_range.split('-'))
        session['lower_price'] = lower_price
        session['upper_price'] = upper_price

    bedrooms = request.form.get('bedrooms', '')
    session['bedrooms'] = bedrooms
    avail_prop = request.form.get('Availability')
    session['avail_prop'] = avail_prop

    area_range = request.form.get('area', '')
    if area_range:
        min_area, max_area = map(int, area_range.split('-'))
        session['min_area'] = min_area
        session['max_area'] = max_area

    return redirect(url_for('home'))


@app.route('/Asylum Hill')
def asylum_hill():
    session['url'] = 'Asylum Hill'
    session['location'] = 'Asylum Hill'
    
    return redirect(url_for('home'))


@app.route('/Barry Square')
def barry_square():
    session['url'] = 'Barry Square'
    session['location'] = 'Barry Square'
    return redirect(url_for('home'))

@app.route('/Blue Hills')
def blue_hils():
    session['url'] = 'Blue Hills'
    session['location'] = 'Blue Hills'
    return redirect(url_for('home'))


@app.route('/owners')
def owners():
    # session['url'] = 'owners'
    # session.pop('url')
    return render_template('seller.html')

'''@app.route('/submit', methods=['POST'])
def submit():
    session['url'] = "submit"
    location = request.form['location']
    session['location'] = location

    price_range = request.form.get('price', '')
    if price_range:
        price_range = price_range.replace('$', '').replace(',', '')
        lower_price, upper_price = map(int, price_range.split('-'))
        session['lower_price'] = lower_price
        session['upper_price'] = upper_price

    bedrooms = request.form.get('bedrooms', '')
    session['bedrooms'] = bedrooms
    avail_prop = request.form.get('Availability')
    session['avail_prop'] = avail_prop

    area_range = request.form.get('area', '')
    if area_range:
        min_area, max_area = map(int, area_range.split('-'))
        session['min_area'] = min_area
        session['max_area'] = max_area

    return redirect(url_for('home'))



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
