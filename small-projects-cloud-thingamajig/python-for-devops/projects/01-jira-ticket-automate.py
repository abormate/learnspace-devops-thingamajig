# This code sample uses the 'requests' library:
# http://docs.python-requests.org
import requests
from requests.auth import HTTPBasicAuth
import json

url = "https://veeramallaabhishek.atlassian.net/rest/api/3/issue"

API_TOKEN = ""

auth = HTTPBasicAuth("", API_TOKEN)

headers = {
  "Accept": "application/json",
  "Content-Type": "application/json"
}
