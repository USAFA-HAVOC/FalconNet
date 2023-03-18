import 'package:flutter/material.dart';

const TimeOfDay diOpens = TimeOfDay(hour: 19, minute: 15);

const String apiLocation = "http://127.0.0.1:8000";
const String tenantID = "7ab80a06-f029-45c0-84d1-7dad19ce3c61";
const String clientID = "198ea96e-078e-4bdc-9b90-0dea3a9ea43b";
const String authURL = "https://login.microsoftonline.com/$tenantID/oauth2/v2.0/authorize"
    "?client_id=$clientID"
    "&scope=$clientID/FalconNet offline_access"
    "&response_type=code"
    "&redirect_uri=$apiLocation/web_login";
