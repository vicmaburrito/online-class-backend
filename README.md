<a name="readme-top"></a>


<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [💻 Front end react app ](#-front-end-react-app-)
- [📖 hello-rails-back-end ](#-hello-rails-back-end-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
    - [JWT](#jwt)
    - [ Token](#-token)
  - [🚀 Live Demo ](#-live-demo-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
    - [Run tests](#run-tests)
    - [Deployment](#deployment)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [❓ FAQ (OPTIONAL) ](#-faq-optional-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->
# 💻 Front end react app <a name="front-end-react-app"></a>

- [ INCOMMING ]
# 📖 hello-rails-back-end <a name="about-project"></a>

>  This is a project that create a reservation to a class in a school.


## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://code.visualstudio.com/">Viual Studio Code</a></li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

> The next key features are availble in this project.

### <b>JWT</b>

JWT (JSON Web Token) is a standard that is contained in the RFC 7519 document.

In it, a mechanism is defined to be able to propagate between two parties, and in a secure way, the identity of a certain user, also with a series of claims or privileges.

These privileges are encoded in JSON-type objects, which are embedded within the payload or body of a message that is digitally signed.

### <b> Token</b>

Is a text string that has three Base64-encoded parts, each separated by a dot

* <b>Header</b>: the algorithm and the type of token are indicated, which in this case we use JWT token.

* <b>Payload</b>: the user data and privileges appear, as well as all the information that we want to add, all the data that we deem convenient.

[More Info](https://openwebinars.net/blog/que-es-json-web-token-y-como-funciona/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

> You can see the deployment once it is executed in the next link.

- Incomming.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

> To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

> Install a text-editor you prefer. [Code editors](https://desarrolloweb.com/colecciones/editores-codigo).

> You need a database
- [SQLlite](https://www.sqlite.org/index.html)
- [MySQL](https://www.mysql.com/)
- [Postgresql](https://www.postgresql.org/)

> [Ruby](https://www.ruby-lang.org/en/downloads/)


> [Ruby on Rails Framework](https://rubyonrails.org/)

### Setup

Clone this repository to your desired folder:

> You must have an account on git hub. [Git Hub](https://github.com/)

> You must have installed git in your local environment. [Git](https://git-scm.com/download/win)

> If you just want to take a look quickly, make a fork and open the project in the web browser by adding ".dev" instead of ."com" in the repo link.
- Example : https://github.dev/vicmaburrito/online-class-backend

### Install

Install this project with:

Execute the bundle in your terminal with the path of 
the directory.

> Execute "rails bundle" in your terminal with the specific path in order to add all the gems.
> Execute "npm install" in your terminal with the specific path in order to add all the gems.
- Or if you are using yarn.
> Execute "yarn install" in your terminal with the specific path in order to add all the gems.

> You have to change the data bases' crentials.

> When the project si already installed execute:
 - rake db:setup or rails db:setup
    - Once this in being executed the nexts actions are generated 
    - rake db:create
    - rake db:schema:load
    - rake db:seed

> If you already have  the project in your local you can pull the lastes commit and execute the next commands:
  - rails db:reset
  - rails db:migrate:reset
  - rails db:seed

### Usage

To run the project, execute the following command:

- Once your credential is ready, execute.

> Ruby bin/rails db:create
> Ruby bin/rails db:migrate
> Ruby bin/rails db:seed
 

### Run tests
- In order to check the test for the endpoints, yout can execute 
**rspec spec/requests/api/v1/**.
or if you desire to test one file you can execute
**rspec spec/requests/api/v1/YOUR_FILE_spec.rb**.

### Deployment

You can deploy this project using:

- The databa.yml file is configured to be deployed with render, if you want to deploy it locally please.
  - Comment the line 33 in the puma's file.
  - Change your credentials.
  - username: postgres
  - password: 153624
  - Execute: in the root directory the next commands:
    - rails server - it will be deployed in the port:3000
    - foreman start - it will be deployed in the port:5000

- and execute
 
> **Important if you are using "Windows" please remove .dev in the Procfile [Procfile] file in the root directory**
> **Important if you are using "Unix-based" please add .dev in the Procfile [Procfile.dev] file in the root directory**
  
> Then execute: **postman start** to see the deployment in the port:5000
> The greeting will be available in the http://127.0.0.1:5000/greetings/show path.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->
## 👥 Authors <a name="authors"></a>

👤 **JOSE ZEPEDA**

- GitHub: [J2ZROMERO](https://github.com/J2ZROMERO)
- Twitter: [@JOSEZEPED4](https://twitter.com/JOSEZEPED4)
- LinkedIn: [JOSE ZEPEDA](https://www.linkedin.com/in/jose-zepeda-733ab91ab/)
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

> The next features will be added.

- [ ] Tests.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/vicmaburrito/online-class-backend/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

> Feel free to share your inquiries to our social links provided and we will help you. Don't forget to gift us a ⭐️



<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank MICROVERSE for preparing the content to work.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FAQ (optional) -->

## ❓ FAQ (OPTIONAL) <a name="faq"></a>

- **It can works with another data base**

  - Of couser the idea of use postgresql is because it is a powerfull db that is well suited with rails.

- **Linters are necessary**

  - If you want to have a redable and clean code it is a good option to choose

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](https://github.com/vicmaburrito/online-class-backend/blob/dev/MIT.md) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
