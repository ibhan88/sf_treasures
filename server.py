"""SF Treasures - The All-Women Hackathon San Francisco 9/10/16"""

from flask import Flask, render_template, request, flash, redirect, session, jsonify
# import geocoder
# import geojson
# import googlemaps
# from Jinja2 import StrictUndefined
import json
import os
import requests
import sys
from helpers import send_sms


app = Flask(__name__)

app.secret_key = os.environ.get('FLASK_SECRET_KEY')
app.secret_key = os.environ.get('GOOGLE_API_KEY')
# Access key for Googlemaps API
# gmaps = googlemaps.Client(key=os.environ['GEOLOCATE_GOOGLE_API'])

# Ensures undefined variables in jinja raise an error
# app.jinja_env.undefined = StrictUndefined
# allows html to reload without restarting server
app.jinja_env.auto_reload = True

###############################################################################


@app.route('/')
def show_homepage():
    """Show homepage."""

    return render_template("homepage.html")


@app.route('/game_time')
def show_gamepage():
    """Show progress of game being played."""

    # body = "Hackathon Test"
    # to = "+14157557230"
    # send_message(body, to)

    neighborhood = request.args.get("neighborhood")
    num_clues = request.args.get("clues")
    phone_number = request.args.getlist("phoneNumber")

    print "\n\n\n\n"
    print phone_number
    print "\n\n\n\n"
    
    session["number"] = phone_number

    send_sms(session["number"], "Clue Clue Clue")
    print "Success! Look out for text messge."

    return render_template("game.html")


@app.route('/results')
def show_winner():
    """Display winner."""

    return render_template("results.html")
    

##########################################################################

# # Listening or requests
if __name__ == "__main__":
    # connect_to_db(app)
    app.run(host="0.0.0.0")

