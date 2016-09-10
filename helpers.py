import os 
from twilio.rest import TwilioRestClient

def send_sms():
    """Configure Twilio client and sends an SMS"""

    twilio_account_sid = os.environ.get('TWILIO_ACCOUNT_SID')
    twilio_auth_token = os.environ.get('TWILIO_AUTH_TOKEN')
    twilio_number = os.environ.get('TWILIO_NUMBER')

    client = TwilioRestClient(twilio_account_sid, twilio_auth_token)

    message = client.messages.create(to="+12316851234", from_="+15555555555",
                                     body="Hello there!")

    return (twilio_number, twilio_account_sid, twilio_auth_token)


