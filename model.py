"""Models for SF Treasures hackathon project."""

from flask import Flask
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


##############################################################################

class Artist(db.Model):
    """Artist for SF Civic Art Collection"""

    __tablename__ = "artists"

    artist_id = db.Column(db.Integer,
                          autoincrement=True,
                          primary_key=True)
    artist_name = db.Column(db.String(200), nullable=False)


class Art(db.Model):
    """Art in SF Civic Art Collection."""

    __tablename__ = "arts"

    art_id = db.Column(db.Integer,
                       autoincrement=True,
                       primary_key=True)
    title = db.Column(db.String(200), nullable=True)
    artist_id = db.Column(db.Integer,
                          db.ForeignKey('artists.artist_id'))
    latitude = db.Column(db.Float, nullable=True)
    longitude = db.Column(db.Float, nullable=True)
    clue = db.Column(db.Text, nullable=True)
    question = db.Column(db.Text, nullable=True)
    answer = db.Column(db.String(140), nullable=True)

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<Art art_id=%s clue=%s>" % (self.art_id,
                                            self.clue)

    #Define relationship artists table
    artists = db.relationship("Artist",
                              backref=db.backref("arts"))


class ParkType(db.Model):
    """A model that represents types of parks."""

    __tablename__ = "parktypes"

    type_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    title = db.Column(db.String(128))


class Park(db.Model):
    """A model that represents a park."""

    __tablename__ = "parks"

    # Create the columns for this table.
    park_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    parkname = db.Column(db.String(64), nullable=False)

    # Park type titles could change, so we'll be breaking these out into a
    # separate table.
    type_id = db.Column(db.Integer, db.ForeignKey("parktypes.type_id"))

    # Location data, as floats per gmaps reqs
    lat = db.Column(db.Float, nullable=False)
    lon = db.Column(db.Float, nullable=False)

    # Scavenger hunt details for this park
    clue = db.Column(db.Text, nullable=False)
    question = db.Column(db.Text, nullable=False)
    answer = db.Column(db.String(140), nullable=False)

    # Create a relationship w/ parktype table
    parktype = db.relationship("ParkType", backref=db.backref("parktypes"))


class Leader(db.Model):
    """Records of 10 teams with shortest time."""

    print "Leaders"

    __tablename__ = "leaders"

    leader_id = db.Column(db.Integer,
                          autoincrement=True,
                          primary_key=True)
    team_name = db.Column(db.String(140),
                          nullable=False)
    total_minutes = db.Column(db.Integer,
                              nullable=False)


#####   HELPER FUNCTIONS  ######################################################

def connect_to_db(app, db_uri='postgresql:///treasures'):
    """Connect the database to our Flask app."""

    app.config['SQLALCHEMY_DATABASE_URI'] = db_uri
    db.app = app
    db.init_app(app)

################################################################################

if __name__ == "__main__":

    from server import app
    connect_to_db(app)
    print "Connected to DB."
