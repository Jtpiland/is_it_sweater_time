<!-- PROJECT INFO -->
<h1 align="center">
  <br>
  <a href="https://github.com/Jtpiland/is_it_sweater_time">
    <img src="https://images.squarespace-cdn.com/content/v1/5b788d28697a98e17a6d4c7a/1603738009211-QNL5MOX36PX11ZA32ZFM/unnamed.gif" alt="Logo" width="200" height="200"></a>
  <br>
  Is It Sweater Time? API
  <br>
</h1>

<h4 align="center">The backend portion of an application built to find weather forecasts!</h4>

<p align="center">
  <a href="https://github.com/Jtpiland/is_it_sweater_time/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/Jtpiland/is_it_sweater_time?style=for-the-badge" alt="contributors_badge">
  </a>
  <a href="https://github.com/Jtpiland/is_it_sweater_time/network/members">
    <img src="https://img.shields.io/github/forks/Jtpiland/is_it_sweater_time?style=for-the-badge" alt="forks_badge">
  </a>
  <a href="https://github.com/Jtpiland/is_it_sweater_time/stargazers">
    <img src="https://img.shields.io/github/stars/Jtpiland/is_it_sweater_timestyle=for-the-badge" alt="stars_badge">
  </a>
  <a href="https://github.com/Jtpiland/is_it_sweater_time/issues">
    <img src="https://img.shields.io/github/issues/Jtpiland/is_it_sweater_time?style=for-the-badge" alt="issues_badge">
  </a>
  <a href="">
    <img src="https://img.shields.io/travis/com/Jtpiland/is_it_sweater_time?style=for-the-badge" alt="build_badge">
  </a>

<!-- CONTENTS -->
<p align="center">
  <a href="#about-the-project">About The Project</a> •
  <a href="#tools-used">Tools Used</a> •
  <a href="#set-up">Set Up</a> •
  <a href="#installation">Installation</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#database-schema">Database Schema</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#acknowledgements">Acknowledgements</a>
</p>

## About The Project

The backend of Is It Sweater Time? consumes the MapQuest API, OpenWeather API, and Unsplash API to power an application that can retrieve current, hourly and daily weather forecasts based on a city search. It also allows users to plan a road trip where they can find out the total travel time as well as what the weather will be like at their estimated time of arrival. We expose endpoints that package up this material for frontend consumption to display to users on the web.

### Learning Goals

- Using an Agile process throughout development
- Building a backend API for frontend consumption
- Consuming endpoints and manipulating the JSON responses

## Tools Used

| Development |  Testing  |      Gems       |
| :---------: | :-------: | :-------------: |
| Ruby 2.7.2  |   RSpec   |       Pry       |
| Rails 5.2.5 |  WebMock  | ShouldaMatchers |
|    JSON     |    VCR    |     Faraday     |
|    Atom     | SimpleCov |     Figaro      |
|   Github    |           |    FastJSON     |

## Set Up

1. To clone and run this application, you'll need Ruby 2.7.2 and Rails 2.5.3. Using [rbenv](https://github.com/rbenv/rbenv) you can install Ruby 2.7.2 (if you don't have it already) with:

```sh
rbenv install 2.7.2
```

2. With rbenv you can set up your Ruby version for a directory and all subdirectories within it. Change into a directory that will eventually contain this repo and then run:

```sh
rbenv local 2.7.2
```

You can check that your Ruby version is correct with `ruby -v`

3. Once you have verified your Ruby version is 2.7.2, check if you have Rails. From the command line:

```sh
rails -v
```

4. If you get a message saying rails is not installed or you do not have version 5.2.5, run

```sh
gem install rails --version 5.2.5
```

5. You may need to quit and restart your terminal session to see these changes show up

## Installation

1. Get a free API Key at [OpenWeather](https://api.openweathermap.org)
2. Get a free API KEY at [MapQuest](http://www.mapquestapi.com)
3. Get a free API KEY at [Unsplash](https://api.unsplash.com)
4. Fork this repo
5. Clone your new repo
   ```sh
   git clone https://github.com/#{your_github_username}/is_it_sweater_time.git
   ```
6. Install gems
   ```sh
   bundle install
   ```
7. Install figaro
   ```sh
   bundle exec figaro install
   ```
8. Enter your API KEYS in `application.yml`
   ```
   weather_key = <ENTER YOUR API KEY>
   map_key = <ENTER YOUR API KEY>
   image_access_key = <ENTER YOUR API KEY>
   ```
9. Setup the database
   ```sh
   rails db:create
   rails db:migrate
   ```

## How To Use

The Is It Sweater Time? API can be used to retrieve information about current, daily and hourly weather for a given location. It can also be used to find directions between two locations, as well as give the weather forecast for the estimated time of arrival at your destination.

### Endpoint Documentation

[Register User Endpoint](localhost:3000/api/v1/users)
<br>
Request:
`/api/v1/users`

Body:

```json
{
  "email": "funbucket1@gmail.com",
  "password": "pw",
  "password_confirmation": "pw"
}
```

Response:

```json
{
  "data": {
    "id": 4,
    "type": "user",
    "attributes": {
      "email": "funbucket1@gmail.com",
      "api_key": "yQprkFUOta0hFf6iWvNw7Qtt"
    }
  }
}
```

[Session Endpoint](localhost:3000/api/v1/sessions)
<br>
Request:
`/api/v1/sessions`

```json

Body:

{
  "email": "funbucket1@gmail.com",
  "password": "pw"
}
```

Response:

```json
{
  "data": {
    "id": 4,
    "type": "users",
    "attributes": {
      "email": "funbucket1@gmail.com",
      "api_key": "yQprkFUOta0hFf6iWvNw7Qtt"
    }
  }
}
```

[Background Image Endpoint](localhost:3000/api/v1/backgrounds)
<br>
Request:
`/api/v1/backgrounds`<br>
`query = 'denver, co'`

Response:

```json
{
  "data": {
    "id": null,
    "type": "image",
    "attributes": {
      "image": {
        "location": "denver, co",
        "image_url": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNjI5OTB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkMlMjBjb3xlbnwwfHx8fDE2MzI4NTYxODI&ixlib=rb-1.2.1&q=80&w=1080",
        "credit": {
          "source": "unsplash.com",
          "author": "Ryan De Hamer",
          "logo": "https://unsplash.com/blog/content/images/max/2560/1-VnKoValwGK3-d1bZhD6sVA.jpeg"
        }
      }
    }
  }
}
```

[Forecast Endpoint](localhost:3000/api/v1/forecast)
<br>
Request:
`/api/v1/forecast` <br>
`location= 'denver, co'`

Response:

```json
{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2021-09-28T14:09:49.000-05:00",
        "sunrise": "2021-09-28T07:53:27.000-05:00",
        "sunset": "2021-09-28T19:47:23.000-05:00",
        "temperature": 79.43,
        "feels_like": 79.43,
        "humidity": 24,
        "uvi": 5.75,
        "visibility": 10000,
        "conditions": "scattered clouds",
        "icon": "03d"
      },
      "hourly_weather": [
        {
          "time": "2021-09-28T14:00:00.000-05:00",
          "temperature": 79.43,
          "conditions": "scattered clouds",
          "icon": "03d"
        },
        {
          "time": "2021-09-28T15:00:00.000-05:00",
          "temperature": 79.66,
          "conditions": "scattered clouds",
          "icon": "03d"
        },
        {
          "time": "2021-09-28T16:00:00.000-05:00",
          "temperature": 79.81,
          "conditions": "scattered clouds",
          "icon": "03d"
        },
        {
          "time": "2021-09-28T17:00:00.000-05:00",
          "temperature": 79.59,
          "conditions": "scattered clouds",
          "icon": "03d"
        },
        {
          "time": "2021-09-28T18:00:00.000-05:00",
          "temperature": 78.75,
          "conditions": "scattered clouds",
          "icon": "03d"
        },
        {
          "time": "2021-09-28T19:00:00.000-05:00",
          "temperature": 77.18,
          "conditions": "scattered clouds",
          "icon": "03d"
        },
        {
          "time": "2021-09-28T20:00:00.000-05:00",
          "temperature": 70.38,
          "conditions": "overcast clouds",
          "icon": "04n"
        },
        {
          "time": "2021-09-28T21:00:00.000-05:00",
          "temperature": 68.92,
          "conditions": "light rain",
          "icon": "10n"
        }
      ],
      "daily_weather": [
        {
          "date": "2021-09-28T13:00:00.000-05:00",
          "sunrise": "2021-09-28T07:53:27.000-05:00",
          "sunset": "2021-09-28T19:47:23.000-05:00",
          "max_temp": 79.81,
          "min_temp": 66.81,
          "conditions": "light rain",
          "icon": "10d"
        },
        {
          "date": "2021-09-29T13:00:00.000-05:00",
          "sunrise": "2021-09-29T07:54:24.000-05:00",
          "sunset": "2021-09-29T19:45:45.000-05:00",
          "max_temp": 71.64,
          "min_temp": 51.89,
          "conditions": "heavy intensity rain",
          "icon": "10d"
        },
        {
          "date": "2021-09-30T13:00:00.000-05:00",
          "sunrise": "2021-09-30T07:55:21.000-05:00",
          "sunset": "2021-09-30T19:44:07.000-05:00",
          "max_temp": 60.91,
          "min_temp": 50.45,
          "conditions": "moderate rain",
          "icon": "10d"
        },
        {
          "date": "2021-10-01T13:00:00.000-05:00",
          "sunrise": "2021-10-01T07:56:19.000-05:00",
          "sunset": "2021-10-01T19:42:29.000-05:00",
          "max_temp": 69.57,
          "min_temp": 53.56,
          "conditions": "few clouds",
          "icon": "02d"
        },
        {
          "date": "2021-10-02T13:00:00.000-05:00",
          "sunrise": "2021-10-02T07:57:16.000-05:00",
          "sunset": "2021-10-02T19:40:52.000-05:00",
          "max_temp": 72.86,
          "min_temp": 57.49,
          "conditions": "clear sky",
          "icon": "01d"
        }
      ]
    }
  }
}
```

[Road Trip Endpoint](localhost:3000/api/v1/road_trip)
<br>
Request:
`/api/v1/backgrounds`<br>

Body:

`{ "origin": "Denver,CO", "destination": "Pueblo,CO", "api_key": "Azwypen9hAv374lsE3LCnwtt" }`

Response:

```json
{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver,CO",
      "end_city": "Pueblo,CO",
      "travel_time": "01:44:22",
      "weather_at_eta": {
        "temperature": 77.99,
        "conditions": "few clouds"
      }
    }
  }
}
```

## Contributing

👤 **Jacob Piland**

- [GitHub](https://github.com/jtpiland)
- [LinkedIn](https://www.linkedin.com/in/jacob-piland/)

## Acknowledgements

- [Turing School of Software and Design](https://turing.edu/)
  - Project created for completion towards Backend Engineering Program
- [OpenWeather API](https://api.openweathermap.org)
- [MapQuest API](http://www.mapquestapi.com)
- [Unsplash API](https://api.unsplash.com)
