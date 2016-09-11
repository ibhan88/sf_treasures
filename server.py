"""SF Treasures - The All-Women Hackathon San Francisco 9/10/16"""

from flask import Flask, render_template, request, flash, redirect, session, jsonify
# from Jinja2 import StrictUndefined
import json
import os
import requests
import sys
from helpers import send_sms


app = Flask(__name__)


app.secret_key = os.environ.get('FLASK_SECRET_KEY')

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
    #list of unicode items
    phone_number_list = request.args.getlist("phoneNumber")

    phone_number = "1"+str(phone_number_list[0])+str(phone_number_list[1])+str(phone_number_list[2])

    session["phone_number"] = phone_number

    send_sms(session["phone_number"], "Clue 1")
    print "Success! Look out for text messge."

    #query database for leaderboard information and pass object to game.html
    leaderboard = Leader.session.query.all()

    return render_template("game.html", leaderboard=leaderboard)




@app.route('/results')
def show_winner():
    """Display winner."""

    return render_template("results.html")
    

##########################################################################

# # Listening or requests
if __name__ == "__main__":
    # connect_to_db(app)
    app.run(host="0.0.0.0")

