<a name="readme-top"></a>

<div align="center">

  <br/>
  <h1>Onbooking</h1>

</div>

## 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With ](#-built-with-)
  - [Tech Stack ](#tech-stack-)
  - [Key Features ](#key-features-)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Usage](#usage)
    - [Run tests](#run-tests)
- [👥 Authors ](#-authors-)
- [🔭 Future Features:](#-future-features)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# Onbooking <a name="about-project"></a>

OnBooking is a comprehensive accommodation booking platform like Airbnb designed to provide users with a seamless experience in finding and booking their ideal accommodations, whether it's for a short stay or an extended vacation.



<div align="center">
 <img src="./app/assets/onbooking_home.png" width="600"  height="auto" />
  <br/>
</div>

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>
- Ruby
- PostgreSQL
- JavaScript
- HTML/CSS
<details>
  <summary>Framework</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
    <li><a href="https://stimulus.hotwired.dev/">Stimulus JS</a></li>
    <li><a href="https://tailwindcss.com/">Tailwind CSS</a></li>

  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

1. <strong>User Authentication:</strong> The system allows users to create accounts and log in.
2. <strong>Property or Accommodation  Listings:</strong> Similar to Airbnb, OnBooking boasts an extensive database of accommodation listings
3. <strong>Reservation Management:</strong> Users can view available accommodations at different locations and make reservations.
4. <strong>Host management:</strong> Users can list and host their properties with host dashboard, 
5. <strong>Payment gateways:</strong> Secure stripe payment gateway integration for safe and reliable transactions
6. <strong>Review and Rating System</strong>
7. <strong>Responsive design </strong>
8. <strong>Search Filters:</strong> OnBooking provides search filters that enable users to narrow down their options based on criteria such as location, price range, amenities, and more.
9. <strong>Reservations/Payments listing of user</strong>
10. <strong>User profile update feature</strong>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Live Demo <a name="live-demo"></a>

 Click on this [Onbooking Live Demo](#) to view the live-demo of project. 
  ```json
email: test@testmail.com
password: 123456
```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

Follow these steps in order to run ruby code.

### Prerequisites

First, you need to ensure that you have Rails and Ruby installed on your computer.

### Setup

It varies depending on your operating system so here are some links to help you install it on [Windows](https://gorails.com/setup/windows/10) and on [Ubuntu](https://www.ruby-lang.org/en/documentation/installation/#apt).

For MacOS run the following commands

```sh
  brew install rbenv ruby-build
  # Add rbenv to bash so that it loads every time you open a terminal
  echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
  source ~/.bash_profile

  # Install Ruby
  rbenv install 3.2.2 
  rbenv global 3.2.2 
  ruby -v
```

This example shows how to install Ruby 3.2.2, you can check to see if there is a newer version [here](https://www.ruby-lang.org/en/downloads/releases/). Iy is also assumed that you have [homebrew](https://brew.sh/) already installed on your Mac.

### Usage

Before running the project, make sure you have Ruby and Rails installed on your system. You can refer to the [official Ruby on Rails installation guide](https://guides.rubyonrails.org/getting_started.html) for instructions on how to install them.
Once you have ruby installed, [clone this repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository)

First navigate to the project directory in your terminal:
```
  cd your-project-directory
```

Then install the required gems by running in the terminal:
```
  bundle install
```
Create the database by running:
```
  rails db:create
```
Run the database migrations to set up the database schema:
```
  rails db:migrate
```
Optionally, you can seed the database with initial data (if the project provides seed data) by running:
```
  rails db:seed
```
Start the Rails server:
```
  rails server or bin/dev
```

### Run tests
To run tests, run the following command in the terminal:
```
  rspec
```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Author <a name="authors"></a>
### 👤 **Binod Bhusal**

- GitHub: [@binodbhusal](https://github.com/binodbhusal)
- Twitter: [@twitter](https://twitter.com/Binod_ironLad)
- LinkedIn: [@linkedin](https://www.linkedin.com/in/binodbhusal/)

# 🔭 Future Features:

- More advanced host management and search filter system.

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/binodbhusal/onbooking/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you liked this project, give it a ⭐️ and kindly send to me an e-mail expressing it, it would make our day and fuel our motivation.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

 Drawing inspiration from successful platforms like Airbnb.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE.md) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
