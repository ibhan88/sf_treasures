<<<<<<< HEAD
<<<<<<< HEAD


=======
"""SF Treasures - The All-Women Hackathon San Francisco 9/10/16"""

=======
"""SF Treasures - The All-Women Hackathon San Francisco 9/10/16"""

>>>>>>> lindsaynchan/master
import os
from flask import Flask, render_template, request, flash, redirect, session, jsonify
import requests
import json

app = Flask(__name__)

app.secret_key = os.environ.get('FLASK_SECRET_KEY')

app.jinja_env.undefined = StrictUndefined


###############################################################################


@app.route('/')
def show_index():


##########################################################################

if __name__ == "__main__":
    connect_to_db(app)
    app.run(host="0.0.0.0")
<<<<<<< HEAD
    
>>>>>>> lindsaynchan/master
=======
    
>>>>>>> lindsaynchan/master
