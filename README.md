<br />

<p align="center">
  <img alt="Logo" src="./.github/logo.png" width="150px" />
</p>

<h1 align="center" style="text-align: center;">Wabanex</h1>

<p align="center">
	<a href="https://github.com/LuizFerK">
		<img alt="Author" src="https://img.shields.io/badge/author-Luiz%20Fernando-F04A45?style=flat" />
	</a>
	<a href="#">
		<img alt="Languages" src="https://img.shields.io/github/languages/count/LuizFerK/Wabanex?color=F04A45&style=flat" />
	</a>
	<a href="hhttps://github.com/LuizFerK/Wabanex/stargazers">
		<img alt="Stars" src="https://img.shields.io/github/stars/LuizFerK/Wabanex?color=F04A45&style=flat" />
	</a>
	<a href="https://github.com/LuizFerK/Wabanex/network/members">
		<img alt="Forks" src="https://img.shields.io/github/forks/LuizFerK/Wabanex?color=F04A45&style=flat" />
	</a>
	<a href="https://github.com/LuizFerK/Wabanex/graphs/contributors">
		<img alt="Contributors" src="https://img.shields.io/github/contributors/LuizFerK/Wabanex?color=F04A45&style=flat" />
	</a>
</p>

<p align="center">
	<b>Track your workouts!</b><br />
	<span>Created with Elixir, Phoenix and Absinthe.</span><br />
	<sub>Made with ❤️</sub>
</p>

<br />

# :pushpin: Contents

- [Features](#rocket-features)
- [Installation](#wrench-installation)
- [Getting started](#bulb-getting-started)
- [GraphQL API](#triangular_flag_on_post-graphql-api)
- [Techs](#fire-techs)
- [Issues](#bug-issues)
- [License](#book-license)

# :rocket: Features

- Create and get users
- Create training and exercise tracking

# :wrench: Installation

### Required :warning:
- Elixir
- Erlang
- Phoenix
- Postgres database

### SSH

SSH URLs provide access to a Git repository via SSH, a secure protocol. If you have an SSH key registered in your GitHub account, clone the project using this command:

```git clone git@github.com:LuizFerK/Wabanex.git```

### HTTPS

In case you don't have an SSH key on your GitHub account, you can clone the project using the HTTPS URL, run this command:

```git clone https://github.com/LuizFerK/Wabanex.git```

**Both of these commands will generate a folder called Wabanex, with all the project**

# :bulb: Getting started

1. Run ```mix deps.get``` to install the dependencies
2. Create a postgres database named ```wabanex```
3. On the ```config/dev.exs``` and ```config/test.exs``` files, change your postgres **user** and **password**
4. Run ```mix ecto.migrate``` to run the migrations to your database
5. Run ```mix phx.server``` to start the server on port 4000

# :triangular_flag_on_post: GraphQL API

`http://localhost:4000/api/graphql`

`http://localhost:4000/api/graphiql` (Absinthe GraphiQL interface)

### Users

* :green_circle: Create 

	* Request
	
		```elixir
		mutation {
          createUser(input: {
            name: "John Doe", 
            email: "johndoe@example.com",
            password: "123456"
          }) {
            id
            name
          }
        }
		```
	* Response
	
		```json
		{
          "data": {
            "createUser": {
              "id": "4b2c733d-541d-4cdf-bd27-40ea3f03aa48",
              "name": "John Doe"
            }
          }
        }
		```

* :purple_circle: Get

	* Request:
	
		```
		query {
          getUser(id: "4b2c733d-541d-4cdf-bd27-40ea3f03aa48") {
            id
            name
            email
            trainings {
              startDate
              endDate
              exercises {
                name
                repetitions
              }
            }
          }
        }
		```
	* Response
	
		```json
		{
          "data": {
            "getUser": {
              "email": "johndoe@example.com",
              "id": "4b2c733d-541d-4cdf-bd27-40ea3f03aa48",
              "name": "John Doe",
              "trainings": [
                {
                  "endDate": "2021-11-21",
                  "exercises": [
                    {
                      "name": "Triceps banco",
                      "repetitions": "4x12"
                    },
                    {
                      "name": "Triceps corda",
                      "repetitions": "5x12"
                    }
                  ],
                  "startDate": "2021-10-21"
                }
              ]
            }
          }
        }
		```

### Trainings

* :green_circle: Create

	* Request
	
		```elixir
		mutation {
          createTraining(input: {
            userId: "4b2c733d-541d-4cdf-bd27-40ea3f03aa48",
            startDate: "2021-10-21",
            endDate: "2021-11-21",
            exercises: [
              {
                name: "Triceps banco",
                youtubeVideoUrl: "youtube.com",
                protocolDescription: "drop-set",
                repetitions: "4x12"
              },
              {
                name: "Triceps corda",
                youtubeVideoUrl: "youtube.com",
                protocolDescription: "drop-set",
                repetitions: "5x12"
              }
            ]
          }) {
            id,
            exercises {
              id,
              name
            }
          }
        }
		```
	* Response
	
		```json
		{
          "data": {
            "createTraining": {
              "exercises": [
                {
                  "id": "348bd17b-92cd-487d-b043-65594680c19c",
                  "name": "Triceps banco"
                },
                {
                  "id": "7b23b24a-95ad-4cb6-a8c2-f30fda4213cb",
                  "name": "Triceps corda"
                }
              ],
              "id": "f5fadab4-49d8-4682-a514-f447eab897f1"
            }
          }
        }
		```

# :fire: Techs

### Elixir (language)

### Phoenix (web framework)
- Ecto
- Absinthe (GraphQL)
- Crudry (Error handling)

# :bug: Issues

Find a bug or error on the project? Please, feel free to send me the issue on the [Wabanex issues area](https://github.com/LuizFerK/Wabanex/issues), with a title and a description of your found!

If you know the origin of the error and know how to resolve it, please, send me a pull request, I will love to review it!

# :book: License

Released in 2020.

This project is under the [MIT license](https://github.com/LuizFerK/Wabanex/blob/main/LICENSE).

<p align="center">
	< keep coding /> :rocket: :heart:
</p>
