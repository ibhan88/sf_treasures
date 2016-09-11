"""SF Treasures - The All-Women Hackathon San Francisco 9/10/16"""

from flask import Flask, render_template, request, flash, redirect, session, jsonify
# from Jinja2 import StrictUndefined

from model import Leader, connect_to_db, Park, Art

import json
import os
import requests
import sys
from helpers import send_sms, midpoint
from flask_sqlalchemy import SQLAlchemy



app = Flask(__name__)


app.secret_key = os.environ.get('FLASK_SECRET_KEY')

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

    neighborhood = request.args.get("neighborhood")
    num_clues = int(request.args.get("clues"))
    team_name = request.args.get("teamName")
    #list of unicode items
    phone_number_list = request.args.getlist("phoneNumber")

    phone_number = "1"+str(phone_number_list[0])+str(phone_number_list[1])+str(phone_number_list[2])

    session["phone_number"] = phone_number

    # send_sms(session["phone_number"], "Clue 1")
    # print "Success! Look out for text messge."
    things = Park.query.limit(5)
    things_list = []
    for t in things:
        things_list.append(t)

    top_left = [37.795190, -122.413189]
    bottom_right = [37.782678, -122.393239]
    art_list = Art.query.filter(Art.latitude < top_left[0], Art.latitude > bottom_right[0]).filter(Art.longitude > top_left[1], Art.longitude < bottom_right[1]).all()
    parks = Park.query.filter(Park.lat < top_left[0], Park.lat > bottom_right[0]).filter(Park.lon > top_left[1], Park.lon < bottom_right[1]).all()

    geojson = [{
                "type": "Feature",
                "geometry": {
                  "type": "Point",
                  "coordinates": [art_list[0].longitude,art_list[0].latitude],
                  "location": art_list[0].title
                }},
              {
                "type": "Feature",
                "geometry": {
                  "type": "Point",
                  "coordinates": [art_list[1].longitude,art_list[1].latitude],
                  "location": art_list[1].title
                }},
              {
                "type": "Feature",
                "geometry": {
                  "type": "Point",
                  "coordinates": [art_list[2].longitude,art_list[2].latitude],
                  "location": art_list[2].title
                }},
              {
                "type": "Feature",
                "geometry": {
                  "type": "Point",
                  "coordinates": [parks[0].lon,parks[0].lat],
                  "location": parks[0].parkname
                }},
              {
                "type": "Feature",
                "geometry": {
                  "type": "Point",
                  "coordinates": [parks[1].lon,parks[1].lat],
                  "location": parks[1].parkname
              }}]


    geojson = jsonify(geojson)

    #query database for leaderboard information and pass object to game.html
    leaderboard = Leader.query.all()


    center_point = midpoint(top_left, bottom_right)

    return render_template("game.html", 
                            leaderboard=leaderboard, 
                            team_name=team_name, 
                            num_clues=num_clues,
                            geojson=geojson,
                            things=things,
                            center_point=center_point)


@app.route('/results')
def show_winner():
    """Display winner."""

    return render_template("results.html")


@app.route('/check')
def check_answer():
    """Check submitted answer."""

    answer = request.args.get("answer")
    question = request.args.get("question").strip()

    check1 = Park.query.filter_by(question=question).first()
    check2 = Art.query.filter_by(question=question).first()

    if check1:
        if answer == check1.answer:
            return "Correct!"
    elif check2:
        if answer == check2.answer:
            return "Correct!"
    else:
        return "Sorry. Try again."


##########################################################################

# # Listening or requests
if __name__ == "__main__":
    connect_to_db(app)
    app.run(host="0.0.0.0")

