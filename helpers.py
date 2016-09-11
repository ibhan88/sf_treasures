
import os
from twilio.rest import TwilioRestClient

def send_sms(user_number, body):
    """Configure Twilio and send SMS"""

    twilio_account_sid = os.environ.get('TWILIO_ACCOUNT_SID')
    twilio_auth_token = os.environ.get('TWILIO_AUTH_TOKEN')
    twilio_number = os.environ.get('TWILIO_NUMBER')

    client = TwilioRestClient(twilio_account_sid, twilio_auth_token)


    message = client.messages.create(to=user_number,
                                     from_=twilio_number,
                                     body=body)

def midpoint(p1, p2):
    """Find the midpoint of square map."""

    return [(p1[1]+p2[1])/2, (p1[0]+p2[0])/2]