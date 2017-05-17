16-7-2013
pawel.glowacki@embarcadero.com

"FMAirportWeather" is a demo created for 7-17-2013 FM3 Component Framework webinar.
The app is using "global weather" web service from http://www.webservicex.net/ws/WSDetails.aspx?CATID=12&WSID=56 to retrieve current weather information from airports around the world.

It demonstrates:
- using one non-visual codebase across desktop and mobile targets
- working with custom styles

The demo is made of 4 projects in a demo group:
- "FMWeatherDsk" is a test, desktop version of the app
- "FMWeather1" is a complete app that is using standard controls with visual live bindings
- "FMWeather2" is a modified version of "FMWeather1" and is using a custom ListBox built in code
- "FMWeather3" is a modified version of "FMWeather2" and is using a ListBox with ListBoxItems defined in a custom style