from model import Artist, Art, ParkType, Park, Leader
from model import connect_to_db, db
from server import app

import requests


def load_artist(data):
    print "Artist"

    for d in data:
        info = d['properties']
        artist_name = info['artist']

        if not Artist.query.filter_by(artist_name=artist_name).all():
            artist = Artist(artist_name=artist_name)
            db.session.add(artist)

    db.session.commit()


def load_art(data):
    print "Art"

    for d in data:
        info = d['properties']
        title = info['title']
        longitude = info['lon']
        latitude = info['lat']
        artist_name = info['artist']

        artist_id = Artist.query.filter_by(artist_name=artist_name).first().artist_id

        art = Art(title=title,
                  artist_id=artist_id,
                  latitude=latitude,
                  longitude=longitude)
        db.session.add(art)

    db.session.commit()


def load_parktypes():
    """Load parktypes into db."""

    print "\n***Loading parktypes***\n"

    # Delete all existing rows so we don't add dups
    ParkType.query.delete()

    parktypes = get_all_park_types()

    for parktype in parktypes:
        title = parktype["parktype"]
        parktype_record = ParkType(title=title)

        db.session.add(parktype_record)

    db.session.commit()


def load_parks():
    """Load park records into db."""

    print "\n***Loading parks***\n"

    # Hard-coding coordinates for the purposes of the hackathon.
    # top_left = (str(37.795190), str(-122.413189))
    # bottom_right = (str(37.782678), str(-122.393239))

    parks = get_parks()

    for park in parks:
        name = park.get("parkname")
        parktype = ParkType.query.filter_by(title=park.get("parktype")).first()
        type_id = parktype.type_id

        # Location looks like this:
        # location_1': {u'type': u'Point', u'coordinates': [-122.41178577, 37.79420965]}
        location = park.get("location_1")

        if location:

            lat = location.get("coordinates")[1]
            lon = location.get("coordinates")[0]

            clue = ""
            question = ""
            answer = ""

            park_record = Park(parkname=name,
                               type_id=type_id,
                               lat=lat,
                               lon=lon,
                               clue=clue,
                               question=question,
                               answer=answer)

            db.session.add(park_record)

    db.session.commit()


def load_sample_teams():
    """Load sample teams."""

    teams = [
        ("Balloonicorn", 60),
        ("Ada", 122),
        ("Hackbright", 87),
        ("Team Go", 99),
        ("Winners", 186),
        ("Pythoners", 202),
        ("Yay! Us!", 258),
        ("Coders", 152),
        ("WeLovePython", 129),
        ("SFers", 138)
    ]

    for team in teams:
        team_name = team[0]
        total_minutes = team[1]

        leader = Leader(team_name=team_name,
                        total_minutes=total_minutes)
        db.session.add(leader)

    db.session.commit()


###########################################################################

def get_art_data():

    url = 'https://stamen-org.carto.com:443/api/v2/sql?format=GeoJSON&q=select * from "stamen-org".sf_civic_art_collection_georeferenced'

    response = requests.get(url)
    response.close()

    return response.json()['features']


def get_parks(top_left=None, bottom_right=None):
    """Sends a request to SF OpenData's park data JSON endpoint and returns
    the result as a list of dictionaries.

    Given top_left and bottom_right, will only get parks in the bounds of
    the box created by those points.

    The request URL for a specific box should look like this:

    https://data.sfgov.org/resource/94uf-amnx.json?$where=within_box
    (location_1,%2037.795190,%20-122.413189,%2037.782678,%20-122.393239)"""

    if top_left is None or bottom_right is None:
        url = 'https://data.sfgov.org/resource/94uf-amnx.json'

    else:
        url = 'https://data.sfgov.org/resource/94uf-amnx.json?$where=' \
              'within_box(location_1,%20{},%20{},%20{},%20{})'.format(top_left[0],
                                                                      top_left[1],
                                                                      bottom_right[0],
                                                                      bottom_right[1])
    response = requests.get(url)
    response.close()
    response = response.json()

    return response


def get_all_park_types():
    """Sends a request to SF OpenData's park data JSON endpoint and returns
    a list of park types. Result is a dict."""

    url = 'https://data.sfgov.org/resource/94uf-amnx.json?$group=parktype&$select=parktype&$where=parktype%20IS%20NOT%20NULL'

    response = requests.get(url)
    response.close()
    response = response.json()

    return response


###########################################################################

if __name__ == "__main__":
    connect_to_db(app)

    db.drop_all()
    db.create_all()

    data = get_art_data()
    load_artist(data)
    load_art(data)
    load_parktypes()
    load_parks()
    load_sample_teams()
