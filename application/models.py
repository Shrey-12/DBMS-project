from application.database import db


class Property(db.Model):
    __tablename__ = 'property'
    pid = db.Column(db.Integer, primary_key=True)
    house_no = db.Column(db.Integer)
    street = db.Column(db.String(50))
    area = db.Column(db.String(50))
    pincode = db.Column(db.Numeric(4))
    area_sqft = db.Column(db.Integer)
    avail = db.Column(db.String)
    market_in = db.Column(db.Date)
    rent_price = db.Column(db.Integer)
    sell_price = db.Column(db.Integer)
    no_bedrooms = db.Column(db.Integer)
    build_year = db.Column(db.Integer)
    is_sold = db.Column(db.Boolean)
    is_rented = db.Column(db.Boolean)


class Agent(db.Model):
    __tablename__ = 'agent'
    agent_id = db.Column(db.Integer, primary_key=True)
    password = db.Column(db.String(50))
    agent_name = db.Column(db.String(50))
    contact_no = db.Column(db.Numeric(10))
    area = db.Column(db.String(50))
    rating = db.Column(db.Numeric(2, 1))
    no_rented = db.Column(db.Integer)
    no_sold = db.Column(db.Integer)
    rental_sales = db.Column(db.Integer)
    sold_sales = db.Column(db.Integer)
    base_commission = db.Column(db.Numeric(2, 1))


class Sells(db.Model):
    __tablename__ = 'sells'
    pid = db.Column(db.Integer, db.ForeignKey('Property.pid'))
    agent_id = db.Column(db.Integer, db.ForeignKey('Agent.agent_id'))
    __table_args__ = (
        db.PrimaryKeyConstraint('pid', 'agent_id'),
    )
